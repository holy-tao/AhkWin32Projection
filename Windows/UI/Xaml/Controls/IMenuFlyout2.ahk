#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IMenuFlyout2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMenuFlyout2
     * @type {Guid}
     */
    static IID => Guid("{507c7bad-d9d1-4c05-9d4b-cda8de9ab242}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowAt"]

    /**
     * 
     * @param {UIElement} targetElement 
     * @param {POINT} point_ 
     * @returns {HRESULT} 
     */
    ShowAt(targetElement, point_) {
        result := ComCall(6, this, "ptr", targetElement, "ptr", point_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
