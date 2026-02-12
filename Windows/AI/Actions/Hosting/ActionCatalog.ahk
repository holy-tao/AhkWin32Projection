#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActionCatalog.ahk
#Include .\IActionCatalog2.ahk
#Include .\IActionCatalog3.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\ActionCatalog.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides APIs for querying for app actions that are registered with the system.
 * @remarks
 * Get an instance of this class by accessing the [ActionCatalog](../windows.ai.actions/actionruntime_actioncatalog.md) property of the [ActionRuntime](../windows.ai.actions/actionruntime.md) class.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actioncatalog
 * @namespace Windows.AI.Actions.Hosting
 * @version WindowsRuntime 1.4
 */
class ActionCatalog extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActionCatalog

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActionCatalog.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnChangedToken")) {
            this.remove_Changed(this.__OnChangedToken)
            this.__OnChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * Gets an array of action definitions for all actions registered with the system.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} An [ActionDefinition](actiondefinition.md) object that provides the details of an app action.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actioncatalog.getallactions
     */
    GetAllActions(result_) {
        if (!this.HasProp("__IActionCatalog")) {
            if ((queryResult := this.QueryInterface(IActionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionCatalog := IActionCatalog(outPtr)
        }

        return this.__IActionCatalog.GetAllActions(result_)
    }

    /**
     * 
     * @param {TypedEventHandler<ActionCatalog, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(handler) {
        if (!this.HasProp("__IActionCatalog")) {
            if ((queryResult := this.QueryInterface(IActionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionCatalog := IActionCatalog(outPtr)
        }

        return this.__IActionCatalog.add_Changed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Changed(token) {
        if (!this.HasProp("__IActionCatalog")) {
            if ((queryResult := this.QueryInterface(IActionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionCatalog := IActionCatalog(outPtr)
        }

        return this.__IActionCatalog.remove_Changed(token)
    }

    /**
     * Gets an array of action instances for all actions registered with the system that accept the specified list of input entities. This overload also accepts the [WindowId](/uwp/api/windows.ui.windowid) associated with the invoker of the action.
     * @param {Integer} inputEntities_length 
     * @param {Pointer<ActionEntity>} inputEntities A list of [ActionEntity](../windows.ai.actions/actionentity.md) objects specifying the input entities for which actions are retrieved.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} An array of [ActionInstance](actioninstance.md) objects that provide the details and the invocation context of an app action as well as the ability to invoke the action.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actioncatalog.getactionsforinputs
     */
    GetActionsForInputs(inputEntities_length, inputEntities, result_) {
        if (!this.HasProp("__IActionCatalog2")) {
            if ((queryResult := this.QueryInterface(IActionCatalog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionCatalog2 := IActionCatalog2(outPtr)
        }

        return this.__IActionCatalog2.GetActionsForInputs(inputEntities_length, inputEntities, result_)
    }

    /**
     * Gets an array of action instances for all actions registered with the system that accept the specified list of input entities.
     * @param {Integer} inputEntities_length 
     * @param {Pointer<ActionEntity>} inputEntities A list of [ActionEntity](../windows.ai.actions/actionentity.md) objects specifying the input entities for which actions are retrieved.
     * @param {WindowId} invokerWindowId 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} An array of [ActionInstance](actioninstance.md) objects that provide the details and the invocation context of an app action as well as the ability to invoke the action.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actioncatalog.getactionsforinputs
     */
    GetActionsForInputs2(inputEntities_length, inputEntities, invokerWindowId, result_) {
        if (!this.HasProp("__IActionCatalog2")) {
            if ((queryResult := this.QueryInterface(IActionCatalog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionCatalog2 := IActionCatalog2(outPtr)
        }

        return this.__IActionCatalog2.GetActionsForInputs2(inputEntities_length, inputEntities, invokerWindowId, result_)
    }

    /**
     * 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetActionsForCurrentApp(result_) {
        if (!this.HasProp("__IActionCatalog3")) {
            if ((queryResult := this.QueryInterface(IActionCatalog3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionCatalog3 := IActionCatalog3(outPtr)
        }

        return this.__IActionCatalog3.GetActionsForCurrentApp(result_)
    }

    /**
     * Closes and releases any resources used by this **ActionCatalog**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actioncatalog.close
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
