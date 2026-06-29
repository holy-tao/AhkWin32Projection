#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_VPCI_PROBED_BARS {
    #StructPack 4

    Value : UInt32[6]

}
