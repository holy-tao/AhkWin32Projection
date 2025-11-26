#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Registry\HKEY.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that simplify the process of retrieving information stored in the registry in association with defining a file type or protocol and associating it with an application.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shlwapi/nn-shlwapi-iqueryassociations
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IQueryAssociations extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQueryAssociations
     * @type {Guid}
     */
    static IID => Guid("{c46ca590-3c3f-11d2-bee6-0000f805ca57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "GetString", "GetKey", "GetData", "GetEnum"]

    /**
     * Initializes the IQueryAssociations interface and sets the root key to the appropriate ProgID.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-url_scheme">ASSOCF</a></b>
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
     * @param {HWND} hwnd Type: <b>HWND</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlwapi/nf-shlwapi-iqueryassociations-init
     */
    Init(flags, pszAssoc, hkProgid, hwnd) {
        pszAssoc := pszAssoc is String ? StrPtr(pszAssoc) : pszAssoc
        hkProgid := hkProgid is Win32Handle ? NumGet(hkProgid, "ptr") : hkProgid
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "uint", flags, "ptr", pszAssoc, "ptr", hkProgid, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * Searches for and retrieves a file or protocol association-related string from the registry.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/win32/shell/assocf_str">ASSOCF</a></b>
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
     * @param {Integer} str Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ne-shlwapi-assocstr">ASSOCSTR</a></b>
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
     * @see https://docs.microsoft.com/windows/win32/api//shlwapi/nf-shlwapi-iqueryassociations-getstring
     */
    GetString(flags, str, pszExtra, pszOut, pcchOut) {
        pszExtra := pszExtra is String ? StrPtr(pszExtra) : pszExtra
        pszOut := pszOut is String ? StrPtr(pszOut) : pszOut

        pcchOutMarshal := pcchOut is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", flags, "int", str, "ptr", pszExtra, "ptr", pszOut, pcchOutMarshal, pcchOut, "HRESULT")
        return result
    }

    /**
     * Searches for and retrieves a file or protocol association-related key from the registry.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/win32/shell/assocf_str">ASSOCF</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/shell/assocf_str">ASSOCF</a> value that can be used to control the search.
     * @param {Integer} key Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ne-shlwapi-assockey">ASSOCKEY</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ne-shlwapi-assockey">ASSOCKEY</a> value that specifies the type of key that is to be returned.
     * @param {PWSTR} pszExtra Type: <b>LPCWSTR</b>
     * 
     * A pointer to an optional null-terminated Unicode string with information about the location of the key. It is normally set to a Shell verb such as <b>open</b>. Set this parameter to <b>NULL</b> if it is not used.
     * @returns {HKEY} Type: <b>HKEY*</b>
     * 
     * A pointer to the key's HKEY value.
     * @see https://docs.microsoft.com/windows/win32/api//shlwapi/nf-shlwapi-iqueryassociations-getkey
     */
    GetKey(flags, key, pszExtra) {
        pszExtra := pszExtra is String ? StrPtr(pszExtra) : pszExtra

        phkeyOut := HKEY()
        result := ComCall(5, this, "uint", flags, "int", key, "ptr", pszExtra, "ptr", phkeyOut, "HRESULT")
        return phkeyOut
    }

    /**
     * Searches for and retrieves file or protocol association-related binary data from the registry.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/win32/shell/assocf_str">ASSOCF</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/shell/assocf_str">ASSOCF</a> value that can be used to control the search.
     * @param {Integer} data Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ne-shlwapi-assocdata">ASSOCDATA</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ne-shlwapi-assocdata">ASSOCDATA</a> value that specifies the type of data that is to be returned.
     * @param {PWSTR} pszExtra Type: <b>LPCWSTR</b>
     * 
     * A pointer to an optional, null-terminated Unicode string with information about the location of the data. It is normally set to a Shell verb such as <b>open</b>. Set this parameter to <b>NULL</b> if it is not used.
     * @param {Pointer} pvOut Type: <b>void*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives the requested data value.
     * @param {Pointer<Integer>} pcbOut Type: <b>DWORD*</b>
     * 
     * A pointer to a value that, when this method is called, holds the size of <i>pvOut</i>, in bytes. When this method returns successfully, the value contains the size of the data actually retrieved.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlwapi/nf-shlwapi-iqueryassociations-getdata
     */
    GetData(flags, data, pszExtra, pvOut, pcbOut) {
        pszExtra := pszExtra is String ? StrPtr(pszExtra) : pszExtra

        pcbOutMarshal := pcbOut is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", flags, "int", data, "ptr", pszExtra, "ptr", pvOut, pcbOutMarshal, pcbOut, "HRESULT")
        return result
    }

    /**
     * This method is not implemented.
     * @param {Integer} flags TBD
     * @param {Integer} assocenum TBD
     * @param {PWSTR} pszExtra TBD
     * @param {Pointer<Guid>} riid TBD
     * @returns {Pointer<Void>} TBD
     * @see https://docs.microsoft.com/windows/win32/api//shlwapi/nf-shlwapi-iqueryassociations-getenum
     */
    GetEnum(flags, assocenum, pszExtra, riid) {
        pszExtra := pszExtra is String ? StrPtr(pszExtra) : pszExtra

        result := ComCall(7, this, "uint", flags, "int", assocenum, "ptr", pszExtra, "ptr", riid, "ptr*", &ppvOut := 0, "HRESULT")
        return ppvOut
    }
}
