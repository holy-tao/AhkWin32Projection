#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that walk a namespace from a given root node. The depth of the walk is specified and an optional array is returned containing the IDs of all nodes walked.
 * @remarks
 * Use this interface to display or perform an operation on the contents of the namespace. <b>INamespaceWalk</b> allows retrieval of all reachable nodes of your namespace as pointers to item identifier lists (PIDLs), which can in turn be used to retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object for each.
 * 
 * The class identifier (CLSID) for the default implementation of <b>INamespaceWalk</b> is CLSID_NamespaceWalker. You can obtain an <b>INamespaceWalk</b> object by creating a single uninitialized object of the class associated with CLSID_NamespaceWalker using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>. This interface's IID is IID_INamespaceWalk.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-inamespacewalk
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
     * @remarks
     * If you do not pass the **NSWF_SHOW_PROGRESS** flag and the object pointed to by the *pnswcb* parameter implements <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iactionprogress">IActionProgress</a>, then the **INamespaceWalk::Walk** method calls the **IActionProgress::QueryCancel** method periodically to determine whether the operation should be canceled.
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
     * 
     * **NSWF_DEFAULT (0x00000000)**
     * 
     * Use this value when you do not want to set any of the other flags.
     * 
     * **NSWF_NONE_IMPLIES_ALL (0x00000001)**
     * 
     * Collect all of the items in the folder if both of these criteria are met:
     * 
     * <ul>
     * <li><i>punkToWalk</i> is a folder (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>).</li>
     * <li>None of the items in the folder are currently selected.</li>
     * </ul>
     * 
     * **NSWF_ONE_IMPLIES_ALL (0x00000002)**
     * 
     * Collect all of the items in the folder if both of these criteria are met: 
     * 
     * <ul>
     * <li><i>punkToWalk</i> is a folder (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>).</li>
     * <li>One of the items in the folder is currently selected.</li>
     * </ul>
     * 
     * **NSWF_DONT_TRAVERSE_LINKS (0x00000004)**
     * 
     * Do not follow links (.lnk, .url, and folder shortcuts) in the recursion; instead, return them as regular items.
     * 
     * **NSWF_DONT_ACCUMULATE_RESULT (0x00000008)**
     * 
     * Do not collect the PIDLs of the nodes during the namespace walk.
     * 
     * **NSWF_TRAVERSE_STREAM_JUNCTIONS (0x00000010)**
     * 
     * Include the contents of stream junction points in the walk. For instance, walk into the contents of a .cab file.
     * 
     * **NSWF_FILESYSTEM_ONLY (0x00000020)**
     * 
     * Walk only file system nodes.
     * 
     * **NSWF_SHOW_PROGRESS (0x00000040)**
     * 
     * Display a dialog box with a progress bar while walking the namespace.
     * 
     * **NSWF_FLAG_VIEWORDER (0x00000080)**
     * 
     * Return items in view order. This applies only when <i>punkToWalk</i> is an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> object.
     * 
     * **NSWF_IGNORE_AUTOPLAY_HIDA (0x00000100)**
     * 
     * Do not use the AutoPlay HIDA in the data object. This applies only when <i>punkToWalk</i> is an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> object.
     * 
     * **NSWF_ASYNC (0x00000200)**
     * 
     * Perform the walk asynchronously by running it on a background thread.
     * 
     * **NSWF_DONT_RESOLVE_LINKS (0x00000400)**
     * 
     * Traverse links to return their targets (for .lnk, .url and folder shortcuts) but do not verify that those targets exist (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinka-resolve">Resolve</a>). This is an optimization and does not affect the results except in the case where a missing or moved target could be found and returned.
     * 
     * **NSWF_ACCUMULATE_FOLDERS (0x00000800)**
     * 
     * **NSWF_DONT_SORT (0x00001000)**
     * 
     * Do not maintain the sort order of the items being walked.
     * 
     * **NSWF_USE_TRANSFER_MEDIUM (0x00002000)**
     * 
     * **NSWF_DONT_TRAVERSE_STREAM_JUNCTIONS (0x00004000)**
     * 
     * **NSWF_ANY_IMPLIES_ALL (0x00008000)**
     * 
     * Introduced in Windows 8.
     * @param {Integer} cDepth Type: <b>int</b>
     * 
     * The maximum depth to descend through the namespace hierarchy. This depth is zero-based. Set to 0 to walk only the folder identified by <i>punkToWalk</i> but none of its subfolders.
     * @param {INamespaceWalkCB} pnswcb Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-inamespacewalkcb">INamespaceWalkCB</a>*</b>
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-inamespacewalkcb">INamespaceWalkCB</a> callback function used by <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-inamespacewalk">INamespaceWalk</a>. This parameter can be <b>NULL</b>. The object can optionally implement the **INamespaceWalkCB2** and <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iactionprogress">IActionProgress</a> interfaces. See remarks below.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacewalk-walk
     */
    Walk(punkToWalk, dwFlags, cDepth, pnswcb) {
        result := ComCall(3, this, "ptr", punkToWalk, "uint", dwFlags, "int", cDepth, "ptr", pnswcb, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a list of objects found during a namespace walk initiated by INamespaceWalk::Walk.
     * @remarks
     * To use <b>INamespaceWalk::GetIDArrayResult</b>, <b>NSWF_DONT_ACCUMULATE_RESULT</b> cannot be specified in the call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-inamespacewalk-walk">INamespaceWalk::Walk</a>.
     * 
     * It is the responsibility of the calling application to free this array. Call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> for each PIDL as well as once for the array itself.
     * @param {Pointer<Integer>} pcItems Type: <b>UINT*</b>
     * 
     * The number of items stored in <i>pppidl</i>
     * @param {Pointer<Pointer<Pointer<ITEMIDLIST>>>} prgpidl Type: <b>LPITEMIDLIST**</b>
     * 
     * The address of a pointer to an array of PIDLs representing the items found during the namespace walk.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacewalk-getidarrayresult
     */
    GetIDArrayResult(pcItems, prgpidl) {
        pcItemsMarshal := pcItems is VarRef ? "uint*" : "ptr"
        prgpidlMarshal := prgpidl is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pcItemsMarshal, pcItems, prgpidlMarshal, prgpidl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
