#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMailUser.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Do not use. This interface provides access to the Windows Address Book (WAB) object which contains function pointers to memory allocation functions and database maintenance functions.
 * @see https://learn.microsoft.com/windows/win32/api//content/wabapi/nn-wabapi-iwabobject
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
     * This method is not implemented. (IWABObject.GetLastError)
     * @param {HRESULT} hResult_ TBD
     * @param {Integer} ulFlags TBD
     * @param {Pointer<Pointer<MAPIERROR>>} lppMAPIError TBD
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api//content/wabapi/nf-wabapi-iwabobject-getlasterror
     */
    GetLastError(hResult_, ulFlags, lppMAPIError) {
        lppMAPIErrorMarshal := lppMAPIError is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "int", hResult_, "uint", ulFlags, lppMAPIErrorMarshal, lppMAPIError, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wabapi/nf-wabapi-iwabobject-allocatebuffer
     */
    AllocateBuffer(cbSize) {
        result := ComCall(4, this, "uint", cbSize, "ptr*", &lppBuffer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lppBuffer
    }

    /**
     * Allocates a memory buffer that is linked to another buffer previously allocated with the IWABObject::AllocateBuffer method.
     * @remarks
     * It is only possible to release a buffer allocated with 
     * 	<b>IWABObject::AllocateMore</b> by passing the buffer pointer 
     * 	specified in the <i>lpObject</i> parameter to 
     * 	<a href="https://docs.microsoft.com/windows/desktop/api/wabapi/nf-wabapi-iwabobject-freebuffer">IWABObject::FreeBuffer</a>. The link between the memory 
     * 	buffers allocated with <a href="https://docs.microsoft.com/windows/desktop/api/wabapi/nf-wabapi-iwabobject-allocatebuffer">IWABObject::AllocateBuffer</a> and 
     * 	<b>IWABObject::AllocateMore</b> enables 
     * 	<b>IWABObject::FreeBuffer</b> to release both buffers 
     * 	with a single call.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wabapi/nf-wabapi-iwabobject-allocatemore
     */
    AllocateMore(cbSize, lpObject) {
        lpObjectMarshal := lpObject is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "uint", cbSize, lpObjectMarshal, lpObject, "ptr*", &lppBuffer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wabapi/nf-wabapi-iwabobject-freebuffer
     */
    FreeBuffer(lpBuffer) {
        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, lpBufferMarshal, lpBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This method is not implemented. (IWABObject.Backup)
     * @param {PSTR} lpFileName TBD
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api//content/wabapi/nf-wabapi-iwabobject-backup
     */
    Backup(lpFileName) {
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

        result := ComCall(7, this, "ptr", lpFileName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Imports a .wab file into the user's Address Book.
     * @remarks
     * When calling this method, pass a pointer to a 
     * 	<a href="https://docs.microsoft.com/windows/desktop/api/wabapi/ns-wabapi-wabimportparam">WABIMPORTPARAM</a> structure. If the caller specifies 
     * 	<b>MAPI_DIALOG</b> in the 
     * 	<b>ulFlags</b> member of the structure, 
     * 	the Windows Address Book (WAB) shows a dialog box with a progress bar indicating 
     * 	the progress of the import process. The caller can specify a file name 
     * 	to import. If the caller specifies a <b>NULL</b> file name, the 
     * 	WAB opens a <a href="https://docs.microsoft.com/windows/desktop/api/commdlg/nf-commdlg-getopenfilenamea">GetOpenFileName</a> 
     * 	dialog box to prompt the user to select a .wab file for importing.
     * 
     * For compatibility with previously released versions of the 
     * 	WAB that expose this method, the pointer to the 
     * 	<a href="https://docs.microsoft.com/windows/desktop/api/wabapi/ns-wabapi-wabimportparam">WABIMPORTPARAM</a> structure needs to be cast to an 
     * 	<b>LPSTR</b> prior to passing it into this method.
     * @param {PSTR} lpWIP Type: <b>LPSTR</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wabapi/ns-wabapi-wabimportparam">WABIMPORTPARAM</a> 
     * 				structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/wabapi/nf-wabapi-iwabobject-import
     */
    Import(lpWIP) {
        lpWIP := lpWIP is String ? StrPtr(lpWIP) : lpWIP

        result := ComCall(8, this, "ptr", lpWIP, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Launches the Windows Address Book (WAB) Find dialog box.
     * @param {IAddrBook} lpIAB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a> interface 
     * 				that specifies the address book to search.
     * @param {HWND} hWnd_ Type: <b>HWND</b>
     * 
     * Value of type <b>HWND</b> that specifies 
     * 				the handle to the parent window for the Find dialog box. 
     * 				The value can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api//content/wabapi/nf-wabapi-iwabobject-find
     */
    Find(lpIAB, hWnd_) {
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_

        result := ComCall(9, this, "ptr", lpIAB, "ptr", hWnd_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Displays properties on a vCard file.
     * @param {IAddrBook} lpIAB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a> interface 
     * 				that specifies the address book object.
     * @param {HWND} hWnd_ Type: <b>HWND</b>
     * 
     * Value of type <b>HWND</b> that specifies 
     * 				the parent window handle for displayed dialog boxes.
     * @param {PSTR} lpszFileName Type: <b>LPSTR</b>
     * 
     * Value of type <b>LPSTR</b> that specifies 		
     * 				the full path of the vCard file to display.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wabapi/nf-wabapi-iwabobject-vcarddisplay
     */
    VCardDisplay(lpIAB, hWnd_, lpszFileName) {
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName

        result := ComCall(10, this, "ptr", lpIAB, "ptr", hWnd_, "ptr", lpszFileName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Processes an Lightweight Directory Access Protocol (LDAP)�URL and displays the results obtained from the URL.
     * @remarks
     * The default behavior for this API is to bind anonymously to the 
     * 	LDAP server. To specify a negotiated bind, you can pass 
     * 	<b>LDAP_AUTH_NEGOTIATE</b> into <i>ulFlags</i>. 
     * 	This flag is defined in Winldap.h.
     * 
     * To pass in a Unicode LDAP 
     * 				URL without losing any data, cast the 
     * 	URL pointer to a <b>LPSTR</b> and pass it into 
     * 	this function. Mark <i>ulFlags</i> to include <b>MAPI_UNICODE</b>, and the WAB will cast the 
     * 	URL back to an <b>LPWSTR</b> prior to using it.
     * @param {IAddrBook} lpIAB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a> interface 
     * 				that specifies the address book to use.
     * @param {HWND} hWnd_ Type: <b>HWND</b>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wabapi/nf-wabapi-iwabobject-ldapurl
     */
    LDAPUrl(lpIAB, hWnd_, ulFlags, lpszURL) {
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_
        lpszURL := lpszURL is String ? StrPtr(lpszURL) : lpszURL

        result := ComCall(11, this, "ptr", lpIAB, "ptr", hWnd_, "uint", ulFlags, "ptr", lpszURL, "ptr*", &lppMailUser := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMailUser(lppMailUser)
    }

    /**
     * Translates the properties of a given MailUser object into a vCard file.
     * @remarks
     * The complete file name must be specified. If the file already exists, 
     * 	it will be overwritten. Vcard creation is extensible: if your client 
     * 	application is using named properties to store client-specific data in the 
     * 	Windows Address Book (WAB), it may be possible to include this data in the newly 
     * 	created vCard.
     * @param {IAddrBook} lpIAB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a> interface that 
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wabapi/nf-wabapi-iwabobject-vcardcreate
     */
    VCardCreate(lpIAB, ulFlags, lpszVCard, lpMailUser) {
        lpszVCard := lpszVCard is String ? StrPtr(lpszVCard) : lpszVCard

        result := ComCall(12, this, "ptr", lpIAB, "uint", ulFlags, "ptr", lpszVCard, "ptr", lpMailUser, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Reads a vCard file and creates a MailUser object containing the vCard properties.
     * @remarks
     * Vcard retrieval is extensible. If your client application is using 
     * 	named properties to store client-specific data in the Windows Address Book (WAB) 
     * 	and exporting them to vCards, it is possible to extend the 
     * 	WAB vCard engine to read this data from a vCard. 
     * 	For more information, see <a href="https://msdn.microsoft.com/40638b23-e956-4fe8-b132-245c43df6890">Importing and 
     * 	Exporting Named Properties Through vCards</a>. The <i>lpszVCard</i> 
     * 	parameter can be a pointer to a Vcard file name or a pointer to a <b>NULL</b>-terminated string containing the full contents of the Vcard. To have the pointer indicate which content it represents, set the <i>ulFlags</i> parameter to either 
     * <b>WAB_VCARD_FILE</b> or 
     * <b>WAB_VCARD_STREAM</b>. The former setting indicates a 
     * file name, and the latter setting indicates a pointer to a buffer with the 
     * Vcard contents.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wabapi/nf-wabapi-iwabobject-vcardretrieve
     */
    VCardRetrieve(lpIAB, ulFlags, lpszVCard) {
        lpszVCard := lpszVCard is String ? StrPtr(lpszVCard) : lpszVCard

        result := ComCall(13, this, "ptr", lpIAB, "uint", ulFlags, "ptr", lpszVCard, "ptr*", &lppMailUser := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMailUser(lppMailUser)
    }

    /**
     * Retrieves the entry identifier of the object that has been designated as &quot;ME.&quot;
     * @remarks
     * Users can designate a single entry in the Windows Address Book (WAB) 
     * that represents them. This entry is referred to as "ME." Applications desiring information about the WAB user can access 
     * this entry to obtain such information. The <b>IWABObject::GetMe</b> 
     * method returns the entry identifier of the object that has been designated as "ME." 
     * The application can then open this object using the entry identifier to inspect its 
     * properties.
     * 
     * If an application calls <b>IWABObject::GetMe</b> when no ME entry 
     * exists in the WAB, the WAB opens a dialog box that requests the user to create a new ME entry or designate 
     * an existing entry in the WAB as being the ME entry. 
     * 
     * If an application passes the <b>AB_NO_DIALOG</b> 
     * flag in the <i>ulFlags</i> parameter, and no ME entry already exists, the 
     * selection dialog box is not displayed and a new entry is automatically created.
     * 
     * 
     * If the user of the application calls the <b>IWABObject::GetMe</b> method to check for the existence of "ME" but does not want a new ME entry to be created automatically, the application must pass <b>WABOBJECT_ME_NOCREATE</b>. This flag prevents the creation of a new entry. If an existing ME entry is not found, the call to <b>IWABObject::GetMe</b> fails, returning MAPI_E_NOT_FOUND.
     * 
     * <div class="alert"><b>Note</b>  (Microsoft Internet Explorer 5 
     * and later) If the user or the calling application informs 
     * the WAB that a new ME object should be created, 
     * the WAB creates the new object and tries to pre-populate it 
     * with data that the user may have previously entered using the Registration 
     * Wizard in Windows 98 and Windows 2000. This pre-populated 
     * information will be displayed to the user so that the user has the option 
     * of changing it as necessary.
     * </div>
     * <div> </div>
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
     * @param {HWND} hwnd_ Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies 
     * 				the handle of the parent window for displayed dialog boxes. 
     * 				You must cast the parent <b>HWND</b> to a 
     * 				<b>ULONG</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wabapi/nf-wabapi-iwabobject-getme
     */
    GetMe(lpIAB, ulFlags, lpdwAction, lpsbEID, hwnd_) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        lpdwActionMarshal := lpdwAction is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", lpIAB, "uint", ulFlags, lpdwActionMarshal, lpdwAction, "ptr", lpsbEID, "ptr", hwnd_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Designates a particular contact as the ME object.
     * @remarks
     * If the calling application provides an entry identifier to set as the ME object,
     * 	 and <i>ulFlags</i> is set to zero, the entry corresponding 
     * 	 to the entry identifier is designated as "ME" and any previous ME entry is cleared 
     * 	 of this setting.
     * 
     * If the calling application specifies 
     * <b>MAPI_DIALOG</b> in the <i>ulFlags</i> parameter,
     *  the Windows Address Book (WAB) displays a ME selection dialog box which contains 
     *  a list of contacts from which the user can choose. If the application passed 
     *  in an entry identifier, the entry corresponding to the entry identifier is pre-selected 
     *  in the contact list. If the application did not pass in an entry identifier, 
     *  and a ME entry currently exists in the WAB, the current ME entry is 
     *  pre-selected in the contact list.
     * 
     * Passing a combination of no flags and no entry identifiers is not valid.
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
     * @param {HWND} hwnd_ Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies the 
     * 				parent window handle for displaying dialog boxes. Cast the 
     * 				parent <b>HWND</b> to a <b>ULONG</b> 
     * 				before passing.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/wabapi/nf-wabapi-iwabobject-setme
     */
    SetMe(lpIAB, ulFlags, sbEID, hwnd_) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(15, this, "ptr", lpIAB, "uint", ulFlags, "ptr", sbEID, "ptr", hwnd_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
