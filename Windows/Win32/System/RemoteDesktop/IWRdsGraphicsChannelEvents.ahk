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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnDataReceived", "OnClose", "OnChannelOpened", "OnDataSent", "OnMetricsUpdate"]

    /**
     * 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-ondatareceived
     */
    OnDataReceived(cbSize, pBuffer) {
        result := ComCall(3, this, "uint", cbSize, "char*", pBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-onclose
     */
    OnClose() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} OpenResult 
     * @param {IUnknown} pOpenContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-onchannelopened
     */
    OnChannelOpened(OpenResult, pOpenContext) {
        result := ComCall(5, this, "int", OpenResult, "ptr", pOpenContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pWriteContext 
     * @param {BOOL} bCancelled 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Integer} cbBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-ondatasent
     */
    OnDataSent(pWriteContext, bCancelled, pBuffer, cbBuffer) {
        result := ComCall(6, this, "ptr", pWriteContext, "int", bCancelled, "char*", pBuffer, "uint", cbBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bandwidth 
     * @param {Integer} RTT 
     * @param {Integer} lastSentByteIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-onmetricsupdate
     */
    OnMetricsUpdate(bandwidth, RTT, lastSentByteIndex) {
        result := ComCall(7, this, "uint", bandwidth, "uint", RTT, "uint", lastSentByteIndex, "HRESULT")
        return result
    }
}
