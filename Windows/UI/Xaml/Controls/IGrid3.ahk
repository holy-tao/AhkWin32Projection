#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IGrid3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGrid3
     * @type {Guid}
     */
    static IID => Guid("{12dfc5fc-2342-4dd2-9e7d-2090a171d1ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RowSpacing", "put_RowSpacing", "get_ColumnSpacing", "put_ColumnSpacing"]

    /**
     * @type {Float} 
     */
    RowSpacing {
        get => this.get_RowSpacing()
        set => this.put_RowSpacing(value)
    }

    /**
     * @type {Float} 
     */
    ColumnSpacing {
        get => this.get_ColumnSpacing()
        set => this.put_ColumnSpacing(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RowSpacing() {
        result := ComCall(6, this, "double*", &value := 0, "int")
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
    put_RowSpacing(value) {
        result := ComCall(7, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ColumnSpacing() {
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
    put_ColumnSpacing(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
