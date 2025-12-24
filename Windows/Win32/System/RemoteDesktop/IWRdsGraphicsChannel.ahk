#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * This interface is used by the RemoteFX graphics services to send and receive data to a virtual graphics channel.
 * @see https://docs.microsoft.com/windows/win32/api//wrdsgraphicschannels/nn-wrdsgraphicschannels-iwrdsgraphicschannel
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsGraphicsChannel extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWRdsGraphicsChannel
     * @type {Guid}
     */
    static IID => Guid("{684b7a0b-edff-43ad-d5a2-4a8d5388f401}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Write", "Close", "Open"]

    /**
     * Called to send data to the virtual channel.
     * @param {Integer} cbSize The length, in bytes, of the data in <i>pBuffer</i>.
     * @param {Pointer<Integer>} pBuffer A pointer to a buffer that contains the data that was sent. The <i>cbBuffer</i> parameter contains the length of this buffer.
     * 
     * The implementation will take ownership of this buffer until the <a href="https://docs.microsoft.com/windows/desktop/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-ondatasent">IWRdsGraphicsChannelEvents::OnDataSent</a> method is called. Before that time, this buffer must not be modified or freed.
     * @param {IUnknown} pContext A user-defined interface pointer that is passed as the <i>pWriteContext</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-ondatasent">IWRdsGraphicsChannelEvents::OnDataSent</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannel-write
     */
    Write(cbSize, pBuffer, pContext) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", cbSize, pBufferMarshal, pBuffer, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * Called to close the channel.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannel-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Called to open a channel.
     * @param {IWRdsGraphicsChannelEvents} pChannelEvents Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wrdsgraphicschannels/nn-wrdsgraphicschannels-iwrdsgraphicschannelevents">IWRdsGraphicsChannelEvents</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wrdsgraphicschannels/nn-wrdsgraphicschannels-iwrdsgraphicschannelevents">IWRdsGraphicsChannelEvents</a> interface that will receive notifications relating to the channel created.
     * @param {IUnknown} pOpenContext Type: <b>IUnknown*</b>
     * 
     * A user-defined interface pointer that is passed as the <i>pOpenContext</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-onchannelopened">IWRdsGraphicsChannelEvents::OnChannelOpened</a> method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannel-open
     */
    Open(pChannelEvents, pOpenContext) {
        result := ComCall(5, this, "ptr", pChannelEvents, "ptr", pOpenContext, "HRESULT")
        return result
    }
}
