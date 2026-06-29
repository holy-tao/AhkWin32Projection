#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXTSTACKTRACE32 {
    #StructPack 4

    FramePointer : UInt32

    ProgramCounter : UInt32

    ReturnAddress : UInt32

    Args : UInt32[4]

}
