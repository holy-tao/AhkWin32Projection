#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\System\Diagnostics\Debug\XSAVE_AREA.ahk" { XSAVE_AREA }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct XSTATE_CONTEXT {
    #StructPack 8

    Mask : Int64

    Length : UInt32

    Reserved1 : UInt32

    Area : XSAVE_AREA.Ptr

    Reserved2 : UInt32

    Buffer : IntPtr

    Reserved3 : UInt32

}
