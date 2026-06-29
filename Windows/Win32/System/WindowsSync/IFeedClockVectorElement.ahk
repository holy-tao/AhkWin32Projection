#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SYNC_TIME.ahk" { SYNC_TIME }
#Import ".\IClockVectorElement.ahk" { IClockVectorElement }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents a clock vector element that contains FeedSync information.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-ifeedclockvectorelement
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IFeedClockVectorElement extends IClockVectorElement {
    /**
     * The interface identifier for IFeedClockVectorElement
     * @type {Guid}
     */
    static IID := Guid("{a40b46d2-e97b-4156-b6da-991f501b0f05}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFeedClockVectorElement interfaces
    */
    struct Vtbl extends IClockVectorElement.Vtbl {
        GetSyncTime : IntPtr
        GetFlags    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFeedClockVectorElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a SYNC_TIME value that corresponds to the when value for the item.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winsync/ns-winsync-sync_time">SYNC_TIME</a> structure is a packed date-and-time value that can store years between 1601 and 67136 and times that are accurate to the millisecond.
     * @param {Pointer<SYNC_TIME>} pSyncTime Returns a <a href="https://docs.microsoft.com/windows/desktop/api/winsync/ns-winsync-sync_time">SYNC_TIME</a> value that corresponds to the <b>when</b> value for the item.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ifeedclockvectorelement-getsynctime
     */
    GetSyncTime(pSyncTime) {
        result := ComCall(5, this, SYNC_TIME.Ptr, pSyncTime, "HRESULT")
        return result
    }

    /**
     * Gets flags that specify additional information about the clock vector element.
     * @param {Pointer<Integer>} pbFlags Returns flags that specify additional information about the clock vector element. These flags will be a combination of the <b>SYNC_VERSION_FLAG</b> flags.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ifeedclockvectorelement-getflags
     */
    GetFlags(pbFlags) {
        pbFlagsMarshal := pbFlags is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, pbFlagsMarshal, pbFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFeedClockVectorElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSyncTime := CallbackCreate(GetMethod(implObj, "GetSyncTime"), flags, 2)
        this.vtbl.GetFlags := CallbackCreate(GetMethod(implObj, "GetFlags"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSyncTime)
        CallbackFree(this.vtbl.GetFlags)
    }
}
