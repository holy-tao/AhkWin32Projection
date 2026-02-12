#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Media\SolidColorBrush.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRichEditBox5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichEditBox5
     * @type {Guid}
     */
    static IID => Guid("{a66d9cea-6391-4f3b-9fd3-1fd01f49f327}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectionHighlightColorWhenNotFocused", "put_SelectionHighlightColorWhenNotFocused", "get_MaxLength", "put_MaxLength"]

    /**
     * @type {SolidColorBrush} 
     */
    SelectionHighlightColorWhenNotFocused {
        get => this.get_SelectionHighlightColorWhenNotFocused()
        set => this.put_SelectionHighlightColorWhenNotFocused(value)
    }

    /**
     * @type {Integer} 
     */
    MaxLength {
        get => this.get_MaxLength()
        set => this.put_MaxLength(value)
    }

    /**
     * 
     * @returns {SolidColorBrush} 
     */
    get_SelectionHighlightColorWhenNotFocused() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SolidColorBrush(value)
    }

    /**
     * 
     * @param {SolidColorBrush} value 
     * @returns {HRESULT} 
     */
    put_SelectionHighlightColorWhenNotFocused(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxLength() {
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
    put_MaxLength(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
