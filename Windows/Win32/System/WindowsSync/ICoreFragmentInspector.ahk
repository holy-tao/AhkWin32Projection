#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICoreFragment.ahk" { ICoreFragment }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enumerates the ICoreFragment objects that are contained in a knowledge object.
 * @remarks
 * An <b>ICoreFragmentInspector</b> object can be obtained by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isyncknowledge2-getinspector">ISyncKnowledge2::GetInspector</a> on a knowledge object.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-icorefragmentinspector
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ICoreFragmentInspector extends IUnknown {
    /**
     * The interface identifier for ICoreFragmentInspector
     * @type {Guid}
     */
    static IID := Guid("{f7fcc5fd-ae26-4679-ba16-96aac583c134}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICoreFragmentInspector interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NextCoreFragments : IntPtr
        Reset             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICoreFragmentInspector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the next ICoreFragment objects in the knowledge, if they are available.
     * @param {Integer} requestedCount The number of <b>ICoreFragment</b> objects to retrieve.
     * @param {Pointer<Integer>} pFetchedCount Receives the number of <b>ICoreFragment</b> objects that were retrieved in the <i>ppiCoreFragments</i> parameter. This value can be <b>NULL</b> only if <i> requestedCount</i> is 1.
     * @returns {ICoreFragment} Receives a pointer to the next <i>pFetchedCount</i> <b>ICoreFragment</b> objects. The size of the array is the value specified in the <i>requestedCount</i> parameter. The length is <c>*(pFetchedCount)</c>. The caller must release the interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-icorefragmentinspector-nextcorefragments
     */
    NextCoreFragments(requestedCount, pFetchedCount) {
        pFetchedCountMarshal := pFetchedCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", requestedCount, "ptr*", &ppiCoreFragments := 0, pFetchedCountMarshal, pFetchedCount, "HRESULT")
        return ICoreFragment(ppiCoreFragments)
    }

    /**
     * Resets the enumerator to the beginning of the knowledge.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The knowledge object that is associated with this object has changed since this object was created.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-icorefragmentinspector-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICoreFragmentInspector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NextCoreFragments := CallbackCreate(GetMethod(implObj, "NextCoreFragments"), flags, 4)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NextCoreFragments)
        CallbackFree(this.vtbl.Reset)
    }
}
