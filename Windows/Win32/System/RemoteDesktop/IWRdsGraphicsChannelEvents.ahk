#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * This interface receives notifications that relate to a graphics virtual channel.
 * @see https://docs.microsoft.com/windows/win32/api//wrdsgraphicschannels/nn-wrdsgraphicschannels-iwrdsgraphicschannelevents
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsGraphicsChannelEvents extends IUnknown{
    /**
     * The interface identifier for IWRdsGraphicsChannelEvents
     * @type {Guid}
     */
    static IID => Guid("{67f2368c-d674-4fae-66a5-d20628a640d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cbSize 
     * @param {Pointer<Byte>} pBuffer 
     * @returns {HRESULT} 
     */
    OnDataReceived(cbSize, pBuffer) {
        result := ComCall(3, this, "uint", cbSize, "char*", pBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnClose() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} OpenResult 
     * @param {Pointer<IUnknown>} pOpenContext 
     * @returns {HRESULT} 
     */
    OnChannelOpened(OpenResult, pOpenContext) {
        result := ComCall(5, this, "int", OpenResult, "ptr", pOpenContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pWriteContext 
     * @param {BOOL} bCancelled 
     * @param {Pointer<Byte>} pBuffer 
     * @param {Integer} cbBuffer 
     * @returns {HRESULT} 
     */
    OnDataSent(pWriteContext, bCancelled, pBuffer, cbBuffer) {
        result := ComCall(6, this, "ptr", pWriteContext, "int", bCancelled, "char*", pBuffer, "uint", cbBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bandwidth 
     * @param {Integer} RTT 
     * @param {Integer} lastSentByteIndex 
     * @returns {HRESULT} 
     */
    OnMetricsUpdate(bandwidth, RTT, lastSentByteIndex) {
        result := ComCall(7, this, "uint", bandwidth, "uint", RTT, "uint", lastSentByteIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
