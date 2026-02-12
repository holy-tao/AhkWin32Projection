#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\Controls\Primitives\Popup.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IVisualTreeHelperStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualTreeHelperStatics2
     * @type {Guid}
     */
    static IID => Guid("{07bcd176-869f-44a7-8797-2103a4c3e47a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOpenPopups"]

    /**
     * 
     * @param {Window} window_ 
     * @returns {IVectorView<Popup>} 
     */
    GetOpenPopups(window_) {
        result := ComCall(6, this, "ptr", window_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Popup, result_)
    }
}
