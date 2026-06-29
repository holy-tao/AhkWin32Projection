#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYPROCESSOFFERINFO {
    #StructPack 8

    cbSize : UInt32 := this.Size

    hProcess : HANDLE

    DecommitUniqueness : Int64

    DecommittableBytes : Int64

}
