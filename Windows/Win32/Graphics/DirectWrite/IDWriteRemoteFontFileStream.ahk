#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFileStream.ahk

/**
 * Represents a font file stream, parts of which may be non-local.
 * @remarks
 * 
  * For more information, see the description of IDWriteRemoteFontFileLoader.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwriteremotefontfilestream
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteRemoteFontFileStream extends IDWriteFontFileStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteRemoteFontFileStream
     * @type {Guid}
     */
    static IID => Guid("{4db3757a-2c72-4ed9-b2b6-1ababe1aff9c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLocalFileSize", "GetFileFragmentLocality", "GetLocality", "BeginDownload"]

    /**
     * 
     * @param {Pointer<Integer>} localFileSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfilestream-getlocalfilesize
     */
    GetLocalFileSize(localFileSize) {
        result := ComCall(7, this, "uint*", localFileSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fileOffset 
     * @param {Integer} fragmentSize 
     * @param {Pointer<BOOL>} isLocal 
     * @param {Pointer<Integer>} partialSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfilestream-getfilefragmentlocality
     */
    GetFileFragmentLocality(fileOffset, fragmentSize, isLocal, partialSize) {
        result := ComCall(8, this, "uint", fileOffset, "uint", fragmentSize, "ptr", isLocal, "uint*", partialSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfilestream-getlocality
     */
    GetLocality() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} downloadOperationID 
     * @param {Pointer<DWRITE_FILE_FRAGMENT>} fileFragments 
     * @param {Integer} fragmentCount 
     * @param {Pointer<IDWriteAsyncResult>} asyncResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfilestream-begindownload
     */
    BeginDownload(downloadOperationID, fileFragments, fragmentCount, asyncResult) {
        result := ComCall(10, this, "ptr", downloadOperationID, "ptr", fileFragments, "uint", fragmentCount, "ptr*", asyncResult, "HRESULT")
        return result
    }
}
