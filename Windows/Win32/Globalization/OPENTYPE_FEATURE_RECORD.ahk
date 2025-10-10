#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains information about a single OpenType feature to apply to a run.
 * @see https://docs.microsoft.com/windows/win32/api//usp10/ns-usp10-opentype_feature_record
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class OPENTYPE_FEATURE_RECORD extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Intl/opentype-tag">OPENTYPE_TAG</a> structure containing a registered or private OpenType feature tag. For information on feature tags, see <a href="https://docs.microsoft.com/typography/opentype/spec/featuretags">http://www.microsoft.com/typography/otspec/featuretags.htm</a>.
     * @type {Integer}
     */
    tagFeature {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Value indicating how to apply the feature tag. Possible values are defined in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Feature is disabled and should not be applied.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Feature is active. If the feature offers several alternatives, select the first value.</td>
     * </tr>
     * <tr>
     * <td>Greater than 1</td>
     * <td>Feature is active. Select the alternative value at this index. Should be used only when multiple alternatives are available for a feature.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    lParameter {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
