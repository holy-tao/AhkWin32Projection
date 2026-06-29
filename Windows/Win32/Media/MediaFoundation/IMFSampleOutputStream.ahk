#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFAsyncCallback.ahk" { IMFAsyncCallback }
#Import ".\IMFSample.ahk" { IMFSample }
#Import ".\IMFAsyncResult.ahk" { IMFAsyncResult }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Writes media samples to a byte stream.
 * @remarks
 * A writable byte stream can optionally implement this interface. 
 * 
 * This interface enables the caller to send media samples to the byte stream for writing, instead of using the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-beginwrite">IMFByteStream::BeginWrite</a> method to write blobs of untyped data. The byte stream can use the information contained in the media sample to optimize how it writes the data. For example, a byte stream that sends media data over a network can optimize based on the time stamp.
 * 
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the byte stream object.
 * 
 * Any implementation of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> that exposes <b>IMFSampleOutputStream</b> as an interface needs to honor the following requirements:
 * 
 * <ul>
 * <li> All writes from either interface always go to the exact same byte stream object.
 * </li>
 * <li>The current position for both <b>IMFSampleOutputStream</b> and <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> shall always be the same. For example, writing to <b>IMFSampleOutputStream</b> will also update the current position of  <b>IMFByteStream</b>.
 * </li>
 * <li>Writing a sample using <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfsampleoutputstream-beginwritesample">BeginWriteSample</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfsampleoutputstream-endwritesample">EndWriteSample</a> shall serialize the sample by writing the data from all the buffers in the sample, in the order in which the buffers are stored in the sample.  (Use <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfsample-getbufferbyindex">IMFSample::GetBufferByIndex</a> to get the individual buffers by index value.) The total bytes copied shall be the number of bytes written from all the buffers. </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfsampleoutputstream
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSampleOutputStream extends IUnknown {
    /**
     * The interface identifier for IMFSampleOutputStream
     * @type {Guid}
     */
    static IID := Guid("{8feed468-6f7e-440d-869a-49bdd283ad0d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSampleOutputStream interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        BeginWriteSample : IntPtr
        EndWriteSample   : IntPtr
        Close            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSampleOutputStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Begins an asynchronous request to write a media sample to the stream.
     * @remarks
     * When the sample has been written to the stream, the callback object's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method is called. At that point, the caller should call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfsampleoutputstream-endwritesample">IMFSampleOutputStream::EndWriteSample</a> to complete the asynchronous request.
     * @param {IMFSample} pSample A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface of the sample.
     * @param {IMFAsyncCallback} pCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} punkState A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsampleoutputstream-beginwritesample
     */
    BeginWriteSample(pSample, pCallback, punkState) {
        result := ComCall(3, this, "ptr", pSample, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * Completes an asynchronous request to write a media sample to the stream.
     * @remarks
     * Call this method when the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfsampleoutputstream-beginwritesample">IMFSampleOutputStream::BeginWriteSample</a> method completes asynchronously.
     * @param {IMFAsyncResult} pResult A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsampleoutputstream-endwritesample
     */
    EndWriteSample(pResult) {
        result := ComCall(4, this, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFSampleOutputStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeginWriteSample := CallbackCreate(GetMethod(implObj, "BeginWriteSample"), flags, 4)
        this.vtbl.EndWriteSample := CallbackCreate(GetMethod(implObj, "EndWriteSample"), flags, 2)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeginWriteSample)
        CallbackFree(this.vtbl.EndWriteSample)
        CallbackFree(this.vtbl.Close)
    }
}
