#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a change unit to exclude from a knowledge object.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-ichangeunitexception
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IChangeUnitException extends IUnknown {
    /**
     * The interface identifier for IChangeUnitException
     * @type {Guid}
     */
    static IID := Guid("{0cd7ee7c-fec0-4021-99ee-f0e5348f2a5f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IChangeUnitException interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetItemId       : IntPtr
        GetChangeUnitId : IntPtr
        GetClockVector  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IChangeUnitException.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the item ID for the item that contains the change unit that is associated with the exception.
     * @param {Pointer<Integer>} pbItemId Returns the item ID that contains the change unit that is associated with the exception.
     * @param {Pointer<Integer>} pcbIdSize Specifies the number of bytes in <i>pbItemId</i>. Returns the number of bytes required to retrieve the ID when <i>pbItemId</i> is too small, or the number of bytes written.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbItemId</i> is too small. In this case, the required number of bytes is returned in <i>pcbIdSize</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeunitexception-getitemid
     */
    GetItemId(pbItemId, pcbIdSize) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbItemIdMarshal, pbItemId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    /**
     * Gets the change unit ID for the change unit that is associated with the exception.
     * @param {Pointer<Integer>} pbChangeUnitId Returns the change unit ID that is associated with the exception.
     * @param {Pointer<Integer>} pcbIdSize Specifies the number of bytes in <i>pbChangeUnitId</i>. Returns the number of bytes required to retrieve the ID when <i>pbChangeUnitId</i> is too small, or the number of bytes written.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbChangeUnitId</i> is null.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbChangeUnitId</i> is too small. In this case, the required number of bytes is returned in <i>pcbIdSize</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeunitexception-getchangeunitid
     */
    GetChangeUnitId(pbChangeUnitId, pcbIdSize) {
        pbChangeUnitIdMarshal := pbChangeUnitId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pbChangeUnitIdMarshal, pbChangeUnitId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    /**
     * Gets the clock vector that is associated with this exception. (IChangeUnitException.GetClockVector)
     * @param {Pointer<Guid>} riid The IID of the object to retrieve. Must be <b>IID_IEnumClockVector</b>.
     * @param {Pointer<Pointer<Void>>} ppUnk Returns an object that implements <i>riid</i> and that represents the clock vector that is associated with this exception.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeunitexception-getclockvector
     */
    GetClockVector(riid, ppUnk) {
        ppUnkMarshal := ppUnk is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, Guid.Ptr, riid, ppUnkMarshal, ppUnk, "HRESULT")
        return result
    }

    Query(iid) {
        if (IChangeUnitException.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetItemId := CallbackCreate(GetMethod(implObj, "GetItemId"), flags, 3)
        this.vtbl.GetChangeUnitId := CallbackCreate(GetMethod(implObj, "GetChangeUnitId"), flags, 3)
        this.vtbl.GetClockVector := CallbackCreate(GetMethod(implObj, "GetClockVector"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetItemId)
        CallbackFree(this.vtbl.GetChangeUnitId)
        CallbackFree(this.vtbl.GetClockVector)
    }
}
