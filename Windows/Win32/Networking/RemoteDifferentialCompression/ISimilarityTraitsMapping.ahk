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
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmapping-closemapping
     */
    CloseMapping() {
        ComCall(3, this)
    }

    /**
     * 
     * @param {Integer} fileSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmapping-setfilesize
     */
    SetFileSize(fileSize) {
        result := ComCall(4, this, "uint", fileSize, "HRESULT")
        return result
    }

    /**
     * Retrieves the size of the specified file, in bytes.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fileapi/nf-fileapi-getfilesize
     */
    GetFileSize() {
        result := ComCall(5, this, "uint*", &fileSize := 0, "HRESULT")
        return fileSize
    }

    /**
     * 
     * @param {Integer} accessMode 
     * @param {Integer} begin 
     * @param {Integer} end 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmapping-openmapping
     */
    OpenMapping(accessMode, begin, end) {
        result := ComCall(6, this, "int", accessMode, "uint", begin, "uint", end, "uint*", &actualEnd := 0, "HRESULT")
        return actualEnd
    }

    /**
     * 
     * @param {Integer} accessMode 
     * @param {Integer} begin 
     * @param {Integer} end 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmapping-resizemapping
     */
    ResizeMapping(accessMode, begin, end) {
        result := ComCall(7, this, "int", accessMode, "uint", begin, "uint", end, "uint*", &actualEnd := 0, "HRESULT")
        return actualEnd
    }

    /**
     * 
     * @param {Pointer<Integer>} pageSize 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmapping-getpagesize
     */
    GetPageSize(pageSize) {
        pageSizeMarshal := pageSize is VarRef ? "uint*" : "ptr"

        ComCall(8, this, pageSizeMarshal, pageSize)
    }

    /**
     * 
     * @param {Integer} minimumMappedPages 
     * @param {Integer} accessMode 
     * @returns {ISimilarityTraitsMappedView} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmapping-createview
     */
    CreateView(minimumMappedPages, accessMode) {
        result := ComCall(9, this, "uint", minimumMappedPages, "int", accessMode, "ptr*", &mappedView := 0, "HRESULT")
        return ISimilarityTraitsMappedView(mappedView)
    }
}
