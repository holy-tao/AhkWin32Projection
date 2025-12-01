#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Com\CY.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\..\System\Variant\VARIANT.ahk

/**
 * Contains data about a UI Automation change that occurred.
 * @remarks
 * The provider can call <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraisechangesevent">UiaRaiseChangesEvent</a> and pass in an array of <b>UiaChangeInfo</b> structs to notify clients of a related group of changes.  The <b>payload</b> and <b>extraInfo</b> will vary depending on the <b>uiaId</b> populated in the <b>UiaChangeInfo</b> struct.
 * 
 * If there are multiple of any of these event types multiple <b>UiaChangeInfo</b> structs would be created.  Below is a description of what these are for each pair of values.
 * 
 * <table>
 * <tr>
 * <th>UiaId</th>
 * <th>payload</th>
 * <th>extraInfo</th>
 * </tr>
 * <tr>
 * <td>
 * <b>UIA_SummaryChangeId</b>
 * 
 * </td>
 * <td>
 * VT_BSTR
 * 
 * A string describing the meaning of the change from an application point of view.
 * 
 * </td>
 * <td>
 * A constant ID value from the provider indicating the meaning of this event.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * For UIA property changes, identified in the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a> section.
 * 
 * </td>
 * <td>
 * Type is the type of the property and the value is the new value of the property.
 * 
 * </td>
 * <td>
 *  
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * For text attributes changes, identified in the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">Text Attribute Identifiers</a> section, <b>extraInfo</b> is not used.
 * 
 * </td>
 * <td>
 * Type is the type of the attribute and the value is the new value of the attribute.
 * 
 * </td>
 * <td>
 *  
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * For annotation changes, identified in the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-annotation-type-identifiers">Annotation Type Identifiers</a> section, <b>extraInfo</b> is not used.
 * 
 * </td>
 * <td>
 * VT_BSTR
 * 
 * For text, the characters from the range to which the annotation  applies.
 * 
 * </td>
 * <td>
 *  
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * For style changes, identified in the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-style-identifiers">Style Identifiers</a> section, <b>extraInfo</b> is not used.
 * 
 * </td>
 * <td>
 * VT_BSTR
 * 
 * For text, the characters from the range to which the style applies.
 * 
 * </td>
 * <td>
 *  
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ns-uiautomationcore-uiachangeinfo
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class UiaChangeInfo extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Identifies the type of change info. Possible values are all the values of <b>Change Identifiers</b>, <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>, <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-textattribute-ids">Text Attribute Identifiers</a>, <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-annotation-type-identifiers">Annotation Type Identifiers</a> and <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-style-identifiers">Style Identifiers</a>.
     * @type {Integer}
     */
    uiaId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Information about the type of change that occurred.
     * @type {VARIANT}
     */
    payload{
        get {
            if(!this.HasProp("__payload"))
                this.__payload := VARIANT(8, this)
            return this.__payload
        }
    }

    /**
     * Detailed information about the change that occurred.
     * @type {VARIANT}
     */
    extraInfo{
        get {
            if(!this.HasProp("__extraInfo"))
                this.__extraInfo := VARIANT(32, this)
            return this.__extraInfo
        }
    }
}
