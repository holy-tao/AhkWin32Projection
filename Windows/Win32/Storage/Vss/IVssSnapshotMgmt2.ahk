#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method to retrieve the minimum size of the shadow copy storage area.
 * @remarks
 * To obtain an instance of the <b>IVssSnapshotMgmt2</b> 
 *    interface, call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of the 
 *    <a href="https://docs.microsoft.com/windows/desktop/api/vsmgmt/nn-vsmgmt-ivsssnapshotmgmt">IVssSnapshotMgmt</a> interface, passing 
 *    <b>IID_IVssSnapshotMgmt2</b> as the <i>riid</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nn-vsmgmt-ivsssnapshotmgmt2
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct IVssSnapshotMgmt2 extends IUnknown {
    /**
     * The interface identifier for IVssSnapshotMgmt2
     * @type {Guid}
     */
    static IID := Guid("{0f61ec39-fe82-45f2-a3f0-768b5d427102}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVssSnapshotMgmt2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMinDiffAreaSize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVssSnapshotMgmt2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the current minimum size of the shadow copy storage area.
     * @remarks
     * The shadow copy storage area minimum size is a per-computer setting that is specified by the <b>MinDiffAreaFileSize</b> registry key. For more information, see the entry for <b>MinDiffAreaFileSize</b> in <a href="https://docs.microsoft.com/windows/desktop/Backup/registry-keys-for-backup-and-restore">Registry Keys and Values for Backup and Restore</a>.
     * @returns {Integer} A pointer to a variable that receives the minimum size, in bytes, of the shadow copy storage area.
     * @see https://learn.microsoft.com/windows/win32/api/vsmgmt/nf-vsmgmt-ivsssnapshotmgmt2-getmindiffareasize
     */
    GetMinDiffAreaSize() {
        result := ComCall(3, this, "int64*", &pllMinDiffAreaSize := 0, "HRESULT")
        return pllMinDiffAreaSize
    }

    Query(iid) {
        if (IVssSnapshotMgmt2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMinDiffAreaSize := CallbackCreate(GetMethod(implObj, "GetMinDiffAreaSize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMinDiffAreaSize)
    }
}
