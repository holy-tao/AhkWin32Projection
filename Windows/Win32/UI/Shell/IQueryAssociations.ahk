#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} flags 
     * @param {PWSTR} pszAssoc 
     * @param {HKEY} hkProgid 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-iqueryassociations-init
     */
    Init(flags, pszAssoc, hkProgid, hwnd) {
        pszAssoc := pszAssoc is String ? StrPtr(pszAssoc) : pszAssoc
        hkProgid := hkProgid is Win32Handle ? NumGet(hkProgid, "ptr") : hkProgid
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "uint", flags, "ptr", pszAssoc, "ptr", hkProgid, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Integer} str 
     * @param {PWSTR} pszExtra 
     * @param {PWSTR} pszOut 
     * @param {Pointer<Integer>} pcchOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-iqueryassociations-getstring
     */
    GetString(flags, str, pszExtra, pszOut, pcchOut) {
        pszExtra := pszExtra is String ? StrPtr(pszExtra) : pszExtra
        pszOut := pszOut is String ? StrPtr(pszOut) : pszOut

        pcchOutMarshal := pcchOut is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", flags, "int", str, "ptr", pszExtra, "ptr", pszOut, pcchOutMarshal, pcchOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Integer} key 
     * @param {PWSTR} pszExtra 
     * @param {Pointer<HKEY>} phkeyOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-iqueryassociations-getkey
     */
    GetKey(flags, key, pszExtra, phkeyOut) {
        pszExtra := pszExtra is String ? StrPtr(pszExtra) : pszExtra

        result := ComCall(5, this, "uint", flags, "int", key, "ptr", pszExtra, "ptr", phkeyOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Integer} data 
     * @param {PWSTR} pszExtra 
     * @param {Pointer} pvOut 
     * @param {Pointer<Integer>} pcbOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-iqueryassociations-getdata
     */
    GetData(flags, data, pszExtra, pvOut, pcbOut) {
        pszExtra := pszExtra is String ? StrPtr(pszExtra) : pszExtra

        pcbOutMarshal := pcbOut is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", flags, "int", data, "ptr", pszExtra, "ptr", pvOut, pcbOutMarshal, pcbOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Integer} assocenum 
     * @param {PWSTR} pszExtra 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-iqueryassociations-getenum
     */
    GetEnum(flags, assocenum, pszExtra, riid, ppvOut) {
        pszExtra := pszExtra is String ? StrPtr(pszExtra) : pszExtra

        result := ComCall(7, this, "uint", flags, "int", assocenum, "ptr", pszExtra, "ptr", riid, "ptr*", ppvOut, "HRESULT")
        return result
    }
}
