#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an annotation registration.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.automationannotationtyperegistration
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class AutomationAnnotationTypeRegistration extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The ID corresponding to the GUID created by calling [RegisterAnnotationType(System.Guid)](coreautomationregistrar_registerannotationtype_1084655315.md).
     * @type {Integer}
     */
    LocalId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
