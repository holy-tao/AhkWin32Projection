#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAgentProvisioningProgressReport.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class AgentProvisioningProgressReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAgentProvisioningProgressReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAgentProvisioningProgressReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
        set => this.put_State(value)
    }

    /**
     * @type {Float} 
     */
    ProgressPercentage {
        get => this.get_ProgressPercentage()
        set => this.put_ProgressPercentage(value)
    }

    /**
     * @type {TimeSpan} 
     */
    EstimatedTimeRemaining {
        get => this.get_EstimatedTimeRemaining()
        set => this.put_EstimatedTimeRemaining(value)
    }

    /**
     * @type {HSTRING} 
     */
    DisplayProgress {
        get => this.get_DisplayProgress()
        set => this.put_DisplayProgress(value)
    }

    /**
     * @type {HSTRING} 
     */
    DisplayProgressSecondary {
        get => this.get_DisplayProgressSecondary()
        set => this.put_DisplayProgressSecondary(value)
    }

    /**
     * @type {IVector<DeploymentWorkloadBatch>} 
     */
    Batches {
        get => this.get_Batches()
    }

    /**
     * @type {Integer} 
     */
    CurrentBatchIndex {
        get => this.get_CurrentBatchIndex()
        set => this.put_CurrentBatchIndex(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Management.Setup.AgentProvisioningProgressReport")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IAgentProvisioningProgressReport")) {
            if ((queryResult := this.QueryInterface(IAgentProvisioningProgressReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAgentProvisioningProgressReport := IAgentProvisioningProgressReport(outPtr)
        }

        return this.__IAgentProvisioningProgressReport.get_State()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_State(value) {
        if (!this.HasProp("__IAgentProvisioningProgressReport")) {
            if ((queryResult := this.QueryInterface(IAgentProvisioningProgressReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAgentProvisioningProgressReport := IAgentProvisioningProgressReport(outPtr)
        }

        return this.__IAgentProvisioningProgressReport.put_State(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ProgressPercentage() {
        if (!this.HasProp("__IAgentProvisioningProgressReport")) {
            if ((queryResult := this.QueryInterface(IAgentProvisioningProgressReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAgentProvisioningProgressReport := IAgentProvisioningProgressReport(outPtr)
        }

        return this.__IAgentProvisioningProgressReport.get_ProgressPercentage()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ProgressPercentage(value) {
        if (!this.HasProp("__IAgentProvisioningProgressReport")) {
            if ((queryResult := this.QueryInterface(IAgentProvisioningProgressReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAgentProvisioningProgressReport := IAgentProvisioningProgressReport(outPtr)
        }

        return this.__IAgentProvisioningProgressReport.put_ProgressPercentage(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_EstimatedTimeRemaining() {
        if (!this.HasProp("__IAgentProvisioningProgressReport")) {
            if ((queryResult := this.QueryInterface(IAgentProvisioningProgressReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAgentProvisioningProgressReport := IAgentProvisioningProgressReport(outPtr)
        }

        return this.__IAgentProvisioningProgressReport.get_EstimatedTimeRemaining()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_EstimatedTimeRemaining(value) {
        if (!this.HasProp("__IAgentProvisioningProgressReport")) {
            if ((queryResult := this.QueryInterface(IAgentProvisioningProgressReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAgentProvisioningProgressReport := IAgentProvisioningProgressReport(outPtr)
        }

        return this.__IAgentProvisioningProgressReport.put_EstimatedTimeRemaining(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayProgress() {
        if (!this.HasProp("__IAgentProvisioningProgressReport")) {
            if ((queryResult := this.QueryInterface(IAgentProvisioningProgressReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAgentProvisioningProgressReport := IAgentProvisioningProgressReport(outPtr)
        }

        return this.__IAgentProvisioningProgressReport.get_DisplayProgress()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayProgress(value) {
        if (!this.HasProp("__IAgentProvisioningProgressReport")) {
            if ((queryResult := this.QueryInterface(IAgentProvisioningProgressReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAgentProvisioningProgressReport := IAgentProvisioningProgressReport(outPtr)
        }

        return this.__IAgentProvisioningProgressReport.put_DisplayProgress(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayProgressSecondary() {
        if (!this.HasProp("__IAgentProvisioningProgressReport")) {
            if ((queryResult := this.QueryInterface(IAgentProvisioningProgressReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAgentProvisioningProgressReport := IAgentProvisioningProgressReport(outPtr)
        }

        return this.__IAgentProvisioningProgressReport.get_DisplayProgressSecondary()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayProgressSecondary(value) {
        if (!this.HasProp("__IAgentProvisioningProgressReport")) {
            if ((queryResult := this.QueryInterface(IAgentProvisioningProgressReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAgentProvisioningProgressReport := IAgentProvisioningProgressReport(outPtr)
        }

        return this.__IAgentProvisioningProgressReport.put_DisplayProgressSecondary(value)
    }

    /**
     * 
     * @returns {IVector<DeploymentWorkloadBatch>} 
     */
    get_Batches() {
        if (!this.HasProp("__IAgentProvisioningProgressReport")) {
            if ((queryResult := this.QueryInterface(IAgentProvisioningProgressReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAgentProvisioningProgressReport := IAgentProvisioningProgressReport(outPtr)
        }

        return this.__IAgentProvisioningProgressReport.get_Batches()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentBatchIndex() {
        if (!this.HasProp("__IAgentProvisioningProgressReport")) {
            if ((queryResult := this.QueryInterface(IAgentProvisioningProgressReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAgentProvisioningProgressReport := IAgentProvisioningProgressReport(outPtr)
        }

        return this.__IAgentProvisioningProgressReport.get_CurrentBatchIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CurrentBatchIndex(value) {
        if (!this.HasProp("__IAgentProvisioningProgressReport")) {
            if ((queryResult := this.QueryInterface(IAgentProvisioningProgressReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAgentProvisioningProgressReport := IAgentProvisioningProgressReport(outPtr)
        }

        return this.__IAgentProvisioningProgressReport.put_CurrentBatchIndex(value)
    }

;@endregion Instance Methods
}
