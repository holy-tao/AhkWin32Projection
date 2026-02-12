#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActionInstance.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an instance of an app action.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actioninstance
 * @namespace Windows.AI.Actions.Hosting
 * @version WindowsRuntime 1.4
 */
class ActionInstance extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActionInstance

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActionInstance.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an object representing the display information associated with an app action instance.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actioninstance.displayinfo
     * @type {ActionInstanceDisplayInfo} 
     */
    DisplayInfo {
        get => this.get_DisplayInfo()
    }

    /**
     * Gets the action definition for an app action instance.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actioninstance.definition
     * @type {ActionDefinition} 
     */
    Definition {
        get => this.get_Definition()
    }

    /**
     * Gets the invocation context for an app action instance.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actioninstance.context
     * @type {ActionInvocationContext} 
     */
    Context {
        get => this.get_Context()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ActionInstanceDisplayInfo} 
     */
    get_DisplayInfo() {
        if (!this.HasProp("__IActionInstance")) {
            if ((queryResult := this.QueryInterface(IActionInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInstance := IActionInstance(outPtr)
        }

        return this.__IActionInstance.get_DisplayInfo()
    }

    /**
     * 
     * @returns {ActionDefinition} 
     */
    get_Definition() {
        if (!this.HasProp("__IActionInstance")) {
            if ((queryResult := this.QueryInterface(IActionInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInstance := IActionInstance(outPtr)
        }

        return this.__IActionInstance.get_Definition()
    }

    /**
     * 
     * @returns {ActionInvocationContext} 
     */
    get_Context() {
        if (!this.HasProp("__IActionInstance")) {
            if ((queryResult := this.QueryInterface(IActionInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInstance := IActionInstance(outPtr)
        }

        return this.__IActionInstance.get_Context()
    }

    /**
     * Asynchronously invokes the app action instance.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actioninstance.invokeasync
     */
    InvokeAsync() {
        if (!this.HasProp("__IActionInstance")) {
            if ((queryResult := this.QueryInterface(IActionInstance.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInstance := IActionInstance(outPtr)
        }

        return this.__IActionInstance.InvokeAsync()
    }

;@endregion Instance Methods
}
