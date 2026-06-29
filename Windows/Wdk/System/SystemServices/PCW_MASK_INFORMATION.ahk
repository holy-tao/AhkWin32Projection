#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\KEVENT.ahk" { KEVENT }
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\PPCW_BUFFER.ahk" { PPCW_BUFFER }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCW_MASK_INFORMATION {
    #StructPack 8

    CounterMask : Int64

    InstanceMask : UNICODE_STRING.Ptr

    InstanceId : UInt32

    CollectMultiple : BOOLEAN

    Buffer : PPCW_BUFFER

    CancelEvent : KEVENT.Ptr

}
