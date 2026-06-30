#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class IAMPlayListItem extends IUnknown {

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
     * @returns {Integer} 
     */
    GetFlags() {
        result := ComCall(3, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSourceCount() {
        result := ComCall(4, this, "uint*", &pdwSources := 0, "HRESULT")
        return pdwSources
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @returns {BSTR} 
     */
    GetSourceURL(dwSourceIndex) {
        pbstrURL := BSTR({Value: 0}, True)
        result := ComCall(5, this, "uint", dwSourceIndex, "ptr", pbstrURL, "HRESULT")
        return pbstrURL
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @returns {Integer} 
     */
    GetSourceStart(dwSourceIndex) {
        result := ComCall(6, this, "uint", dwSourceIndex, "int64*", &prtStart := 0, "HRESULT")
        return prtStart
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @returns {Integer} 
     */
    GetSourceDuration(dwSourceIndex) {
        result := ComCall(7, this, "uint", dwSourceIndex, "int64*", &prtDuration := 0, "HRESULT")
        return prtDuration
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @returns {Integer} 
     */
    GetSourceStartMarker(dwSourceIndex) {
        result := ComCall(8, this, "uint", dwSourceIndex, "uint*", &pdwMarker := 0, "HRESULT")
        return pdwMarker
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @returns {Integer} 
     */
    GetSourceEndMarker(dwSourceIndex) {
        result := ComCall(9, this, "uint", dwSourceIndex, "uint*", &pdwMarker := 0, "HRESULT")
        return pdwMarker
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @returns {BSTR} 
     */
    GetSourceStartMarkerName(dwSourceIndex) {
        pbstrStartMarker := BSTR({Value: 0}, True)
        result := ComCall(10, this, "uint", dwSourceIndex, "ptr", pbstrStartMarker, "HRESULT")
        return pbstrStartMarker
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @returns {BSTR} 
     */
    GetSourceEndMarkerName(dwSourceIndex) {
        pbstrEndMarker := BSTR({Value: 0}, True)
        result := ComCall(11, this, "uint", dwSourceIndex, "ptr", pbstrEndMarker, "HRESULT")
        return pbstrEndMarker
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetLinkURL() {
        pbstrURL := BSTR({Value: 0}, True)
        result := ComCall(12, this, "ptr", pbstrURL, "HRESULT")
        return pbstrURL
    }

    /**
     * 
     * @param {Integer} dwSourceIndex 
     * @returns {Integer} 
     */
    GetScanDuration(dwSourceIndex) {
        result := ComCall(13, this, "uint", dwSourceIndex, "int64*", &prtScanDuration := 0, "HRESULT")
        return prtScanDuration
    }
}
