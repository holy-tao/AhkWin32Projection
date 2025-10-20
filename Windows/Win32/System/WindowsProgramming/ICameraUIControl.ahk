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
     * 
     * @param {Pointer<IUnknown>} pWindow 
     * @param {Integer} mode 
     * @param {Integer} selectionMode 
     * @param {Integer} captureMode 
     * @param {Integer} photoFormat 
     * @param {Integer} videoFormat 
     * @param {BOOL} bHasCloseButton 
     * @param {Pointer<ICameraUIControlEventCallback>} pEventCallback 
     * @returns {HRESULT} 
     */
    Show(pWindow, mode, selectionMode, captureMode, photoFormat, videoFormat, bHasCloseButton, pEventCallback) {
        result := ComCall(3, this, "ptr", pWindow, "int", mode, "int", selectionMode, "int", captureMode, "int", photoFormat, "int", videoFormat, "int", bHasCloseButton, "ptr", pEventCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbDeferralRequired 
     * @returns {HRESULT} 
     */
    Suspend(pbDeferralRequired) {
        result := ComCall(5, this, "ptr", pbDeferralRequired, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pViewType 
     * @returns {HRESULT} 
     */
    GetCurrentViewType(pViewType) {
        result := ComCall(7, this, "int*", pViewType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrActiveItemPath 
     * @returns {HRESULT} 
     */
    GetActiveItem(pbstrActiveItemPath) {
        result := ComCall(8, this, "ptr", pbstrActiveItemPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} ppSelectedItemPaths 
     * @returns {HRESULT} 
     */
    GetSelectedItems(ppSelectedItemPaths) {
        result := ComCall(9, this, "ptr", ppSelectedItemPaths, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    RemoveCapturedItem(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
