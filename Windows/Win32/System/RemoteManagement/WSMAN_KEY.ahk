#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Represents a key and value pair within a selector set and is used to identify a particular resource.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_key
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_KEY {
    #StructPack 8

    /**
     * Specifies the key name.
     */
    key : PWSTR

    /**
     * Defines the value associated with <i>key</i>.
     */
    value : PWSTR

}
