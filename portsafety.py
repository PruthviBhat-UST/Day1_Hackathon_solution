import subprocess

# Define suspicious / uncommon ports
SUSPICIOUS_PORTS = {666, 34783,36473,64564}

result = subprocess.check_output([ "-sTCP:LISTEN", "-Pn"],text=True)


lines = result.strip().split("\n")

for line in lines[1:]:
        parts = line.split()
        command = parts[0]
        pid = parts[1]
        user = parts[2]
        name = parts[-1]

if port in SUSPICIOUS_PORTS:
            print("Suspicious port detected!")
            print(f"  Port {port} is commonly used by malware or backdoors.")
