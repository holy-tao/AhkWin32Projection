#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\STATSTG.ahk" { STATSTG }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * Enumerates an array of STATSTG structures.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-ienumstatstg
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct IEnumSTATSTG extends IUnknown {
    /**
     * The interface identifier for IEnumSTATSTG
     * @type {Guid}
     */
    static IID := Guid("{0000000d-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumSTATSTG interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumSTATSTG.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a specified number of STATSTG structures, that follow in the enumeration sequence.
     * @param {Integer} celt The number of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structures requested.
     * @param {Pointer<STATSTG>} rgelt An array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structures returned.
     * @param {Pointer<Integer>} pceltFetched The number of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structures  retrieved in the <i>rgelt</i> parameter.
     * @returns {HRESULT} This method supports the following return values:
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
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structures returned is equal to the number specified in the <i>celt</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structures returned is less than the number specified in the <i>celt</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ienumstatstg-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, STATSTG.Ptr, rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skips a specified number of STATSTG structures in the enumeration sequence.
     * @param {Integer} celt The number of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structures to skip.
     * @returns {HRESULT} This method supports the following return values:
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * | S_OK | The specified number of **STATSTG** structures that were successfully skipped. |
     * | S_FALSE | The number of **STATSTG** structures skipped is less than the *celt* parameter. |
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ienumstatstg-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration sequence to the beginning of the STATSTG structure array.
     * @returns {HRESULT} This method supports the S_OK return value.
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
     * The enumeration sequence was successfully reset to the beginning of the enumeration.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ienumstatstg-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a new enumerator that contains the same enumeration state as the current STATSTG structure enumerator.
     * @returns {IEnumSTATSTG} A pointer to the variable that receives the  <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatstg">IEnumSTATSTG</a> interface pointer. 
     * 
     * If the method is unsuccessful, the value of the <i>ppenum</i> parameter is undefined.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ienumstatstg-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSTATSTG(ppenum)
    }

    Query(iid) {
        if (IEnumSTATSTG.IID.Equals(iid)) {
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
