#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct TRACE_STACK_CACHING_INFO {
    #StructPack 4

    Enabled : BOOLEAN

    CacheSize : UInt32

    BucketCount : UInt32

}
