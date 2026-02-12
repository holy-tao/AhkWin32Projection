#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\GridLength.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IColumnDefinition extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IColumnDefinition
     * @type {Guid}
     */
    static IID => Guid("{f7f1b229-f024-467f-970a-7e705615db7b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Width", "put_Width", "get_MaxWidth", "put_MaxWidth", "get_MinWidth", "put_MinWidth", "get_ActualWidth"]

    /**
     * @type {GridLength} 
     */
    Width {
        get => this.get_Width()
        set => this.put_Width(value)
    }

    /**
     * @type {Float} 
     */
    MaxWidth {
        get => this.get_MaxWidth()
        set => this.put_MaxWidth(value)
    }

    /**
     * @type {Float} 
     */
    MinWidth {
        get => this.get_MinWidth()
        set => this.put_MinWidth(value)
    }

    /**
     * @type {Float} 
     */
    ActualWidth {
        get => this.get_ActualWidth()
    }

    /**
     * 
     * @returns {GridLength} 
     */
    get_Width() {
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
    put_Width(value) {
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
    get_MaxWidth() {
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
    put_MaxWidth(value) {
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
    get_MinWidth() {
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
    put_MinWidth(value) {
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
    get_ActualWidth() {
        result := ComCall(12, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
