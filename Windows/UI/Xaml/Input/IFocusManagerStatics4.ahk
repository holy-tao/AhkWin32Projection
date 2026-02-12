#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyObject.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IFocusManagerStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFocusManagerStatics4
     * @type {Guid}
     */
    static IID => Guid("{29276e9c-1c6c-414a-ba1c-96efd5962bcd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryMoveFocusWithOptions", "FindNextElement", "FindFirstFocusableElement", "FindLastFocusableElement", "FindNextElementWithOptions"]

    /**
     * 
     * @param {Integer} focusNavigationDirection_ 
     * @param {FindNextElementOptions} focusNavigationOptions 
     * @returns {Boolean} 
     */
    TryMoveFocusWithOptions(focusNavigationDirection_, focusNavigationOptions) {
        result := ComCall(6, this, "int", focusNavigationDirection_, "ptr", focusNavigationOptions, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Initializes a new instance of the [FindNextElementOptions](findnextelementoptions.md) class.
     * @param {Integer} focusNavigationDirection_ 
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.findnextelementoptions.#ctor
     */
    FindNextElement(focusNavigationDirection_) {
        result := ComCall(7, this, "int", focusNavigationDirection_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(result_)
    }

    /**
     * 
     * @param {DependencyObject} searchScope_ 
     * @returns {DependencyObject} 
     */
    FindFirstFocusableElement(searchScope_) {
        result := ComCall(8, this, "ptr", searchScope_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(result_)
    }

    /**
     * 
     * @param {DependencyObject} searchScope_ 
     * @returns {DependencyObject} 
     */
    FindLastFocusableElement(searchScope_) {
        result := ComCall(9, this, "ptr", searchScope_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(result_)
    }

    /**
     * Initializes a new instance of the [FindNextElementOptions](findnextelementoptions.md) class.
     * @param {Integer} focusNavigationDirection_ 
     * @param {FindNextElementOptions} focusNavigationOptions 
     * @returns {DependencyObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.findnextelementoptions.#ctor
     */
    FindNextElementWithOptions(focusNavigationDirection_, focusNavigationOptions) {
        result := ComCall(10, this, "int", focusNavigationDirection_, "ptr", focusNavigationOptions, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyObject(result_)
    }
}
