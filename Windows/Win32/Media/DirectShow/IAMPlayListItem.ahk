#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMPlayListItem extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFlags", "GetSourceCount", "GetSourceURL", "GetSourceStart", "GetSourceDuration", "GetSourceStartMarker", "GetSourceEndMarker", "GetSourceStartMarkerName", "GetSourceEndMarkerName", "GetLinkURL", "GetScanDuration"]

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwSources 
     * @returns {HRESULT} 
     */
    GetSourceCount(pdwSources) {
        pdwSourcesMarshal := pdwSources is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwSourcesMarshal, pdwSources, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @param {Pointer<BSTR>} pbstrURL 
     * @returns {HRESULT} 
     */
    GetSourceURL(dwSourceIndex, pbstrURL) {
        result := ComCall(5, this, "uint", dwSourceIndex, "ptr", pbstrURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @param {Pointer<Integer>} prtStart 
     * @returns {HRESULT} 
     */
    GetSourceStart(dwSourceIndex, prtStart) {
        prtStartMarshal := prtStart is VarRef ? "int64*" : "ptr"

        result := ComCall(6, this, "uint", dwSourceIndex, prtStartMarshal, prtStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @param {Pointer<Integer>} prtDuration 
     * @returns {HRESULT} 
     */
    GetSourceDuration(dwSourceIndex, prtDuration) {
        prtDurationMarshal := prtDuration is VarRef ? "int64*" : "ptr"

        result := ComCall(7, this, "uint", dwSourceIndex, prtDurationMarshal, prtDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @param {Pointer<Integer>} pdwMarker 
     * @returns {HRESULT} 
     */
    GetSourceStartMarker(dwSourceIndex, pdwMarker) {
        pdwMarkerMarshal := pdwMarker is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", dwSourceIndex, pdwMarkerMarshal, pdwMarker, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @param {Pointer<Integer>} pdwMarker 
     * @returns {HRESULT} 
     */
    GetSourceEndMarker(dwSourceIndex, pdwMarker) {
        pdwMarkerMarshal := pdwMarker is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", dwSourceIndex, pdwMarkerMarshal, pdwMarker, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @param {Pointer<BSTR>} pbstrStartMarker 
     * @returns {HRESULT} 
     */
    GetSourceStartMarkerName(dwSourceIndex, pbstrStartMarker) {
        result := ComCall(10, this, "uint", dwSourceIndex, "ptr", pbstrStartMarker, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @param {Pointer<BSTR>} pbstrEndMarker 
     * @returns {HRESULT} 
     */
    GetSourceEndMarkerName(dwSourceIndex, pbstrEndMarker) {
        result := ComCall(11, this, "uint", dwSourceIndex, "ptr", pbstrEndMarker, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrURL 
     * @returns {HRESULT} 
     */
    GetLinkURL(pbstrURL) {
        result := ComCall(12, this, "ptr", pbstrURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @param {Pointer<Integer>} prtScanDuration 
     * @returns {HRESULT} 
     */
    GetScanDuration(dwSourceIndex, prtScanDuration) {
        prtScanDurationMarshal := prtScanDuration is VarRef ? "int64*" : "ptr"

        result := ComCall(13, this, "uint", dwSourceIndex, prtScanDurationMarshal, prtScanDuration, "HRESULT")
        return result
    }
}
