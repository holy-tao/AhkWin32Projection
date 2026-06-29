#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\XSAVE_AREA.ahk" { XSAVE_AREA }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @architecture X64, Arm64
 */
export default struct XSTATE_CONTEXT {
    #StructPack 8

    Mask : Int64

    Length : UInt32

    Flags : Int8

    Reserved0 : Int8[3]

    Area : XSAVE_AREA.Ptr

    Buffer : IntPtr

}
