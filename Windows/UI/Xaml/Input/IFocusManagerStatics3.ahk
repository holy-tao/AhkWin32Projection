#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\UIElement.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IFocusManagerStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFocusManagerStatics3
     * @type {Guid}
     */
    static IID => Guid("{60805ebf-b149-417d-83f1-baeb560e2a47}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindNextFocusableElement", "FindNextFocusableElementWithHint"]

    /**
     * 
     * @param {Integer} focusNavigationDirection_ 
     * @returns {UIElement} 
     */
    FindNextFocusableElement(focusNavigationDirection_) {
        result := ComCall(6, this, "int", focusNavigationDirection_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(result_)
    }

    /**
     * 
     * @param {Integer} focusNavigationDirection_ 
     * @param {RECT} hintRect 
     * @returns {UIElement} 
     */
    FindNextFocusableElementWithHint(focusNavigationDirection_, hintRect) {
        result := ComCall(7, this, "int", focusNavigationDirection_, "ptr", hintRect, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(result_)
    }
}
