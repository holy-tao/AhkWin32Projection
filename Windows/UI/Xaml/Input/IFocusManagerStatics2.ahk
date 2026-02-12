#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IFocusManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFocusManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{a920d761-dd87-4f31-beda-ef417fe7c04a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryMoveFocus"]

    /**
     * 
     * @param {Integer} focusNavigationDirection_ 
     * @returns {Boolean} 
     */
    TryMoveFocus(focusNavigationDirection_) {
        result := ComCall(6, this, "int", focusNavigationDirection_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
