#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents a specific option name and value pair.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_option
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_OPTION {
    #StructPack 8

    /**
     * Specifies the name of the option.
     */
    name : PWSTR

    /**
     * Specifies the value of the option.
     */
    value : PWSTR

    /**
     * Specifies whether the option must be understood and complied with.  If this value is <b>TRUE</b>, the plug-in must understand and adhere to the meaning of the option; otherwise, the plug-in must return an error.  If this is <b>FALSE</b>, the plug-in should ignore the option if it is not understood.
     */
    mustComply : BOOL

}
