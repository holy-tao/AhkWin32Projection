#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IControlOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IControlOverrides
     * @type {Guid}
     */
    static IID => Guid("{a09691df-9824-41fe-b530-b0d8990e64c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnPointerEntered", "OnPointerPressed", "OnPointerMoved", "OnPointerReleased", "OnPointerExited", "OnPointerCaptureLost", "OnPointerCanceled", "OnPointerWheelChanged", "OnTapped", "OnDoubleTapped", "OnHolding", "OnRightTapped", "OnManipulationStarting", "OnManipulationInertiaStarting", "OnManipulationStarted", "OnManipulationDelta", "OnManipulationCompleted", "OnKeyUp", "OnKeyDown", "OnGotFocus", "OnLostFocus", "OnDragEnter", "OnDragLeave", "OnDragOver", "OnDrop"]

    /**
     * 
     * @param {PointerRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnPointerEntered(e) {
        result := ComCall(6, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnPointerPressed(e) {
        result := ComCall(7, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnPointerMoved(e) {
        result := ComCall(8, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnPointerReleased(e) {
        result := ComCall(9, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnPointerExited(e) {
        result := ComCall(10, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnPointerCaptureLost(e) {
        result := ComCall(11, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnPointerCanceled(e) {
        result := ComCall(12, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnPointerWheelChanged(e) {
        result := ComCall(13, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TappedRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnTapped(e) {
        result := ComCall(14, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DoubleTappedRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnDoubleTapped(e) {
        result := ComCall(15, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HoldingRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnHolding(e) {
        result := ComCall(16, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RightTappedRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnRightTapped(e) {
        result := ComCall(17, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ManipulationStartingRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnManipulationStarting(e) {
        result := ComCall(18, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ManipulationInertiaStartingRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnManipulationInertiaStarting(e) {
        result := ComCall(19, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ManipulationStartedRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnManipulationStarted(e) {
        result := ComCall(20, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ManipulationDeltaRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnManipulationDelta(e) {
        result := ComCall(21, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ManipulationCompletedRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnManipulationCompleted(e) {
        result := ComCall(22, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {KeyRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnKeyUp(e) {
        result := ComCall(23, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {KeyRoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnKeyDown(e) {
        result := ComCall(24, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnGotFocus(e) {
        result := ComCall(25, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RoutedEventArgs} e 
     * @returns {HRESULT} 
     */
    OnLostFocus(e) {
        result := ComCall(26, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DragEventArgs} e 
     * @returns {HRESULT} 
     */
    OnDragEnter(e) {
        result := ComCall(27, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DragEventArgs} e 
     * @returns {HRESULT} 
     */
    OnDragLeave(e) {
        result := ComCall(28, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DragEventArgs} e 
     * @returns {HRESULT} 
     */
    OnDragOver(e) {
        result := ComCall(29, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DragEventArgs} e 
     * @returns {HRESULT} 
     */
    OnDrop(e) {
        result := ComCall(30, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
