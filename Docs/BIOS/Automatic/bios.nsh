# Disable command printing
@echo -off

echo "BIOS OFFSETs EDITING SCRIPT"
echo "This will tweak Dell Inspiron 5370 BIOS offsets accordingly to macOS requirements"

echo "Above 4G MMIO BIOS assignment (disable)"
setup_var.efi 0x7ED 0x0 -n Setup

echo "CFG Lock (disable)"
setup_var.efi 0x527 0x0 -n Setup

echo "CSM Support (disable)"
setup_var.efi 0x104A 0x0 -n Setup

echo "DVMT Pre-Allocated (64M)"
setup_var.efi 0x7E8 0x2 -n Setup

echo "DVMT Total Gfx Mem (MAX)"
setup_var.efi 0x7E9 0x3 -n Setup

echo "Serial Port (disable)"
setup_var.efi 0x1272 0x0 -n Setup

echo "SW Guard Extension (disable)"
setup_var.efi 0x5DC 0x0 -n Setup

echo "TPM State (disable)"
setup_var.efi 0xF7A 0x0 -n Setup

echo "XHCI Hand-off (enable)"
setup_var.efi 0x1B 0x1 -n UsbSupport

