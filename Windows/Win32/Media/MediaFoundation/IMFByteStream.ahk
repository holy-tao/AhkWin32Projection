#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a byte stream from some data source, which might be a local file, a network file, or some other source.
 * @remarks
 * 
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
  * A byte stream for a media souce can be opened with read access. A byte stream for an archive media sink should be opened with both read and write access. (Read access may be required, because the archive sink might need to read portions of the file as it writes.)
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfbytestream
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(3, this, "uint*", &pdwCapabilities := 0, "HRESULT")
        return pdwCapabilities
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-getlength
     */
    GetLength() {
        result := ComCall(4, this, "uint*", &pqwLength := 0, "HRESULT")
        return pqwLength
    }

    /**
     * 
     * @param {Integer} qwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-setlength
     */
    SetLength(qwLength) {
        result := ComCall(5, this, "uint", qwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-getcurrentposition
     */
    GetCurrentPosition() {
        result := ComCall(6, this, "uint*", &pqwPosition := 0, "HRESULT")
        return pqwPosition
    }

    /**
     * 
     * @param {Integer} qwPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-setcurrentposition
     */
    SetCurrentPosition(qwPosition) {
        result := ComCall(7, this, "uint", qwPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-isendofstream
     */
    IsEndOfStream() {
        result := ComCall(8, this, "int*", &pfEndOfStream := 0, "HRESULT")
        return pfEndOfStream
    }

    /**
     * 
     * @param {Pointer<Integer>} pb 
     * @param {Integer} cb 
     * @param {Pointer<Integer>} pcbRead 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-read
     */
    Read(pb, cb, pcbRead) {
        pbMarshal := pb is VarRef ? "char*" : "ptr"
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pbMarshal, pb, "uint", cb, pcbReadMarshal, pcbRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pb 
     * @param {Integer} cb 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} punkState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-beginread
     */
    BeginRead(pb, cb, pCallback, punkState) {
        result := ComCall(10, this, "ptr", pb, "uint", cb, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-endread
     */
    EndRead(pResult) {
        result := ComCall(11, this, "ptr", pResult, "uint*", &pcbRead := 0, "HRESULT")
        return pcbRead
    }

    /**
     * 
     * @param {Pointer<Integer>} pb 
     * @param {Integer} cb 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-write
     */
    Write(pb, cb) {
        pbMarshal := pb is VarRef ? "char*" : "ptr"

        result := ComCall(12, this, pbMarshal, pb, "uint", cb, "uint*", &pcbWritten := 0, "HRESULT")
        return pcbWritten
    }

    /**
     * 
     * @param {Pointer} pb 
     * @param {Integer} cb 
     * @param {IMFAsyncCallback} pCallback 
     * @param {IUnknown} punkState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-beginwrite
     */
    BeginWrite(pb, cb, pCallback, punkState) {
        result := ComCall(13, this, "ptr", pb, "uint", cb, "ptr", pCallback, "ptr", punkState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncResult} pResult 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-endwrite
     */
    EndWrite(pResult) {
        result := ComCall(14, this, "ptr", pResult, "uint*", &pcbWritten := 0, "HRESULT")
        return pcbWritten
    }

    /**
     * 
     * @param {Integer} SeekOrigin 
     * @param {Integer} llSeekOffset 
     * @param {Integer} dwSeekFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-seek
     */
    Seek(SeekOrigin, llSeekOffset, dwSeekFlags) {
        result := ComCall(15, this, "int", SeekOrigin, "int64", llSeekOffset, "uint", dwSeekFlags, "uint*", &pqwCurrentPosition := 0, "HRESULT")
        return pqwCurrentPosition
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-flush
     */
    Flush() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfbytestream-close
     */
    Close() {
        result := ComCall(17, this, "HRESULT")
        return result
    }
}
