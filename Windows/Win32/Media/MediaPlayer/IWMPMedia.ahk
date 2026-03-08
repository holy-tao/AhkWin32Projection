#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use the IWMPMedia interface to set and retrieve the properties of a media item.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpmedia
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
     * The get_isIdentical method retrieves a value indicating whether the specified object is the same as the current one.
     * @param {IWMPMedia} pIWMPMedia Pointer to an <b>IWMPMedia</b> object that this method will compare to the current object.
     * @param {Pointer<VARIANT_BOOL>} pvbool Pointer to a <b>VARIANT_BOOL</b> that indicates whether the objects were identical.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-get_isidentical
     */
    get_isIdentical(pIWMPMedia, pvbool) {
        pvboolMarshal := pvbool is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, "ptr", pIWMPMedia, pvboolMarshal, pvbool, "HRESULT")
        return result
    }

    /**
     * The get_sourceURL method retrieves the URL of the media item.
     * @param {Pointer<BSTR>} pbstrSourceURL Pointer to a <b>BSTR</b> containing the source URL.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-get_sourceurl
     */
    get_sourceURL(pbstrSourceURL) {
        result := ComCall(8, this, "ptr", pbstrSourceURL, "HRESULT")
        return result
    }

    /**
     * The get_name method retrieves the name of the media item.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {Pointer<BSTR>} pbstrName Pointer to a <b>BSTR</b> containing the name.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-get_name
     */
    get_name(pbstrName) {
        result := ComCall(9, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * The put_name method specifies sets the name of the media item.
     * @remarks
     * Before calling this method, you must have full access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method always returns E_INVALIDARG.
     * @param {BSTR} bstrName <b>BSTR</b> containing the name.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-put_name
     */
    put_name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(10, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * The get_imageSourceWidth method retrieves the width of the current media item in pixels.
     * @remarks
     * If the digital media item is not the current one, this property returns zero.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {Pointer<Integer>} pWidth Pointer to a <b>long</b> that specifies the width.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-get_imagesourcewidth
     */
    get_imageSourceWidth(pWidth) {
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pWidthMarshal, pWidth, "HRESULT")
        return result
    }

    /**
     * The get_imageSourceHeight method retrieves the height of the current media item in pixels.
     * @remarks
     * If the media item is not the current one, this property returns zero.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {Pointer<Integer>} pHeight Pointer to a <b>long</b> that specifies the height.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-get_imagesourceheight
     */
    get_imageSourceHeight(pHeight) {
        pHeightMarshal := pHeight is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pHeightMarshal, pHeight, "HRESULT")
        return result
    }

    /**
     * The get_markerCount method retrieves the number of markers in the media item.
     * @remarks
     * This method returns zero if a file has no markers, or if the media item is not the same as the one specified in <b>IWMPCore::get_currentMedia</b>.
     * 
     * Marker numbers start at 1.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {Pointer<Integer>} pMarkerCount Pointer to a <b>long</b> that contains the marker count.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-get_markercount
     */
    get_markerCount(pMarkerCount) {
        pMarkerCountMarshal := pMarkerCount is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pMarkerCountMarshal, pMarkerCount, "HRESULT")
        return result
    }

    /**
     * The getMarkerTime method retrieves the time of the marker at the specified index.
     * @remarks
     * This method returns <b>NULL</b> if the specified marker does not exist.
     * 
     * Some media items do not contain markers. Use <b>get_markerCount</b> to find out how many markers are in the current media item.
     * 
     * Marker index numbers start at 1.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {Integer} MarkerNum <b>long</b> specifying the marker index.
     * @param {Pointer<Float>} pMarkerTime Pointer to a <b>double</b> that specifies the marker time.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-getmarkertime
     */
    getMarkerTime(MarkerNum, pMarkerTime) {
        pMarkerTimeMarshal := pMarkerTime is VarRef ? "double*" : "ptr"

        result := ComCall(14, this, "int", MarkerNum, pMarkerTimeMarshal, pMarkerTime, "HRESULT")
        return result
    }

    /**
     * The getMarkerName method retrieves the name of the marker at the specified index.
     * @remarks
     * This method returns <b>NULL</b> if the specified marker does not exist.
     * 
     * Some media items do not contain markers. Use <b>get_markerCount</b> to find out how many markers are in the current media item.
     * 
     * Marker index numbers start at 1.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {Integer} MarkerNum <b>long</b> specifying the marker index.
     * @param {Pointer<BSTR>} pbstrMarkerName Pointer to a <b>BSTR</b> containing the marker name.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-getmarkername
     */
    getMarkerName(MarkerNum, pbstrMarkerName) {
        result := ComCall(15, this, "int", MarkerNum, "ptr", pbstrMarkerName, "HRESULT")
        return result
    }

    /**
     * The get_duration method retrieves the duration in seconds of the current media item..
     * @remarks
     * If this method is used with a media item other than the one specified in <b>IWMPCore::get_currentMedia</b>, it may not contain a valid value.
     * 
     * To retrieve the duration for files that are not in the user's library, you must wait for Windows Media Player to open the file; that is, the current OpenState must equal MediaOpen. You can verify this by handling the <b>IWMPEvents::OpenStateChange</b> event or by periodically checking the value of <b>IWMPCore::get_openState</b>.
     * 
     * For playlists, the duration of each media item can be retrieved when the individual media item is opened, rather than the when the playlist is opened.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {Pointer<Float>} pDuration Pointer to a <b>double</b> containing the duration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-get_duration
     */
    get_duration(pDuration) {
        pDurationMarshal := pDuration is VarRef ? "double*" : "ptr"

        result := ComCall(16, this, pDurationMarshal, pDuration, "HRESULT")
        return result
    }

    /**
     * The get_durationString method retrieves a string indicating the duration of the current media item in HH:MM:SS format.
     * @remarks
     * If this method is used with a media item other than the one specified in <b>IWMPCore::get_currentMedia</b>, it may not contain a valid value. If the media item is less than an hour long, the hours portion of the return value is omitted.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {Pointer<BSTR>} pbstrDuration Pointer to a <b>BSTR</b> containing the duration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-get_durationstring
     */
    get_durationString(pbstrDuration) {
        result := ComCall(17, this, "ptr", pbstrDuration, "HRESULT")
        return result
    }

    /**
     * The get_attributeCount method retrieves the number of attributes that can be queried and/or set for the media item.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * For information about the attributes supported by Windows Media Player, see the Windows Media Player <a href="https://docs.microsoft.com/windows/desktop/WMP/attribute-reference">Attribute Reference</a>.
     * 
     * <b>Windows Media Player 10 Mobile:</b> Attributes for a media item are available only during playback unless they are retrieved from the item through the media collection.
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> containing the count.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-get_attributecount
     */
    get_attributeCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The getAttributeName method retrieves the name of the attribute corresponding to the specified index.
     * @remarks
     * The attribute name returned can be used in conjunction with <b>getItemInfo</b> to retrieve the value for a specific named attribute.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * For information about the attributes supported by Windows Media Player, see the Windows Media Player <a href="https://docs.microsoft.com/windows/desktop/WMP/attribute-reference">Attribute Reference</a>.
     * 
     * <b>Windows Media Player 10 Mobile:</b> Attributes for a media item are available only during playback unless they are retrieved from the item through the media collection.
     * @param {Integer} lIndex <b>long</b> containing the index.
     * @param {Pointer<BSTR>} pbstrItemName Pointer to a <b>BSTR</b> containing the attribute name.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-getattributename
     */
    getAttributeName(lIndex, pbstrItemName) {
        result := ComCall(19, this, "int", lIndex, "ptr", pbstrItemName, "HRESULT")
        return result
    }

    /**
     * The getItemInfo method retrieves the value of the specified attribute for the media item.
     * @remarks
     * This method retrieves the metadata for an individual media item or a media item that is part of a playlist.
     * 
     * The <b>get_attributeCount</b> method retrieves the number of attribute names available for a given media item. Index numbers can then be used with the <b>getAttributeName</b> method to determine the name of each available attribute. Individual attribute names can be passed to <b>getItemInfo</b>.
     * 
     * To retrieve attributes with multiple values and attributes with complex values, use the <b>getItemInfoByType</b> method.
     * 
     * The set of attributes available from sources other than the local library (remote libraries, portable devices, or CDs) is defined by the other sources.
     * 
     * Before calling this method, you must have Read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * To share the Windows media libraries over UPnP, Windows Media Player creates a content directory service (CDS) that 
     * 
     * is exposed over UPnP. Other devices can then navigate and browse the libraries. 
     * 
     * 
     * In Windows 7, an application can use the Windows Media Player <a href="https://docs.microsoft.com/windows/desktop/WMP/trackingid-attribute">TrackingID</a> and <a href="https://docs.microsoft.com/windows/desktop/WMP/mediatype-attribute">MediaType</a> attributes to construct the object ID of each item in the CDS. Note that this construction might change in future versions of Windows. The application passes each of these attribute strings in the <i>bstrItemName</i> parameter in a call to <b>getItemInfo</b>. <b>getItemInfo</b> returns the value for each attribute in a variable to which the   <i>pbstrVal</i> parameter points.  The application then uses the following syntax to construct each object ID:
     * 
     * <i>TrackingID</i>.0.<i>MediaTypeID</i>
     * 
     * This syntax has the  following meaning:
     * 
     * <ul>
     * <li><i>TrackingID</i> is the string that is stored in the Windows Media Player <a href="https://docs.microsoft.com/windows/desktop/WMP/trackingid-attribute">TrackingID</a> attribute of the media item.</li>
     * <li><i>MediaTypeID</i> depends on the value of the <a href="https://docs.microsoft.com/windows/desktop/WMP/mediatype-attribute">MediaType</a> 
     * 
     * attribute, as shown in the following table:<table>
     * <tr>
     * <th>MediaType attribute</th>
     * <th>MediaTypeID</th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/WMP/audio-item-attributes">Audio Items</a>
     * </td>
     * <td>4</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/WMP/photo-item-attributes">Photo Items</a>
     * </td>
     * <td>B</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/WMP/video-item-attributes">Video Items</a>
     * </td>
     * <td>8</td>
     * </tr>
     * </table>
     *  
     * 
     * </li>
     * </ul>
     * <b>Windows Media Player 10 Mobile:</b> Attributes for a media item are available only during playback unless they are retrieved from the item through the media collection.
     * @param {BSTR} bstrItemName <b>BSTR</b> containing the item name.
     * @param {Pointer<BSTR>} pbstrVal Pointer to a <b>BSTR</b> containing the returned value.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-getiteminfo
     */
    getItemInfo(bstrItemName, pbstrVal) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(20, this, "ptr", bstrItemName, "ptr", pbstrVal, "HRESULT")
        return result
    }

    /**
     * The setItemInfo method sets the value of the specified attribute for the media item.
     * @remarks
     * The <b>get_attributeCount</b> method retrieves the number of attributes available for a given media item. Index numbers can then be used with the <b>getAttributeName</b> method to determine the names of the built-in attributes that can be used with this method.
     * 
     * Before using this method, use the <b>isReadOnlyItem</b> method to determine whether a particular attribute can be set.
     * 
     * Before calling this method, you must have full access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * Note
     *         
     * 
     * If you embed the Windows Media Player control in your application, file attributes that you change will not be written to the digital media file until the user runs Windows Media Player. If you use the control in a remoted application written in C++, file attributes that you change will be written to the digital media file shortly after you make the changes. In either case, the changes are immediately available to you through the library.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method always returns E_INVALIDARG.
     * @param {BSTR} bstrItemName <b>BSTR</b> containing the attribute name.
     * @param {BSTR} bstrVal <b>BSTR</b> containing the new value.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-setiteminfo
     */
    setItemInfo(bstrItemName, bstrVal) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(21, this, "ptr", bstrItemName, "ptr", bstrVal, "HRESULT")
        return result
    }

    /**
     * The getItemInfoByAtom method retrieves the value of the attribute with the specified index number.
     * @remarks
     * This method can be used to retrieve metadata for a specific media item by using an attribute index number. The <b>get_attributeCount</b> method can be used to determine the number of attributes available for the media item.
     * 
     * The <b>getMediaAtom</b> method of the <b>MediaCollection</b> object can also be used to retrieve the index of a particular attribute. This technique is generally more efficient than the <b>getItemInfo</b> or <b>getItemInfoByType</b> methods when working with large playlists.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile:</b> Attributes for a media item are available only during playback unless they are retrieved from the item through the media collection.
     * @param {Integer} lAtom <b>long</b> specifying the index at which a given attribute resides within the set of available attributes.
     * @param {Pointer<BSTR>} pbstrVal Pointer to a <b>BSTR</b> containing the returned value.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-getiteminfobyatom
     */
    getItemInfoByAtom(lAtom, pbstrVal) {
        result := ComCall(22, this, "int", lAtom, "ptr", pbstrVal, "HRESULT")
        return result
    }

    /**
     * The isMemberOf method retrieves a value indicating whether the specified media item is a member of the specified playlist.
     * @remarks
     * This method cannot check playlists retrieved through the <b>MediaCollection</b> object. To test whether a media item is a member of a particular named playlist, retrieve the playlist collection with the <b>IWMPCore::get_playlistCollection</b> method. Once you retrieve the collection, retrieve the individual playlist by calling the <b>IWMPPlaylistCollection::getByName</b> method.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {IWMPPlaylist} pPlaylist Pointer to an <b>IWMPPlaylist</b> interface.
     * @param {Pointer<VARIANT_BOOL>} pvarfIsMemberOf Pointer to a <b>VARIANT_BOOL</b> that indicates whether the item is a member of the playlist.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-ismemberof
     */
    isMemberOf(pPlaylist, pvarfIsMemberOf) {
        pvarfIsMemberOfMarshal := pvarfIsMemberOf is VarRef ? "short*" : "ptr"

        result := ComCall(23, this, "ptr", pPlaylist, pvarfIsMemberOfMarshal, pvarfIsMemberOf, "HRESULT")
        return result
    }

    /**
     * The isReadOnlyItem method retrieves a value indicating whether the attributes of the specified media item can be edited.
     * @remarks
     * If an attribute is read-only, then it cannot be set with the <b>setItemInfo</b> method. Note that this method may return different values for a particular attribute when used with different versions of Windows Media Player.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method always retrieves a <b>VARIANT_BOOL</b> set to <b>TRUE</b>.
     * @param {BSTR} bstrItemName <b>BSTR</b> containing the item name.
     * @param {Pointer<VARIANT_BOOL>} pvarfIsReadOnly Pointer to a <b>VARIANT_BOOL</b> that specifies whether the attributes are read-only.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia-isreadonlyitem
     */
    isReadOnlyItem(bstrItemName, pvarfIsReadOnly) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        pvarfIsReadOnlyMarshal := pvarfIsReadOnly is VarRef ? "short*" : "ptr"

        result := ComCall(24, this, "ptr", bstrItemName, pvarfIsReadOnlyMarshal, pvarfIsReadOnly, "HRESULT")
        return result
    }
}
