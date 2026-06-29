#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct THREAD_NAME_INFORMATION {
    #StructPack 8

    ThreadName : UNICODE_STRING

}
