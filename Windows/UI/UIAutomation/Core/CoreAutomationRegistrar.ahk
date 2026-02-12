#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreAutomationRegistrarStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Exposes methods for registering new control patterns, properties, events, and annotations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.coreautomationregistrar
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class CoreAutomationRegistrar extends IInspectable {
;@region Static Methods
    /**
     * Registers a custom annotation type for text ranges.
     * @remarks
     * Both the UI Automation (UIA) provider and client call this method to register a custom annotation type. The *guid* must be the same for both.
     * 
     * The same annotation type GUID can be registered more than once on the same process. An identical registration is returned if called on a GUID that is already registered. [UnregisterAnnotationType(Windows.UI.UIAutomation.Core.AutomationAnnotationTypeRegistration)](coreautomationregistrar_unregisterannotationtype_936763465.md) must still be called once for each call to this method, even if the same GUID is registered multiple times.
     * 
     * An annotation type registration lasts as long as the process for which it was registered or until [UnregisterAnnotationType(Windows.UI.UIAutomation.Core.AutomationAnnotationTypeRegistration)](coreautomationregistrar_unregisterannotationtype_936763465.md) is called.
     * @param {Guid} guid The GUID that represents the custom annotation type. This must be the same as the GUID used by the UI Automation provider.
     * @returns {AutomationAnnotationTypeRegistration} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.coreautomationregistrar.registerannotationtype
     */
    static RegisterAnnotationType(guid) {
        if (!CoreAutomationRegistrar.HasProp("__ICoreAutomationRegistrarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.UIAutomation.Core.CoreAutomationRegistrar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreAutomationRegistrarStatics.IID)
            CoreAutomationRegistrar.__ICoreAutomationRegistrarStatics := ICoreAutomationRegistrarStatics(factoryPtr)
        }

        return CoreAutomationRegistrar.__ICoreAutomationRegistrarStatics.RegisterAnnotationType(guid)
    }

    /**
     * Unregisters a custom annotation type that was previously registered for text ranges with [RegisterAnnotationType(System.Guid)](coreautomationregistrar_registerannotationtype_1084655315.md).
     * @remarks
     * An annotation type registration lasts as long as the process for which it was registered. You can call this method, or let the registration expire with the process for which it was registered.
     * 
     * If the same annotation type is registered more than once, this method must be called for each.
     * @param {AutomationAnnotationTypeRegistration} registration A registration object returned by [RegisterAnnotationType(System.Guid)](coreautomationregistrar_registerannotationtype_1084655315.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.coreautomationregistrar.unregisterannotationtype
     */
    static UnregisterAnnotationType(registration) {
        if (!CoreAutomationRegistrar.HasProp("__ICoreAutomationRegistrarStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.UIAutomation.Core.CoreAutomationRegistrar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreAutomationRegistrarStatics.IID)
            CoreAutomationRegistrar.__ICoreAutomationRegistrarStatics := ICoreAutomationRegistrarStatics(factoryPtr)
        }

        return CoreAutomationRegistrar.__ICoreAutomationRegistrarStatics.UnregisterAnnotationType(registration)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
