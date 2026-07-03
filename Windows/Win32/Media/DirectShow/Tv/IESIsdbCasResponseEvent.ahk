#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IESEvent.ahk" { IESEvent }
#Import "..\..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Implements methods that get information from a Protected Broadcast Driver Architecture (PBDA) IsdbCasResponse event.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESIsdbCasResponseEvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-iesisdbcasresponseevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IESIsdbCasResponseEvent extends IESEvent {
    /**
     * The interface identifier for IESIsdbCasResponseEvent
     * @type {Guid}
     */
    static IID := Guid("{2017cb03-dc0f-4c24-83ca-36307b2cd19f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IESIsdbCasResponseEvent interfaces
    */
    struct Vtbl extends IESEvent.Vtbl {
        GetRequestId    : IntPtr
        GetStatus       : IntPtr
        GetDataLength   : IntPtr
        GetResponseData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IESIsdbCasResponseEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the request identifier returned in an IsdbCasResponse event. The request identifier identifies the request originated by a PBDA media sink device (MSD).
     * @returns {Integer} Receives the request identifier.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesisdbcasresponseevent-getrequestid
     */
    GetRequestId() {
        result := ComCall(8, this, "uint*", &pRequestId := 0, "HRESULT")
        return pRequestId
    }

    /**
     * Gets the response status returned in an IsdbCasResponse event.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesisdbcasresponseevent-getstatus
     */
    GetStatus() {
        result := ComCall(9, this, "uint*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * Gets the length of response data returned in anIsdbCasResponse event.
     * @returns {Integer} Receives the length of the response data, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesisdbcasresponseevent-getdatalength
     */
    GetDataLength() {
        result := ComCall(10, this, "uint*", &pRequestLength := 0, "HRESULT")
        return pRequestLength
    }

    /**
     * Gets the response data returned in an IsdbCasResponse event.
     * @returns {Pointer<SAFEARRAY>} Pointer to a buffer that receives the response data. The caller must free this memory after use.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesisdbcasresponseevent-getresponsedata
     */
    GetResponseData() {
        result := ComCall(11, this, "ptr*", &pbData := 0, "HRESULT")
        return pbData
    }

    Query(iid) {
        if (IESIsdbCasResponseEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRequestId := CallbackCreate(GetMethod(implObj, "GetRequestId"), flags, 2)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 2)
        this.vtbl.GetDataLength := CallbackCreate(GetMethod(implObj, "GetDataLength"), flags, 2)
        this.vtbl.GetResponseData := CallbackCreate(GetMethod(implObj, "GetResponseData"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRequestId)
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.GetDataLength)
        CallbackFree(this.vtbl.GetResponseData)
    }
}
