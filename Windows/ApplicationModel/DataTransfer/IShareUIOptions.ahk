#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IShareUIOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShareUIOptions
     * @type {Guid}
     */
    static IID => Guid("{72fa8a80-342f-4d90-9551-2ae04e37680c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Theme", "put_Theme", "get_SelectionRect", "put_SelectionRect"]

    /**
     * @type {Integer} 
     */
    Theme {
        get => this.get_Theme()
        set => this.put_Theme(value)
    }

    /**
     * @type {IReference<RECT>} 
     */
    SelectionRect {
        get => this.get_SelectionRect()
        set => this.put_SelectionRect(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Theme() {
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
    put_Theme(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<RECT>} 
     */
    get_SelectionRect() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetRECT(), value)
    }

    /**
     * 
     * @param {IReference<RECT>} value 
     * @returns {HRESULT} 
     */
    put_SelectionRect(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
