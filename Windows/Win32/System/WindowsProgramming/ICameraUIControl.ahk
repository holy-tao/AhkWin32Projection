#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables a user interface control for a camera device..
 * @see https://docs.microsoft.com/windows/win32/api//camerauicontrol/nn-camerauicontrol-icamerauicontrol
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class ICameraUIControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICameraUIControl
     * @type {Guid}
     */
    static IID => Guid("{b8733adf-3d68-4b8f-bb08-e28a0bed0376}")

    /**
     * The class identifier for CameraUIControl
     * @type {Guid}
     */
    static CLSID => Guid("{16d5a2be-b1c5-47b3-8eae-ccbcf452c7e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Show", "Close", "Suspend", "Resume", "GetCurrentViewType", "GetActiveItem", "GetSelectedItems", "RemoveCapturedItem"]

    /**
     * Displays the user interface control for the camera.
     * @param {IUnknown} pWindow Pointer to the user interface window.
     * @param {Integer} mode Specifies whether the user interface will be presented in a browseable or linear manner.
     * @param {Integer} selectionMode Specifies the selection mode.
     * @param {Integer} captureMode Specifies whether the user interface that will be shown allows the user to capture a photo, capture a video, or either.
     * @param {Integer} photoFormat Provides the format for capturing photos. The available formats include JPEG, PNG, and JPEG XR.
     * @param {Integer} videoFormat Provides the format for capturing videos. The available formats include MP4 and WMV.
     * @param {BOOL} bHasCloseButton TRUE if the user interface has a close button, otherwise, FALSE.
     * @param {ICameraUIControlEventCallback} pEventCallback Pointer to an event callback for the dialog. The callback is invoked if an item is captured or deleted, and when the dialog starts, or is closed or suspended.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//camerauicontrol/nf-camerauicontrol-icamerauicontrol-show
     */
    Show(pWindow, mode, selectionMode, captureMode, photoFormat, videoFormat, bHasCloseButton, pEventCallback) {
        result := ComCall(3, this, "ptr", pWindow, "int", mode, "int", selectionMode, "int", captureMode, "int", photoFormat, "int", videoFormat, "int", bHasCloseButton, "ptr", pEventCallback, "HRESULT")
        return result
    }

    /**
     * Closes the user interface control.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//camerauicontrol/nf-camerauicontrol-icamerauicontrol-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Simulates suspend of the user interface control.
     * @returns {BOOL} TRUE if the suspend operation requires deferral; otherwise, FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//camerauicontrol/nf-camerauicontrol-icamerauicontrol-suspend
     */
    Suspend() {
        result := ComCall(5, this, "int*", &pbDeferralRequired := 0, "HRESULT")
        return pbDeferralRequired
    }

    /**
     * Simulates resume of the user interface control.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//camerauicontrol/nf-camerauicontrol-icamerauicontrol-resume
     */
    Resume() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Gets the type of the current view.
     * @returns {Integer} A value that indicates whether the UI presents single items or lists of items.
     * @see https://docs.microsoft.com/windows/win32/api//camerauicontrol/nf-camerauicontrol-icamerauicontrol-getcurrentviewtype
     */
    GetCurrentViewType() {
        result := ComCall(7, this, "int*", &pViewType := 0, "HRESULT")
        return pViewType
    }

    /**
     * Gets the active captured item.
     * @returns {BSTR} Path to the currently active captured item.
     * @see https://docs.microsoft.com/windows/win32/api//camerauicontrol/nf-camerauicontrol-icamerauicontrol-getactiveitem
     */
    GetActiveItem() {
        pbstrActiveItemPath := BSTR()
        result := ComCall(8, this, "ptr", pbstrActiveItemPath, "HRESULT")
        return pbstrActiveItemPath
    }

    /**
     * Gets the selected items.
     * @returns {Pointer<SAFEARRAY>} An array of paths to captured items selected in the user interface.
     * @see https://docs.microsoft.com/windows/win32/api//camerauicontrol/nf-camerauicontrol-icamerauicontrol-getselecteditems
     */
    GetSelectedItems() {
        result := ComCall(9, this, "ptr*", &ppSelectedItemPaths := 0, "HRESULT")
        return ppSelectedItemPaths
    }

    /**
     * Removes the captured item.
     * @param {PWSTR} pszPath The path to the item to delete.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//camerauicontrol/nf-camerauicontrol-icamerauicontrol-removecaptureditem
     */
    RemoveCapturedItem(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "HRESULT")
        return result
    }
}
