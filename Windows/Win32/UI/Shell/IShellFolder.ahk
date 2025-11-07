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
     * 
     * @param {HWND} hwnd 
     * @param {IBindCtx} pbc 
     * @param {PWSTR} pszDisplayName 
     * @param {Pointer<Integer>} pdwAttributes 
     * @returns {Pointer<ITEMIDLIST>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname
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
     * The EnumObjects function enumerates the pens or brushes available for the specified device context (DC).
     * @param {HWND} hwnd 
     * @param {Integer} grfFlags 
     * @returns {IEnumIDList} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-enumobjects
     */
    EnumObjects(hwnd, grfFlags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(4, this, "ptr", hwnd, "uint", grfFlags, "ptr*", &ppenumIDList := 0, "int")
        return IEnumIDList(ppenumIDList)
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {IBindCtx} pbc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellfolder-bindtoobject
     */
    BindToObject(pidl, pbc, riid) {
        result := ComCall(5, this, "ptr", pidl, "ptr", pbc, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {IBindCtx} pbc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellfolder-bindtostorage
     */
    BindToStorage(pidl, pbc, riid) {
        result := ComCall(6, this, "ptr", pidl, "ptr", pbc, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {LPARAM} lParam 
     * @param {Pointer<ITEMIDLIST>} pidl1 
     * @param {Pointer<ITEMIDLIST>} pidl2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellfolder-compareids
     */
    CompareIDs(lParam, pidl1, pidl2) {
        result := ComCall(7, this, "ptr", lParam, "ptr", pidl1, "ptr", pidl2, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hwndOwner 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellfolder-createviewobject
     */
    CreateViewObject(hwndOwner, riid) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(8, this, "ptr", hwndOwner, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Integer} cidl 
     * @param {Pointer<Pointer<ITEMIDLIST>>} apidl 
     * @param {Pointer<Integer>} rgfInOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getattributesof
     */
    GetAttributesOf(cidl, apidl, rgfInOut) {
        apidlMarshal := apidl is VarRef ? "ptr*" : "ptr"
        rgfInOutMarshal := rgfInOut is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", cidl, apidlMarshal, apidl, rgfInOutMarshal, rgfInOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndOwner 
     * @param {Integer} cidl 
     * @param {Pointer<Pointer<ITEMIDLIST>>} apidl 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof
     */
    GetUIObjectOf(hwndOwner, cidl, apidl, riid) {
        static rgfReserved := 0 ;Reserved parameters must always be NULL

        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        apidlMarshal := apidl is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "ptr", hwndOwner, "uint", cidl, apidlMarshal, apidl, "ptr", riid, "uint*", rgfReserved, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Integer} uFlags 
     * @returns {STRRET} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getdisplaynameof
     */
    GetDisplayNameOf(pidl, uFlags) {
        pName := STRRET()
        result := ComCall(11, this, "ptr", pidl, "uint", uFlags, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {PWSTR} pszName 
     * @param {Integer} uFlags 
     * @returns {Pointer<ITEMIDLIST>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellfolder-setnameof
     */
    SetNameOf(hwnd, pidl, pszName, uFlags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(12, this, "ptr", hwnd, "ptr", pidl, "ptr", pszName, "uint", uFlags, "ptr*", &ppidlOut := 0, "HRESULT")
        return ppidlOut
    }
}
