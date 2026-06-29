#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCW_COUNTER_INFORMATION {
    #StructPack 8

    CounterMask : Int64

    InstanceMask : UNICODE_STRING.Ptr

}
