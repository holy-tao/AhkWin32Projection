#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SCESVC_CONFIGURATION_LINE structure contains information about a line of configuration data. It is used by the SCESVC_CONFIGURATION_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/scesvc/ns-scesvc-scesvc_configuration_line
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 * @version v4.0.30319
 */
class SCESVC_CONFIGURATION_LINE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * String that contains data key. Typically this is the name of the configuration parameter to which the <b>Value</b> data applies.
     * @type {Pointer<Integer>}
     */
    Key {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * String that contains data describing the configuration.
     * @type {Pointer<Integer>}
     */
    Value {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Length of the data stored in <b>Value</b>, in bytes.
     * @type {Integer}
     */
    ValueLen {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
