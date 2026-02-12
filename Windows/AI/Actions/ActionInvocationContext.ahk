#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActionInvocationContext.ahk
#Include .\IActionInvocationContext2.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides context information related to the invocation of an App Action for Windows.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationcontext
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class ActionInvocationContext extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActionInvocationContext

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActionInvocationContext.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a factory class that is used to instantiate entity types.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationcontext.entityfactory
     * @type {ActionEntityFactory} 
     */
    EntityFactory {
        get => this.get_EntityFactory()
    }

    /**
     * Gets or sets the result status of an app action invocation.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationcontext.result
     * @type {Integer} 
     */
    Result {
        get => this.get_Result()
        set => this.put_Result(value)
    }

    /**
     * Gets or sets the extended error for the app action invocation.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationcontext.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
        set => this.put_ExtendedError(value)
    }

    /**
     * Gets the identifier for the window from which the app action invocation was initiated.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationcontext.invokerwindowid
     * @type {WindowId} 
     */
    InvokerWindowId {
        get => this.get_InvokerWindowId()
    }

    /**
     * Gets an object that conveys help information for the app action invocation.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationcontext.helpdetails
     * @type {ActionInvocationHelpDetails} 
     */
    HelpDetails {
        get => this.get_HelpDetails()
    }

    /**
     * Gets the ID of the app action for the current invocation.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationcontext.actionid
     * @type {HSTRING} 
     */
    ActionId {
        get => this.get_ActionId()
    }

    /**
     * Gets the Application User Model ID (AppUserModelID) for the app from which the app action invocation was initiated.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationcontext.invokerappusermodelid
     * @type {HSTRING} 
     */
    InvokerAppUserModelId {
        get => this.get_InvokerAppUserModelId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {ActionEntityFactory} 
     */
    get_EntityFactory() {
        if (!this.HasProp("__IActionInvocationContext")) {
            if ((queryResult := this.QueryInterface(IActionInvocationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationContext := IActionInvocationContext(outPtr)
        }

        return this.__IActionInvocationContext.get_EntityFactory()
    }

    /**
     * Sets the input entity for an app action invocation.
     * @param {HSTRING} inputName The name of the input entity. The name must match the name declared in the Action definition JSON file. For more information, see [Action definition JSON schema for App Actions on Windows](/windows/ai/app-actions/actions-json).
     * @param {ActionEntity} inputValue An instance of one of the entity classes that inherits from [ActionEntity](actionentity.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationcontext.setinputentity
     */
    SetInputEntity(inputName, inputValue) {
        if (!this.HasProp("__IActionInvocationContext")) {
            if ((queryResult := this.QueryInterface(IActionInvocationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationContext := IActionInvocationContext(outPtr)
        }

        return this.__IActionInvocationContext.SetInputEntity(inputName, inputValue)
    }

    /**
     * Gets a list of input entities for the app action being invoked.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} An array of [NamedActionEntity](namedactionentity.md) objects representing the input entities for the app action.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationcontext.getinputentities
     */
    GetInputEntities(result_) {
        if (!this.HasProp("__IActionInvocationContext")) {
            if ((queryResult := this.QueryInterface(IActionInvocationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationContext := IActionInvocationContext(outPtr)
        }

        return this.__IActionInvocationContext.GetInputEntities(result_)
    }

    /**
     * Sets the output entity for an app action invocation.
     * @param {HSTRING} outputName The name of the output entity. The name must match the name declared in the Action definition JSON file. For more information, see [Action definition JSON schema for App Actions on Windows](/windows/ai/app-actions/actions-json).
     * @param {ActionEntity} outputValue An instance of one of the entity classes that inherits from [ActionEntity](actionentity.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationcontext.setoutputentity
     */
    SetOutputEntity(outputName, outputValue) {
        if (!this.HasProp("__IActionInvocationContext")) {
            if ((queryResult := this.QueryInterface(IActionInvocationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationContext := IActionInvocationContext(outPtr)
        }

        return this.__IActionInvocationContext.SetOutputEntity(outputName, outputValue)
    }

    /**
     * Gets a list of output entities for the app action being invoked.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} An array of [NamedActionEntity](namedactionentity.md) objects representing the output entities for the app action.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationcontext.getoutputentities
     */
    GetOutputEntities(result_) {
        if (!this.HasProp("__IActionInvocationContext")) {
            if ((queryResult := this.QueryInterface(IActionInvocationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationContext := IActionInvocationContext(outPtr)
        }

        return this.__IActionInvocationContext.GetOutputEntities(result_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Result() {
        if (!this.HasProp("__IActionInvocationContext")) {
            if ((queryResult := this.QueryInterface(IActionInvocationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationContext := IActionInvocationContext(outPtr)
        }

        return this.__IActionInvocationContext.get_Result()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Result(value) {
        if (!this.HasProp("__IActionInvocationContext")) {
            if ((queryResult := this.QueryInterface(IActionInvocationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationContext := IActionInvocationContext(outPtr)
        }

        return this.__IActionInvocationContext.put_Result(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IActionInvocationContext")) {
            if ((queryResult := this.QueryInterface(IActionInvocationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationContext := IActionInvocationContext(outPtr)
        }

        return this.__IActionInvocationContext.get_ExtendedError()
    }

    /**
     * 
     * @param {HRESULT} value 
     * @returns {HRESULT} 
     */
    put_ExtendedError(value) {
        if (!this.HasProp("__IActionInvocationContext")) {
            if ((queryResult := this.QueryInterface(IActionInvocationContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationContext := IActionInvocationContext(outPtr)
        }

        return this.__IActionInvocationContext.put_ExtendedError(value)
    }

    /**
     * 
     * @returns {WindowId} 
     */
    get_InvokerWindowId() {
        if (!this.HasProp("__IActionInvocationContext2")) {
            if ((queryResult := this.QueryInterface(IActionInvocationContext2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationContext2 := IActionInvocationContext2(outPtr)
        }

        return this.__IActionInvocationContext2.get_InvokerWindowId()
    }

    /**
     * 
     * @returns {ActionInvocationHelpDetails} 
     */
    get_HelpDetails() {
        if (!this.HasProp("__IActionInvocationContext2")) {
            if ((queryResult := this.QueryInterface(IActionInvocationContext2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationContext2 := IActionInvocationContext2(outPtr)
        }

        return this.__IActionInvocationContext2.get_HelpDetails()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ActionId() {
        if (!this.HasProp("__IActionInvocationContext2")) {
            if ((queryResult := this.QueryInterface(IActionInvocationContext2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationContext2 := IActionInvocationContext2(outPtr)
        }

        return this.__IActionInvocationContext2.get_ActionId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InvokerAppUserModelId() {
        if (!this.HasProp("__IActionInvocationContext2")) {
            if ((queryResult := this.QueryInterface(IActionInvocationContext2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationContext2 := IActionInvocationContext2(outPtr)
        }

        return this.__IActionInvocationContext2.get_InvokerAppUserModelId()
    }

    /**
     * Closes and releases any resources used by this **ActionInvocationContext**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationcontext.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
