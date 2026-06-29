#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains process parameter information.
 * @see https://learn.microsoft.com/windows/win32/api/winternl/ns-winternl-rtl_user_process_parameters
 * @namespace Windows.Win32.System.Threading
 */
export default struct RTL_USER_PROCESS_PARAMETERS {
    #StructPack 8

    /**
     * Reserved for internal use by the operating system.
     */
    Reserved1 : Int8[16]

    /**
     * Reserved for internal use by the operating system.
     */
    Reserved2 : IntPtr[10]

    /**
     * The path of the image file for the process.
     */
    ImagePathName : UNICODE_STRING

    /**
     * The command-line string passed to the process.
     */
    CommandLine : UNICODE_STRING

}
