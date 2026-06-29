#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a virtual machine generation identifier.
 * @remarks
 * For info about the virtual machine generation identifier, see <a href="https://docs.microsoft.com/windows/desktop/HyperV_v2/virtual-machine-generation-identifier">Virtual machine generation identifier</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vmgenerationcounter/ns-vmgenerationcounter-vm_gencounter
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct VM_GENCOUNTER {
    #StructPack 8

    /**
     * The low 64 bits of the virtual machine generation identifier.
     */
    GenerationCount : Int64

    /**
     * The high 64 bits of the virtual machine generation identifier.
     */
    GenerationCountHigh : Int64

}
