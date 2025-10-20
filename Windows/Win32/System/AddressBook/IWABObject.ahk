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

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * Retrieves the calling thread's last-error code value.
     * @param {HRESULT} hResult 
     * @param {Integer} ulFlags 
     * @param {Pointer<MAPIERROR>} lppMAPIError 
     * @returns {HRESULT} The return value is the calling thread's last-error code.
     * 
     * The Return Value section of the documentation for each function that sets the last-error code notes the conditions under which the function sets the last-error code. Most functions that set the thread's last-error code set it when they fail. However, some functions also set the last-error code when they succeed. If the function is not documented to set the last-error code, the value returned by this function is simply the most recent last-error code to have been set; some functions set the last-error code to 0 on success and others do not.
     * @see https://docs.microsoft.com/windows/win32/api//errhandlingapi/nf-errhandlingapi-getlasterror
     */
    GetLastError(hResult, ulFlags, lppMAPIError) {
        result := ComCall(3, this, "int", hResult, "uint", ulFlags, "ptr", lppMAPIError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbSize 
     * @param {Pointer<Void>} lppBuffer 
     * @returns {HRESULT} 
     */
    AllocateBuffer(cbSize, lppBuffer) {
        result := ComCall(4, this, "uint", cbSize, "ptr", lppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbSize 
     * @param {Pointer<Void>} lpObject 
     * @param {Pointer<Void>} lppBuffer 
     * @returns {HRESULT} 
     */
    AllocateMore(cbSize, lpObject, lppBuffer) {
        result := ComCall(5, this, "uint", cbSize, "ptr", lpObject, "ptr", lppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpBuffer 
     * @returns {HRESULT} 
     */
    FreeBuffer(lpBuffer) {
        result := ComCall(6, this, "ptr", lpBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} lpFileName 
     * @returns {HRESULT} 
     */
    Backup(lpFileName) {
        result := ComCall(7, this, "ptr", lpFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} lpWIP 
     * @returns {HRESULT} 
     */
    Import(lpWIP) {
        result := ComCall(8, this, "ptr", lpWIP, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAddrBook>} lpIAB 
     * @param {HWND} hWnd 
     * @returns {HRESULT} 
     */
    Find(lpIAB, hWnd) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(9, this, "ptr", lpIAB, "ptr", hWnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAddrBook>} lpIAB 
     * @param {HWND} hWnd 
     * @param {PSTR} lpszFileName 
     * @returns {HRESULT} 
     */
    VCardDisplay(lpIAB, hWnd, lpszFileName) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(10, this, "ptr", lpIAB, "ptr", hWnd, "ptr", lpszFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAddrBook>} lpIAB 
     * @param {HWND} hWnd 
     * @param {Integer} ulFlags 
     * @param {PSTR} lpszURL 
     * @param {Pointer<IMailUser>} lppMailUser 
     * @returns {HRESULT} 
     */
    LDAPUrl(lpIAB, hWnd, ulFlags, lpszURL, lppMailUser) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(11, this, "ptr", lpIAB, "ptr", hWnd, "uint", ulFlags, "ptr", lpszURL, "ptr", lppMailUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAddrBook>} lpIAB 
     * @param {Integer} ulFlags 
     * @param {PSTR} lpszVCard 
     * @param {Pointer<IMailUser>} lpMailUser 
     * @returns {HRESULT} 
     */
    VCardCreate(lpIAB, ulFlags, lpszVCard, lpMailUser) {
        result := ComCall(12, this, "ptr", lpIAB, "uint", ulFlags, "ptr", lpszVCard, "ptr", lpMailUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAddrBook>} lpIAB 
     * @param {Integer} ulFlags 
     * @param {PSTR} lpszVCard 
     * @param {Pointer<IMailUser>} lppMailUser 
     * @returns {HRESULT} 
     */
    VCardRetrieve(lpIAB, ulFlags, lpszVCard, lppMailUser) {
        result := ComCall(13, this, "ptr", lpIAB, "uint", ulFlags, "ptr", lpszVCard, "ptr", lppMailUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAddrBook>} lpIAB 
     * @param {Integer} ulFlags 
     * @param {Pointer<UInt32>} lpdwAction 
     * @param {Pointer<SBinary>} lpsbEID 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    GetMe(lpIAB, ulFlags, lpdwAction, lpsbEID, hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(14, this, "ptr", lpIAB, "uint", ulFlags, "uint*", lpdwAction, "ptr", lpsbEID, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAddrBook>} lpIAB 
     * @param {Integer} ulFlags 
     * @param {SBinary} sbEID 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    SetMe(lpIAB, ulFlags, sbEID, hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(15, this, "ptr", lpIAB, "uint", ulFlags, "ptr", sbEID, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
