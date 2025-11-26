#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use the IWMPMedia interface to set and retrieve the properties of a media item.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpmedia
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPMedia extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPMedia
     * @type {Guid}
     */
    static IID => Guid("{94d55e95-3fac-11d3-b155-00c04f79faa6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_isIdentical", "get_sourceURL", "get_name", "put_name", "get_imageSourceWidth", "get_imageSourceHeight", "get_markerCount", "getMarkerTime", "getMarkerName", "get_duration", "get_durationString", "get_attributeCount", "getAttributeName", "getItemInfo", "setItemInfo", "getItemInfoByAtom", "isMemberOf", "isReadOnlyItem"]

    /**
     */
    sourceURL {
        get => this.get_sourceURL()
    }

    /**
     */
    name {
        get => this.get_name()
        set => this.put_name(value)
    }

    /**
     */
    imageSourceWidth {
        get => this.get_imageSourceWidth()
    }

    /**
     */
    imageSourceHeight {
        get => this.get_imageSourceHeight()
    }

    /**
     */
    markerCount {
        get => this.get_markerCount()
    }

    /**
     */
    duration {
        get => this.get_duration()
    }

    /**
     */
    durationString {
        get => this.get_durationString()
    }

    /**
     */
    attributeCount {
        get => this.get_attributeCount()
    }

    /**
     * 
     * @param {IWMPMedia} pIWMPMedia 
     * @param {Pointer<VARIANT_BOOL>} pvbool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-get_isidentical
     */
    get_isIdentical(pIWMPMedia, pvbool) {
        pvboolMarshal := pvbool is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, "ptr", pIWMPMedia, pvboolMarshal, pvbool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSourceURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-get_sourceurl
     */
    get_sourceURL(pbstrSourceURL) {
        result := ComCall(8, this, "ptr", pbstrSourceURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-get_name
     */
    get_name(pbstrName) {
        result := ComCall(9, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-put_name
     */
    put_name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(10, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-get_imagesourcewidth
     */
    get_imageSourceWidth(pWidth) {
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pWidthMarshal, pWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-get_imagesourceheight
     */
    get_imageSourceHeight(pHeight) {
        pHeightMarshal := pHeight is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pHeightMarshal, pHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMarkerCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-get_markercount
     */
    get_markerCount(pMarkerCount) {
        pMarkerCountMarshal := pMarkerCount is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pMarkerCountMarshal, pMarkerCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} MarkerNum 
     * @param {Pointer<Float>} pMarkerTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-getmarkertime
     */
    getMarkerTime(MarkerNum, pMarkerTime) {
        pMarkerTimeMarshal := pMarkerTime is VarRef ? "double*" : "ptr"

        result := ComCall(14, this, "int", MarkerNum, pMarkerTimeMarshal, pMarkerTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} MarkerNum 
     * @param {Pointer<BSTR>} pbstrMarkerName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-getmarkername
     */
    getMarkerName(MarkerNum, pbstrMarkerName) {
        result := ComCall(15, this, "int", MarkerNum, "ptr", pbstrMarkerName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-get_duration
     */
    get_duration(pDuration) {
        pDurationMarshal := pDuration is VarRef ? "double*" : "ptr"

        result := ComCall(16, this, pDurationMarshal, pDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-get_durationstring
     */
    get_durationString(pbstrDuration) {
        result := ComCall(17, this, "ptr", pbstrDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-get_attributecount
     */
    get_attributeCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<BSTR>} pbstrItemName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-getattributename
     */
    getAttributeName(lIndex, pbstrItemName) {
        result := ComCall(19, this, "int", lIndex, "ptr", pbstrItemName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrItemName 
     * @param {Pointer<BSTR>} pbstrVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-getiteminfo
     */
    getItemInfo(bstrItemName, pbstrVal) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(20, this, "ptr", bstrItemName, "ptr", pbstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrItemName 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-setiteminfo
     */
    setItemInfo(bstrItemName, bstrVal) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(21, this, "ptr", bstrItemName, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lAtom 
     * @param {Pointer<BSTR>} pbstrVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-getiteminfobyatom
     */
    getItemInfoByAtom(lAtom, pbstrVal) {
        result := ComCall(22, this, "int", lAtom, "ptr", pbstrVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPPlaylist} pPlaylist 
     * @param {Pointer<VARIANT_BOOL>} pvarfIsMemberOf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-ismemberof
     */
    isMemberOf(pPlaylist, pvarfIsMemberOf) {
        pvarfIsMemberOfMarshal := pvarfIsMemberOf is VarRef ? "short*" : "ptr"

        result := ComCall(23, this, "ptr", pPlaylist, pvarfIsMemberOfMarshal, pvarfIsMemberOf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrItemName 
     * @param {Pointer<VARIANT_BOOL>} pvarfIsReadOnly 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-isreadonlyitem
     */
    isReadOnlyItem(bstrItemName, pvarfIsReadOnly) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        pvarfIsReadOnlyMarshal := pvarfIsReadOnly is VarRef ? "short*" : "ptr"

        result := ComCall(24, this, "ptr", bstrItemName, pvarfIsReadOnlyMarshal, pvarfIsReadOnly, "HRESULT")
        return result
    }
}
