#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Do not use. This interface provides access to the Windows Address Book (WAB) object which contains function pointers to memory allocation functions and database maintenance functions.
 * @see https://docs.microsoft.com/windows/win32/api//wabapi/nn-wabapi-iwabobject
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IWABObject extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLastError", "AllocateBuffer", "AllocateMore", "FreeBuffer", "Backup", "Import", "Find", "VCardDisplay", "LDAPUrl", "VCardCreate", "VCardRetrieve", "GetMe", "SetMe"]

    /**
     * Retrieves the calling thread's last-error code value.
     * @param {HRESULT} hResult 
     * @param {Integer} ulFlags 
     * @param {Pointer<Pointer<MAPIERROR>>} lppMAPIError 
     * @returns {HRESULT} The return value is the calling thread's last-error code.
     * 
     * The Return Value section of the documentation for each function that sets the last-error code notes the conditions under which the function sets the last-error code. Most functions that set the thread's last-error code set it when they fail. However, some functions also set the last-error code when they succeed. If the function is not documented to set the last-error code, the value returned by this function is simply the most recent last-error code to have been set; some functions set the last-error code to 0 on success and others do not.
     * @see https://docs.microsoft.com/windows/win32/api//errhandlingapi/nf-errhandlingapi-getlasterror
     */
    GetLastError(hResult, ulFlags, lppMAPIError) {
        result := ComCall(3, this, "int", hResult, "uint", ulFlags, "ptr*", lppMAPIError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbSize 
     * @param {Pointer<Pointer<Void>>} lppBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wabapi/nf-wabapi-iwabobject-allocatebuffer
     */
    AllocateBuffer(cbSize, lppBuffer) {
        result := ComCall(4, this, "uint", cbSize, "ptr*", lppBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbSize 
     * @param {Pointer<Void>} lpObject 
     * @param {Pointer<Pointer<Void>>} lppBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wabapi/nf-wabapi-iwabobject-allocatemore
     */
    AllocateMore(cbSize, lpObject, lppBuffer) {
        result := ComCall(5, this, "uint", cbSize, "ptr", lpObject, "ptr*", lppBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wabapi/nf-wabapi-iwabobject-freebuffer
     */
    FreeBuffer(lpBuffer) {
        result := ComCall(6, this, "ptr", lpBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} lpFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wabapi/nf-wabapi-iwabobject-backup
     */
    Backup(lpFileName) {
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

        result := ComCall(7, this, "ptr", lpFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} lpWIP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wabapi/nf-wabapi-iwabobject-import
     */
    Import(lpWIP) {
        lpWIP := lpWIP is String ? StrPtr(lpWIP) : lpWIP

        result := ComCall(8, this, "ptr", lpWIP, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAddrBook} lpIAB 
     * @param {HWND} hWnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wabapi/nf-wabapi-iwabobject-find
     */
    Find(lpIAB, hWnd) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(9, this, "ptr", lpIAB, "ptr", hWnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAddrBook} lpIAB 
     * @param {HWND} hWnd 
     * @param {PSTR} lpszFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wabapi/nf-wabapi-iwabobject-vcarddisplay
     */
    VCardDisplay(lpIAB, hWnd, lpszFileName) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

        result := ComCall(10, this, "ptr", lpIAB, "ptr", hWnd, "ptr", lpszFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAddrBook} lpIAB 
     * @param {HWND} hWnd 
     * @param {Integer} ulFlags 
     * @param {PSTR} lpszURL 
     * @param {Pointer<IMailUser>} lppMailUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wabapi/nf-wabapi-iwabobject-ldapurl
     */
    LDAPUrl(lpIAB, hWnd, ulFlags, lpszURL, lppMailUser) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL

        result := ComCall(11, this, "ptr", lpIAB, "ptr", hWnd, "uint", ulFlags, "ptr", lpszURL, "ptr*", lppMailUser, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAddrBook} lpIAB 
     * @param {Integer} ulFlags 
     * @param {PSTR} lpszVCard 
     * @param {IMailUser} lpMailUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wabapi/nf-wabapi-iwabobject-vcardcreate
     */
    VCardCreate(lpIAB, ulFlags, lpszVCard, lpMailUser) {
        lpszVCard := lpszVCard is String ? StrPtr(lpszVCard) : lpszVCard

        result := ComCall(12, this, "ptr", lpIAB, "uint", ulFlags, "ptr", lpszVCard, "ptr", lpMailUser, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAddrBook} lpIAB 
     * @param {Integer} ulFlags 
     * @param {PSTR} lpszVCard 
     * @param {Pointer<IMailUser>} lppMailUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wabapi/nf-wabapi-iwabobject-vcardretrieve
     */
    VCardRetrieve(lpIAB, ulFlags, lpszVCard, lppMailUser) {
        lpszVCard := lpszVCard is String ? StrPtr(lpszVCard) : lpszVCard

        result := ComCall(13, this, "ptr", lpIAB, "uint", ulFlags, "ptr", lpszVCard, "ptr*", lppMailUser, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAddrBook} lpIAB 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpdwAction 
     * @param {Pointer<SBinary>} lpsbEID 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wabapi/nf-wabapi-iwabobject-getme
     */
    GetMe(lpIAB, ulFlags, lpdwAction, lpsbEID, hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(14, this, "ptr", lpIAB, "uint", ulFlags, "uint*", lpdwAction, "ptr", lpsbEID, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAddrBook} lpIAB 
     * @param {Integer} ulFlags 
     * @param {SBinary} sbEID 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wabapi/nf-wabapi-iwabobject-setme
     */
    SetMe(lpIAB, ulFlags, sbEID, hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(15, this, "ptr", lpIAB, "uint", ulFlags, "ptr", sbEID, "ptr", hwnd, "HRESULT")
        return result
    }
}
