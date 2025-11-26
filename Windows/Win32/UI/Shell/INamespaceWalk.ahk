#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that walk a namespace from a given root node. The depth of the walk is specified and an optional array is returned containing the IDs of all nodes walked.
 * @remarks
 * 
 * Use this interface to display or perform an operation on the contents of the namespace. <b>INamespaceWalk</b> allows retrieval of all reachable nodes of your namespace as pointers to item identifier lists (PIDLs), which can in turn be used to retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object for each.
 * 
 * The class identifier (CLSID) for the default implementation of <b>INamespaceWalk</b> is CLSID_NamespaceWalker. You can obtain an <b>INamespaceWalk</b> object by creating a single uninitialized object of the class associated with CLSID_NamespaceWalker using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>. This interface's IID is IID_INamespaceWalk.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-inamespacewalk
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INamespaceWalk extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INamespaceWalk
     * @type {Guid}
     */
    static IID => Guid("{57ced8a7-3f4a-432c-9350-30f24483f74f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Walk", "GetIDArrayResult"]

    /**
     * Initiates a recursive walk of the namespace from the specified root to the given depth.
     * @param {IUnknown} punkToWalk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * The root node from which to begin the walk. This can be represented by one of the following objects.
     * 
     * 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iparentanditem">IParentAndItem</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumfullidlist">IEnumFullIDList</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>
     * </li>
     * </ul>
     * Specifying the desktop's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> as the root allows the possibility of walking the entire Windows namespace if <i>cDepth</i> is sufficiently large.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * One or more of the following flags that control the walk operation.
     * @param {Integer} cDepth Type: <b>int</b>
     * 
     * The maximum depth to descend through the namespace hierarchy. This depth is zero-based. Set to 0 to walk only the folder identified by <i>punkToWalk</i> but none of its subfolders.
     * @param {INamespaceWalkCB} pnswcb Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-inamespacewalkcb">INamespaceWalkCB</a>*</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-inamespacewalkcb">INamespaceWalkCB</a> callback function used by <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-inamespacewalk">INamespaceWalk</a>. This parameter can be <b>NULL</b>. The object can optionally implement the INamespaceWalkCB2 and IActionProgress interfaces. See remarks below.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacewalk-walk
     */
    Walk(punkToWalk, dwFlags, cDepth, pnswcb) {
        result := ComCall(3, this, "ptr", punkToWalk, "uint", dwFlags, "int", cDepth, "ptr", pnswcb, "HRESULT")
        return result
    }

    /**
     * Gets a list of objects found during a namespace walk initiated by INamespaceWalk::Walk.
     * @param {Pointer<Integer>} pcItems Type: <b>UINT*</b>
     * 
     * The number of items stored in <i>pppidl</i>
     * @param {Pointer<Pointer<Pointer<ITEMIDLIST>>>} prgpidl Type: <b>LPITEMIDLIST**</b>
     * 
     * The address of a pointer to an array of PIDLs representing the items found during the namespace walk.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacewalk-getidarrayresult
     */
    GetIDArrayResult(pcItems, prgpidl) {
        pcItemsMarshal := pcItems is VarRef ? "uint*" : "ptr"
        prgpidlMarshal := prgpidl is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pcItemsMarshal, pcItems, prgpidlMarshal, prgpidl, "HRESULT")
        return result
    }
}
