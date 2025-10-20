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
     * 
     * @param {Pointer<UInt32>} pdwCapabilities 
     * @returns {HRESULT} 
     */
    GetCapabilities(pdwCapabilities) {
        result := ComCall(3, this, "uint*", pdwCapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pqwLength 
     * @returns {HRESULT} 
     */
    GetLength(pqwLength) {
        result := ComCall(4, this, "uint*", pqwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} qwLength 
     * @returns {HRESULT} 
     */
    SetLength(qwLength) {
        result := ComCall(5, this, "uint", qwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pqwPosition 
     * @returns {HRESULT} 
     */
    GetCurrentPosition(pqwPosition) {
        result := ComCall(6, this, "uint*", pqwPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} qwPosition 
     * @returns {HRESULT} 
     */
    SetCurrentPosition(qwPosition) {
        result := ComCall(7, this, "uint", qwPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEndOfStream 
     * @returns {HRESULT} 
     */
    IsEndOfStream(pfEndOfStream) {
        result := ComCall(8, this, "ptr", pfEndOfStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pb 
     * @param {Integer} cb 
     * @param {Pointer<UInt32>} pcbRead 
     * @returns {HRESULT} 
     */
    Read(pb, cb, pcbRead) {
        result := ComCall(9, this, "char*", pb, "uint", cb, "uint*", pcbRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pb 
     * @param {Integer} cb 
     * @param {Pointer<IMFAsyncCallback>} pCallback 
     * @param {Pointer<IUnknown>} punkState 
     * @returns {HRESULT} 
     */
    BeginRead(pb, cb, pCallback, punkState) {
        result := ComCall(10, this, "ptr", pb, "uint", cb, "ptr", pCallback, "ptr", punkState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncResult>} pResult 
     * @param {Pointer<UInt32>} pcbRead 
     * @returns {HRESULT} 
     */
    EndRead(pResult, pcbRead) {
        result := ComCall(11, this, "ptr", pResult, "uint*", pcbRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pb 
     * @param {Integer} cb 
     * @param {Pointer<UInt32>} pcbWritten 
     * @returns {HRESULT} 
     */
    Write(pb, cb, pcbWritten) {
        result := ComCall(12, this, "char*", pb, "uint", cb, "uint*", pcbWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pb 
     * @param {Integer} cb 
     * @param {Pointer<IMFAsyncCallback>} pCallback 
     * @param {Pointer<IUnknown>} punkState 
     * @returns {HRESULT} 
     */
    BeginWrite(pb, cb, pCallback, punkState) {
        result := ComCall(13, this, "ptr", pb, "uint", cb, "ptr", pCallback, "ptr", punkState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncResult>} pResult 
     * @param {Pointer<UInt32>} pcbWritten 
     * @returns {HRESULT} 
     */
    EndWrite(pResult, pcbWritten) {
        result := ComCall(14, this, "ptr", pResult, "uint*", pcbWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SeekOrigin 
     * @param {Integer} llSeekOffset 
     * @param {Integer} dwSeekFlags 
     * @param {Pointer<UInt64>} pqwCurrentPosition 
     * @returns {HRESULT} 
     */
    Seek(SeekOrigin, llSeekOffset, dwSeekFlags, pqwCurrentPosition) {
        result := ComCall(15, this, "int", SeekOrigin, "int64", llSeekOffset, "uint", dwSeekFlags, "uint*", pqwCurrentPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Flush() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
