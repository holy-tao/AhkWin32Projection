#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an array of environment variables.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_environment_variable_set
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_ENVIRONMENT_VARIABLE_SET extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of environment variables contained within the <b>vars</b> array.
     * @type {Integer}
     */
    varsCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Defines an array of environment variables. Each element of the array is of type <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_environment_variable">WSMAN_ENVIRONMENT_VARIABLE</a>.
     * @type {Pointer<WSMAN_ENVIRONMENT_VARIABLE>}
     */
    vars {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
