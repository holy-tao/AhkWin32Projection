#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Writes media samples to a byte stream.
 * @remarks
 * 
  * A writeable byte stream can optionally implement this interface. 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfsampleoutputstream
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSampleOutputStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSampleOutputStream
     * @type {Guid}
     */
    static IID => Guid("{8feed468-6f7e-440d-869a-49bdd283ad0d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginWriteSample", "EndWriteSample", "Close"]

    /**
     * 
     * @param {IMFSample} pSample 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} punkState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfsampleoutputstream-beginwritesample
     */
    BeginWriteSample(pSample, pCallback, punkState) {
        result := ComCall(3, this, "ptr", pSample, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @returns {HRESULT} 
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
}
