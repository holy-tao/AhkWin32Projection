#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class IInjectedInputMouseInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInjectedInputMouseInfo
     * @type {Guid}
     */
    static IID => Guid("{96f56e6b-e47a-5cf4-418d-8a5fb9670c7d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MouseOptions", "put_MouseOptions", "get_MouseData", "put_MouseData", "get_DeltaY", "put_DeltaY", "get_DeltaX", "put_DeltaX", "get_TimeOffsetInMilliseconds", "put_TimeOffsetInMilliseconds"]

    /**
     * @type {Integer} 
     */
    MouseOptions {
        get => this.get_MouseOptions()
        set => this.put_MouseOptions(value)
    }

    /**
     * @type {Integer} 
     */
    MouseData {
        get => this.get_MouseData()
        set => this.put_MouseData(value)
    }

    /**
     * @type {Integer} 
     */
    DeltaY {
        get => this.get_DeltaY()
        set => this.put_DeltaY(value)
    }

    /**
     * @type {Integer} 
     */
    DeltaX {
        get => this.get_DeltaX()
        set => this.put_DeltaX(value)
    }

    /**
     * @type {Integer} 
     */
    TimeOffsetInMilliseconds {
        get => this.get_TimeOffsetInMilliseconds()
        set => this.put_TimeOffsetInMilliseconds(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MouseOptions() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
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
    put_MouseOptions(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MouseData() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
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
    put_MouseData(value) {
        result := ComCall(9, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DeltaY() {
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
    put_DeltaY(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DeltaX() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_DeltaX(value) {
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
    get_TimeOffsetInMilliseconds() {
        result := ComCall(14, this, "uint*", &value := 0, "int")
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
    put_TimeOffsetInMilliseconds(value) {
        result := ComCall(15, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
