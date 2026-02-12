#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeploymentWorkload.ahk
#Include .\IDeploymentWorkloadFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class DeploymentWorkload extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeploymentWorkload

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeploymentWorkload.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {HSTRING} id 
     * @returns {DeploymentWorkload} 
     */
    static CreateInstance(id) {
        if (!DeploymentWorkload.HasProp("__IDeploymentWorkloadFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Setup.DeploymentWorkload")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeploymentWorkloadFactory.IID)
            DeploymentWorkload.__IDeploymentWorkloadFactory := IDeploymentWorkloadFactory(factoryPtr)
        }

        return DeploymentWorkload.__IDeploymentWorkloadFactory.CreateInstance(id)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayFriendlyName {
        get => this.get_DisplayFriendlyName()
        set => this.put_DisplayFriendlyName(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    EndTime {
        get => this.get_EndTime()
        set => this.put_EndTime(value)
    }

    /**
     * @type {Integer} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
        set => this.put_ErrorCode(value)
    }

    /**
     * @type {HSTRING} 
     */
    ErrorMessage {
        get => this.get_ErrorMessage()
        set => this.put_ErrorMessage(value)
    }

    /**
     * @type {HSTRING} 
     */
    PossibleCause {
        get => this.get_PossibleCause()
        set => this.put_PossibleCause(value)
    }

    /**
     * @type {HSTRING} 
     */
    PossibleResolution {
        get => this.get_PossibleResolution()
        set => this.put_PossibleResolution(value)
    }

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
        set => this.put_State(value)
    }

    /**
     * @type {HSTRING} 
     */
    StateDetails {
        get => this.get_StateDetails()
        set => this.put_StateDetails(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayFriendlyName() {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.get_DisplayFriendlyName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayFriendlyName(value) {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.put_DisplayFriendlyName(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_StartTime() {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.get_StartTime()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_StartTime(value) {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.put_StartTime(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_EndTime() {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.get_EndTime()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_EndTime(value) {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.put_EndTime(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.get_ErrorCode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ErrorCode(value) {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.put_ErrorCode(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ErrorMessage() {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.get_ErrorMessage()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ErrorMessage(value) {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.put_ErrorMessage(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PossibleCause() {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.get_PossibleCause()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PossibleCause(value) {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.put_PossibleCause(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PossibleResolution() {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.get_PossibleResolution()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PossibleResolution(value) {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.put_PossibleResolution(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.get_State()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_State(value) {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.put_State(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StateDetails() {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.get_StateDetails()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_StateDetails(value) {
        if (!this.HasProp("__IDeploymentWorkload")) {
            if ((queryResult := this.QueryInterface(IDeploymentWorkload.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentWorkload := IDeploymentWorkload(outPtr)
        }

        return this.__IDeploymentWorkload.put_StateDetails(value)
    }

;@endregion Instance Methods
}
