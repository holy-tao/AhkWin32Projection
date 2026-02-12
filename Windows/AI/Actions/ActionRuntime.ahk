#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActionRuntime.ahk
#Include .\IActionRuntime2.ahk
#Include .\IActionRuntime3.ahk
#Include .\IActionRuntime4.ahk
#Include .\IActionRuntime5.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IActionRuntimeFactory.ahk
#Include .\IActionRuntimeStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the App Actions on Windows runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionruntime
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class ActionRuntime extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActionRuntime

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActionRuntime.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ActionRuntime} 
     */
    static GetDefault() {
        if (!ActionRuntime.HasProp("__IActionRuntimeStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.Actions.ActionRuntime")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IActionRuntimeStatics.IID)
            ActionRuntime.__IActionRuntimeStatics := IActionRuntimeStatics(factoryPtr)
        }

        return ActionRuntime.__IActionRuntimeStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionruntime.actioncatalog
     * @type {ActionCatalog} 
     */
    ActionCatalog {
        get => this.get_ActionCatalog()
    }

    /**
     * Gets an instance of the [ActionEntityFactory](actionentityfactory.md) class that is used to create instances of all the app action entity types.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionruntime.entityfactory
     * @type {ActionEntityFactory} 
     */
    EntityFactory {
        get => this.get_EntityFactory()
    }

    /**
     * Gets a value specifying the latest supported app action definition schema version.
     * @remarks
     * For more information, see [Action definition JSON schema for App Actions on Windows](/windows/ai/app-actions/actions-json).
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionruntime.latestsupportedschemaversion
     * @type {Integer} 
     */
    LatestSupportedSchemaVersion {
        get => this.get_LatestSupportedSchemaVersion()
    }

    /**
     * @type {CustomActionEntityStore} 
     */
    CustomEntityStore {
        get => this.get_CustomEntityStore()
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
     * @returns {ActionCatalog} 
     */
    get_ActionCatalog() {
        if (!this.HasProp("__IActionRuntime")) {
            if ((queryResult := this.QueryInterface(IActionRuntime.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionRuntime := IActionRuntime(outPtr)
        }

        return this.__IActionRuntime.get_ActionCatalog()
    }

    /**
     * 
     * @returns {ActionEntityFactory} 
     */
    get_EntityFactory() {
        if (!this.HasProp("__IActionRuntime")) {
            if ((queryResult := this.QueryInterface(IActionRuntime.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionRuntime := IActionRuntime(outPtr)
        }

        return this.__IActionRuntime.get_EntityFactory()
    }

    /**
     * Creates an [ActionInvocationContext](actioninvocationcontext.md) object associated with the specified action and window ID.
     * @param {HSTRING} actionId The ID of the app action for which the invocation context is created. The action ID is declared in the Action definition JSON file. For more information, see [Action definition JSON schema for App Actions on Windows](/windows/ai/app-actions/actions-json).
     * @returns {ActionInvocationContext} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionruntime.createinvocationcontext
     */
    CreateInvocationContext(actionId) {
        if (!this.HasProp("__IActionRuntime")) {
            if ((queryResult := this.QueryInterface(IActionRuntime.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionRuntime := IActionRuntime(outPtr)
        }

        return this.__IActionRuntime.CreateInvocationContext(actionId)
    }

    /**
     * Creates a new instance of the [ActionFeedback](actionfeedback.md) class that provides information about user feedback for an action.
     * @param {Integer} feedbackKind A member of the [ActionFeedbackKind](actionfeedbackkind.md) enumeration specifying the kind of user feedback represented by the new **ActionFeedback** object.
     * @returns {ActionFeedback} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionruntime.createactionfeedback
     */
    CreateActionFeedback(feedbackKind) {
        if (!this.HasProp("__IActionRuntime2")) {
            if ((queryResult := this.QueryInterface(IActionRuntime2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionRuntime2 := IActionRuntime2(outPtr)
        }

        return this.__IActionRuntime2.CreateActionFeedback(feedbackKind)
    }

    /**
     * Sets the availability status of an app action.
     * @remarks
     * For information on app action availability, see [Toggle availability of an App Action for Windows](/windows/ai/app-actions/actionsgit -availability).
     * @param {HSTRING} actionId The ID of the app action for which availability is set. The action ID is declared in the Action definition JSON file. For more information, see [Action definition JSON schema for App Actions on Windows](/windows/ai/app-actions/actions-json).
     * @param {Boolean} isAvailable True if the action is available, otherwise false.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionruntime.setactionavailability
     */
    SetActionAvailability(actionId, isAvailable) {
        if (!this.HasProp("__IActionRuntime2")) {
            if ((queryResult := this.QueryInterface(IActionRuntime2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionRuntime2 := IActionRuntime2(outPtr)
        }

        return this.__IActionRuntime2.SetActionAvailability(actionId, isAvailable)
    }

    /**
     * Gets a value indicating whether the specified entity is currently in the available state.
     * @remarks
     * For information on app action availability, see [Toggle availability of an App Action for Windows](/windows/ai/app-actions/actions-availability).
     * @param {HSTRING} actionId The ID of the entity for which availability status is queried. The ID is dynamically assigned by the system when the entity is created, such as through one of the [ActionEntityFactory](actionentityfactory.md) entity creation methods.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionruntime.getactionavailability
     */
    GetActionAvailability(actionId) {
        if (!this.HasProp("__IActionRuntime2")) {
            if ((queryResult := this.QueryInterface(IActionRuntime2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionRuntime2 := IActionRuntime2(outPtr)
        }

        return this.__IActionRuntime2.GetActionAvailability(actionId)
    }

    /**
     * Creates an [ActionInvocationContext](actioninvocationcontext.md) object associated with the specified action and window ID.
     * @param {HSTRING} actionId The ID of the app action for which the invocation context is created. The action ID is declared in the Action definition JSON file. For more information, see [Action definition JSON schema for App Actions on Windows](/windows/ai/app-actions/actions-json).
     * @param {WindowId} invokerWindowId A [WindowId](/uwp/api/windows.ui.windowid) object specifying the window that invoked the app action.
     * @returns {ActionInvocationContext} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionruntime.createinvocationcontextwithwindowid
     */
    CreateInvocationContextWithWindowId(actionId, invokerWindowId) {
        if (!this.HasProp("__IActionRuntime3")) {
            if ((queryResult := this.QueryInterface(IActionRuntime3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionRuntime3 := IActionRuntime3(outPtr)
        }

        return this.__IActionRuntime3.CreateInvocationContextWithWindowId(actionId, invokerWindowId)
    }

    /**
     * Gets the app action entity with the specified ID.
     * @param {HSTRING} entityId The ID of the entity to retrieve. The ID is dynamically assigned by the system when the entity is created, such as through one of the [ActionEntityFactory](actionentityfactory.md) entity creation methods.
     * @returns {ActionEntity} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionruntime.getactionentitybyid
     */
    GetActionEntityById(entityId) {
        if (!this.HasProp("__IActionRuntime3")) {
            if ((queryResult := this.QueryInterface(IActionRuntime3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionRuntime3 := IActionRuntime3(outPtr)
        }

        return this.__IActionRuntime3.GetActionEntityById(entityId)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LatestSupportedSchemaVersion() {
        if (!this.HasProp("__IActionRuntime3")) {
            if ((queryResult := this.QueryInterface(IActionRuntime3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionRuntime3 := IActionRuntime3(outPtr)
        }

        return this.__IActionRuntime3.get_LatestSupportedSchemaVersion()
    }

    /**
     * 
     * @param {HSTRING} token 
     * @returns {ActionInvocationContext} 
     */
    GetActionInvocationContextFromToken(token) {
        if (!this.HasProp("__IActionRuntime4")) {
            if ((queryResult := this.QueryInterface(IActionRuntime4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionRuntime4 := IActionRuntime4(outPtr)
        }

        return this.__IActionRuntime4.GetActionInvocationContextFromToken(token)
    }

    /**
     * 
     * @returns {CustomActionEntityStore} 
     */
    get_CustomEntityStore() {
        if (!this.HasProp("__IActionRuntime5")) {
            if ((queryResult := this.QueryInterface(IActionRuntime5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionRuntime5 := IActionRuntime5(outPtr)
        }

        return this.__IActionRuntime5.get_CustomEntityStore()
    }

    /**
     * Closes and releases any resources used by this **ActionRuntime**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionruntime.close
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
