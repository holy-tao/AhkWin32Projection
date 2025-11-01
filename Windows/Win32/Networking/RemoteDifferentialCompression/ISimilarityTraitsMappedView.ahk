#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmappedview-flush
     */
    Flush() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmappedview-unmap
     */
    Unmap() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {BOOL} dirty 
     * @param {Integer} numElements 
     * @param {Pointer<SimilarityMappedViewInfo>} viewInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmappedview-get
     */
    Get(index, dirty, numElements, viewInfo) {
        result := ComCall(5, this, "uint", index, "int", dirty, "uint", numElements, "ptr", viewInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} mappedPageBegin 
     * @param {Pointer<Pointer<Integer>>} mappedPageEnd 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmappedview-getview
     */
    GetView(mappedPageBegin, mappedPageEnd) {
        ComCall(6, this, "ptr*", mappedPageBegin, "ptr*", mappedPageEnd)
    }
}
