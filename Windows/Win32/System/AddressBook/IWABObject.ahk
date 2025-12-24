#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMailUser.ahk
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
     * This method is not implemented.
     * @param {HRESULT} hResult TBD
     * @param {Integer} ulFlags TBD
     * @param {Pointer<Pointer<MAPIERROR>>} lppMAPIError TBD
     * @returns {HRESULT} This method does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//wabapi/nf-wabapi-iwabobject-getlasterror
     */
    GetLastError(hResult, ulFlags, lppMAPIError) {
        lppMAPIErrorMarshal := lppMAPIError is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "int", hResult, "uint", ulFlags, lppMAPIErrorMarshal, lppMAPIError, "HRESULT")
        return result
    }

    /**
     * Allocates memory for buffers that are passed to Windows Address Book (WAB) methods. The buffer must be freed with IWABObject::FreeBuffer, and may be reallocated with IWABObject::AllocateMore.
     * @param {Integer} cbSize Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies the size
     * 				 in bytes of the buffer to be allocated.
     * @returns {Pointer<Void>} Type: <b>LPVOID*</b>
     * 
     * Address of a pointer to the returned buffer.
     * @see https://docs.microsoft.com/windows/win32/api//wabapi/nf-wabapi-iwabobject-allocatebuffer
     */
    AllocateBuffer(cbSize) {
        result := ComCall(4, this, "uint", cbSize, "ptr*", &lppBuffer := 0, "HRESULT")
        return lppBuffer
    }

    /**
     * Allocates a memory buffer that is linked to another buffer previously allocated with the IWABObject::AllocateBuffer method.
     * @param {Integer} cbSize Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies 
     * 				the size in bytes of the buffer to be allocated.
     * @param {Pointer<Void>} lpObject Type: <b>LPVOID</b>
     * 
     * Pointer to the existing buffer object allocated using 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/wabapi/nf-wabapi-iwabobject-allocatebuffer">IWABObject::AllocateBuffer</a>.
     * @returns {Pointer<Void>} Type: <b>LPVOID*</b>
     * 
     * Address of a pointer to the returned buffer. This buffer is linked to 
     * 				<i>lpObject</i>.
     * @see https://docs.microsoft.com/windows/win32/api//wabapi/nf-wabapi-iwabobject-allocatemore
     */
    AllocateMore(cbSize, lpObject) {
        lpObjectMarshal := lpObject is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "uint", cbSize, lpObjectMarshal, lpObject, "ptr*", &lppBuffer := 0, "HRESULT")
        return lppBuffer
    }

    /**
     * Frees memory allocated with IWABObject::AllocateBuffer or any of the other Windows Address Book (WAB) methods.
     * @param {Pointer<Void>} lpBuffer Type: <b>LPVOID</b>
     * 
     * Pointer to the buffer to be freed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the call succeeded 
     * 			and freed the memory requested.
     * @see https://docs.microsoft.com/windows/win32/api//wabapi/nf-wabapi-iwabobject-freebuffer
     */
    FreeBuffer(lpBuffer) {
        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, lpBufferMarshal, lpBuffer, "HRESULT")
        return result
    }

    /**
     * This method is not implemented.
     * @param {PSTR} lpFileName TBD
     * @returns {HRESULT} This method does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//wabapi/nf-wabapi-iwabobject-backup
     */
    Backup(lpFileName) {
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

        result := ComCall(7, this, "ptr", lpFileName, "HRESULT")
        return result
    }

    /**
     * Imports a .wab file into the user's Address Book.
     * @param {PSTR} lpWIP Type: <b>LPSTR</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wabapi/ns-wabapi-wabimportparam">WABIMPORTPARAM</a> 
     * 				structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wabapi/nf-wabapi-iwabobject-import
     */
    Import(lpWIP) {
        lpWIP := lpWIP is String ? StrPtr(lpWIP) : lpWIP

        result := ComCall(8, this, "ptr", lpWIP, "HRESULT")
        return result
    }

    /**
     * Launches the Windows Address Book (WAB) Find dialog box.
     * @param {IAddrBook} lpIAB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a> interface 
     * 				that specifies the address book to search.
     * @param {HWND} hWnd Type: <b>HWND</b>
     * 
     * Value of type <b>HWND</b> that specifies 
     * 				the handle to the parent window for the Find dialog box. 
     * 				The value can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//wabapi/nf-wabapi-iwabobject-find
     */
    Find(lpIAB, hWnd) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(9, this, "ptr", lpIAB, "ptr", hWnd, "HRESULT")
        return result
    }

    /**
     * Displays properties on a vCard file.
     * @param {IAddrBook} lpIAB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a> interface 
     * 				that specifies the address book object.
     * @param {HWND} hWnd Type: <b>HWND</b>
     * 
     * Value of type <b>HWND</b> that specifies 
     * 				the parent window handle for displayed dialog boxes.
     * @param {PSTR} lpszFileName Type: <b>LPSTR</b>
     * 
     * Value of type <b>LPSTR</b> that specifies 		
     * 				the full path of the vCard file to display.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wabapi/nf-wabapi-iwabobject-vcarddisplay
     */
    VCardDisplay(lpIAB, hWnd, lpszFileName) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

        result := ComCall(10, this, "ptr", lpIAB, "ptr", hWnd, "ptr", lpszFileName, "HRESULT")
        return result
    }

    /**
     * Processes an Lightweight Directory Access Protocol (LDAP)�URL and displays the results obtained from the URL.
     * @param {IAddrBook} lpIAB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a> interface 
     * 				that specifies the address book to use.
     * @param {HWND} hWnd Type: <b>HWND</b>
     * 
     * Value of type <b>HWND</b> that specifies the 
     * 				handle to the parent window for displayed dialog boxes.
     * @param {Integer} ulFlags Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies flags 
     * 				that affect functionality.
     * @param {PSTR} lpszURL Type: <b>LPSTR</b>
     * 
     * Value of type <b>LPSTR</b> that specifies the 
     * 				LDAP URL string. This 
     * 				string must begin with "ldap://".
     * @returns {IMailUser} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/nn-wabdefs-imailuser">IMailUser</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/nn-wabdefs-imailuser">IMailUser</a> 
     * 				interface that receives the returned Mailuser object, 
     * 				if requested. Otherwise, it is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wabapi/nf-wabapi-iwabobject-ldapurl
     */
    LDAPUrl(lpIAB, hWnd, ulFlags, lpszURL) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd
        lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL

        result := ComCall(11, this, "ptr", lpIAB, "ptr", hWnd, "uint", ulFlags, "ptr", lpszURL, "ptr*", &lppMailUser := 0, "HRESULT")
        return IMailUser(lppMailUser)
    }

    /**
     * Translates the properties of a given MailUser object into a vCard file.
     * @param {IAddrBook} lpIAB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a>interface that 
     * 				specifies the address book.
     * @param {Integer} ulFlags Type: <b>ULONG</b>
     * 
     * No flags.
     * @param {PSTR} lpszVCard Type: <b>LPSTR</b>
     * 
     * Value of type <b>LPSTR</b> that specifies the 
     * 				string containing the complete path name of the file to create.
     * @param {IMailUser} lpMailUser Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/nn-wabdefs-imailuser">IMailUser</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/nn-wabdefs-imailuser">IMailUser</a> interface that 
     * 				specifies the object whose properties are to be written into 
     * 				the file.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wabapi/nf-wabapi-iwabobject-vcardcreate
     */
    VCardCreate(lpIAB, ulFlags, lpszVCard, lpMailUser) {
        lpszVCard := lpszVCard is String ? StrPtr(lpszVCard) : lpszVCard

        result := ComCall(12, this, "ptr", lpIAB, "uint", ulFlags, "ptr", lpszVCard, "ptr", lpMailUser, "HRESULT")
        return result
    }

    /**
     * Reads a vCard file and creates a MailUser object containing the vCard properties.
     * @param {IAddrBook} lpIAB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a> interface 
     * 				that specifies the address book object.
     * @param {Integer} ulFlags Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies flags 
     * 				affecting behavior.
     * @param {PSTR} lpszVCard Type: <b>LPSTR</b>
     * 
     * Pointer to a string containing either the complete path name of the 
     * 				file to be read or the vCard buffer.
     * @returns {IMailUser} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/nn-wabdefs-imailuser">IMailUser</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/nn-wabdefs-imailuser">IMailUser</a> interface that 
     * 				receives the MailUser object created containing the properties 
     * 				in the vCard file.
     * @see https://docs.microsoft.com/windows/win32/api//wabapi/nf-wabapi-iwabobject-vcardretrieve
     */
    VCardRetrieve(lpIAB, ulFlags, lpszVCard) {
        lpszVCard := lpszVCard is String ? StrPtr(lpszVCard) : lpszVCard

        result := ComCall(13, this, "ptr", lpIAB, "uint", ulFlags, "ptr", lpszVCard, "ptr*", &lppMailUser := 0, "HRESULT")
        return IMailUser(lppMailUser)
    }

    /**
     * Retrieves the entry identifier of the object that has been designated as &quot;ME.&quot;
     * @param {IAddrBook} lpIAB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a> interface 
     * 				that specifies the address book object.
     * @param {Integer} ulFlags Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies flags 
     * 				affecting functionality.
     * @param {Pointer<Integer>} lpdwAction Type: <b>DWORD*</b>
     * 
     * Pointer to a variable of type <b>DWORD</b> that 
     * 				receives the flag WABOBJECT_ME_NEW on return, if a new ME entry is created. 
     * 				 The variable is used to signal creation, as opposed to selection, of a new ME entry. The variable 
     * 				 can be <b>NULL</b>.
     * @param {Pointer<SBinary>} lpsbEID Type: <b><a href="https://docs.microsoft.com/previous-versions/office/developer/office-2007/cc815817(v=office.12)">SBinary</a>*</b>
     * 
     * Pointer to a variable of type <a href="https://docs.microsoft.com/previous-versions/office/developer/office-2007/cc815817(v=office.12)">SBinary</a> 
     * 				that specifies the entry identifier of the ME object on return.
     * @param {HWND} hwnd Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies 
     * 				the handle of the parent window for displayed dialog boxes. 
     * 				You must cast the parent <b>HWND</b> to a 
     * 				<b>ULONG</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wabapi/nf-wabapi-iwabobject-getme
     */
    GetMe(lpIAB, ulFlags, lpdwAction, lpsbEID, hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        lpdwActionMarshal := lpdwAction is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", lpIAB, "uint", ulFlags, lpdwActionMarshal, lpdwAction, "ptr", lpsbEID, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * Designates a particular contact as the ME object.
     * @param {IAddrBook} lpIAB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a> interface 
     * 				that specifies the address book.
     * @param {Integer} ulFlags Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies flags 
     * 				affecting behavior.
     * @param {SBinary} sbEID Type: <b><a href="https://docs.microsoft.com/previous-versions/office/developer/office-2007/cc815817(v=office.12)">SBinary</a></b>
     * 
     * Value of type <a href="https://docs.microsoft.com/previous-versions/office/developer/office-2007/cc815817(v=office.12)">SBinary</a> that 
     * 				specifies the entry identifier of the contact that should be tagged 
     * 				as ME.
     * @param {HWND} hwnd Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies the 
     * 				parent window handle for displaying dialog boxes. Cast the 
     * 				parent <b>HWND</b> to a <b>ULONG</b> 
     * 				before passing.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wabapi/nf-wabapi-iwabobject-setme
     */
    SetMe(lpIAB, ulFlags, sbEID, hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(15, this, "ptr", lpIAB, "uint", ulFlags, "ptr", sbEID, "ptr", hwnd, "HRESULT")
        return result
    }
}
