#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SimilarityMappedViewInfo.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods that an RDC application can implement for manipulating a mapped view of a similarity traits table file.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-isimilaritytraitsmappedview
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class ISimilarityTraitsMappedView extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISimilarityTraitsMappedView
     * @type {Guid}
     */
    static IID => Guid("{96236a7c-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for SimilarityTraitsMappedView
     * @type {Guid}
     */
    static CLSID => Guid("{96236a95-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Flush", "Unmap", "Get", "GetView"]

    /**
     * Writes to the disk any dirty pages within a mapped view of a similarity traits table file.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytraitsmappedview-flush
     */
    Flush() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Unmaps a mapped view of a similarity traits table file.
     * @returns {HRESULT} This method always returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytraitsmappedview-unmap
     */
    Unmap() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Returns information about the mapped view of a similarity traits table file.
     * @param {Integer} index Beginning file offset, in bytes, of the underlying file data to be mapped in the mapped view.
     * @param {BOOL} dirty If <b>TRUE</b> is specified, the data in the currently mapped view has been changed; otherwise, the data has not changed. This parameter can be used to determine if data may need to be written to disk.
     * @param {Integer} numElements Minimum number of bytes of data to be mapped in the mapped view.
     * @returns {SimilarityMappedViewInfo} Pointer to a location that receives a <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritymappedviewinfo">SimilarityMappedViewInfo</a> structure containing information about the mapped view.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytraitsmappedview-get
     */
    Get(index, dirty, numElements) {
        viewInfo := SimilarityMappedViewInfo()
        result := ComCall(5, this, "uint", index, "int", dirty, "uint", numElements, "ptr", viewInfo, "HRESULT")
        return viewInfo
    }

    /**
     * Returns the beginning and ending addresses for the mapped view of a similarity traits table file.
     * @remarks
     * 
     * If there is no mapped view, then <c>*mappedPageBegin</code> must be set to zero. Otherwise, <code>*mappedPageBegin</code> is set to a valid pointer, and <code>*mappedPageBegin - *mappedPageEnd</c> equals the size, in bytes, of the mapped area.
     * 
     * 
     * @param {Pointer<Pointer<Integer>>} mappedPageBegin Pointer to a location that receives the start of the data that is mapped for this view.
     * @param {Pointer<Pointer<Integer>>} mappedPageEnd Pointer to a location that receives the end of the data that is mapped for this view, plus one.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytraitsmappedview-getview
     */
    GetView(mappedPageBegin, mappedPageEnd) {
        mappedPageBeginMarshal := mappedPageBegin is VarRef ? "ptr*" : "ptr"
        mappedPageEndMarshal := mappedPageEnd is VarRef ? "ptr*" : "ptr"

        ComCall(6, this, mappedPageBeginMarshal, mappedPageBegin, mappedPageEndMarshal, mappedPageEnd)
    }
}
