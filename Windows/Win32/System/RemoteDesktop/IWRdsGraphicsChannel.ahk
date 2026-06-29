#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWRdsGraphicsChannelEvents.ahk" { IWRdsGraphicsChannelEvents }

/**
 * This interface is used by the RemoteFX graphics services to send and receive data to a virtual graphics channel.
 * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nn-wrdsgraphicschannels-iwrdsgraphicschannel
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWRdsGraphicsChannel extends IUnknown {
    /**
     * The interface identifier for IWRdsGraphicsChannel
     * @type {Guid}
     */
    static IID := Guid("{684b7a0b-edff-43ad-d5a2-4a8d5388f401}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWRdsGraphicsChannel interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Write : IntPtr
        Close : IntPtr
        Open  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWRdsGraphicsChannel.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called to send data to the virtual channel.
     * @param {Integer} cbSize The length, in bytes, of the data in <i>pBuffer</i>.
     * @param {Pointer<Integer>} pBuffer A pointer to a buffer that contains the data that was sent. The <i>cbBuffer</i> parameter contains the length of this buffer.
     * 
     * The implementation will take ownership of this buffer until the <a href="https://docs.microsoft.com/windows/desktop/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-ondatasent">IWRdsGraphicsChannelEvents::OnDataSent</a> method is called. Before that time, this buffer must not be modified or freed.
     * @param {IUnknown} pContext A user-defined interface pointer that is passed as the <i>pWriteContext</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannelevents-ondatasent">IWRdsGraphicsChannelEvents::OnDataSent</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannel-write
     */
    Write(cbSize, pBuffer, pContext) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", cbSize, pBufferMarshal, pBuffer, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * Called to close the channel.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannel-close
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannel-open
     */
    Open(pChannelEvents, pOpenContext) {
        result := ComCall(5, this, "ptr", pChannelEvents, "ptr", pOpenContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWRdsGraphicsChannel.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Write := CallbackCreate(GetMethod(implObj, "Write"), flags, 4)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
        this.vtbl.Open := CallbackCreate(GetMethod(implObj, "Open"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Write)
        CallbackFree(this.vtbl.Close)
        CallbackFree(this.vtbl.Open)
    }
}
