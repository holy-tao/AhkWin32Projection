#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRDPSRAPITransportStreamBuffer.ahk" { IRDPSRAPITransportStreamBuffer }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IRDPSRAPITransportStreamEvents.ahk" { IRDPSRAPITransportStreamEvents }

/**
 * Exposes methods that perform operations with streams.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstream
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPITransportStream extends IUnknown {
    /**
     * The interface identifier for IRDPSRAPITransportStream
     * @type {Guid}
     */
    static IID := Guid("{36cfa065-43bb-4ef7-aed7-9b88a5053036}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPITransportStream interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AllocBuffer : IntPtr
        FreeBuffer  : IntPtr
        WriteBuffer : IntPtr
        ReadBuffer  : IntPtr
        Open        : IntPtr
        Close       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPITransportStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the Remote Desktop Protocol (RDP) stack to allocate a stream buffer.
     * @param {Integer} maxPayload Type: <b>long</b>
     * 
     * The maximum size, in bytes, of the payload that will be placed into the buffer.
     * @returns {IRDPSRAPITransportStreamBuffer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer">IRDPSRAPITransportStreamBuffer</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer">IRDPSRAPITransportStreamBuffer</a> interface pointer that receives the buffer object.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstream-allocbuffer
     */
    AllocBuffer(maxPayload) {
        result := ComCall(3, this, "int", maxPayload, "ptr*", &ppBuffer := 0, "HRESULT")
        return IRDPSRAPITransportStreamBuffer(ppBuffer)
    }

    /**
     * Called by the Remote Desktop Protocol (RDP) stack to return a stream buffer to the stream.
     * @param {IRDPSRAPITransportStreamBuffer} pBuffer Type: <b>IRDPSRAPITransportStreamBuffer*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer">IRDPSRAPITransportStreamBuffer</a> interface pointer that represents the buffer to free.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstream-freebuffer
     */
    FreeBuffer(pBuffer) {
        result := ComCall(4, this, "ptr", pBuffer, "HRESULT")
        return result
    }

    /**
     * Called by the Remote Desktop Protocol (RDP) stack to write the contents of a stream buffer to the network.
     * @param {IRDPSRAPITransportStreamBuffer} pBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer">IRDPSRAPITransportStreamBuffer</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer">IRDPSRAPITransportStreamBuffer</a> interface pointer that represents the buffer to write.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstream-writebuffer
     */
    WriteBuffer(pBuffer) {
        result := ComCall(5, this, "ptr", pBuffer, "HRESULT")
        return result
    }

    /**
     * Called by the Remote Desktop Protocol (RDP) stack to read the contents of a stream buffer.
     * @param {IRDPSRAPITransportStreamBuffer} pBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer">IRDPSRAPITransportStreamBuffer</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer">IRDPSRAPITransportStreamBuffer</a> interface pointer that represents the buffer to read.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstream-readbuffer
     */
    ReadBuffer(pBuffer) {
        result := ComCall(6, this, "ptr", pBuffer, "HRESULT")
        return result
    }

    /**
     * Called by the Remote Desktop Protocol (RDP) stack to start the stream and indicate that the RDP stack is ready to receive notifications of events.
     * @param {IRDPSRAPITransportStreamEvents} pCallbacks Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreamevents">IRDPSRAPITransportStreamEvents</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreamevents">IRDPSRAPITransportStreamEvents</a> interface pointer that will receive the transport stream events.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstream-open
     */
    Open(pCallbacks) {
        result := ComCall(7, this, "ptr", pCallbacks, "HRESULT")
        return result
    }

    /**
     * Called by the Remote Desktop Protocol (RDP) stack to close the stream.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstream-close
     */
    Close() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRDPSRAPITransportStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AllocBuffer := CallbackCreate(GetMethod(implObj, "AllocBuffer"), flags, 3)
        this.vtbl.FreeBuffer := CallbackCreate(GetMethod(implObj, "FreeBuffer"), flags, 2)
        this.vtbl.WriteBuffer := CallbackCreate(GetMethod(implObj, "WriteBuffer"), flags, 2)
        this.vtbl.ReadBuffer := CallbackCreate(GetMethod(implObj, "ReadBuffer"), flags, 2)
        this.vtbl.Open := CallbackCreate(GetMethod(implObj, "Open"), flags, 2)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AllocBuffer)
        CallbackFree(this.vtbl.FreeBuffer)
        CallbackFree(this.vtbl.WriteBuffer)
        CallbackFree(this.vtbl.ReadBuffer)
        CallbackFree(this.vtbl.Open)
        CallbackFree(this.vtbl.Close)
    }
}
