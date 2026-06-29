#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRDPSRAPITransportStreamBuffer.ahk" { IRDPSRAPITransportStreamBuffer }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods called by the stream interface (IRDPSRAPITransportStream) to notify the Remote Desktop Protocol (RDP) stack about the completion of events.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreamevents
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPITransportStreamEvents extends IUnknown {
    /**
     * The interface identifier for IRDPSRAPITransportStreamEvents
     * @type {Guid}
     */
    static IID := Guid("{ea81c254-f5af-4e40-982e-3e63bb595276}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPITransportStreamEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnWriteCompleted : IntPtr
        OnReadCompleted  : IntPtr
        OnStreamClosed   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPITransportStreamEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the Remote Desktop Protocol (RDP) stack that a write operation has completed.
     * @param {IRDPSRAPITransportStreamBuffer} pBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer">IRDPSRAPITransportStreamBuffer</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer">IRDPSRAPITransportStreamBuffer</a> interface pointer that represents the stream buffer that was written.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstreamevents-onwritecompleted
     */
    OnWriteCompleted(pBuffer) {
        ComCall(3, this, "ptr", pBuffer)
    }

    /**
     * Notifies the Remote Desktop Protocol (RDP) stack that a read operation has completed.
     * @param {IRDPSRAPITransportStreamBuffer} pBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer">IRDPSRAPITransportStreamBuffer</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer">IRDPSRAPITransportStreamBuffer</a> interface pointer that represents the stream buffer that was read.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstreamevents-onreadcompleted
     */
    OnReadCompleted(pBuffer) {
        ComCall(4, this, "ptr", pBuffer)
    }

    /**
     * Notifies the Remote Desktop Protocol (RDP) stack that the connection was closed.
     * @param {HRESULT} hrReason Type: <b>HRESULT</b>
     * 
     * An <b>HRESULT</b> value that specifies if the stream was closed normally or due to an error. Contains <b>S_OK</b> if the stream was closed normally or an error code otherwise.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstreamevents-onstreamclosed
     */
    OnStreamClosed(hrReason) {
        ComCall(5, this, "int", hrReason)
    }

    Query(iid) {
        if (IRDPSRAPITransportStreamEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnWriteCompleted := CallbackCreate(GetMethod(implObj, "OnWriteCompleted"), flags, 2)
        this.vtbl.OnReadCompleted := CallbackCreate(GetMethod(implObj, "OnReadCompleted"), flags, 2)
        this.vtbl.OnStreamClosed := CallbackCreate(GetMethod(implObj, "OnStreamClosed"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnWriteCompleted)
        CallbackFree(this.vtbl.OnReadCompleted)
        CallbackFree(this.vtbl.OnStreamClosed)
    }
}
