#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} maxPayload 
     * @param {Pointer<IRDPSRAPITransportStreamBuffer>} ppBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstream-allocbuffer
     */
    AllocBuffer(maxPayload, ppBuffer) {
        result := ComCall(3, this, "int", maxPayload, "ptr*", ppBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRDPSRAPITransportStreamBuffer} pBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstream-freebuffer
     */
    FreeBuffer(pBuffer) {
        result := ComCall(4, this, "ptr", pBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRDPSRAPITransportStreamBuffer} pBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstream-writebuffer
     */
    WriteBuffer(pBuffer) {
        result := ComCall(5, this, "ptr", pBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRDPSRAPITransportStreamBuffer} pBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstream-readbuffer
     */
    ReadBuffer(pBuffer) {
        result := ComCall(6, this, "ptr", pBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRDPSRAPITransportStreamEvents} pCallbacks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstream-open
     */
    Open(pCallbacks) {
        result := ComCall(7, this, "ptr", pCallbacks, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstream-close
     */
    Close() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
