#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides the progress dialog box that may be displayed when enumerating or importing images. The dialog box is modal and runs in its own thread.
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nn-photoacquire-iphotoprogressdialog
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class IPhotoProgressDialog extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoProgressDialog
     * @type {Guid}
     */
    static IID => Guid("{00f246f9-0750-4f08-9381-2cd8e906a4ae}")

    /**
     * The class identifier for PhotoProgressDialog
     * @type {Guid}
     */
    static CLSID => Guid("{00f24ca0-748f-4e8a-894f-0e0357c6799f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "GetWindow", "Destroy", "SetTitle", "ShowCheckbox", "SetCheckboxText", "SetCheckboxCheck", "SetCheckboxTooltip", "IsCheckboxChecked", "SetCaption", "SetImage", "SetPercentComplete", "SetProgressText", "SetActionLinkCallback", "SetActionLinkText", "ShowActionLink", "IsCancelled", "GetUserInput"]

    /**
     * 
     * @param {HWND} hwndParent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoprogressdialog-create
     */
    Create(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "HRESULT")
        return result
    }

    /**
     * Retrieves a handle to a window that has the specified relationship (Z-Order or owner) to the specified window.
     * @param {Pointer<HWND>} phwndProgressDialog 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is a window handle. If no window exists with the specified relationship to the specified window, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getwindow
     */
    GetWindow(phwndProgressDialog) {
        result := ComCall(4, this, "ptr", phwndProgressDialog, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoprogressdialog-destroy
     */
    Destroy() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoprogressdialog-settitle
     */
    SetTitle(pszTitle) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle

        result := ComCall(6, this, "ptr", pszTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nCheckboxId 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoprogressdialog-showcheckbox
     */
    ShowCheckbox(nCheckboxId, fShow) {
        result := ComCall(7, this, "int", nCheckboxId, "int", fShow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nCheckboxId 
     * @param {PWSTR} pszCheckboxText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoprogressdialog-setcheckboxtext
     */
    SetCheckboxText(nCheckboxId, pszCheckboxText) {
        pszCheckboxText := pszCheckboxText is String ? StrPtr(pszCheckboxText) : pszCheckboxText

        result := ComCall(8, this, "int", nCheckboxId, "ptr", pszCheckboxText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nCheckboxId 
     * @param {BOOL} fChecked 
     * @returns {HRESULT} 
     */
    SetCheckboxCheck(nCheckboxId, fChecked) {
        result := ComCall(9, this, "int", nCheckboxId, "int", fChecked, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nCheckboxId 
     * @param {PWSTR} pszCheckboxTooltipText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoprogressdialog-setcheckboxtooltip
     */
    SetCheckboxTooltip(nCheckboxId, pszCheckboxTooltipText) {
        pszCheckboxTooltipText := pszCheckboxTooltipText is String ? StrPtr(pszCheckboxTooltipText) : pszCheckboxTooltipText

        result := ComCall(10, this, "int", nCheckboxId, "ptr", pszCheckboxTooltipText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nCheckboxId 
     * @param {Pointer<BOOL>} pfChecked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoprogressdialog-ischeckboxchecked
     */
    IsCheckboxChecked(nCheckboxId, pfChecked) {
        result := ComCall(11, this, "int", nCheckboxId, "ptr", pfChecked, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoprogressdialog-setcaption
     */
    SetCaption(pszTitle) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle

        result := ComCall(12, this, "ptr", pszTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nImageType 
     * @param {HICON} hIcon 
     * @param {HBITMAP} hBitmap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoprogressdialog-setimage
     */
    SetImage(nImageType, hIcon, hBitmap) {
        hIcon := hIcon is Win32Handle ? NumGet(hIcon, "ptr") : hIcon
        hBitmap := hBitmap is Win32Handle ? NumGet(hBitmap, "ptr") : hBitmap

        result := ComCall(13, this, "int", nImageType, "ptr", hIcon, "ptr", hBitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nPercent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoprogressdialog-setpercentcomplete
     */
    SetPercentComplete(nPercent) {
        result := ComCall(14, this, "int", nPercent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszProgressText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoprogressdialog-setprogresstext
     */
    SetProgressText(pszProgressText) {
        pszProgressText := pszProgressText is String ? StrPtr(pszProgressText) : pszProgressText

        result := ComCall(15, this, "ptr", pszProgressText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPhotoProgressActionCB} pPhotoProgressActionCB 
     * @returns {HRESULT} 
     */
    SetActionLinkCallback(pPhotoProgressActionCB) {
        result := ComCall(16, this, "ptr", pPhotoProgressActionCB, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszCaption 
     * @returns {HRESULT} 
     */
    SetActionLinkText(pszCaption) {
        pszCaption := pszCaption is String ? StrPtr(pszCaption) : pszCaption

        result := ComCall(17, this, "ptr", pszCaption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     */
    ShowActionLink(fShow) {
        result := ComCall(18, this, "int", fShow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfCancelled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoprogressdialog-iscancelled
     */
    IsCancelled(pfCancelled) {
        result := ComCall(19, this, "ptr", pfCancelled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riidType 
     * @param {IUnknown} pUnknown 
     * @param {Pointer<PROPVARIANT>} pPropVarResult 
     * @param {Pointer<PROPVARIANT>} pPropVarDefault 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoprogressdialog-getuserinput
     */
    GetUserInput(riidType, pUnknown, pPropVarResult, pPropVarDefault) {
        result := ComCall(20, this, "ptr", riidType, "ptr", pUnknown, "ptr", pPropVarResult, "ptr", pPropVarDefault, "HRESULT")
        return result
    }
}
