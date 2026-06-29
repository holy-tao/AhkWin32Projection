#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct CO_PVC {
    #StructPack 8

    NdisAfHandle : IntPtr

    PvcParameters : IntPtr

}
