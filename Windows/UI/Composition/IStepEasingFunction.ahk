#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IStepEasingFunction extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStepEasingFunction
     * @type {Guid}
     */
    static IID => Guid("{d0caa74b-560c-4a0b-a5f6-206ca8c3ecd6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FinalStep", "put_FinalStep", "get_InitialStep", "put_InitialStep", "get_IsFinalStepSingleFrame", "put_IsFinalStepSingleFrame", "get_IsInitialStepSingleFrame", "put_IsInitialStepSingleFrame", "get_StepCount", "put_StepCount"]

    /**
     * @type {Integer} 
     */
    FinalStep {
        get => this.get_FinalStep()
        set => this.put_FinalStep(value)
    }

    /**
     * @type {Integer} 
     */
    InitialStep {
        get => this.get_InitialStep()
        set => this.put_InitialStep(value)
    }

    /**
     * @type {Boolean} 
     */
    IsFinalStepSingleFrame {
        get => this.get_IsFinalStepSingleFrame()
        set => this.put_IsFinalStepSingleFrame(value)
    }

    /**
     * @type {Boolean} 
     */
    IsInitialStepSingleFrame {
        get => this.get_IsInitialStepSingleFrame()
        set => this.put_IsInitialStepSingleFrame(value)
    }

    /**
     * @type {Integer} 
     */
    StepCount {
        get => this.get_StepCount()
        set => this.put_StepCount(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FinalStep() {
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
    put_FinalStep(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InitialStep() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_InitialStep(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFinalStepSingleFrame() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_IsFinalStepSingleFrame(value) {
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
    get_IsInitialStepSingleFrame() {
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
    put_IsInitialStepSingleFrame(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StepCount() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_StepCount(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
