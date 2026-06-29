#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKMDT_OPM_REQUESTED_INFORMATION {
    #StructPack 8

    omac : IntPtr

    cbRequestedInformationSize : UInt32

    abRequestedInformation : Int8[4076]

}
