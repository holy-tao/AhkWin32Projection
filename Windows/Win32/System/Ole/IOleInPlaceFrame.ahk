#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleInPlaceUIWindow.ahk

/**
 * Controls the container's top-level frame window.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-ioleinplaceframe
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleInPlaceFrame extends IOleInPlaceUIWindow{
    /**
     * The interface identifier for IOleInPlaceFrame
     * @type {Guid}
     */
    static IID => Guid("{00000116-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {HMENU} hmenuShared 
     * @param {Pointer<OLEMENUGROUPWIDTHS>} lpMenuWidths 
     * @returns {HRESULT} 
     */
    InsertMenus(hmenuShared, lpMenuWidths) {
        hmenuShared := hmenuShared is Win32Handle ? NumGet(hmenuShared, "ptr") : hmenuShared

        result := ComCall(9, this, "ptr", hmenuShared, "ptr", lpMenuWidths, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Assigns a new menu to the specified window.
     * @param {HMENU} hmenuShared 
     * @param {Pointer} holemenu 
     * @param {HWND} hwndActiveObject 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setmenu
     */
    SetMenu(hmenuShared, holemenu, hwndActiveObject) {
        hmenuShared := hmenuShared is Win32Handle ? NumGet(hmenuShared, "ptr") : hmenuShared
        hwndActiveObject := hwndActiveObject is Win32Handle ? NumGet(hwndActiveObject, "ptr") : hwndActiveObject

        result := ComCall(10, this, "ptr", hmenuShared, "ptr", holemenu, "ptr", hwndActiveObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HMENU} hmenuShared 
     * @returns {HRESULT} 
     */
    RemoveMenus(hmenuShared) {
        hmenuShared := hmenuShared is Win32Handle ? NumGet(hmenuShared, "ptr") : hmenuShared

        result := ComCall(11, this, "ptr", hmenuShared, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszStatusText 
     * @returns {HRESULT} 
     */
    SetStatusText(pszStatusText) {
        pszStatusText := pszStatusText is String ? StrPtr(pszStatusText) : pszStatusText

        result := ComCall(12, this, "ptr", pszStatusText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    EnableModeless(fEnable) {
        result := ComCall(13, this, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} lpmsg 
     * @param {Integer} wID 
     * @returns {HRESULT} 
     */
    TranslateAccelerator(lpmsg, wID) {
        result := ComCall(14, this, "ptr", lpmsg, "ushort", wID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
