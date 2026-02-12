#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAutomationConnectionBoundObject.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an object associated with a specific UI Automation provider connection.
 * @remarks
 * A UI Automation (UIA) client imports a connection-bound object into a remote operation, and then either uses it as the target object when calling an extension, or passes it as an operand to an extension.
 * 
 * The provider-side extension handler always executes on the thread where the remote operation is evaluated. Whenever a provider sets an operand to a connection-bound object, the threading model of this object is determined by the value of the [IsComThreadingRequired](../windows.ui.uiautomation.core/icoreautomationconnectionboundobjectprovider_iscomthreadingrequired.md) property on the provider’s implementation of the [ICoreAutomationConnectionBoundObjectProvider](../windows.ui.uiautomation.core/icoreautomationconnectionboundobjectprovider.md) interface. If this property is true and the the connection-bound object is returned in the result of the remote operation, then the connection-bound object will be bound to the apartment where the remote operation that first introduced the object was evaluated.
 * 
 * This object wraps an [ICoreAutomationConnectionBoundObjectProvider](../windows.ui.uiautomation.core/icoreautomationconnectionboundobjectprovider.md), which is implemented by a UIA provider.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.automationconnectionboundobject
 * @namespace Windows.UI.UIAutomation
 * @version WindowsRuntime 1.4
 */
class AutomationConnectionBoundObject extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutomationConnectionBoundObject

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutomationConnectionBoundObject.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the connection details for the connection-bound object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.automationconnectionboundobject.connection
     * @type {AutomationConnection} 
     */
    Connection {
        get => this.get_Connection()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AutomationConnection} 
     */
    get_Connection() {
        if (!this.HasProp("__IAutomationConnectionBoundObject")) {
            if ((queryResult := this.QueryInterface(IAutomationConnectionBoundObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationConnectionBoundObject := IAutomationConnectionBoundObject(outPtr)
        }

        return this.__IAutomationConnectionBoundObject.get_Connection()
    }

;@endregion Instance Methods
}
