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
class IVisualTreeHelperStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualTreeHelperStatics3
     * @type {Guid}
     */
    static IID => Guid("{40420d50-ca16-57da-8aac-944c8af577fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOpenPopupsForXamlRoot"]

    /**
     * 
     * @param {XamlRoot} xamlRoot_ 
     * @returns {IVectorView<Popup>} 
     */
    GetOpenPopupsForXamlRoot(xamlRoot_) {
        result := ComCall(6, this, "ptr", xamlRoot_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Popup, result_)
    }
}
