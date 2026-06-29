#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_FRAME_INFO {
    #StructPack 8

    ExtendedHeaderSize : UInt32

    dwFrameFlags : UInt32

    PictureNumber : Int64

    DropCount : Int64

    hDirectDraw : HANDLE

    hSurfaceHandle : HANDLE

    DirectDrawRect : RECT

    lSurfacePitch : Int32

    Reserved2 : UInt32

    Reserved3 : UInt32

    Reserved4 : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Reserved1', { type: UInt32, offset: 56 })
        DefineProp(this.Prototype, 'FrameCompletionNumber', { type: Int64, offset: 64 })
        this.DeleteProp("__New")
    }
}
