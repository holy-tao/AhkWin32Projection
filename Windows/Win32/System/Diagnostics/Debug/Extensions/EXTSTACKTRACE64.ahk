#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXTSTACKTRACE64 {
    #StructPack 8

    FramePointer : Int64

    ProgramCounter : Int64

    ReturnAddress : Int64

    Args : Int64[4]

}
