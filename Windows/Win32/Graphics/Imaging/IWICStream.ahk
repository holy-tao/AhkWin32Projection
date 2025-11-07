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
     * 
     * @param {IStream} pIStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicstream-initializefromistream
     */
    InitializeFromIStream(pIStream) {
        result := ComCall(14, this, "ptr", pIStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wzFileName 
     * @param {Integer} dwDesiredAccess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicstream-initializefromfilename
     */
    InitializeFromFilename(wzFileName, dwDesiredAccess) {
        wzFileName := wzFileName is String ? StrPtr(wzFileName) : wzFileName

        result := ComCall(15, this, "ptr", wzFileName, "uint", dwDesiredAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbBuffer 
     * @param {Integer} cbBufferSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicstream-initializefrommemory
     */
    InitializeFromMemory(pbBuffer, cbBufferSize) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(16, this, pbBufferMarshal, pbBuffer, "uint", cbBufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pIStream 
     * @param {Integer} ulOffset 
     * @param {Integer} ulMaxSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicstream-initializefromistreamregion
     */
    InitializeFromIStreamRegion(pIStream, ulOffset, ulMaxSize) {
        result := ComCall(17, this, "ptr", pIStream, "uint", ulOffset, "uint", ulMaxSize, "HRESULT")
        return result
    }
}
