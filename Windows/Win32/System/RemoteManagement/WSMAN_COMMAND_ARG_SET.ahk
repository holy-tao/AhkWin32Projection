#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the set of arguments that are passed in to the command line.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_command_arg_set
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_COMMAND_ARG_SET extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of arguments in the array.
     * @type {Integer}
     */
    argsCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Defines an array of strings that specify the arguments.
     * @type {Pointer<Char>}
     */
    args {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
