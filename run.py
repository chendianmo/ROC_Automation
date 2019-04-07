import subprocess
import sys
import getopt
import datetime
import time

serial = ""
output = 'Reports'
tag = 'MTBF'
Round=1
report_name='TestReport'

def _help():
    print('run.py -s android_serial -o report -t MTBF')

def parse_opt(argv):
    global serial, output, tag, Round, report_name
    try:
        opts, args = getopt.getopt(argv, "hs:o:t:r:n:",["serial=", "output=", "tag=", "round=", 'reportname='])
    except getopt.GetoptError:
        _help()
        sys.exit(2)

    for opt, arg in opts:
        if opt == '-h':
            _help()
            sys.exit(1)
        elif opt in ('-s', "--serial"):
            serial = arg
        elif opt in ('-o', '--output'):
            output = arg
        elif opt in ('-t', '--tag'):
            tag = arg
        elif opt in ('-r', "--round"):
            Round = int(arg)
        elif opt in ('-n', '--reportname'):
            report_name = arg
        else:
            _help()
            sys.exit(3)
    print ('serial:',serial, 'output:',output, 'Tag:',tag, 'Round',Round)
    if serial == "":
        print ("Serial must be correct and not empty")
        _help()
        sys.exit(4)

def run():
    start_time = time.time()
    if Round == 1:
        run_test()
    else:
        for _round in range(Round):
            _r_start = time.time()
            run_test()
            print ('Round {} is taking time {} seconds'.format(_round, (time.time() - _r_start)))

    print ('All Test are taking {} seconds'.format(time.time() - start_time))

def run_test():
    print ('Run test....')
    current = datetime.datetime.now().strftime("%m%d_%H%M%S")
    cmd = "pybot --variable MUT1:{} --include={} -d {}/testreport_{} ../CloudPepperTest".format(serial, tag, output, current)
    p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    p.poll()
    lines = p.stdout.readlines()
    for line in lines:
        print line

    try:
        p.terminate()
    except Exception, e:
        print Exception, e

def rebot_report():
    cmd = "rebot --name {} -d {} -o output.xml {}/testreport_*/output.xml".format(report_name, output, output)
    if Round > 1:
        p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        p.poll()
        lines = p.stdout.readlines()
        for line in lines:
            print line

        try:
            p.terminate()
        except Exception, e:
            print Exception, e


if __name__ == "__main__":
   parse_opt(sys.argv[1:])
   run()
   rebot_report()




