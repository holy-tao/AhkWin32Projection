#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface receives notifications that relate to a graphics virtual channel.
 * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nn-wrdsgraphicschannels-iwrdsgraphicschannelevents
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWRdsGraphicsChannelEvents extends IUnknown {
    /**
     * The interface identifier for IWRdsGraphicsChannelEvents
     * @type {Guid}
     */
    static IID := Guid("{67f2368c-d674-4fae-66a5-d20628a640d2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWRdsGraphicsChannelEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnDataReceived  : IntPtr
        OnClose         : IntPtr
        OnChannelOpened : IntPtr
        OnDataSent      : IntPtr
        OnMetricsUpdate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWRdsGraphicsChannelEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when a full message is received from the server.
     * @param {Integer} cbSize The length, in bytes, of the data in <i>pBuffer</i>.
     * @param {Pointer<Integer>} pBuffer A pointer to a buffer that contains the data that was received. The <i>cbSize</i> parameter contains the length of this buffer.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-ondatareceived
     */
    OnDataReceived(cbSize, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", cbSize, pBufferMarshal, pBuffer, "HRESULT")
        return result
    }

    /**
     * Called when the channel has been closed.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-onclose
     */
    OnClose() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Called when the channel has been opened and is ready for use, or when an error occurs when a channel is opened.
     * @param {HRESULT} OpenResult An <b>HRESULT</b> value that specifies the result of the open operation. If this parameter contains <b>S_OK</b>, <i>pOpenContext</i> is valid.
     * @param {IUnknown} pOpenContext A user-defined interface pointer that is passed as the <i>pOpenContext</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannel-open">IWRdsGraphicsChannel::Open</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-onchannelopened
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-ondatasent
     */
    OnDataSent(pWriteContext, bCancelled, pBuffer, cbBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "ptr", pWriteContext, BOOL, bCancelled, pBufferMarshal, pBuffer, "uint", cbBuffer, "HRESULT")
        return result
    }

    /**
     * Called to notify the RemoteFX graphics services that network conditions have changed.
     * @param {Integer} bandwidth The expected bandwidth, in bytes per second. If this parameter contains <b>WRdsGraphicsChannels_Bandwidth_Unavailable</b>, bandwidth statistics are not available.
     * @param {Integer} RTT The round trip time (RTT) of the link, in milliseconds. If this parameter contains <b>WRdsGraphicsChannels_RTT_Unavailable</b>, latency statistics are not available.
     * @param {Integer} lastSentByteIndex The byte index of the last byte that was sent from this channel at this time. This value begins at zero and increases for the lifetime of the connection. This value will roll back to zero when an overflow occurs.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-onmetricsupdate
     */
    OnMetricsUpdate(bandwidth, RTT, lastSentByteIndex) {
        result := ComCall(7, this, "uint", bandwidth, "uint", RTT, "uint", lastSentByteIndex, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWRdsGraphicsChannelEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnDataReceived := CallbackCreate(GetMethod(implObj, "OnDataReceived"), flags, 3)
        this.vtbl.OnClose := CallbackCreate(GetMethod(implObj, "OnClose"), flags, 1)
        this.vtbl.OnChannelOpened := CallbackCreate(GetMethod(implObj, "OnChannelOpened"), flags, 3)
        this.vtbl.OnDataSent := CallbackCreate(GetMethod(implObj, "OnDataSent"), flags, 5)
        this.vtbl.OnMetricsUpdate := CallbackCreate(GetMethod(implObj, "OnMetricsUpdate"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnDataReceived)
        CallbackFree(this.vtbl.OnClose)
        CallbackFree(this.vtbl.OnChannelOpened)
        CallbackFree(this.vtbl.OnDataSent)
        CallbackFree(this.vtbl.OnMetricsUpdate)
    }
}
