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
     * 
     * @param {Pointer<IWMPMedia>} pIWMPMedia 
     * @param {Pointer<VARIANT_BOOL>} pvbool 
     * @returns {HRESULT} 
     */
    get_isIdentical(pIWMPMedia, pvbool) {
        result := ComCall(7, this, "ptr", pIWMPMedia, "ptr", pvbool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSourceURL 
     * @returns {HRESULT} 
     */
    get_sourceURL(pbstrSourceURL) {
        result := ComCall(8, this, "ptr", pbstrSourceURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_name(pbstrName) {
        result := ComCall(9, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     */
    put_name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(10, this, "ptr", bstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pWidth 
     * @returns {HRESULT} 
     */
    get_imageSourceWidth(pWidth) {
        result := ComCall(11, this, "int*", pWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pHeight 
     * @returns {HRESULT} 
     */
    get_imageSourceHeight(pHeight) {
        result := ComCall(12, this, "int*", pHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMarkerCount 
     * @returns {HRESULT} 
     */
    get_markerCount(pMarkerCount) {
        result := ComCall(13, this, "int*", pMarkerCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MarkerNum 
     * @param {Pointer<Double>} pMarkerTime 
     * @returns {HRESULT} 
     */
    getMarkerTime(MarkerNum, pMarkerTime) {
        result := ComCall(14, this, "int", MarkerNum, "double*", pMarkerTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MarkerNum 
     * @param {Pointer<BSTR>} pbstrMarkerName 
     * @returns {HRESULT} 
     */
    getMarkerName(MarkerNum, pbstrMarkerName) {
        result := ComCall(15, this, "int", MarkerNum, "ptr", pbstrMarkerName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pDuration 
     * @returns {HRESULT} 
     */
    get_duration(pDuration) {
        result := ComCall(16, this, "double*", pDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDuration 
     * @returns {HRESULT} 
     */
    get_durationString(pbstrDuration) {
        result := ComCall(17, this, "ptr", pbstrDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_attributeCount(plCount) {
        result := ComCall(18, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<BSTR>} pbstrItemName 
     * @returns {HRESULT} 
     */
    getAttributeName(lIndex, pbstrItemName) {
        result := ComCall(19, this, "int", lIndex, "ptr", pbstrItemName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrItemName 
     * @param {Pointer<BSTR>} pbstrVal 
     * @returns {HRESULT} 
     */
    getItemInfo(bstrItemName, pbstrVal) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(20, this, "ptr", bstrItemName, "ptr", pbstrVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrItemName 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     */
    setItemInfo(bstrItemName, bstrVal) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(21, this, "ptr", bstrItemName, "ptr", bstrVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lAtom 
     * @param {Pointer<BSTR>} pbstrVal 
     * @returns {HRESULT} 
     */
    getItemInfoByAtom(lAtom, pbstrVal) {
        result := ComCall(22, this, "int", lAtom, "ptr", pbstrVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlaylist>} pPlaylist 
     * @param {Pointer<VARIANT_BOOL>} pvarfIsMemberOf 
     * @returns {HRESULT} 
     */
    isMemberOf(pPlaylist, pvarfIsMemberOf) {
        result := ComCall(23, this, "ptr", pPlaylist, "ptr", pvarfIsMemberOf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrItemName 
     * @param {Pointer<VARIANT_BOOL>} pvarfIsReadOnly 
     * @returns {HRESULT} 
     */
    isReadOnlyItem(bstrItemName, pvarfIsReadOnly) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(24, this, "ptr", bstrItemName, "ptr", pvarfIsReadOnly, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
