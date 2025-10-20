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
     * 
     * @param {Pointer<IUnknown>} punkToWalk 
     * @param {Integer} dwFlags 
     * @param {Integer} cDepth 
     * @param {Pointer<INamespaceWalkCB>} pnswcb 
     * @returns {HRESULT} 
     */
    Walk(punkToWalk, dwFlags, cDepth, pnswcb) {
        result := ComCall(3, this, "ptr", punkToWalk, "uint", dwFlags, "int", cDepth, "ptr", pnswcb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcItems 
     * @param {Pointer<ITEMIDLIST>} prgpidl 
     * @returns {HRESULT} 
     */
    GetIDArrayResult(pcItems, prgpidl) {
        result := ComCall(4, this, "uint*", pcItems, "ptr", prgpidl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
