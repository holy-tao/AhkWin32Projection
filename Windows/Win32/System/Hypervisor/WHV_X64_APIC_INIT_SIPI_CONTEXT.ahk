#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_APIC_INIT_SIPI_CONTEXT {
    #StructPack 8

    ApicIcr : Int64

}
