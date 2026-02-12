#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class IXamlUIPresenterStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlUIPresenterStatics2
     * @type {Guid}
     */
    static IID => Guid("{5c6b68d2-cf1c-4f53-bf09-6a745f7a9703}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFlyoutPlacementTargetInfo", "GetFlyoutPlacement"]

    /**
     * 
     * @param {FrameworkElement} placementTarget 
     * @param {Integer} preferredPlacement 
     * @param {Pointer<Int32>} targetPreferredPlacement 
     * @param {Pointer<Boolean>} allowFallbacks 
     * @returns {RECT} 
     */
    GetFlyoutPlacementTargetInfo(placementTarget, preferredPlacement, targetPreferredPlacement, allowFallbacks) {
        returnValue := RECT()
        result := ComCall(6, this, "ptr", placementTarget, "int", preferredPlacement, "ptr", targetPreferredPlacement, "ptr", allowFallbacks, "ptr", returnValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * 
     * @param {RECT} placementTargetBounds 
     * @param {SIZE} controlSize 
     * @param {SIZE} minControlSize 
     * @param {RECT} containerRect 
     * @param {Integer} targetPreferredPlacement 
     * @param {Boolean} allowFallbacks 
     * @param {Pointer<Int32>} chosenPlacement 
     * @returns {RECT} 
     */
    GetFlyoutPlacement(placementTargetBounds, controlSize, minControlSize, containerRect, targetPreferredPlacement, allowFallbacks, chosenPlacement) {
        returnValue := RECT()
        result := ComCall(7, this, "ptr", placementTargetBounds, "ptr", controlSize, "ptr", minControlSize, "ptr", containerRect, "int", targetPreferredPlacement, "int", allowFallbacks, "ptr", chosenPlacement, "ptr", returnValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }
}
