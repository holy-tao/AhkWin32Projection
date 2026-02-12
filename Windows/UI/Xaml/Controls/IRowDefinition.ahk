#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\GridLength.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRowDefinition extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowDefinition
     * @type {Guid}
     */
    static IID => Guid("{4abae829-d80c-4a5e-a48c-f8b3d3b6533d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Height", "put_Height", "get_MaxHeight", "put_MaxHeight", "get_MinHeight", "put_MinHeight", "get_ActualHeight"]

    /**
     * @type {GridLength} 
     */
    Height {
        get => this.get_Height()
        set => this.put_Height(value)
    }

    /**
     * @type {Float} 
     */
    MaxHeight {
        get => this.get_MaxHeight()
        set => this.put_MaxHeight(value)
    }

    /**
     * @type {Float} 
     */
    MinHeight {
        get => this.get_MinHeight()
        set => this.put_MinHeight(value)
    }

    /**
     * @type {Float} 
     */
    ActualHeight {
        get => this.get_ActualHeight()
    }

    /**
     * 
     * @returns {GridLength} 
     */
    get_Height() {
        value := GridLength()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {GridLength} value 
     * @returns {HRESULT} 
     */
    put_Height(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxHeight() {
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
    put_MaxHeight(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinHeight() {
        result := ComCall(10, this, "double*", &value := 0, "int")
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
    put_MinHeight(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ActualHeight() {
        result := ComCall(12, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
