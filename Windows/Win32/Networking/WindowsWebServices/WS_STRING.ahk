#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * An array of Unicode characters and a length.
 * @remarks
 * The string is not required to be zero terminated.  If it is
 *                 zero terminated, then the terminating character is not included
 *                 in the length.
 *             
 * 
 * The macro <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-ws_string_value">WS_STRING_VALUE</a> can be used to initialize
 *                 this structure if the string is a constant string.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_string
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_STRING {
    #StructPack 8

    /**
     * The number of characters in the string.
     */
    length : UInt32

    /**
     * The array of characters that make up the string.
     */
    chars : PWSTR

}
