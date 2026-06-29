#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ASSOCDATA.ahk" { ASSOCDATA }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\ASSOCSTR.ahk" { ASSOCSTR }
#Import ".\ASSOCF.ahk" { ASSOCF }
#Import ".\ASSOCKEY.ahk" { ASSOCKEY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ASSOCENUM.ahk" { ASSOCENUM }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * Exposes methods that simplify the process of retrieving information stored in the registry in association with defining a file type or protocol and associating it with an application.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * This interface is exposed by the Shell or by namespace extensions to simplify handling file and protocol associations. You should not implement this interface.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Use this interface if you need information from the registry related to file or protocol associations. For example, you can use this interface to retrieve information associated with a file name extension such as the command string of one of its verbs.
 * 
 * A complete registry path or HKEY value is not required. Instead, you can retrieve information based on criteria such as the file name extension or executable name. For a discussion of file associations, see <a href="https://docs.microsoft.com/windows/desktop/shell/fa-file-types">File Types</a>.
 * 
 * You can also retrieve an application's name using this interface. Use method <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-iqueryassociations-getstring">IQueryAssociations::GetString</a>. Set the <i>str</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ne-shlwapi-assocstr">ASSOCSTR_FRIENDLYAPPNAME</a>.
 * 
 * To use this interface, you must first retrieve a pointer to it. Typically, you retrieve an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> pointer by calling a Shell object's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof">IShellFolder::GetUIObjectOf</a> method. You can also retrieve an interface pointer by calling <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-assoccreate">AssocCreate</a> (set <i>clsid</i> to CLSID_QueryAssociations). Initialize the interface with <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-iqueryassociations-init">IQueryAssociations::Init</a>. This method sets the root key that will be used when you call any of the remaining three methods to retrieve information from the registry. They will look only below the root key. You must release the interface when you no longer need it.
 * 
 * The <b>IQueryAssociations</b> interface is useful if you need to repeatedly query the registry for information. Once the interface is initialized, the overhead of calling the various methods is relatively small. There are also several related functions, listed in the See Also section, that allow you to retrieve the same information from the registry with a single function call. While they are simpler to use, they cause the overhead of creating and initializing <b>IQueryAssociations</b> each time they are called. Because of this, they are best suited for single use.
 * @see https://learn.microsoft.com/windows/win32/api/shlwapi/nn-shlwapi-iqueryassociations
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IQueryAssociations extends IUnknown {
    /**
     * The interface identifier for IQueryAssociations
     * @type {Guid}
     */
    static IID := Guid("{c46ca590-3c3f-11d2-bee6-0000f805ca57}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IQueryAssociations interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Init      : IntPtr
        GetString : IntPtr
        GetKey    : IntPtr
        GetData   : IntPtr
        GetEnum   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IQueryAssociations.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the IQueryAssociations interface and sets the root key to the appropriate ProgID.
     * @remarks
     * This method initializes the interface, and is also called each time you need to specify a new root key. You can use <i>pwszAssoc</i> to specify a string, such as a file name extension or its associated ProgID, that identifies the root key. You can also specify the root key's HKEY value. <b>Init</b> will then use this information to locate the root key in the registry. Subsequent calls to the other <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nn-shlwapi-iqueryassociations">IQueryAssociations</a> methods will use it as their starting point and search for the information in the root key's subkeys.
     * @param {ASSOCF} flags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-url_scheme">ASSOCF</a></b>
     * 
     * A flag that specifies how the search is to be initialized. It is typically set to zero, but it can also take one of the following <a href="https://docs.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-url_scheme">ASSOCF</a> values. 
     * 					
     *                     
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-url_scheme">ASSOCF_INIT_BYEXENAME</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-url_scheme">ASSOCF_INIT_DEFAULTTOFOLDER</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-url_scheme">ASSOCF_INIT_DEFAULTTOSTAR</a>
     * </li>
     * </ul>
     * @param {PWSTR} pszAssoc Type: <b>LPCWSTR</b>
     * 
     * A Unicode string that is used to determine the root key. If a value is specified for <i>hkProgid</i>, set this parameter to <b>NULL</b>. Four types of string can be used:
     * @param {HKEY} hkProgid Type: <b>HKEY</b>
     * 
     * The HKEY value of the subkey that is used as a root key. The search looks only below this key. If a value is specified for <i>pwszAssoc</i>, set this parameter to <b>NULL</b>.
     * @param {HWND} _hwnd Type: <b>HWND</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-iqueryassociations-init
     */
    Init(flags, pszAssoc, hkProgid, _hwnd) {
        pszAssoc := pszAssoc is String ? StrPtr(pszAssoc) : pszAssoc

        result := ComCall(3, this, ASSOCF, flags, "ptr", pszAssoc, HKEY, hkProgid, HWND, _hwnd, "HRESULT")
        return result
    }

    /**
     * Searches for and retrieves a file or protocol association-related string from the registry. (IQueryAssociations.GetString)
     * @param {ASSOCF} flags Type: <b><a href="https://docs.microsoft.com/windows/win32/shell/assocf_str">ASSOCF</a></b>
     * 
     * A flag that can be used to control the search. It can be any combination of the following <a href="https://docs.microsoft.com/windows/win32/shell/assocf_str">ASSOCF</a> values. 
     * 
     * 					
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-url_scheme">ASSOCF_IGNOREBASECLASS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-url_scheme">ASSOCF_NOFIXUPS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-url_scheme">ASSOCF_NOTRUNCATE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-url_scheme">ASSOCF_NOUSERSETTINGS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-url_scheme">ASSOCF_REMAPRUNDLL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-url_scheme">ASSOCF_VERIFY</a>
     * </li>
     * </ul>
     * @param {ASSOCSTR} str Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ne-shlwapi-assocstr">ASSOCSTR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ne-shlwapi-assocstr">ASSOCSTR</a> value that specifies the type of string that is to be returned.
     * @param {PWSTR} pszExtra Type: <b>LPCWSTR</b>
     * 
     * A pointer to an optional, null-terminated Unicode string with information about the location of the string. It is typically set to a Shell verb such as <b>open</b>. Set this parameter to <b>NULL</b> if it is not used.
     * @param {PWSTR} pszOut Type: <b>LPWSTR</b>
     * 
     * A pointer to a null-terminated Unicode string used to return the requested string. Set this parameter to <b>NULL</b> to retrieve the required buffer size.
     * @param {Pointer<Integer>} pcchOut Type: <b>DWORD*</b>
     * 
     * A pointer to a value that, on entry, is set to the number of characters in the <i>pwszOut</i> buffer. When the function returns successfully, it points to the number of characters placed in the buffer.
     * 
     * If the <a href="https://docs.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-url_scheme">ASSOCF_NOTRUNCATE</a> flag is set in <i>flags</i> and the buffer specified in <i>pwszOut</i> is too small, the function returns E_POINTER and <i>pcchOut</i> points to the required size of the buffer.
     * 
     * If <i>pwszOut</i> is <b>NULL</b>, the function returns S_FALSE and <i>pcchOut</i> points to the required size of the buffer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns a standard COM error value, including the following: 
     * 
     *                     
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Error</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>Success.</td>
     * </tr>
     * <tr>
     * <td>E_POINTER</td>
     * <td>The <i>pwszOut</i> buffer is too small to hold the entire string.</td>
     * </tr>
     * <tr>
     * <td>S_FALSE</td>
     * <td><i>pwszOut</i> is <b>NULL</b>. <i>pcchOut</i> contains the required buffer size.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-iqueryassociations-getstring
     */
    GetString(flags, str, pszExtra, pszOut, pcchOut) {
        pszExtra := pszExtra is String ? StrPtr(pszExtra) : pszExtra
        pszOut := pszOut is String ? StrPtr(pszOut) : pszOut

        pcchOutMarshal := pcchOut is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, ASSOCF, flags, ASSOCSTR, str, "ptr", pszExtra, "ptr", pszOut, pcchOutMarshal, pcchOut, "HRESULT")
        return result
    }

    /**
     * Searches for and retrieves a file or protocol association-related key from the registry.
     * @param {ASSOCF} flags Type: <b><a href="https://docs.microsoft.com/windows/win32/shell/assocf_str">ASSOCF</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/shell/assocf_str">ASSOCF</a> value that can be used to control the search.
     * @param {ASSOCKEY} key Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ne-shlwapi-assockey">ASSOCKEY</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ne-shlwapi-assockey">ASSOCKEY</a> value that specifies the type of key that is to be returned.
     * @param {PWSTR} pszExtra Type: <b>LPCWSTR</b>
     * 
     * A pointer to an optional null-terminated Unicode string with information about the location of the key. It is normally set to a Shell verb such as <b>open</b>. Set this parameter to <b>NULL</b> if it is not used.
     * @returns {HKEY} Type: <b>HKEY*</b>
     * 
     * A pointer to the key's HKEY value.
     * @see https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-iqueryassociations-getkey
     */
    GetKey(flags, key, pszExtra) {
        pszExtra := pszExtra is String ? StrPtr(pszExtra) : pszExtra

        phkeyOut := HKEY.Owned()
        result := ComCall(5, this, ASSOCF, flags, ASSOCKEY, key, "ptr", pszExtra, HKEY.Ptr, phkeyOut, "HRESULT")
        return phkeyOut
    }

    /**
     * Searches for and retrieves file or protocol association-related binary data from the registry.
     * @param {ASSOCF} flags Type: <b><a href="https://docs.microsoft.com/windows/win32/shell/assocf_str">ASSOCF</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/shell/assocf_str">ASSOCF</a> value that can be used to control the search.
     * @param {ASSOCDATA} data Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ne-shlwapi-assocdata">ASSOCDATA</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ne-shlwapi-assocdata">ASSOCDATA</a> value that specifies the type of data that is to be returned.
     * @param {PWSTR} pszExtra Type: <b>LPCWSTR</b>
     * 
     * A pointer to an optional, null-terminated Unicode string with information about the location of the data. It is normally set to a Shell verb such as <b>open</b>. Set this parameter to <b>NULL</b> if it is not used.
     * @param {Integer} pvOut Type: <b>void*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives the requested data value.
     * @param {Pointer<Integer>} pcbOut Type: <b>DWORD*</b>
     * 
     * A pointer to a value that, when this method is called, holds the size of <i>pvOut</i>, in bytes. When this method returns successfully, the value contains the size of the data actually retrieved.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-iqueryassociations-getdata
     */
    GetData(flags, data, pszExtra, pvOut, pcbOut) {
        pszExtra := pszExtra is String ? StrPtr(pszExtra) : pszExtra

        pcbOutMarshal := pcbOut is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, ASSOCF, flags, ASSOCDATA, data, "ptr", pszExtra, "ptr", pvOut, pcbOutMarshal, pcbOut, "HRESULT")
        return result
    }

    /**
     * This method is not implemented. (IQueryAssociations.GetEnum)
     * @param {ASSOCF} flags TBD
     * @param {ASSOCENUM} _assocenum TBD
     * @param {PWSTR} pszExtra TBD
     * @param {Pointer<Guid>} riid TBD
     * @returns {Pointer<Void>} TBD
     * @see https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-iqueryassociations-getenum
     */
    GetEnum(flags, _assocenum, pszExtra, riid) {
        pszExtra := pszExtra is String ? StrPtr(pszExtra) : pszExtra

        result := ComCall(7, this, ASSOCF, flags, ASSOCENUM, _assocenum, "ptr", pszExtra, Guid.Ptr, riid, "ptr*", &ppvOut := 0, "HRESULT")
        return ppvOut
    }

    Query(iid) {
        if (IQueryAssociations.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Init := CallbackCreate(GetMethod(implObj, "Init"), flags, 5)
        this.vtbl.GetString := CallbackCreate(GetMethod(implObj, "GetString"), flags, 6)
        this.vtbl.GetKey := CallbackCreate(GetMethod(implObj, "GetKey"), flags, 5)
        this.vtbl.GetData := CallbackCreate(GetMethod(implObj, "GetData"), flags, 6)
        this.vtbl.GetEnum := CallbackCreate(GetMethod(implObj, "GetEnum"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Init)
        CallbackFree(this.vtbl.GetString)
        CallbackFree(this.vtbl.GetKey)
        CallbackFree(this.vtbl.GetData)
        CallbackFree(this.vtbl.GetEnum)
    }
}
