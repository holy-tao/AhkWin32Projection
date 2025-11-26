#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteAsyncResult.ahk
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
     * GetLocalFileSize returns the number of bytes of the font file that are currently local, which should always be less than or equal to the full file size returned by GetFileSize.
     * @returns {Integer} Type: <b>UINT64*</b>
     * 
     * Receives the local size of the file.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwriteremotefontfilestream-getlocalfilesize
     */
    GetLocalFileSize() {
        result := ComCall(7, this, "uint*", &localFileSize := 0, "HRESULT")
        return localFileSize
    }

    /**
     * Returns information about the locality of a byte range (i.e., font fragment) within the font file stream.
     * @param {Integer} fileOffset Type: <b>UINT64</b>
     * 
     * Offset of the fragment from the beginning of the font file.
     * @param {Integer} fragmentSize Type: <b>UINT64</b>
     * 
     * Size of the fragment in bytes.
     * @param {Pointer<Integer>} partialSize Type: <b>UINT64*</b>
     * 
     * Receives the number of contiguous bytes from the start of the fragment that have the same locality as the first byte.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives TRUE if the first byte of the fragment is local, FALSE if not.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwriteremotefontfilestream-getfilefragmentlocality
     */
    GetFileFragmentLocality(fileOffset, fragmentSize, partialSize) {
        partialSizeMarshal := partialSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", fileOffset, "uint", fragmentSize, "int*", &isLocal := 0, partialSizeMarshal, partialSize, "HRESULT")
        return isLocal
    }

    /**
     * Gets the current locality of the file.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_locality">DWRITE_LOCALITY</a></b>
     * 
     * Returns the current locality (i.e., remote, partial, or local).
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwriteremotefontfilestream-getlocality
     */
    GetLocality() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * Begins downloading all or part of the font file.
     * @param {Pointer<Guid>} downloadOperationID Type: <b>UUID</b>
     * @param {Pointer<DWRITE_FILE_FRAGMENT>} fileFragments Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_file_fragment">DWRITE_FILE_FRAGMENT</a></b>
     * 
     * Array of structures, each specifying a byte range to download.
     * @param {Integer} fragmentCount Type: <b>UINT32</b>
     * 
     * Number of elements in the fileFragments array. This can be zero to just download file information, such as the size.
     * @returns {IDWriteAsyncResult} Type: <b>_COM_Outptr_result_maybenull_</b>
     * 
     * Receives an object that can be used to wait for the asynchronous download to complete and to get the download result upon 
     *           completion. The result may be NULL if the download completes synchronously. For example, this can happen if method determines that the requested data
     *           is already local.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwriteremotefontfilestream-begindownload
     */
    BeginDownload(downloadOperationID, fileFragments, fragmentCount) {
        result := ComCall(10, this, "ptr", downloadOperationID, "ptr", fileFragments, "uint", fragmentCount, "ptr*", &asyncResult := 0, "HRESULT")
        return IDWriteAsyncResult(asyncResult)
    }
}
