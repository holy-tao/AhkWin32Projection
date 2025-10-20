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
     * 
     * @param {Integer} maxPayload 
     * @param {Pointer<IRDPSRAPITransportStreamBuffer>} ppBuffer 
     * @returns {HRESULT} 
     */
    AllocBuffer(maxPayload, ppBuffer) {
        result := ComCall(3, this, "int", maxPayload, "ptr", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPITransportStreamBuffer>} pBuffer 
     * @returns {HRESULT} 
     */
    FreeBuffer(pBuffer) {
        result := ComCall(4, this, "ptr", pBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPITransportStreamBuffer>} pBuffer 
     * @returns {HRESULT} 
     */
    WriteBuffer(pBuffer) {
        result := ComCall(5, this, "ptr", pBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPITransportStreamBuffer>} pBuffer 
     * @returns {HRESULT} 
     */
    ReadBuffer(pBuffer) {
        result := ComCall(6, this, "ptr", pBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPITransportStreamEvents>} pCallbacks 
     * @returns {HRESULT} 
     */
    Open(pCallbacks) {
        result := ComCall(7, this, "ptr", pCallbacks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
