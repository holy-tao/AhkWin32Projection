#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionGeometry extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionGeometry
     * @type {Guid}
     */
    static IID => Guid("{e985217c-6a17-4207-abd8-5fd3dd612a9d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TrimEnd", "put_TrimEnd", "get_TrimOffset", "put_TrimOffset", "get_TrimStart", "put_TrimStart"]

    /**
     * @type {Float} 
     */
    TrimEnd {
        get => this.get_TrimEnd()
        set => this.put_TrimEnd(value)
    }

    /**
     * @type {Float} 
     */
    TrimOffset {
        get => this.get_TrimOffset()
        set => this.put_TrimOffset(value)
    }

    /**
     * @type {Float} 
     */
    TrimStart {
        get => this.get_TrimStart()
        set => this.put_TrimStart(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TrimEnd() {
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
    put_TrimEnd(value) {
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
    get_TrimOffset() {
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
    put_TrimOffset(value) {
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
    get_TrimStart() {
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
    put_TrimStart(value) {
        result := ComCall(11, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
