#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a parameter of a custom control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ns-uiautomationcore-uiautomationparameter
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class UIAutomationParameter extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-uiautomationtype">UIAutomationType</a></b>
     * 
     * A value indicating the type of the parameter.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>void*</b>
     * 
     * A pointer to the parameter data.
     * @type {Pointer<Void>}
     */
    pData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
