#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a clock vector in a knowledge structure.
 * @remarks
 * A clock vector defines the changes that are contained in a knowledge structure by using a list of <b>IClockVectorElement</b> objects. An <b>IClockVectorElement</b> object exists for each replica that has made a change that is contained in the knowledge. A change that is made by a particular replica is defined to be contained in the knowledge when the tick count for the change occurs between zero and the tick count contained in <b>IClockVectorElement</b> that tracks that replica.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-iclockvector
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IClockVector extends IUnknown {
    /**
     * The interface identifier for IClockVector
     * @type {Guid}
     */
    static IID := Guid("{14b2274a-8698-4cc6-9333-f89bd1d47bc4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IClockVector interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetClockVectorElements     : IntPtr
        GetClockVectorElementCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IClockVector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns an enumerator that iterates through the clock vector elements.
     * @param {Pointer<Guid>} riid The IID of the enumeration interface that is requested. Must be either <b>IID_IEnumClockVector</b> or <b>IID_IEnumFeedClockVector</b>.
     * @param {Pointer<Pointer<Void>>} ppiEnumClockVector Returns an object that implements <i>riid</i> and that can enumerate the clock vector elements.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
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
     * <td width="60%">
     * <i>riid</i> is not  <b>IID_IEnumClockVector</b> or <b>IID_IEnumFeedClockVector</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iclockvector-getclockvectorelements
     */
    GetClockVectorElements(riid, ppiEnumClockVector) {
        ppiEnumClockVectorMarshal := ppiEnumClockVector is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, Guid.Ptr, riid, ppiEnumClockVectorMarshal, ppiEnumClockVector, "HRESULT")
        return result
    }

    /**
     * Gets the number of elements that are contained in the clock vector.
     * @param {Pointer<Integer>} pdwCount Returns the number of elements that are contained in the clock vector.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iclockvector-getclockvectorelementcount
     */
    GetClockVectorElementCount(pdwCount) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwCountMarshal, pdwCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IClockVector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClockVectorElements := CallbackCreate(GetMethod(implObj, "GetClockVectorElements"), flags, 3)
        this.vtbl.GetClockVectorElementCount := CallbackCreate(GetMethod(implObj, "GetClockVectorElementCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClockVectorElements)
        CallbackFree(this.vtbl.GetClockVectorElementCount)
    }
}
