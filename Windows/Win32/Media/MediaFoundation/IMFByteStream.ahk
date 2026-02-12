#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a byte stream from some data source, which might be a local file, a network file, or some other source.
 * @remarks
 * The following functions return <b>IMFByteStream</b> pointers for local files:
 *         
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfbegincreatefile">MFBeginCreateFile</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatefile">MFCreateFile</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatetempfile">MFCreateTempFile</a>
 * </li>
 * </ul>
 * A byte stream for a media source can be opened with read access. A byte stream for an archive media sink should be opened with both read and write access. (Read access may be required, because the archive sink might need to read portions of the file as it writes.)
 *       
 * 
 * Some implementations of this interface also expose one or more of the following interfaces:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfbytestreambuffering">IMFByteStreamBuffering</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfbytestreamcachecontrol">IMFByteStreamCacheControl</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfgetservice">IMFGetService</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaeventgenerator">IMFMediaEventGenerator</a>
 * </li>
 * </ul>
 * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nn-mfobjects-imfbytestream
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFByteStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFByteStream
     * @type {Guid}
     */
    static IID => Guid("{ad4c1b00-4bf7-422f-9175-756693d9130d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapabilities", "GetLength", "SetLength", "GetCurrentPosition", "SetCurrentPosition", "IsEndOfStream", "Read", "BeginRead", "EndRead", "Write", "BeginWrite", "EndWrite", "Seek", "Flush", "Close"]

    /**
     * Retrieves the characteristics of the byte stream.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags. The following flags are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFBYTESTREAM_IS_READABLE"></a><a id="mfbytestream_is_readable"></a><dl>
     * <dt><b>MFBYTESTREAM_IS_READABLE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The byte stream can be read.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFBYTESTREAM_IS_WRITABLE"></a><a id="mfbytestream_is_writable"></a><dl>
     * <dt><b>MFBYTESTREAM_IS_WRITABLE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The byte stream can be written to.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFBYTESTREAM_IS_SEEKABLE"></a><a id="mfbytestream_is_seekable"></a><dl>
     * <dt><b>MFBYTESTREAM_IS_SEEKABLE</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The byte stream can be seeked.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFBYTESTREAM_IS_REMOTE"></a><a id="mfbytestream_is_remote"></a><dl>
     * <dt><b>MFBYTESTREAM_IS_REMOTE</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The byte stream is from a remote source, such as a network.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFBYTESTREAM_IS_DIRECTORY"></a><a id="mfbytestream_is_directory"></a><dl>
     * <dt><b>MFBYTESTREAM_IS_DIRECTORY</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The byte stream represents a file directory.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFBYTESTREAM_HAS_SLOW_SEEK"></a><a id="mfbytestream_has_slow_seek"></a><dl>
     * <dt><b>MFBYTESTREAM_HAS_SLOW_SEEK</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Seeking within this stream might be slow. For example, the byte stream might download from a network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFBYTESTREAM_IS_PARTIALLY_DOWNLOADED"></a><a id="mfbytestream_is_partially_downloaded"></a><dl>
     * <dt><b>MFBYTESTREAM_IS_PARTIALLY_DOWNLOADED</b></dt>
     * <dt>0x00000200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The byte stream is currently downloading data to a local cache.
     *               Read operations on the byte stream might take longer until the data is completely downloaded.
     * 
     * This flag is cleared after all of the data has been downloaded.
     * 
     * If the <b>MFBYTESTREAM_HAS_SLOW_SEEK</b> flag is also set, it means the byte stream must download the entire file sequentially. Otherwise, the byte stream can respond to seek requests by restarting the download from a new point in the stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFBYTESTREAM_SHARE_WRITE"></a><a id="mfbytestream_share_write"></a><dl>
     * <dt><b>MFBYTESTREAM_SHARE_WRITE</b></dt>
     * <dt>0x00000400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another thread or process can open this byte stream for writing. If this flag is present, the length of the
     * byte stream could change while it is being read. 
     * 
     * This flag can affect the behavior of byte-stream handlers. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-bytestreamhandler-accepts-share-write">MF_BYTESTREAMHANDLER_ACCEPTS_SHARE_WRITE</a>.
     * 
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFBYTESTREAM_DOES_NOT_USE_NETWORK"></a><a id="mfbytestream_does_not_use_network"></a><dl>
     * <dt><b>MFBYTESTREAM_DOES_NOT_USE_NETWORK</b></dt>
     * <dt>0x00000800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The byte stream is not currently
     * using the network to receive the content.  Networking hardware
     * may enter a power saving state when this bit is set.
     * 
     * <div class="alert"><b>Note</b>  Requires Windows 8 or later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfbytestream-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(3, this, "uint*", &pdwCapabilities := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwCapabilities
    }

    /**
     * Retrieves the length of the stream.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {Integer} Receives the length of the stream, in bytes. If the length is unknown, this value is -1.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfbytestream-getlength
     */
    GetLength() {
        result := ComCall(4, this, "uint*", &pqwLength := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pqwLength
    }

    /**
     * Sets the length of the stream.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Integer} qwLength Length of the stream in bytes.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfbytestream-setlength
     */
    SetLength(qwLength) {
        result := ComCall(5, this, "uint", qwLength, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the current read or write position in the stream.
     * @remarks
     * The methods that update the current position are <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-beginread">BeginRead</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-write">Write</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-beginwrite">BeginWrite</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-setcurrentposition">SetCurrentPosition</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-seek">Seek</a>.
     *       
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {Integer} Receives the current position, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfbytestream-getcurrentposition
     */
    GetCurrentPosition() {
        result := ComCall(6, this, "uint*", &pqwPosition := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pqwPosition
    }

    /**
     * Sets the current read or write position.
     * @remarks
     * If the new position is larger than the length of the stream, the method returns E_INVALIDARG.
     *       
     * 
     * <b> Implementation notes:</b>This method should update the current position in the stream by setting the current position to the value passed in to the <i>qwPosition</i> parameter. Other methods that can update the current position are <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-beginread">BeginRead</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-write">Write</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-beginwrite">BeginWrite</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-seek">Seek</a>.
     * 
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Integer} qwPosition New position in the stream, as a byte offset from the start of the stream.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfbytestream-setcurrentposition
     */
    SetCurrentPosition(qwPosition) {
        result := ComCall(7, this, "uint", qwPosition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Queries whether the current position has reached the end of the stream.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {BOOL} Receives the value <b>TRUE</b> if the end of the stream has been reached, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfbytestream-isendofstream
     */
    IsEndOfStream() {
        result := ComCall(8, this, "int*", &pfEndOfStream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfEndOfStream
    }

    /**
     * Reads data from the stream.
     * @remarks
     * This method reads at most <i>cb</i> bytes from the current position in the stream and copies them into the buffer provided by the caller. The number of bytes that were read is returned in the <i>pcbRead</i> parameter. The method does not return an error code on reaching the end of the file, so the application should check the value in <i>pcbRead</i> after the method returns.
     *       
     * 
     * This method is synchronous. It blocks until the read operation completes.
     *       
     * 
     * <b> Implementation notes:</b>This method should update the current position in the stream by adding the number of bytes that were read, which is specified by the value returned in the <i>pcbRead</i> parameter,  to the current position. Other methods that can update the current position are <b>Read</b>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-write">Write</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-beginwrite">BeginWrite</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-setcurrentposition">SetCurrentPosition</a>. 
     * 
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Pointer<Integer>} pb Pointer to a buffer that receives the data. The caller must allocate the buffer.
     * @param {Integer} cb Size of the buffer in bytes.
     * @param {Pointer<Integer>} pcbRead Receives the number of bytes that are copied into the buffer. This parameter cannot be <b>NULL</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfbytestream-read
     */
    Read(pb, cb, pcbRead) {
        pbMarshal := pb is VarRef ? "char*" : "ptr"
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pbMarshal, pb, "uint", cb, pcbReadMarshal, pcbRead, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Begins an asynchronous read operation from the stream.
     * @remarks
     * When all of the data has been read into the buffer, the callback object's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method is called. At that point, the application should call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-endread">IMFByteStream::EndRead</a> to complete the asynchronous request.
     *       
     * 
     * Do not read from, write to, free, or reallocate the buffer while an asynchronous read is pending.
     *       
     * 
     * <b> Implementation notes:</b>This method should update the current position in the stream by adding the number of bytes that will be read, which is specified by the value returned in the <i>pcbRead</i> parameter,  to the current position. Other methods that can update the current position are <b>BeginRead</b>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-write">Write</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-beginwrite">BeginWrite</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-setcurrentposition">SetCurrentPosition</a>. 
     * 
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Pointer} pb Pointer to a buffer that receives the data. The caller must allocate the buffer.
     * @param {Integer} cb Size of the buffer in bytes.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} punkState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfbytestream-beginread
     */
    BeginRead(pb, cb, pCallback, punkState) {
        result := ComCall(10, this, "ptr", pb, "uint", cb, "ptr", pCallback, "ptr", punkState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Completes an asynchronous read operation.
     * @remarks
     * Call this method after the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-beginread">IMFByteStream::BeginRead</a> method completes asynchronously.
     *       
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @returns {Integer} Receives the number of bytes that were read.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfbytestream-endread
     */
    EndRead(pResult) {
        result := ComCall(11, this, "ptr", pResult, "uint*", &pcbRead := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbRead
    }

    /**
     * Writes data to the stream.
     * @remarks
     * This method writes the contents of the <i>pb</i> buffer to the stream, starting at the current stream position. The number of bytes that were written is returned in the <i>pcbWritten</i> parameter.
     *       
     * 
     * This method is synchronous. It blocks until the write operation completes.
     *       
     * 
     * <b>Implementation notes:</b>This method should update the current position in the stream by adding the number of bytes that were written to the stream, which is specified by the value returned in the <i>pcbWritten</i>, to the current position offset. 
     * 
     *  Other methods that can update the current position are <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-beginread">BeginRead</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-beginwrite">BeginWrite</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-setcurrentposition">SetCurrentPosition</a>.
     * 
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Pointer<Integer>} pb Pointer to a buffer that contains the data to write.
     * @param {Integer} cb Size of the buffer in bytes.
     * @returns {Integer} Receives the number of bytes that are written.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfbytestream-write
     */
    Write(pb, cb) {
        pbMarshal := pb is VarRef ? "char*" : "ptr"

        result := ComCall(12, this, pbMarshal, pb, "uint", cb, "uint*", &pcbWritten := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbWritten
    }

    /**
     * Begins an asynchronous write operation to the stream.
     * @remarks
     * When all of the data has been written to the stream, the callback object's <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method is called. At that point, the application should call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-endwrite">IMFByteStream::EndWrite</a> to complete the asynchronous request.
     *       
     * 
     * Do not reallocate, free, or write to the buffer while an asynchronous write is still pending.
     *       
     * 
     * <b>Implementation notes:</b>This method should update the current position in the stream by adding the number of bytes that will be written to the stream, which is specified by the value returned in the <i>pcbWritten</i>, to the current position. Other methods that can update the current position are <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-beginread">BeginRead</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-write">Write</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-setcurrentposition">SetCurrentPosition</a>.
     * 
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {Pointer} pb Pointer to a buffer containing the data to write.
     * @param {Integer} cb Size of the buffer in bytes.
     * @param {IMFAsyncCallback} pCallback Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasynccallback">IMFAsyncCallback</a> interface of a callback object. The caller must implement this interface.
     * @param {IUnknown} punkState Pointer to the <b>IUnknown</b> interface of a state object, defined by the caller. This parameter can be <b>NULL</b>. You can use this object to hold state information. The object is returned to the caller when the callback is invoked.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfbytestream-beginwrite
     */
    BeginWrite(pb, cb, pCallback, punkState) {
        result := ComCall(13, this, "ptr", pb, "uint", cb, "ptr", pCallback, "ptr", punkState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Completes an asynchronous write operation.
     * @remarks
     * Call this method when the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-beginwrite">IMFByteStream::BeginWrite</a> method completes asynchronously.
     *       
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @param {IMFAsyncResult} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfasyncresult">IMFAsyncResult</a> interface. Pass in the same pointer that your callback object received in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfasynccallback-invoke">IMFAsyncCallback::Invoke</a> method.
     * @returns {Integer} Receives the number of bytes that were written.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfbytestream-endwrite
     */
    EndWrite(pResult) {
        result := ComCall(14, this, "ptr", pResult, "uint*", &pcbWritten := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbWritten
    }

    /**
     * Moves the current position in the stream by a specified offset.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * <b> Implementation notes:</b> This method should update the current position in the stream by adding the <i>qwSeekOffset</i> to the seek <i>SeekOrigin</i> position. This should be the same value passed back in the <i>pqwCurrentPosition</i> parameter. 
     * Other methods that can update the current position are <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-beginread">BeginRead</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-write">Write</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-beginwrite">BeginWrite</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfbytestream-setcurrentposition">SetCurrentPosition</a>.
     * @param {Integer} SeekOrigin Specifies the origin of the seek as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfbytestream_seek_origin">MFBYTESTREAM_SEEK_ORIGIN</a> enumeration. The offset is calculated relative to this position.
     * @param {Integer} llSeekOffset Specifies the new position, as a byte offset from the seek origin.
     * @param {Integer} dwSeekFlags Specifies zero or more flags. The following flags are defined.
     *           
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFBYTESTREAM_SEEK_FLAG_CANCEL_PENDING_IO"></a><a id="mfbytestream_seek_flag_cancel_pending_io"></a><dl>
     * <dt><b>MFBYTESTREAM_SEEK_FLAG_CANCEL_PENDING_IO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All pending I/O requests are canceled after the seek request completes successfully.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} Receives the new position after the seek.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfbytestream-seek
     */
    Seek(SeekOrigin, llSeekOffset, dwSeekFlags) {
        result := ComCall(15, this, "int", SeekOrigin, "int64", llSeekOffset, "uint", dwSeekFlags, "uint*", &pqwCurrentPosition := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pqwCurrentPosition
    }

    /**
     * Clears any internal buffers used by the stream. If you are writing to the stream, the buffered data is written to the underlying file or device.
     * @remarks
     * If the byte stream is read-only, this method has no effect.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfbytestream-flush
     */
    Flush() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Closes the stream and releases any resources associated with the stream, such as sockets or file handles. This method also cancels any pending asynchronous I/O requests.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfbytestream-close
     */
    Close() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
