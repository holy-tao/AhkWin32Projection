#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Media\SolidColorBrush.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ITextBox5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextBox5
     * @type {Guid}
     */
    static IID => Guid("{35f9cfc1-4176-44f4-b756-e9ccc4399805}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectionHighlightColorWhenNotFocused", "put_SelectionHighlightColorWhenNotFocused"]

    /**
     * @type {SolidColorBrush} 
     */
    SelectionHighlightColorWhenNotFocused {
        get => this.get_SelectionHighlightColorWhenNotFocused()
        set => this.put_SelectionHighlightColorWhenNotFocused(value)
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
}
