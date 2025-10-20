#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMPlayListItem extends IUnknown{
    /**
     * The interface identifier for IAMPlayListItem
     * @type {Guid}
     */
    static IID => Guid("{56a868ff-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetFlags(pdwFlags) {
        result := ComCall(3, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwSources 
     * @returns {HRESULT} 
     */
    GetSourceCount(pdwSources) {
        result := ComCall(4, this, "uint*", pdwSources, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @param {Pointer<BSTR>} pbstrURL 
     * @returns {HRESULT} 
     */
    GetSourceURL(dwSourceIndex, pbstrURL) {
        result := ComCall(5, this, "uint", dwSourceIndex, "ptr", pbstrURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @param {Pointer<Int64>} prtStart 
     * @returns {HRESULT} 
     */
    GetSourceStart(dwSourceIndex, prtStart) {
        result := ComCall(6, this, "uint", dwSourceIndex, "int64*", prtStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @param {Pointer<Int64>} prtDuration 
     * @returns {HRESULT} 
     */
    GetSourceDuration(dwSourceIndex, prtDuration) {
        result := ComCall(7, this, "uint", dwSourceIndex, "int64*", prtDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @param {Pointer<UInt32>} pdwMarker 
     * @returns {HRESULT} 
     */
    GetSourceStartMarker(dwSourceIndex, pdwMarker) {
        result := ComCall(8, this, "uint", dwSourceIndex, "uint*", pdwMarker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @param {Pointer<UInt32>} pdwMarker 
     * @returns {HRESULT} 
     */
    GetSourceEndMarker(dwSourceIndex, pdwMarker) {
        result := ComCall(9, this, "uint", dwSourceIndex, "uint*", pdwMarker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @param {Pointer<BSTR>} pbstrStartMarker 
     * @returns {HRESULT} 
     */
    GetSourceStartMarkerName(dwSourceIndex, pbstrStartMarker) {
        result := ComCall(10, this, "uint", dwSourceIndex, "ptr", pbstrStartMarker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @param {Pointer<BSTR>} pbstrEndMarker 
     * @returns {HRESULT} 
     */
    GetSourceEndMarkerName(dwSourceIndex, pbstrEndMarker) {
        result := ComCall(11, this, "uint", dwSourceIndex, "ptr", pbstrEndMarker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrURL 
     * @returns {HRESULT} 
     */
    GetLinkURL(pbstrURL) {
        result := ComCall(12, this, "ptr", pbstrURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @param {Pointer<Int64>} prtScanDuration 
     * @returns {HRESULT} 
     */
    GetScanDuration(dwSourceIndex, prtScanDuration) {
        result := ComCall(13, this, "uint", dwSourceIndex, "int64*", prtScanDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
