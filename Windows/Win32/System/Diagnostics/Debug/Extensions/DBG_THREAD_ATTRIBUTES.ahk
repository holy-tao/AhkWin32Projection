#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DBG_THREAD_ATTRIBUTES {
    #StructPack 8

    ThreadIndex : UInt32

    ProcessID : Int64

    ThreadID : Int64

    AttributeBits : Int64

    BoolBits : UInt32

    BlockedOnPID : Int64

    BlockedOnTID : Int64

    CritSecAddress : Int64

    Timeout_msec : UInt32

    StringData : CHAR[100]

    SymName : CHAR[100]

}
