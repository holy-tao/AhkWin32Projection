#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a virtual machine generation identifier.
 * @remarks
 * For info about the virtual machine generation identifier, see <a href="https://docs.microsoft.com/windows/desktop/HyperV_v2/virtual-machine-generation-identifier">Virtual machine generation identifier</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vmgenerationcounter/ns-vmgenerationcounter-vm_gencounter
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class VM_GENCOUNTER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The low 64 bits of the virtual machine generation identifier.
     * @type {Integer}
     */
    GenerationCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The high 64 bits of the virtual machine generation identifier.
     * @type {Integer}
     */
    GenerationCountHigh {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
