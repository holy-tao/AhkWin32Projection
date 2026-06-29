#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_CANCEL_PRESENTS_OPERATION.ahk" { D3DKMT_CANCEL_PRESENTS_OPERATION }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CANCEL_PRESENTS {
    #StructPack 8

    cbSize : UInt32 := this.Size

    hDevice : UInt32

    Flags : IntPtr

    Operation : D3DKMT_CANCEL_PRESENTS_OPERATION

    CancelFromPresentId : Int64

    CompSurfaceLuid : IntPtr

    BindId : Int64

}
