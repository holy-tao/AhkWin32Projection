#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOfflineFilesItem.ahk" { IOfflineFilesItem }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a collection of IOfflineFilesItem interface pointers.
 * @remarks
 * To obtain an instance of this interface, first obtain an instance of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitemcontainer">IOfflineFilesItemContainer</a> using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on an instance of one of the following interfaces:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilescache">IOfflineFilesCache</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesdirectoryitem">IOfflineFilesDirectoryItem</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitem">IOfflineFilesItem</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesserveritem">IOfflineFilesServerItem</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesshareitem">IOfflineFilesShareItem</a>
 * </li>
 * </ul>
 * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitemcontainer">IOfflineFilesItemContainer</a> interface is only valid for directory, server, and share items. If <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> is called for the <b>IOfflineFilesItemContainer</b> interface on a file item (an instance of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesfileitem">IOfflineFilesFileItem</a> interface), it will fail with <b>E_NOINTERFACE</b>.</div>
 * <div> </div>
 * For a code example that shows how to use the <b>IEnumOfflineFilesItems</b> interface, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesitemcontainer-enumitems">IOfflineFilesItemContainer::EnumItems</a>.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-ienumofflinefilesitems
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IEnumOfflineFilesItems extends IUnknown {
    /**
     * The interface identifier for IEnumOfflineFilesItems
     * @type {Guid}
     */
    static IID := Guid("{da70e815-c361-4407-bc0b-0d7046e5f2cd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumOfflineFilesItems interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumOfflineFilesItems.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the next item in the enumeration and advances the enumerator. (IEnumOfflineFilesItems.Next)
     * @param {Integer} celt Number of elements requested.
     * @param {Pointer<IOfflineFilesItem>} rgelt Array of elements returned.
     * @param {Pointer<Integer>} pceltFetched Pointer to number of elements actually supplied.
     * @returns {HRESULT} Returns <b>S_OK</b> if the number of elements returned is <i>celt</i>; S_FALSE if a number less than <i>celt</i> is returned; or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-ienumofflinefilesitems-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, IOfflineFilesItem.Ptr, rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skips over the next specified number of elements in the enumeration. (IEnumOfflineFilesItems.Skip)
     * @param {Integer} celt Number of elements to be skipped.
     * @returns {HRESULT} Returns <b>S_OK</b> if the number of elements skipped is <i>celt</i>; S_FALSE if a number less than <i>celt</i> is skipped; or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-ienumofflinefilesitems-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration to the beginning. (IEnumOfflineFilesItems.Reset)
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-ienumofflinefilesitems-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a new instance of the enumerator with the same enumeration state as the current one. (IEnumOfflineFilesItems.Clone)
     * @returns {IEnumOfflineFilesItems} Address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-ienumofflinefilesitems">IEnumOfflineFilesItems</a> pointer variable that receives the interface pointer of the new enumeration object.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-ienumofflinefilesitems-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumOfflineFilesItems(ppenum)
    }

    Query(iid) {
        if (IEnumOfflineFilesItems.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
