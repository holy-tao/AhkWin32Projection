#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OUTPUTDUPL_FRAMEINFO {
    #StructPack 8

    LastPresentTime : Int64

    LastMouseUpdateTime : Int64

    AccumulatedFrames : UInt32

    RectsCoalesced : BOOL

    ProtectedContentMaskedOut : BOOL

    PointerPosition : IntPtr

    TotalMetadataBufferSize : UInt32

    PointerShapeBufferSize : UInt32

}
