#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRDPSRAPITransportStreamBuffer.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that perform operations with streams.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapitransportstream
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPITransportStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPITransportStream
     * @type {Guid}
     */
    static IID => Guid("{36cfa065-43bb-4ef7-aed7-9b88a5053036}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AllocBuffer", "FreeBuffer", "WriteBuffer", "ReadBuffer", "Open", "Close"]

    /**
     * Called by the Remote Desktop Protocol (RDP) stack to allocate a stream buffer.
     * @param {Integer} maxPayload Type: <b>long</b>
     * 
     * The maximum size, in bytes, of the payload that will be placed into the buffer.
     * @returns {IRDPSRAPITransportStreamBuffer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer">IRDPSRAPITransportStreamBuffer</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer">IRDPSRAPITransportStreamBuffer</a> interface pointer that receives the buffer object.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapitransportstream-allocbuffer
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
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapitransportstream-freebuffer
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
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapitransportstream-writebuffer
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
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapitransportstream-readbuffer
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
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapitransportstream-open
     */
    Open(pCallbacks) {
        result := ComCall(7, this, "ptr", pCallbacks, "HRESULT")
        return result
    }

    /**
     * Called by the Remote Desktop Protocol (RDP) stack to close the stream.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapitransportstream-close
     */
    Close() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
