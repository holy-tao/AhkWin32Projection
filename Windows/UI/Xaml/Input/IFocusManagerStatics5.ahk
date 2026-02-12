#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\FocusMovementResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IFocusManagerStatics5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFocusManagerStatics5
     * @type {Guid}
     */
    static IID => Guid("{280edc61-207a-4d7b-b98f-ce165e1b2015}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryFocusAsync", "TryMoveFocusAsync", "TryMoveFocusWithOptionsAsync"]

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Integer} value 
     * @returns {IAsyncOperation<FocusMovementResult>} 
     */
    TryFocusAsync(element, value) {
        result := ComCall(6, this, "ptr", element, "int", value, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(FocusMovementResult, operation)
    }

    /**
     * 
     * @param {Integer} focusNavigationDirection_ 
     * @returns {IAsyncOperation<FocusMovementResult>} 
     */
    TryMoveFocusAsync(focusNavigationDirection_) {
        result := ComCall(7, this, "int", focusNavigationDirection_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(FocusMovementResult, operation)
    }

    /**
     * 
     * @param {Integer} focusNavigationDirection_ 
     * @param {FindNextElementOptions} focusNavigationOptions 
     * @returns {IAsyncOperation<FocusMovementResult>} 
     */
    TryMoveFocusWithOptionsAsync(focusNavigationDirection_, focusNavigationOptions) {
        result := ComCall(8, this, "int", focusNavigationDirection_, "ptr", focusNavigationOptions, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(FocusMovementResult, operation)
    }
}
