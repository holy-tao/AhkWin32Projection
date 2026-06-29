#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Sends conditional access system (CAS) commands for Integrated Services Digital Broadcasting (ISDB).
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_ISDBConditionalAccess)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_isdbconditionalaccess
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_ISDBConditionalAccess extends IUnknown {
    /**
     * The interface identifier for IBDA_ISDBConditionalAccess
     * @type {Guid}
     */
    static IID := Guid("{5e68c627-16c2-4e6c-b1e2-d00170cdaa0f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_ISDBConditionalAccess interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetIsdbCasRequest : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_ISDBConditionalAccess.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sends a conditional access system (CAS) command for Integrated Services Digital Broadcasting (ISDB).
     * @param {Integer} ulRequestId The numeric code for the CAS command. The ARIB standard defines these values. Enumeration constants for some commands are defined in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/isdbcas-request-id">ISDBCAS_REQUEST_ID</a> enumeration.
     * @param {Integer} ulcbRequestBufferLen Size of the <i>pbRequestBuffer</i> array, in bytes.
     * @param {Pointer<Integer>} pbRequestBuffer Pointer to a byte array that contains the data for the command.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_isdbconditionalaccess-setisdbcasrequest
     */
    SetIsdbCasRequest(ulRequestId, ulcbRequestBufferLen, pbRequestBuffer) {
        pbRequestBufferMarshal := pbRequestBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", ulRequestId, "uint", ulcbRequestBufferLen, pbRequestBufferMarshal, pbRequestBuffer, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_ISDBConditionalAccess.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetIsdbCasRequest := CallbackCreate(GetMethod(implObj, "SetIsdbCasRequest"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetIsdbCasRequest)
    }
}
