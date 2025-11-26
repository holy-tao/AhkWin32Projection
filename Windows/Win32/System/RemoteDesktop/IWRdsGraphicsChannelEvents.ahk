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
     * Called when a full message is received from the server.
     * @param {Integer} cbSize The length, in bytes, of the data in <i>pBuffer</i>.
     * @param {Pointer<Integer>} pBuffer A pointer to a buffer that contains the data that was received. The <i>cbSize</i> parameter contains the length of this buffer.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-ondatareceived
     */
    OnDataReceived(cbSize, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", cbSize, pBufferMarshal, pBuffer, "HRESULT")
        return result
    }

    /**
     * Called when the channel has been closed.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-onclose
     */
    OnClose() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Called when the channel has been opened and is ready for use, or when an error occurs when a channel is opened.
     * @param {HRESULT} OpenResult An <b>HRESULT</b> value that specifies the result of the open operation. If this parameter contains <b>S_OK</b>, <i>pOpenContext</i> is valid.
     * @param {IUnknown} pOpenContext A user-defined interface pointer that is passed as the <i>pOpenContext</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannel-open">IWRdsGraphicsChannel::Open</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-onchannelopened
     */
    OnChannelOpened(OpenResult, pOpenContext) {
        result := ComCall(5, this, "int", OpenResult, "ptr", pOpenContext, "HRESULT")
        return result
    }

    /**
     * Called when the IWRdsGraphicsChannel::Write method is called and the data has been sent.
     * @param {IUnknown} pWriteContext A user-defined interface pointer that is passed as the <i>pContext</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannel-write">IWRdsGraphicsChannel::Write</a> method.
     * @param {BOOL} bCancelled Contains <b>TRUE</b> if the connection was dropped during the write, or <b>FALSE</b> otherwise.
     * @param {Pointer<Integer>} pBuffer A pointer to a buffer that contains the data that was sent. The <i>cbBuffer</i> parameter contains the length of this buffer.
     * @param {Integer} cbBuffer The length, in bytes, of the data in <i>pBuffer</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-ondatasent
     */
    OnDataSent(pWriteContext, bCancelled, pBuffer, cbBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "ptr", pWriteContext, "int", bCancelled, pBufferMarshal, pBuffer, "uint", cbBuffer, "HRESULT")
        return result
    }

    /**
     * Called to notify the RemoteFX graphics services that network conditions have changed.
     * @param {Integer} bandwidth The expected bandwidth, in bytes per second. If this parameter contains <b>WRdsGraphicsChannels_Bandwidth_Unavailable</b>, bandwidth statistics are not available.
     * @param {Integer} RTT The round trip time (RTT) of the link, in milliseconds. If this parameter contains <b>WRdsGraphicsChannels_RTT_Unavailable</b>, latency statistics are not available.
     * @param {Integer} lastSentByteIndex The byte index of the last byte that was sent from this channel at this time. This value begins at zero and increases for the lifetime of the connection. This value will roll back to zero when an overflow occurs.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-onmetricsupdate
     */
    OnMetricsUpdate(bandwidth, RTT, lastSentByteIndex) {
        result := ComCall(7, this, "uint", bandwidth, "uint", RTT, "uint", lastSentByteIndex, "HRESULT")
        return result
    }
}
