#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk

/**
 * Represents a Windows Imaging Component (WIC) stream for referencing imaging and metadata content.
 * @remarks
 * 
 * Decoders and metadata handlers are expected to create sub streams of whatever stream they hold when handing off control for embedded metadata to another metadata handler.  If the stream is not restricted then use MAXLONGLONG as the max size and offset 0.
 * 
 * The <b>IWICStream</b> interface methods do not enable you to provide a file sharing option.
 *             To create a file stream for an image, use the <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-shcreatestreamonfileex">SHCreateStreamOnFileEx</a> function.
 *             This stream can then be used to create an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a> using the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicimagingfactory-createdecoderfromstream">CreateDecoderFromStream</a> method.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicstream
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICStream extends IStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICStream
     * @type {Guid}
     */
    static IID => Guid("{135ff860-22b7-4ddf-b0f6-218f4f299a43}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromIStream", "InitializeFromFilename", "InitializeFromMemory", "InitializeFromIStreamRegion"]

    /**
     * Initializes a stream from another stream. Access rights are inherited from the underlying stream.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The initialize stream.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicstream-initializefromistream
     */
    InitializeFromIStream(pIStream) {
        result := ComCall(14, this, "ptr", pIStream, "HRESULT")
        return result
    }

    /**
     * Initializes a stream from a particular file.
     * @param {PWSTR} wzFileName Type: <b>LPCWSTR</b>
     * 
     * The file used to initialize the stream.
     * @param {Integer} dwDesiredAccess Type: <b>DWORD</b>
     * 
     * The desired file access mode.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GENERIC_READ"></a><a id="generic_read"></a><dl>
     * <dt><b>GENERIC_READ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Read access.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GENERIC_WRITE"></a><a id="generic_write"></a><dl>
     * <dt><b>GENERIC_WRITE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Write access.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicstream-initializefromfilename
     */
    InitializeFromFilename(wzFileName, dwDesiredAccess) {
        wzFileName := wzFileName is String ? StrPtr(wzFileName) : wzFileName

        result := ComCall(15, this, "ptr", wzFileName, "uint", dwDesiredAccess, "HRESULT")
        return result
    }

    /**
     * Initializes a stream to treat a block of memory as a stream. The stream cannot grow beyond the buffer size.
     * @param {Pointer<Integer>} pbBuffer Type: <b>BYTE*</b>
     * 
     * Pointer to the buffer used to initialize the stream.
     * @param {Integer} cbBufferSize Type: <b>DWORD</b>
     * 
     * The size of buffer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicstream-initializefrommemory
     */
    InitializeFromMemory(pbBuffer, cbBufferSize) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(16, this, pbBufferMarshal, pbBuffer, "uint", cbBufferSize, "HRESULT")
        return result
    }

    /**
     * Initializes the stream as a substream of another stream.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * Pointer to the input stream.
     * @param {Integer} ulOffset Type: <b>ULARGE_INTEGER</b>
     * 
     * The stream offset used to create the new stream.
     * @param {Integer} ulMaxSize Type: <b>ULARGE_INTEGER</b>
     * 
     * The maximum size of the stream.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicstream-initializefromistreamregion
     */
    InitializeFromIStreamRegion(pIStream, ulOffset, ulMaxSize) {
        result := ComCall(17, this, "ptr", pIStream, "uint", ulOffset, "uint", ulMaxSize, "HRESULT")
        return result
    }
}
