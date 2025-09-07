#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains a group of OpenType features to apply to a run.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-textrange_properties
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class TEXTRANGE_PROPERTIES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/usp10/ns-usp10-opentype_feature_record">OPENTYPE_FEATURE_RECORD</a> structures containing OpenType features (records) to apply to the characters in a specific range of text in a run.
     * @type {Pointer<OPENTYPE_FEATURE_RECORD>}
     */
    potfRecords {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Number of features in the array specified by <b>potfRecords</b>.
     * @type {Integer}
     */
    cotfRecords {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
