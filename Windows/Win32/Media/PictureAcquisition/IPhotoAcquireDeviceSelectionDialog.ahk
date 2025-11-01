#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a dialog box for selecting the device to acquire images from.
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nn-photoacquire-iphotoacquiredeviceselectiondialog
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class IPhotoAcquireDeviceSelectionDialog extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoAcquireDeviceSelectionDialog
     * @type {Guid}
     */
    static IID => Guid("{00f28837-55dd-4f37-aaf5-6855a9640467}")

    /**
     * The class identifier for PhotoAcquireDeviceSelectionDialog
     * @type {Guid}
     */
    static CLSID => Guid("{00f29a34-b8a1-482c-bcf8-3ac7b0fe8f62}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTitle", "SetSubmitButtonText", "DoModal"]

    /**
     * 
     * @param {PWSTR} pszTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiredeviceselectiondialog-settitle
     */
    SetTitle(pszTitle) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle

        result := ComCall(3, this, "ptr", pszTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSubmitButtonText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiredeviceselectiondialog-setsubmitbuttontext
     */
    SetSubmitButtonText(pszSubmitButtonText) {
        pszSubmitButtonText := pszSubmitButtonText is String ? StrPtr(pszSubmitButtonText) : pszSubmitButtonText

        result := ComCall(4, this, "ptr", pszSubmitButtonText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWndParent 
     * @param {Integer} dwDeviceFlags 
     * @param {Pointer<BSTR>} pbstrDeviceId 
     * @param {Pointer<Integer>} pnDeviceType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiredeviceselectiondialog-domodal
     */
    DoModal(hWndParent, dwDeviceFlags, pbstrDeviceId, pnDeviceType) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        pnDeviceTypeMarshal := pnDeviceType is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", hWndParent, "uint", dwDeviceFlags, "ptr", pbstrDeviceId, pnDeviceTypeMarshal, pnDeviceType, "HRESULT")
        return result
    }
}
