#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\DeploymentWorkloadBatch.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class IAgentProvisioningProgressReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAgentProvisioningProgressReport
     * @type {Guid}
     */
    static IID => Guid("{5097398a-70cc-5181-a7af-d31c167323d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_State", "put_State", "get_ProgressPercentage", "put_ProgressPercentage", "get_EstimatedTimeRemaining", "put_EstimatedTimeRemaining", "get_DisplayProgress", "put_DisplayProgress", "get_DisplayProgressSecondary", "put_DisplayProgressSecondary", "get_Batches", "get_CurrentBatchIndex", "put_CurrentBatchIndex"]

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

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_State(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ProgressPercentage() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ProgressPercentage(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_EstimatedTimeRemaining() {
        value := TimeSpan()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_EstimatedTimeRemaining(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayProgress() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayProgress(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayProgressSecondary() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayProgressSecondary(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<DeploymentWorkloadBatch>} 
     */
    get_Batches() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(DeploymentWorkloadBatch, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentBatchIndex() {
        result := ComCall(17, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CurrentBatchIndex(value) {
        result := ComCall(18, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
