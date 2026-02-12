#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class IInferencingOptionsPreview extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInferencingOptionsPreview
     * @type {Guid}
     */
    static IID => Guid("{47bc8205-4d36-47a9-8f68-ffcb339dd0fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PreferredDeviceKind", "put_PreferredDeviceKind", "get_IsTracingEnabled", "put_IsTracingEnabled", "get_MaxBatchSize", "put_MaxBatchSize", "get_MinimizeMemoryAllocation", "put_MinimizeMemoryAllocation", "get_ReclaimMemoryAfterEvaluation", "put_ReclaimMemoryAfterEvaluation"]

    /**
     * @type {Integer} 
     */
    PreferredDeviceKind {
        get => this.get_PreferredDeviceKind()
        set => this.put_PreferredDeviceKind(value)
    }

    /**
     * @type {Boolean} 
     */
    IsTracingEnabled {
        get => this.get_IsTracingEnabled()
        set => this.put_IsTracingEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    MaxBatchSize {
        get => this.get_MaxBatchSize()
        set => this.put_MaxBatchSize(value)
    }

    /**
     * @type {Boolean} 
     */
    MinimizeMemoryAllocation {
        get => this.get_MinimizeMemoryAllocation()
        set => this.put_MinimizeMemoryAllocation(value)
    }

    /**
     * @type {Boolean} 
     */
    ReclaimMemoryAfterEvaluation {
        get => this.get_ReclaimMemoryAfterEvaluation()
        set => this.put_ReclaimMemoryAfterEvaluation(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreferredDeviceKind() {
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
    put_PreferredDeviceKind(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTracingEnabled() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTracingEnabled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxBatchSize() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_MaxBatchSize(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MinimizeMemoryAllocation() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MinimizeMemoryAllocation(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ReclaimMemoryAfterEvaluation() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ReclaimMemoryAfterEvaluation(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
