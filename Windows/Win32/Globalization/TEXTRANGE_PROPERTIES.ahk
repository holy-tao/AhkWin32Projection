#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OPENTYPE_FEATURE_RECORD.ahk" { OPENTYPE_FEATURE_RECORD }

/**
 * Contains a group of OpenType features to apply to a run.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-textrange_properties
 * @namespace Windows.Win32.Globalization
 */
export default struct TEXTRANGE_PROPERTIES {
    #StructPack 8

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/usp10/ns-usp10-opentype_feature_record">OPENTYPE_FEATURE_RECORD</a> structures containing OpenType features (records) to apply to the characters in a specific range of text in a run.
     */
    potfRecords : OPENTYPE_FEATURE_RECORD.Ptr

    /**
     * Number of features in the array specified by <b>potfRecords</b>.
     */
    cotfRecords : Int32

}
