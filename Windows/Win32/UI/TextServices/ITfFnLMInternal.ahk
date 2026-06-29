#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfRange.ahk" { ITfRange }
#Import ".\ITfFnLMProcessor.ahk" { ITfFnLMProcessor }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITfFnLMInternal interface is not used.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itffnlminternal
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfFnLMInternal extends ITfFnLMProcessor {
    /**
     * The interface identifier for ITfFnLMInternal
     * @type {Guid}
     */
    static IID := Guid("{04b825b1-ac9a-4f7b-b5ad-c7168f1ee445}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfFnLMInternal interfaces
    */
    struct Vtbl extends ITfFnLMProcessor.Vtbl {
        ProcessLattice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfFnLMInternal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfFnLMInternal::ProcessLattice method
     * @param {ITfRange} pRange Not used.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnlminternal-processlattice
     */
    ProcessLattice(pRange) {
        result := ComCall(11, this, "ptr", pRange, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfFnLMInternal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ProcessLattice := CallbackCreate(GetMethod(implObj, "ProcessLattice"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ProcessLattice)
    }
}
