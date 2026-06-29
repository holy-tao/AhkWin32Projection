#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents an item ID range to exclude from a knowledge object.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-irangeexception
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IRangeException extends IUnknown {
    /**
     * The interface identifier for IRangeException
     * @type {Guid}
     */
    static IID := Guid("{75ae8777-6848-49f7-956c-a3a92f5096e8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRangeException interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetClosedRangeStart : IntPtr
        GetClosedRangeEnd   : IntPtr
        GetClockVector      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRangeException.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the lower bound of the range of item IDs to exclude.
     * @param {Pointer<Integer>} pbClosedRangeStart Returns the lower bound of the range of item IDs to exclude.
     * @param {Pointer<Integer>} pcbIdSize Specifies the number of bytes in <i>pbClosedRangeStart</i>. Returns the number of bytes to retrieve the ID when <i>pbClosedRangeStart</i> is too small, or returns the number of bytes written.
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
     * When <i>pbClosedRangeStart</i> is too small. In this case, the required number of bytes is returned in <i>pcbIdSize</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irangeexception-getclosedrangestart
     */
    GetClosedRangeStart(pbClosedRangeStart, pcbIdSize) {
        pbClosedRangeStartMarshal := pbClosedRangeStart is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbClosedRangeStartMarshal, pbClosedRangeStart, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    /**
     * Gets the upper bound of the range of item IDs to exclude.
     * @param {Pointer<Integer>} pbClosedRangeEnd Returns the upper bound of the range of item IDs to exclude.
     * @param {Pointer<Integer>} pcbIdSize Specifies the number of bytes in <i>pbClosedRangeEnd</i>. Returns the number of bytes required to retrieve the ID when <i>pbClosedRangeEnd</i> is too small, or returns the number of bytes written.
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
     * <i>pbClosedRangeEnd</i> is too small. In this case, the required number of bytes is returned in <i>pcbIdSize</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irangeexception-getclosedrangeend
     */
    GetClosedRangeEnd(pbClosedRangeEnd, pcbIdSize) {
        pbClosedRangeEndMarshal := pbClosedRangeEnd is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pbClosedRangeEndMarshal, pbClosedRangeEnd, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    /**
     * Gets the clock vector that is associated with this exception. (IRangeException.GetClockVector)
     * @param {Pointer<Guid>} riid The IID of the object to retrieve. Must be <b>IID_IEnumClockVector</b>.
     * @param {Pointer<Pointer<Void>>} ppUnk Returns an object that implements <i>riid</i> and represents the clock vector that is associated with this exception.
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
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irangeexception-getclockvector
     */
    GetClockVector(riid, ppUnk) {
        ppUnkMarshal := ppUnk is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, Guid.Ptr, riid, ppUnkMarshal, ppUnk, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRangeException.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClosedRangeStart := CallbackCreate(GetMethod(implObj, "GetClosedRangeStart"), flags, 3)
        this.vtbl.GetClosedRangeEnd := CallbackCreate(GetMethod(implObj, "GetClosedRangeEnd"), flags, 3)
        this.vtbl.GetClockVector := CallbackCreate(GetMethod(implObj, "GetClockVector"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClosedRangeStart)
        CallbackFree(this.vtbl.GetClosedRangeEnd)
        CallbackFree(this.vtbl.GetClockVector)
    }
}
