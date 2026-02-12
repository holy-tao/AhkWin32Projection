#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IListViewBase5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IListViewBase5
     * @type {Guid}
     */
    static IID => Guid("{1a9c6e99-1719-4b80-b335-628331a07019}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SingleSelectionFollowsFocus", "put_SingleSelectionFollowsFocus", "IsDragSource"]

    /**
     * @type {Boolean} 
     */
    SingleSelectionFollowsFocus {
        get => this.get_SingleSelectionFollowsFocus()
        set => this.put_SingleSelectionFollowsFocus(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SingleSelectionFollowsFocus() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_SingleSelectionFollowsFocus(value) {
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
    IsDragSource() {
        result := ComCall(8, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
