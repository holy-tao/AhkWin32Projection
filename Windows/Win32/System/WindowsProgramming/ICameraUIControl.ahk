#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {IUnknown} pWindow 
     * @param {Integer} mode 
     * @param {Integer} selectionMode 
     * @param {Integer} captureMode 
     * @param {Integer} photoFormat 
     * @param {Integer} videoFormat 
     * @param {BOOL} bHasCloseButton 
     * @param {ICameraUIControlEventCallback} pEventCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontrol-show
     */
    Show(pWindow, mode, selectionMode, captureMode, photoFormat, videoFormat, bHasCloseButton, pEventCallback) {
        result := ComCall(3, this, "ptr", pWindow, "int", mode, "int", selectionMode, "int", captureMode, "int", photoFormat, "int", videoFormat, "int", bHasCloseButton, "ptr", pEventCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontrol-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbDeferralRequired 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontrol-suspend
     */
    Suspend(pbDeferralRequired) {
        result := ComCall(5, this, "ptr", pbDeferralRequired, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontrol-resume
     */
    Resume() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pViewType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontrol-getcurrentviewtype
     */
    GetCurrentViewType(pViewType) {
        result := ComCall(7, this, "int*", pViewType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrActiveItemPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontrol-getactiveitem
     */
    GetActiveItem(pbstrActiveItemPath) {
        result := ComCall(8, this, "ptr", pbstrActiveItemPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppSelectedItemPaths 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontrol-getselecteditems
     */
    GetSelectedItems(ppSelectedItemPaths) {
        result := ComCall(9, this, "ptr*", ppSelectedItemPaths, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/camerauicontrol/nf-camerauicontrol-icamerauicontrol-removecaptureditem
     */
    RemoveCapturedItem(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "HRESULT")
        return result
    }
}
