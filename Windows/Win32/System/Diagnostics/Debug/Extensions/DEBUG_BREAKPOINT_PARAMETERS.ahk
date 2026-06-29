#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_BREAKPOINT_PARAMETERS {
    #StructPack 8

    Offset : Int64

    Id : UInt32

    BreakType : UInt32

    ProcType : UInt32

    Flags : UInt32

    DataSize : UInt32

    DataAccessType : UInt32

    PassCount : UInt32

    CurrentPassCount : UInt32

    MatchThread : UInt32

    CommandSize : UInt32

    OffsetExpressionSize : UInt32

}
