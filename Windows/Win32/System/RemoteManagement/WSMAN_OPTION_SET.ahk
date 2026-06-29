#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSMAN_OPTION.ahk" { WSMAN_OPTION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents a set of options.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_option_set
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_OPTION_SET {
    #StructPack 8

    /**
     * Specifies the number of options in the <b>options</b> array.
     */
    optionsCount : UInt32

    /**
     * Specifies an array of option names and values
     */
    options : WSMAN_OPTION.Ptr

    /**
     * If this member is <b>TRUE</b>, the plug-in must return an error if any of the options are not understood.
     */
    optionsMustUnderstand : BOOL

}
