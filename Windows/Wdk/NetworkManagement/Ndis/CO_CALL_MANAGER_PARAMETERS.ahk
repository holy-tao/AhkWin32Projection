#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct CO_CALL_MANAGER_PARAMETERS {
    #StructPack 8

    Transmit : IntPtr

    Receive : IntPtr

    CallMgrSpecific : IntPtr

}
