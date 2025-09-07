#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SCESVC_ANALYSIS_LINE structure contains the key, value, and value length for a specific line specified by an SCESVC_ANALYSIS_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/scesvc/ns-scesvc-scesvc_analysis_line
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 * @version v4.0.30319
 */
class SCESVC_ANALYSIS_LINE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * String that contains data key. Typically, this is the name of the configuration parameter to which the <b>Value</b> data applies.
     * @type {Pointer<SByte>}
     */
    Key {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Data describing the analysis result for the key. This can be binary data.
     * @type {Pointer<Byte>}
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
