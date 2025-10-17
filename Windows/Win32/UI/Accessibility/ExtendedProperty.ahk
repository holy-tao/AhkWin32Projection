#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * Contains information about an extended property.
 * @remarks
 * 
  * This structure is used by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh437294(v=vs.85)">IUIAutomationStylesPattern::GetCachedExtendedPropertiesArray</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh437295(v=vs.85)">GetCurrentExtendedPropertiesArray</a> methods.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/ns-uiautomationclient-extendedproperty
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ExtendedProperty extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>BSTR</b>
     * 
     * A localized string that contains the name of the extended property.
     * @type {BSTR}
     */
    PropertyName{
        get {
            if(!this.HasProp("__PropertyName"))
                this.__PropertyName := BSTR(0, this)
            return this.__PropertyName
        }
    }

    /**
     * Type: <b>BSTR</b>
     * 
     * A string that represents the value of the extended property.   This string should be localized, if appropriate.
     * @type {BSTR}
     */
    PropertyValue{
        get {
            if(!this.HasProp("__PropertyValue"))
                this.__PropertyValue := BSTR(8, this)
            return this.__PropertyValue
        }
    }
}
