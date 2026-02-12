#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\TextBoxId.ahk
#Include ..\..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class ITextBoxContentChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextBoxContentChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{2cb70a41-5aed-58c5-b4c1-8ee4e1492f9e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TextBoxId", "get_Source", "get_SelectionBounds", "IsContentAttributeChanged"]

    /**
     * @type {TextBoxId} 
     */
    TextBoxId {
        get => this.get_TextBoxId()
    }

    /**
     * @type {Integer} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * @type {RECT} 
     */
    SelectionBounds {
        get => this.get_SelectionBounds()
    }

    /**
     * 
     * @returns {TextBoxId} 
     */
    get_TextBoxId() {
        value := TextBoxId()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Source() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_SelectionBounds() {
        value := RECT()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {Boolean} 
     */
    IsContentAttributeChanged(value) {
        result := ComCall(9, this, "int", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
