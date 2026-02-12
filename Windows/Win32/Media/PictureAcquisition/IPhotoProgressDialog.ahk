#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides the progress dialog box that may be displayed when enumerating or importing images. The dialog box is modal and runs in its own thread.
 * @see https://learn.microsoft.com/windows/win32/api//content/photoacquire/nn-photoacquire-iphotoprogressdialog
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
     * The Create method creates and displays a progress dialog box that can be shown during image enumeration and acquisition.
     * @remarks
     * The dialog box that is created is modal, and runs in its own thread.
     * 
     * To close the dialog, call <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoprogressdialog-destroy">Destroy</a>.
     * @param {HWND} hwndParent Handle of the parent window.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/photoacquire/nf-photoacquire-iphotoprogressdialog-create
     */
    Create(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetWindow method retrieves the handle to the progress dialog box.
     * @returns {HWND} Specifies the handle to the progress dialog box.
     * @see https://learn.microsoft.com/windows/win32/api//content/photoacquire/nf-photoacquire-iphotoprogressdialog-getwindow
     */
    GetWindow() {
        phwndProgressDialog := HWND()
        result := ComCall(4, this, "ptr", phwndProgressDialog, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phwndProgressDialog
    }

    /**
     * The Destroy method closes and disposes of the progress dialog box shown during image enumeration and acquisition.
     * @remarks
     * Calling <c>Destroy</code> is the only way to close the progress dialog box. If <code>Destroy</c> is not called, the dialog box will remain open. The dialog box is not automatically closed when the operation in progress completes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/photoacquire/nf-photoacquire-iphotoprogressdialog-destroy
     */
    Destroy() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetTitle method sets the title of the progress dialog box.
     * @param {PWSTR} pszTitle Pointer to a null-terminated string containing the title.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/photoacquire/nf-photoacquire-iphotoprogressdialog-settitle
     */
    SetTitle(pszTitle) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle

        result := ComCall(6, this, "ptr", pszTitle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ShowCheckbox method indicates whether to show the check box in the progress dialog box indicating whether to delete images after transfer.
     * @param {Integer} nCheckboxId Integer containing the check box identifier (ID).
     * @param {BOOL} fShow Flag that, when set to <b>TRUE</b>, indicates that the check box will appear.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/photoacquire/nf-photoacquire-iphotoprogressdialog-showcheckbox
     */
    ShowCheckbox(nCheckboxId, fShow) {
        result := ComCall(7, this, "int", nCheckboxId, "int", fShow, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetCheckboxText method sets the text for the check box in the progress dialog box indicating whether to delete images after transfer.
     * @param {Integer} nCheckboxId Integer containing the check box identifier (ID).
     * @param {PWSTR} pszCheckboxText Pointer to a null-terminated string containing the check box text.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/photoacquire/nf-photoacquire-iphotoprogressdialog-setcheckboxtext
     */
    SetCheckboxText(nCheckboxId, pszCheckboxText) {
        pszCheckboxText := pszCheckboxText is String ? StrPtr(pszCheckboxText) : pszCheckboxText

        result := ComCall(8, this, "int", nCheckboxId, "ptr", pszCheckboxText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} nCheckboxId 
     * @param {BOOL} fChecked 
     * @returns {HRESULT} 
     */
    SetCheckboxCheck(nCheckboxId, fChecked) {
        result := ComCall(9, this, "int", nCheckboxId, "int", fChecked, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetCheckboxTooltip method sets the tooltip text for the check box in the progress dialog box.
     * @param {Integer} nCheckboxId Integer containing the check box identifier (ID).
     * @param {PWSTR} pszCheckboxTooltipText Pointer to a null-terminated string containing the check box tooltip text.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/photoacquire/nf-photoacquire-iphotoprogressdialog-setcheckboxtooltip
     */
    SetCheckboxTooltip(nCheckboxId, pszCheckboxTooltipText) {
        pszCheckboxTooltipText := pszCheckboxTooltipText is String ? StrPtr(pszCheckboxTooltipText) : pszCheckboxTooltipText

        result := ComCall(10, this, "int", nCheckboxId, "ptr", pszCheckboxTooltipText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IsCheckboxChecked method indicates whether the check box in the progress dialog box (typically indicating whether to delete files after transfer) is selected.
     * @param {Integer} nCheckboxId Integer value containing the check box identifier (ID).
     * @returns {BOOL} Pointer to a flag that, if set to <b>TRUE</b>, indicates that the check box is selected.
     * @see https://learn.microsoft.com/windows/win32/api//content/photoacquire/nf-photoacquire-iphotoprogressdialog-ischeckboxchecked
     */
    IsCheckboxChecked(nCheckboxId) {
        result := ComCall(11, this, "int", nCheckboxId, "int*", &pfChecked := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfChecked
    }

    /**
     * Sets the caption of the progress dialog box.
     * @remarks
     * The caption text is displayed above the progress indicator bar in the dialog box.
     * @param {PWSTR} pszTitle Pointer to a null-terminated string containing the title of the progress dialog box.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/photoacquire/nf-photoacquire-iphotoprogressdialog-setcaption
     */
    SetCaption(pszTitle) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle

        result := ComCall(12, this, "ptr", pszTitle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets either the thumbnail image displayed in the progress dialog box, the icon in the title bar of the progress dialog box, or the icon in ALT+TAB key combination windows.
     * @param {Integer} nImageType Integer value indicating the image type to set. Only one type of image type may be set at a time. The values passed to this parameter should not be considered a bit field and may not be combined with bitwise OR. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROGRESS_DIALOG_ICON_SMALL"></a><a id="progress_dialog_icon_small"></a><dl>
     * <dt><b>PROGRESS_DIALOG_ICON_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The small icon used in the title bar (normally 16 x 16 pixels).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROGRESS_DIALOG_ICON_LARGE"></a><a id="progress_dialog_icon_large"></a><dl>
     * <dt><b>PROGRESS_DIALOG_ICON_LARGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The icon used to represent the progress dialog box in Alt-Tab windows (normally 32 x 32 pixels).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROGRESS_DIALOG_ICON_THUMBNAIL"></a><a id="progress_dialog_icon_thumbnail"></a><dl>
     * <dt><b>PROGRESS_DIALOG_ICON_THUMBNAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An icon used in place of the thumbnail (up to 128 x 128 pixels).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROGRESS_DIALOG_BITMAP_THUMBNAIL"></a><a id="progress_dialog_bitmap_thumbnail"></a><dl>
     * <dt><b>PROGRESS_DIALOG_BITMAP_THUMBNAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A bitmap thumbnail (up to 128 x 128 pixels, although it will be scaled to fit if it is too large).
     * 
     * </td>
     * </tr>
     * </table>
     * @param {HICON} hIcon_ Handle to an icon object.
     * @param {HBITMAP} hBitmap_ Handle to a bitmap object representing the thumbnail image.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/photoacquire/nf-photoacquire-iphotoprogressdialog-setimage
     */
    SetImage(nImageType, hIcon_, hBitmap_) {
        hIcon_ := hIcon_ is Win32Handle ? NumGet(hIcon_, "ptr") : hIcon_
        hBitmap_ := hBitmap_ is Win32Handle ? NumGet(hBitmap_, "ptr") : hBitmap_

        result := ComCall(13, this, "int", nImageType, "ptr", hIcon_, "ptr", hBitmap_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetPercentComplete method sets a value indicating the completed portion of the current operation.
     * @remarks
     * If you pass PROGRESS_INDETERMINATE to <c>SetPercentComplete</c>, the progress bar will not progress from left to right (from 0 to 100%), but will instead animate to indicate that an operation with an indeterminate end is taking place.
     * @param {Integer} nPercent Integer value indicating the percentage of the operation that has completed. This value may be between 0 and 100 only.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/photoacquire/nf-photoacquire-iphotoprogressdialog-setpercentcomplete
     */
    SetPercentComplete(nPercent) {
        result := ComCall(14, this, "int", nPercent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetProgressText method sets the text for the progress bar in the progress dialog box.
     * @param {PWSTR} pszProgressText Pointer to a null-terminated string containing the progress text.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/photoacquire/nf-photoacquire-iphotoprogressdialog-setprogresstext
     */
    SetProgressText(pszProgressText) {
        pszProgressText := pszProgressText is String ? StrPtr(pszProgressText) : pszProgressText

        result := ComCall(15, this, "ptr", pszProgressText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IPhotoProgressActionCB} pPhotoProgressActionCB 
     * @returns {HRESULT} 
     */
    SetActionLinkCallback(pPhotoProgressActionCB) {
        result := ComCall(16, this, "ptr", pPhotoProgressActionCB, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pszCaption 
     * @returns {HRESULT} 
     */
    SetActionLinkText(pszCaption) {
        pszCaption := pszCaption is String ? StrPtr(pszCaption) : pszCaption

        result := ComCall(17, this, "ptr", pszCaption, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     */
    ShowActionLink(fShow) {
        result := ComCall(18, this, "int", fShow, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IsCancelled method indicates whether the operation has been canceled via the progress dialog box.
     * @returns {BOOL} Pointer to a flag that, if set to <b>TRUE</b>, indicates the action has been canceled.
     * @see https://learn.microsoft.com/windows/win32/api//content/photoacquire/nf-photoacquire-iphotoprogressdialog-iscancelled
     */
    IsCancelled() {
        result := ComCall(19, this, "int*", &pfCancelled := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfCancelled
    }

    /**
     * Retrieves descriptive information entered by the user, such as the tag name of the images to store.
     * @remarks
     * If the progress dialog box has been suppressed in <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquire-acquire">IPhotoAcquire::Acquire</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquireprogresscb-getuserinput">IPhotoAcquireProgressCB::GetUserInput</a> is either not implemented, or returns E_NOTIMPL, this method will return S_FALSE, and <i>pPropVarResult</i> will contain the value stored in the optional <i>pPropVarDefault</i> argument.
     * @param {Pointer<Guid>} riidType Specifies the interface identifier (ID) of the prompt type. Currently, the only supported value is IID_IUserInputString.
     * @param {IUnknown} pUnknown Pointer to an object of the prompt class. Currently, the only supported type is <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nn-photoacquire-iuserinputstring">IUserInputString</a>.
     * @param {Pointer<PROPVARIANT>} pPropVarDefault Pointer to a property variant containing the default value to be used if no input is supplied.
     * @returns {PROPVARIANT} Pointer to a property variant that stores the user input. Must be freed by the caller using <b>ClearPropVariant</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/photoacquire/nf-photoacquire-iphotoprogressdialog-getuserinput
     */
    GetUserInput(riidType, pUnknown, pPropVarDefault) {
        pPropVarResult := PROPVARIANT()
        result := ComCall(20, this, "ptr", riidType, "ptr", pUnknown, "ptr", pPropVarResult, "ptr", pPropVarDefault, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pPropVarResult
    }
}
