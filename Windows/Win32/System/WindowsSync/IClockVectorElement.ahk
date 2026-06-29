#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a clock vector element of a knowledge structure.
 * @remarks
 * The clock vector elements of a clock vector represent the changes that are contained in a knowledge structure. A change that is made by a particular replica is defined to be contained in the knowledge when the tick count for the change occurs between zero and the tick count contained in the <b>IClockVectorElement</b> that tracks that replica.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-iclockvectorelement
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IClockVectorElement extends IUnknown {
    /**
     * The interface identifier for IClockVectorElement
     * @type {Guid}
     */
    static IID := Guid("{e71c4250-adf8-4a07-8fae-5669596909c1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IClockVectorElement interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetReplicaKey : IntPtr
        GetTickCount  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IClockVectorElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the replica key for the replica that is associated with this clock vector element.
     * @param {Pointer<Integer>} pdwReplicaKey Returns the replica key for the replica that is associated with this clock vector element.
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
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iclockvectorelement-getreplicakey
     */
    GetReplicaKey(pdwReplicaKey) {
        pdwReplicaKeyMarshal := pdwReplicaKey is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwReplicaKeyMarshal, pdwReplicaKey, "HRESULT")
        return result
    }

    /**
     * Gets the tick count that defines the upper bound on the range of tick counts that are contained in this clock vector element.
     * @param {Pointer<Integer>} pullTickCount Returns the tick count that defines the upper bound on the range of tick counts that are contained in this clock vector element.
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
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iclockvectorelement-gettickcount
     */
    GetTickCount(pullTickCount) {
        pullTickCountMarshal := pullTickCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pullTickCountMarshal, pullTickCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IClockVectorElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetReplicaKey := CallbackCreate(GetMethod(implObj, "GetReplicaKey"), flags, 2)
        this.vtbl.GetTickCount := CallbackCreate(GetMethod(implObj, "GetTickCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetReplicaKey)
        CallbackFree(this.vtbl.GetTickCount)
    }
}
