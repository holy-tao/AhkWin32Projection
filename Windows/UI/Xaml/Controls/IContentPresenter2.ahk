#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IContentPresenter2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentPresenter2
     * @type {Guid}
     */
    static IID => Guid("{5138e958-335d-4210-8bbb-0aa2b4b5c29e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OpticalMarginAlignment", "put_OpticalMarginAlignment", "get_TextLineBounds", "put_TextLineBounds"]

    /**
     * @type {Integer} 
     */
    OpticalMarginAlignment {
        get => this.get_OpticalMarginAlignment()
        set => this.put_OpticalMarginAlignment(value)
    }

    /**
     * @type {Integer} 
     */
    TextLineBounds {
        get => this.get_TextLineBounds()
        set => this.put_TextLineBounds(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OpticalMarginAlignment() {
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
    put_OpticalMarginAlignment(value) {
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
    get_TextLineBounds() {
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
    put_TextLineBounds(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
