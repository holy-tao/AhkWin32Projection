#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import ".\PCW_COUNTER_DESCRIPTOR.ahk" { PCW_COUNTER_DESCRIPTOR }
#Import ".\PCW_REGISTRATION_FLAGS.ahk" { PCW_REGISTRATION_FLAGS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCW_REGISTRATION_INFORMATION {
    #StructPack 8

    Version : UInt32

    Name : UNICODE_STRING.Ptr

    CounterCount : UInt32

    Counters : PCW_COUNTER_DESCRIPTOR.Ptr

    Callback : IntPtr

    CallbackContext : IntPtr

    Flags : PCW_REGISTRATION_FLAGS

}
