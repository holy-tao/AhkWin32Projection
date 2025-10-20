#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow an application to be notified of events that are related to controls that the application has added to a common file dialog.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * <b>IFileDialogControlEvents</b> is implemented by an application on the same object that it implements <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialogevents">IFileDialogEvents</a> in.
  * 
  * The dialog does not check the return values of this interface's methods.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ifiledialogcontrolevents
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileDialogControlEvents extends IUnknown{
    /**
     * The interface identifier for IFileDialogControlEvents
     * @type {Guid}
     */
    static IID => Guid("{36116642-d713-4b97-9b83-7484a9d00433}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IFileDialogCustomize>} pfdc 
     * @param {Integer} dwIDCtl 
     * @param {Integer} dwIDItem 
     * @returns {HRESULT} 
     */
    OnItemSelected(pfdc, dwIDCtl, dwIDItem) {
        result := ComCall(3, this, "ptr", pfdc, "uint", dwIDCtl, "uint", dwIDItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFileDialogCustomize>} pfdc 
     * @param {Integer} dwIDCtl 
     * @returns {HRESULT} 
     */
    OnButtonClicked(pfdc, dwIDCtl) {
        result := ComCall(4, this, "ptr", pfdc, "uint", dwIDCtl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFileDialogCustomize>} pfdc 
     * @param {Integer} dwIDCtl 
     * @param {BOOL} bChecked 
     * @returns {HRESULT} 
     */
    OnCheckButtonToggled(pfdc, dwIDCtl, bChecked) {
        result := ComCall(5, this, "ptr", pfdc, "uint", dwIDCtl, "int", bChecked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFileDialogCustomize>} pfdc 
     * @param {Integer} dwIDCtl 
     * @returns {HRESULT} 
     */
    OnControlActivating(pfdc, dwIDCtl) {
        result := ComCall(6, this, "ptr", pfdc, "uint", dwIDCtl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
