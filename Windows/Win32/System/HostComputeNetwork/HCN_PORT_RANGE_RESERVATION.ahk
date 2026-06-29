#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * HCN_PORT_RANGE_RESERVATION
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HCN_PORT_RANGE_RESERVATION
 * @namespace Windows.Win32.System.HostComputeNetwork
 */
export default struct HCN_PORT_RANGE_RESERVATION {
    #StructPack 2

    startingPort : UInt16

    endingPort : UInt16

}
