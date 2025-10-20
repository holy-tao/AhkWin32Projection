#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} fileSize 
     * @returns {HRESULT} If the function succeeds, the return value is the low-order doubleword of the file size, and, if 
     *        <i>lpFileSizeHigh</i> is non-<b>NULL</b>, the function puts the 
     *        high-order doubleword of the file size into the variable pointed to by that parameter.
     * 
     * If the function fails and <i>lpFileSizeHigh</i> is <b>NULL</b>, the 
     *        return value is <b>INVALID_FILE_SIZE</b>. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. When 
     *        <i>lpFileSizeHigh</i> is <b>NULL</b>, the results returned for large 
     *        files are ambiguous, and you will not be able to determine the actual size of the file. It is recommended that 
     *        you use <a href="/windows/desktop/api/fileapi/nf-fileapi-getfilesizeex">GetFileSizeEx</a> instead.
     * 
     * If the function fails and <i>lpFileSizeHigh</i> is non-<b>NULL</b>, the 
     *        return value is <b>INVALID_FILE_SIZE</b> and 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return a value other than 
     *        <b>NO_ERROR</b>.
     * @see https://docs.microsoft.com/windows/win32/api//fileapi/nf-fileapi-getfilesize
     */
    GetFileSize(fileSize) {
        result := ComCall(5, this, "uint*", fileSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} accessMode 
     * @param {Integer} begin 
     * @param {Integer} end 
     * @param {Pointer<Integer>} actualEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmapping-openmapping
     */
    OpenMapping(accessMode, begin, end, actualEnd) {
        result := ComCall(6, this, "int", accessMode, "uint", begin, "uint", end, "uint*", actualEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} accessMode 
     * @param {Integer} begin 
     * @param {Integer} end 
     * @param {Pointer<Integer>} actualEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmapping-resizemapping
     */
    ResizeMapping(accessMode, begin, end, actualEnd) {
        result := ComCall(7, this, "int", accessMode, "uint", begin, "uint", end, "uint*", actualEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pageSize 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmapping-getpagesize
     */
    GetPageSize(pageSize) {
        ComCall(8, this, "uint*", pageSize)
    }

    /**
     * 
     * @param {Integer} minimumMappedPages 
     * @param {Integer} accessMode 
     * @param {Pointer<ISimilarityTraitsMappedView>} mappedView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmapping-createview
     */
    CreateView(minimumMappedPages, accessMode, mappedView) {
        result := ComCall(9, this, "uint", minimumMappedPages, "int", accessMode, "ptr*", mappedView, "HRESULT")
        return result
    }
}
