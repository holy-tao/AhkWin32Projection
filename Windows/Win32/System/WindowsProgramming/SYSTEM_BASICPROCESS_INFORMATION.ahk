#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct SYSTEM_BASICPROCESS_INFORMATION {
    #StructPack 8

    NextEntryOffset : UInt32

    UniqueProcessId : HANDLE

    InheritedFromUniqueProcessId : HANDLE

    SequenceNumber : Int64

    ImageName : UNICODE_STRING

}
