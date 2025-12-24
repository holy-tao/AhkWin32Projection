#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISimilarityTraitsMappedView.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods that an RDC application can implement for creating and manipulating a file mapping object for a similarity traits table file.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-isimilaritytraitsmapping
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class ISimilarityTraitsMapping extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISimilarityTraitsMapping
     * @type {Guid}
     */
    static IID => Guid("{96236a7d-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for SimilarityTraitsMapping
     * @type {Guid}
     */
    static CLSID => Guid("{96236a94-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CloseMapping", "SetFileSize", "GetFileSize", "OpenMapping", "ResizeMapping", "GetPageSize", "CreateView"]

    /**
     * Closes a file mapping object for a similarity traits table file.
     * @remarks
     * 
     * Note that there may still be valid views open on the file. No new views may be created after the mapping is closed, but existing views continue to work.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytraitsmapping-closemapping
     */
    CloseMapping() {
        ComCall(3, this)
    }

    /**
     * Sets the size of a similarity traits table file.
     * @param {Integer} fileSize Pointer to a location that specifies the file size, in bytes.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytraitsmapping-setfilesize
     */
    SetFileSize(fileSize) {
        result := ComCall(4, this, "uint", fileSize, "HRESULT")
        return result
    }

    /**
     * Returns the size of a similarity traits table file.
     * @returns {Integer} Pointer to a location that receives the file size, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytraitsmapping-getfilesize
     */
    GetFileSize() {
        result := ComCall(5, this, "uint*", &fileSize := 0, "HRESULT")
        return fileSize
    }

    /**
     * Opens the file mapping object for a similarity traits table file.
     * @param {Integer} accessMode <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdcmappingaccessmode">RdcMappingAccessMode</a> enumeration value that specifies the desired access to the file mapping object.
     * @param {Integer} begin File offset, in bytes, where the file mapping is to begin.
     * @param {Integer} end File offset, in bytes, where the file mapping is to end.
     * @returns {Integer} Pointer to a location that receives the file offset, in bytes, of the actual end of the file mapping, rounded up to the nearest block size.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytraitsmapping-openmapping
     */
    OpenMapping(accessMode, begin, end) {
        result := ComCall(6, this, "int", accessMode, "uint", begin, "uint", end, "uint*", &actualEnd := 0, "HRESULT")
        return actualEnd
    }

    /**
     * Resizes the file mapping object for a similarity traits table file.
     * @param {Integer} accessMode <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdcmappingaccessmode">RdcMappingAccessMode</a> enumeration value that specifies the desired access to the file mapping object.
     * @param {Integer} begin File offset, in bytes, where the file mapping is to begin.
     * @param {Integer} end File offset, in bytes, where the file mapping is to end.
     * @returns {Integer} Pointer to a location that receives the file offset, in bytes, of the actual end of the file mapping, rounded up to the nearest block size.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytraitsmapping-resizemapping
     */
    ResizeMapping(accessMode, begin, end) {
        result := ComCall(7, this, "int", accessMode, "uint", begin, "uint", end, "uint*", &actualEnd := 0, "HRESULT")
        return actualEnd
    }

    /**
     * Returns the page size (disk block size) for a similarity traits table file.
     * @param {Pointer<Integer>} pageSize Pointer to a location that receives the page size, in bytes. This page size must be at least 65536 bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytraitsmapping-getpagesize
     */
    GetPageSize(pageSize) {
        pageSizeMarshal := pageSize is VarRef ? "uint*" : "ptr"

        ComCall(8, this, pageSizeMarshal, pageSize)
    }

    /**
     * Maps a view of the file mapping for a similarity traits table file.
     * @param {Integer} minimumMappedPages Minimum number of pages of the file mapping to map to the view.
     * @param {Integer} accessMode <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdcmappingaccessmode">RdcMappingAccessMode</a> enumeration value that specifies the desired access to the file mapping object.
     * @returns {ISimilarityTraitsMappedView} Pointer to a location that will receive the returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-isimilaritytraitsmappedview">ISimilarityTraitsMappedView</a> interface pointer. Callers must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytraitsmapping-createview
     */
    CreateView(minimumMappedPages, accessMode) {
        result := ComCall(9, this, "uint", minimumMappedPages, "int", accessMode, "ptr*", &mappedView := 0, "HRESULT")
        return ISimilarityTraitsMappedView(mappedView)
    }
}
