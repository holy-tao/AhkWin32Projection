#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a set of options.
 * @see https://docs.microsoft.com/windows/win32/api//wsman/ns-wsman-wsman_option_set
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_OPTION_SET extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the number of options in the <b>options</b> array.
     * @type {Integer}
     */
    optionsCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies an array of option names and values
     * @type {Pointer<WSMAN_OPTION>}
     */
    options {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * If this member is <b>TRUE</b>, the plug-in must return an error if any of the options are not understood.
     * @type {BOOL}
     */
    optionsMustUnderstand {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
