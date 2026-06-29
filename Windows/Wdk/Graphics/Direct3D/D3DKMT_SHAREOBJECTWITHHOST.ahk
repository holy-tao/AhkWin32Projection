#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SHAREOBJECTWITHHOST {
    #StructPack 8

    hDevice : UInt32

    hObject : UInt32

    Reserved : Int64

    hVailProcessNtHandle : Int64

}
