#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActionDefinition.ahk
#Include .\IActionDefinition2.ahk
#Include .\IActionDefinition3.ahk
#Include .\IActionDefinition4.ahk
#Include .\IActionDefinition5.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides details about the app action definition.
 * @remarks
 * Actions are defined using JSON syntax that specifies information about the action such as a unique identifier, a description, and the set of inputs that it accepts. For information about the JSON syntax for defining an action, see [Action definition JSON schema for App Actions on Windows](/windows/ai/app-actions/actions-json).
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actiondefinition
 * @namespace Windows.AI.Actions.Hosting
 * @version WindowsRuntime 1.4
 */
class ActionDefinition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActionDefinition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActionDefinition.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique identifier for the app action.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actiondefinition.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the description of the app action.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actiondefinition.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * Gets the full path to the icon for the app action.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actiondefinition.iconfullpath
     * @type {HSTRING} 
     */
    IconFullPath {
        get => this.get_IconFullPath()
    }

    /**
     * Gets the Package Family Name (PFN) for the app action provider app.
     * @remarks
     * For more information about Package Family Names, see [Package identity overview](/windows/apps/desktop/modernize/package-identity-overview).
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actiondefinition.packagefamilyname
     * @type {HSTRING} 
     */
    PackageFamilyName {
        get => this.get_PackageFamilyName()
    }

    /**
     * Gets a value indicating whether the app action displays UI.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actiondefinition.displaysui
     * @type {Boolean} 
     */
    DisplaysUI {
        get => this.get_DisplaysUI()
    }

    /**
     * Gets a value indicating whether the app action uses generative AI.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actiondefinition.usesgenerativeai
     * @type {Boolean} 
     */
    UsesGenerativeAI {
        get => this.get_UsesGenerativeAI()
    }

    /**
     * Gets a value that specifies the action definition JSON schema version used by the app action.
     * @remarks
     * For information about the JSON syntax for defining an action, see [Action definition JSON schema for App Actions on Windows](/windows/ai/app-actions/actions-json).
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actiondefinition.schemaversion
     * @type {Integer} 
     */
    SchemaVersion {
        get => this.get_SchemaVersion()
    }

    /**
     * Gets the package-relative application ID for the app action provider app.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actiondefinition.packagerelativeapplicationid
     * @type {HSTRING} 
     */
    PackageRelativeApplicationId {
        get => this.get_PackageRelativeApplicationId()
    }

    /**
     * @type {Boolean} 
     */
    IsCurrentlyAvailable {
        get => this.get_IsCurrentlyAvailable()
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
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IActionDefinition")) {
            if ((queryResult := this.QueryInterface(IActionDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionDefinition := IActionDefinition(outPtr)
        }

        return this.__IActionDefinition.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IActionDefinition")) {
            if ((queryResult := this.QueryInterface(IActionDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionDefinition := IActionDefinition(outPtr)
        }

        return this.__IActionDefinition.get_Description()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IconFullPath() {
        if (!this.HasProp("__IActionDefinition")) {
            if ((queryResult := this.QueryInterface(IActionDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionDefinition := IActionDefinition(outPtr)
        }

        return this.__IActionDefinition.get_IconFullPath()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageFamilyName() {
        if (!this.HasProp("__IActionDefinition")) {
            if ((queryResult := this.QueryInterface(IActionDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionDefinition := IActionDefinition(outPtr)
        }

        return this.__IActionDefinition.get_PackageFamilyName()
    }

    /**
     * Gets an array of objects describing the input entities accepted by an app action.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} An array of [ActionEntityRegistrationInfo](actionentityregistrationinfo.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actiondefinition.getinputs
     */
    GetInputs(result_) {
        if (!this.HasProp("__IActionDefinition")) {
            if ((queryResult := this.QueryInterface(IActionDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionDefinition := IActionDefinition(outPtr)
        }

        return this.__IActionDefinition.GetInputs(result_)
    }

    /**
     * Gets an array of objects describing the output entities returned from an app action.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} An array of [ActionEntityRegistrationInfo](actionentityregistrationinfo.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actiondefinition.getoutputs
     */
    GetOutputs(result_) {
        if (!this.HasProp("__IActionDefinition")) {
            if ((queryResult := this.QueryInterface(IActionDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionDefinition := IActionDefinition(outPtr)
        }

        return this.__IActionDefinition.GetOutputs(result_)
    }

    /**
     * Gets an array of overloads of an app action, each of which accepts a different set of inputs.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} An array of [ActionOverload](actionoverload.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actiondefinition.getoverloads
     */
    GetOverloads(result_) {
        if (!this.HasProp("__IActionDefinition")) {
            if ((queryResult := this.QueryInterface(IActionDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionDefinition := IActionDefinition(outPtr)
        }

        return this.__IActionDefinition.GetOverloads(result_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DisplaysUI() {
        if (!this.HasProp("__IActionDefinition2")) {
            if ((queryResult := this.QueryInterface(IActionDefinition2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionDefinition2 := IActionDefinition2(outPtr)
        }

        return this.__IActionDefinition2.get_DisplaysUI()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UsesGenerativeAI() {
        if (!this.HasProp("__IActionDefinition2")) {
            if ((queryResult := this.QueryInterface(IActionDefinition2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionDefinition2 := IActionDefinition2(outPtr)
        }

        return this.__IActionDefinition2.get_UsesGenerativeAI()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SchemaVersion() {
        if (!this.HasProp("__IActionDefinition2")) {
            if ((queryResult := this.QueryInterface(IActionDefinition2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionDefinition2 := IActionDefinition2(outPtr)
        }

        return this.__IActionDefinition2.get_SchemaVersion()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageRelativeApplicationId() {
        if (!this.HasProp("__IActionDefinition3")) {
            if ((queryResult := this.QueryInterface(IActionDefinition3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionDefinition3 := IActionDefinition3(outPtr)
        }

        return this.__IActionDefinition3.get_PackageRelativeApplicationId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCurrentlyAvailable() {
        if (!this.HasProp("__IActionDefinition4")) {
            if ((queryResult := this.QueryInterface(IActionDefinition4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionDefinition4 := IActionDefinition4(outPtr)
        }

        return this.__IActionDefinition4.get_IsCurrentlyAvailable()
    }

    /**
     * 
     * @param {PropertySet} qualifierValues 
     * @returns {HSTRING} 
     */
    GetIconFullPath(qualifierValues) {
        if (!this.HasProp("__IActionDefinition5")) {
            if ((queryResult := this.QueryInterface(IActionDefinition5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionDefinition5 := IActionDefinition5(outPtr)
        }

        return this.__IActionDefinition5.GetIconFullPath(qualifierValues)
    }

    /**
     * Closes and releases any resources used by this **ActionDefinition**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.hosting.actiondefinition.close
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
