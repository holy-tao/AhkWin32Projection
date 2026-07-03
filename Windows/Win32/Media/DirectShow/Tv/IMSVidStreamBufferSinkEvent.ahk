#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSVidOutputDeviceEvent.ahk" { IMSVidOutputDeviceEvent }

/**
 * This topic applies to Windows XP Service Pack 1 or later.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferSinkEvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidstreambuffersinkevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidStreamBufferSinkEvent extends IMSVidOutputDeviceEvent {
    /**
     * The interface identifier for IMSVidStreamBufferSinkEvent
     * @type {Guid}
     */
    static IID := Guid("{f798a36b-b05b-4bbe-9703-eaea7d61cd51}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidStreamBufferSinkEvent interfaces
    */
    struct Vtbl extends IMSVidOutputDeviceEvent.Vtbl {
        CertificateFailure : IntPtr
        CertificateSuccess : IntPtr
        WriteFailure       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidStreamBufferSinkEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This topic applies to Windows XP Service Pack 1 or later.
     * @returns {HRESULT} Returns S_OK or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersinkevent-certificatefailure
     */
    CertificateFailure() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows XP Service Pack 1 or later.
     * @returns {HRESULT} Return S_OK or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersinkevent-certificatesuccess
     */
    CertificateSuccess() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows XP Service Pack 1 or later.
     * @returns {HRESULT} Returns S_OK or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambuffersinkevent-writefailure
     */
    WriteFailure() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidStreamBufferSinkEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CertificateFailure := CallbackCreate(GetMethod(implObj, "CertificateFailure"), flags, 1)
        this.vtbl.CertificateSuccess := CallbackCreate(GetMethod(implObj, "CertificateSuccess"), flags, 1)
        this.vtbl.WriteFailure := CallbackCreate(GetMethod(implObj, "WriteFailure"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CertificateFailure)
        CallbackFree(this.vtbl.CertificateSuccess)
        CallbackFree(this.vtbl.WriteFailure)
    }
}
