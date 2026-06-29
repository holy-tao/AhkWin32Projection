#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_TIMER {
    #StructPack 8

    Timer : IntPtr

    Dpc : IntPtr

}
