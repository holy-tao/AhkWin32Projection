#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Do not use. Defines methods for reading and writing properties for a single contact.
 * @remarks
 * 
  * Classes that implement this interface often also implement these interfaces:
  *             
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersistfile">IPersistFile</a>: Enables the contact 
  *             to be loaded from a file. Use this interface when loading a contact to get full support 
  *             in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nf-icontact-icontact-commitchanges">CommitChanges</a> to change conflict detection.</li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststream">IPersistStream</a>: Provides methods for saving and 
  * 			loading objects that use a simple serial stream for their storage needs.</li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ipersiststreaminit">IPersistStreamInit</a>: Enables the contact to be saved 
  * 			or loaded from a stream. Use <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipersiststreaminit-initnew">IPersistStreamInit::InitNew</a> to create a 
  * 			new <b>IContact</b>. 
  * 			Note: loading a contact with <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststream">IPersistStream</a> does 
  * 			not give you the locking and conflict detection that <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-load">IPersistFile::Load</a> 
  * 			and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nf-icontact-icontact-commitchanges">CommitChanges</a> do.</li>
  * <li>
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nn-icontact-icontactproperties">IContactProperties</a>: Enables manipulation of contact properties.</li>
  * </ul>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//icontact/nn-icontact-icontact
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContact extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContact
     * @type {Guid}
     */
    static IID => Guid("{f941b671-bda7-4f77-884a-f46462f226a7}")

    /**
     * The class identifier for Contact
     * @type {Guid}
     */
    static CLSID => Guid("{61b68808-8eee-4fd1-acb8-3d804c8db056}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContactID", "GetPath", "CommitChanges"]

    /**
     * 
     * @param {PWSTR} pszContactID 
     * @param {Integer} cchContactID 
     * @param {Pointer<Integer>} pdwcchContactIDRequired 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontact-getcontactid
     */
    GetContactID(pszContactID, cchContactID, pdwcchContactIDRequired) {
        pszContactID := pszContactID is String ? StrPtr(pszContactID) : pszContactID

        pdwcchContactIDRequiredMarshal := pdwcchContactIDRequired is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pszContactID, "uint", cchContactID, pdwcchContactIDRequiredMarshal, pdwcchContactIDRequired, "HRESULT")
        return result
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @param {PWSTR} pszPath 
     * @param {Integer} cchPath 
     * @param {Pointer<Integer>} pdwcchPathRequired 
     * @returns {HRESULT} If the <i>nSize</i> parameter is nonzero, the return value is the number of points enumerated. If <i>nSize</i> is 0, the return value is the total number of points in the path (and <b>GetPath</b> writes nothing to the buffers). If <i>nSize</i> is nonzero and is less than the number of points in the path, the return value is 1.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     */
    GetPath(pszPath, cchPath, pdwcchPathRequired) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        pdwcchPathRequiredMarshal := pdwcchPathRequired is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pszPath, "uint", cchPath, pdwcchPathRequiredMarshal, pdwcchPathRequired, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCommitFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontact-commitchanges
     */
    CommitChanges(dwCommitFlags) {
        result := ComCall(5, this, "uint", dwCommitFlags, "HRESULT")
        return result
    }
}
