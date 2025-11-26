#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumIDList.ahk
#Include Common\STRRET.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposed by all Shell namespace folder objects, its methods are used to manage folders.
 * @remarks
 * 
 * Implement this interface for objects that extend the Shell's namespace. For example, implement this interface to create a separate namespace that requires a rooted Windows Explorer or to install a new namespace directly within the hierarchy of the system namespace. You are most familiar with the contents of your namespace, so you are responsible for implementing everything needed to access your data.
 * 
 * Use this interface when you need to display or perform an operation on the contents of the Shell's namespace. Objects that support <b>IShellFolder</b> are usually created by other Shell folder objects. To retrieve a folder's <b>IShellFolder</b> interface, you typically start by calling <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shgetdesktopfolder">SHGetDesktopFolder</a>. This function returns a pointer to the desktop's <b>IShellFolder</b> interface. You can then use its methods to retrieve an <b>IShellFolder</b> interface for a particular namespace folder.
 * 
 * <div class="alert"><b>Note</b>  <b>IShellFolder</b> methods only accept PIDLs that are relative to the folder. Some <b>IShellFolder</b> methods, such as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getattributesof">IShellFolder::GetAttributesOf</a>, only accept single-level PIDLs. In other words, the PIDL must contain only a single <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shitemid">SHITEMID</a> structure, plus the terminating <b>NULL</b>. When you enumerate the contents of a folder with <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumidlist">IEnumIDList</a>, you will receive PIDLs of this form. Other methods, such as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-compareids">IShellFolder::CompareIDs</a>, accept multi-level PIDLs. These PIDLs can have multiple <b>SHITEMID</b> structures and identify objects one or more levels below the parent folder. Check the reference to be sure what type of PIDL can be accepted by a particular method.</div>
 * <div> </div>
 * <h3><a id="Examples"></a><a id="examples"></a><a id="EXAMPLES"></a>Examples</h3>
 * An example implementation of <b>IShellFolder</b> can be seen in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd940360(v=vs.85)">Explorer Data Provider Sample</a> sample. The use of various <b>IShellFolder</b> methods can be found in several samples, including <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd940361(v=vs.85)">File Operations Sample</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellfolder
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellFolder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellFolder
     * @type {Guid}
     */
    static IID => Guid("{000214e6-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ParseDisplayName", "EnumObjects", "BindToObject", "BindToStorage", "CompareIDs", "CreateViewObject", "GetAttributesOf", "GetUIObjectOf", "GetDisplayNameOf", "SetNameOf"]

    /**
     * Translates the display name of a file object or a folder into an item identifier list.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * A window handle. The client should provide a window handle if it displays a dialog or message box. Otherwise set <i>hwnd</i> to <b>NULL</b>.
     * @param {IBindCtx} pbc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>*</b>
     * 
     * Optional. A pointer to a bind context used to pass parameters as inputs and outputs to the parsing function. These passed parameters are often specific to the data source and are documented by the data source owners. For example, the file system data source accepts the name being parsed (as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-win32_find_dataa">WIN32_FIND_DATA</a> structure), using the <a href="https://docs.microsoft.com/windows/desktop/shell/str-constants">STR_FILE_SYS_BIND_DATA</a> bind context parameter. <a href="https://docs.microsoft.com/windows/desktop/shell/str-constants">STR_PARSE_PREFER_FOLDER_BROWSING</a> can be passed to indicate that URLs are parsed using the file system data source when possible. Construct a bind context object using <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createbindctx">CreateBindCtx</a> and populate the values using <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-registerobjectparam">IBindCtx::RegisterObjectParam</a>. See <b>Bind Context String Keys</b> for a complete list of these.
     * 
     * 
     * 
     * If no data is being passed to or received from the parsing function, this value can be <b>NULL</b>.
     * @param {PWSTR} pszDisplayName Type: <b>LPWSTR</b>
     * 
     * A null-terminated Unicode string with the display name. Because each Shell folder defines its own parsing syntax, the form this string can take may vary. The desktop folder, for instance, accepts paths such as "C:\My Docs\My File.txt". It also will accept references to items in the namespace that have a GUID associated with them using the "::{GUID}" syntax. For example, to retrieve a fully qualified identifier list for the control panel from the desktop folder, you can use the following:
     *     
     *                         
     * 
     * 
     * ```cpp
     * ::{CLSID for Control Panel}\::{CLSID for printers folder}
     * 
     * ```
     * @param {Pointer<Integer>} pdwAttributes Type: <b>ULONG*</b>
     * 
     * The value used to query for file attributes. If not used, it should be set to <b>NULL</b>. To query for one or more attributes, initialize this parameter with the <a href="https://docs.microsoft.com/windows/desktop/shell/sfgao">SFGAO</a> flags that represent the attributes of interest. On return, those attributes that are true <i>and</i> were requested will be set.
     * @returns {Pointer<ITEMIDLIST>} Type: <b>PIDLIST_RELATIVE*</b>
     * 
     * When this method returns, contains a pointer to the PIDL for the object. The returned item identifier list specifies the item relative to the parsing folder. If the object associated with <i>pszDisplayName</i> is within the parsing folder, the returned item identifier list will contain only one <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shitemid">SHITEMID</a> structure. If the object is in a subfolder of the parsing folder, the returned item identifier list will contain multiple <b>SHITEMID</b> structures. If an error occurs, <b>NULL</b> is returned in this address.
     *                         
     * 
     * When it is no longer needed, it is the responsibility of the caller to free this resource by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname
     */
    ParseDisplayName(hwnd, pbc, pszDisplayName, pdwAttributes) {
        static pchEaten := 0 ;Reserved parameters must always be NULL

        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        pszDisplayName := pszDisplayName is String ? StrPtr(pszDisplayName) : pszDisplayName

        pdwAttributesMarshal := pdwAttributes is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hwnd, "ptr", pbc, "ptr", pszDisplayName, "uint*", pchEaten, "ptr*", &ppidl := 0, pdwAttributesMarshal, pdwAttributes, "HRESULT")
        return ppidl
    }

    /**
     * Enables a client to determine the contents of a folder by creating an item identifier enumeration object and returning its IEnumIDList interface. The methods supported by that interface can then be used to enumerate the folder's contents.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * If user input is required to perform the enumeration, this window handle should be used by the enumeration object as the parent window to take user input. An example would be a dialog box to ask for a password or prompt the user to insert a CD or floppy disk. If <i>hwndOwner</i> is set to <b>NULL</b>, the enumerator should not post any messages, and if user input is required, it should silently fail.
     * @param {Integer} grfFlags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf">SHCONTF</a></b>
     * 
     * Flags indicating which items to include in the enumeration. For a list of possible values, see the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf">SHCONTF</a> enumerated type.
     * @returns {IEnumIDList} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumidlist">IEnumIDList</a>**</b>
     * 
     * The address that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumidlist">IEnumIDList</a> interface of the enumeration object created by this method. If an error occurs or no suitable subobjects are found, <i>ppenumIDList</i> is set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellfolder-enumobjects
     */
    EnumObjects(hwnd, grfFlags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(4, this, "ptr", hwnd, "uint", grfFlags, "ptr*", &ppenumIDList := 0, "int")
        return IEnumIDList(ppenumIDList)
    }

    /**
     * Retrieves a handler, typically the Shell folder object that implements IShellFolder for a particular item. Optional parameters that control the construction of the handler are passed in the bind context.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUIDLIST_RELATIVE</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structure (PIDL) that identifies the subfolder. This value can refer to an item at any level below the parent folder in the namespace hierarchy. The structure contains one or more <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shitemid">SHITEMID</a> structures, followed by a terminating <b>NULL</b>.
     * @param {IBindCtx} pbc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on a bind context object that can be used to pass parameters to the construction of the handler. If this parameter is not used, set it to <b>NULL</b>. Because support for this parameter is optional for folder object implementations, some folders may not support the use of bind contexts. 
     * 
     *                     
     * 
     * Information that can be provided in the bind context includes a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-bind_opts">BIND_OPTS</a> structure that includes a <b>grfMode</b> member that indicates the access mode when binding to a stream handler. Other parameters can be set and discovered using <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-registerobjectparam">IBindCtx::RegisterObjectParam</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-getobjectparam">IBindCtx::GetObjectParam</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The identifier of the interface to return. This may be <b>IID_IShellFolder</b>, <b>IID_IStream</b>, or any other interface that identifies a particular handler.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of a pointer to the requested interface. If an error occurs, a <b>NULL</b> pointer is returned at this address.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellfolder-bindtoobject
     */
    BindToObject(pidl, pbc, riid) {
        result := ComCall(5, this, "ptr", pidl, "ptr", pbc, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Requests a pointer to an object's storage interface.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUIDLIST_RELATIVE</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structure that identifies the subfolder relative to its parent folder. The structure must contain exactly one <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shitemid">SHITEMID</a> structure followed by a terminating zero.
     * @param {IBindCtx} pbc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>*</b>
     * 
     * The optional address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on a bind context object to be used during this operation. If this parameter is not used, set it to <b>NULL</b>. Because support for <i>pbc</i> is optional for folder object implementations, some folders may not support the use of bind contexts.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The IID of the requested storage interface. To retrieve an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a> interface pointer, set <i>riid</i> to <b>IID_IStream</b>, <b>IID_IStorage</b>, or <b>IID_IPropertySetStorage</b>, respectively.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address that receives the interface pointer specified by <i>riid</i>. If an error occurs, a <b>NULL</b> pointer is returned in this address.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellfolder-bindtostorage
     */
    BindToStorage(pidl, pbc, riid) {
        result := ComCall(6, this, "ptr", pidl, "ptr", pbc, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Determines the relative order of two file objects or folders, given their item identifier lists.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * A value that specifies how the comparison should be performed. 
     * 
     * 					
     * 
     * The lower sixteen bits of <i>lParam</i> define the sorting rule. Most applications set the sorting rule to the default value of zero, indicating that the two items should be compared by name. The system does not define any other sorting rules. Some folder objects might allow calling applications to use the lower sixteen bits of <i>lParam</i> to specify folder-specific sorting rules. The rules and their associated <i>lParam</i> values are defined by the folder.
     * 
     * When the system folder view object calls <b>IShellFolder::CompareIDs</b>, the lower sixteen bits of <i>lParam</i> are used to specify the column to be used for the comparison.
     * 
     * The upper sixteen bits of <i>lParam</i> are used for flags that modify the sorting rule. The system currently defines these modifier flags.
     * @param {Pointer<ITEMIDLIST>} pidl1 Type: <b>PCUIDLIST_RELATIVE</b>
     * 
     * A pointer to the first item's <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structure. It will be relative to the folder. This <b>ITEMIDLIST</b> structure can contain more than one element; therefore, the entire structure must be compared, not just the first element.
     * @param {Pointer<ITEMIDLIST>} pidl2 Type: <b>PCUIDLIST_RELATIVE</b>
     * 
     * A pointer to the second item's <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structure. It will be relative to the folder. This <b>ITEMIDLIST</b> structure can contain more than one element; therefore, the entire structure must be compared, not just the first element.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method is successful, the CODE field of the <b>HRESULT</b> contains one of the following values. For information regarding the extraction of the CODE field from the returned <b>HRESULT</b>, see Remarks. If this method is unsuccessful, it returns a COM error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Negative</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A negative return value indicates that the first item should precede the second (pidl1 &lt; pidl2).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Positive</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A positive return value indicates that the first item should follow the second (pidl1 &gt; pidl2).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Zero</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A return value of zero indicates that the two items are the same (pidl1 = pidl2).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellfolder-compareids
     */
    CompareIDs(lParam, pidl1, pidl2) {
        result := ComCall(7, this, "ptr", lParam, "ptr", pidl1, "ptr", pidl2, "int")
        return result
    }

    /**
     * Requests an object that can be used to obtain information from or interact with a folder object.
     * @param {HWND} hwndOwner Type: <b>HWND</b>
     * 
     * A handle to the owner window. If you have implemented a custom folder view object, your folder view window should be created as a child of <i>hwndOwner</i>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppv</i>, typically IID_IShellView.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns successfully, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>. See the Remarks section for more details.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellfolder-createviewobject
     */
    CreateViewObject(hwndOwner, riid) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(8, this, "ptr", hwndOwner, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets the attributes of one or more file or folder objects contained in the object represented by IShellFolder.
     * @param {Integer} cidl Type: <b>UINT</b>
     * 
     * The number of items from which to retrieve attributes.
     * @param {Pointer<Pointer<ITEMIDLIST>>} apidl Type: <b>PCUITEMID_CHILD_ARRAY*</b>
     * 
     * The address of an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structures, each of which uniquely identifies an item relative to the parent folder. Each <b>ITEMIDLIST</b> structure must contain exactly one <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shitemid">SHITEMID</a> structure followed by a terminating zero.
     * @param {Pointer<Integer>} rgfInOut Type: <b>SFGAOF*</b>
     * 
     * Pointer to a single <b>ULONG</b> value that, on entry, contains the bitwise <a href="https://docs.microsoft.com/windows/desktop/shell/sfgao">SFGAO</a> attributes that the calling application is requesting. On exit, this value contains the requested attributes that are common to all of the specified items.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellfolder-getattributesof
     */
    GetAttributesOf(cidl, apidl, rgfInOut) {
        apidlMarshal := apidl is VarRef ? "ptr*" : "ptr"
        rgfInOutMarshal := rgfInOut is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", cidl, apidlMarshal, apidl, rgfInOutMarshal, rgfInOut, "HRESULT")
        return result
    }

    /**
     * Gets an object that can be used to carry out actions on the specified file objects or folders.
     * @param {HWND} hwndOwner Type: <b>HWND</b>
     * 
     * A handle to the owner window that the client should specify if it displays a dialog box or message box.
     * @param {Integer} cidl Type: <b>UINT</b>
     * 
     * The number of file objects or subfolders specified in the <i>apidl</i> parameter.
     * @param {Pointer<Pointer<ITEMIDLIST>>} apidl Type: <b>PCUITEMID_CHILD_ARRAY</b>
     * 
     * The address of an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structures, each of which uniquely identifies a file object or subfolder relative to the parent folder. Each item identifier list must contain exactly one <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shitemid">SHITEMID</a> structure followed by a terminating zero.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppv</i>. This can be any valid interface identifier that can be created for an item. The most common identifiers used by the Shell are listed in the comments at the end of this reference.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns successfully, contains the interface pointer requested in <i>riid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof
     */
    GetUIObjectOf(hwndOwner, cidl, apidl, riid) {
        static rgfReserved := 0 ;Reserved parameters must always be NULL

        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        apidlMarshal := apidl is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "ptr", hwndOwner, "uint", cidl, apidlMarshal, apidl, "ptr", riid, "uint*", rgfReserved, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Retrieves the display name for the specified file object or subfolder.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * PIDL that uniquely identifies the file object or subfolder relative to the parent folder.
     * @param {Integer} uFlags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shgdnf">SHGDNF</a></b>
     * 
     * Flags used to request the type of display name to return. For a list of possible values, see the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shgdnf">SHGDNF</a> enumerated type.
     * @returns {STRRET} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-strret">STRRET</a>*</b>
     * 
     * When this method returns, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-strret">STRRET</a> structure in which to return the display name. The type of name returned in this structure can be the requested type, but the Shell folder might return a different type.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellfolder-getdisplaynameof
     */
    GetDisplayNameOf(pidl, uFlags) {
        pName := STRRET()
        result := ComCall(11, this, "ptr", pidl, "uint", uFlags, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * Sets the display name of a file object or subfolder, changing the item identifier in the process.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * A handle to the owner window of any dialog or message box that the client displays.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structure that uniquely identifies the file object or subfolder relative to the parent folder. The structure must contain exactly one <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shitemid">SHITEMID</a> structure followed by a terminating zero.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated string that specifies the new display name.
     * @param {Integer} uFlags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shgdnf">SHGDNF</a></b>
     * 
     * Flags that indicate the type of name specified by the <i>pszName</i> parameter. For a list of possible values and combinations of values, see <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shgdnf">SHGDNF</a>.
     * @returns {Pointer<ITEMIDLIST>} Type: <b>PITEMID_CHILD*</b>
     * 
     * Optional. If specified, the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> structure that receives the <b>ITEMIDLIST</b> of the renamed item. The caller requests this value by passing a non-null <i>ppidlOut</i>. Implementations of <b>IShellFolder::SetNameOf</b> must return a pointer to the new <b>ITEMIDLIST</b> in the <i>ppidlOut</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellfolder-setnameof
     */
    SetNameOf(hwnd, pidl, pszName, uFlags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(12, this, "ptr", hwnd, "ptr", pidl, "ptr", pszName, "uint", uFlags, "ptr*", &ppidlOut := 0, "HRESULT")
        return ppidlOut
    }
}
