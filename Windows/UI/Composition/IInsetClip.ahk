#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IInsetClip extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInsetClip
     * @type {Guid}
     */
    static IID => Guid("{1e73e647-84c7-477a-b474-5880e0442e15}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BottomInset", "put_BottomInset", "get_LeftInset", "put_LeftInset", "get_RightInset", "put_RightInset", "get_TopInset", "put_TopInset"]

    /**
     * @type {Float} 
     */
    BottomInset {
        get => this.get_BottomInset()
        set => this.put_BottomInset(value)
    }

    /**
     * @type {Float} 
     */
    LeftInset {
        get => this.get_LeftInset()
        set => this.put_LeftInset(value)
    }

    /**
     * @type {Float} 
     */
    RightInset {
        get => this.get_RightInset()
        set => this.put_RightInset(value)
    }

    /**
     * @type {Float} 
     */
    TopInset {
        get => this.get_TopInset()
        set => this.put_TopInset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BottomInset() {
        result := ComCall(6, this, "float*", &value := 0, "int")
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
    put_BottomInset(value) {
        result := ComCall(7, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LeftInset() {
        result := ComCall(8, this, "float*", &value := 0, "int")
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
    put_LeftInset(value) {
        result := ComCall(9, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RightInset() {
        result := ComCall(10, this, "float*", &value := 0, "int")
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
    put_RightInset(value) {
        result := ComCall(11, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TopInset() {
        result := ComCall(12, this, "float*", &value := 0, "int")
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
    put_TopInset(value) {
        result := ComCall(13, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
