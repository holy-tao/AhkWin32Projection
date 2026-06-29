#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Specifies constraints on the set of values which can be deserialized. (WS_BOOL_DESCRIPTION)
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_bool_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_BOOL_DESCRIPTION {
    #StructPack 4

    /**
     * Specifies the required value.
     */
    value : BOOL

}
