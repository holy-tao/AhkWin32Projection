#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class Xps {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_SIGREQUESTID_DUP => -2142108795

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_PACKAGE_NOT_OPENED => -2142108794

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_PACKAGE_ALREADY_OPENED => -2142108793

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_SIGNATUREID_DUP => -2142108792

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MARKUP_COMPATIBILITY_ELEMENTS => -2142108791

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_OBJECT_DETACHED => -2142108790

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_INVALID_SIGNATUREBLOCK_MARKUP => -2142108789

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_INVALID_NUMBER_OF_POINTS_IN_CURVE_SEGMENTS => -2142108160

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_ABSOLUTE_REFERENCE => -2142108159

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_INVALID_NUMBER_OF_COLOR_CHANNELS => -2142108158

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_INVALID_LANGUAGE => -2142109696

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_INVALID_NAME => -2142109695

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_INVALID_RESOURCE_KEY => -2142109694

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_INVALID_PAGE_SIZE => -2142109693

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_INVALID_BLEED_BOX => -2142109692

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_INVALID_THUMBNAIL_IMAGE_TYPE => -2142109691

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_INVALID_LOOKUP_TYPE => -2142109690

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_INVALID_FLOAT => -2142109689

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_UNEXPECTED_CONTENT_TYPE => -2142109688

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_INVALID_FONT_URI => -2142109686

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_INVALID_CONTENT_BOX => -2142109685

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_INVALID_MARKUP => -2142109684

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_INVALID_XML_ENCODING => -2142109683

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_INVALID_CONTENT_TYPE => -2142109682

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_INVALID_OBFUSCATED_FONT_URI => -2142109681

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_UNEXPECTED_RELATIONSHIP_TYPE => -2142109680

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_UNEXPECTED_RESTRICTED_FONT_RELATIONSHIP => -2142109679

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_NAME => -2142109440

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_LOOKUP => -2142109439

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_GLYPHS => -2142109438

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_SEGMENT_DATA => -2142109437

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_COLORPROFILE => -2142109436

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_RELATIONSHIP_TARGET => -2142109435

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_RESOURCE_RELATIONSHIP => -2142109434

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_FONTURI => -2142109433

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_DOCUMENTSEQUENCE_RELATIONSHIP => -2142109432

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_DOCUMENT => -2142109431

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_REFERRED_DOCUMENT => -2142109430

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_REFERRED_PAGE => -2142109429

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_PAGE_IN_DOCUMENT => -2142109428

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_PAGE_IN_PAGEREFERENCE => -2142109427

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_IMAGE_IN_IMAGEBRUSH => -2142109426

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_RESOURCE_KEY => -2142109425

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_PART_REFERENCE => -2142109424

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_RESTRICTED_FONT_RELATIONSHIP => -2142109423

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_DISCARDCONTROL => -2142109422

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MISSING_PART_STREAM => -2142109421

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_UNAVAILABLE_PACKAGE => -2142109420

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_DUPLICATE_RESOURCE_KEYS => -2142109184

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MULTIPLE_RESOURCES => -2142109183

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MULTIPLE_DOCUMENTSEQUENCE_RELATIONSHIPS => -2142109182

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MULTIPLE_THUMBNAILS_ON_PAGE => -2142109181

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MULTIPLE_THUMBNAILS_ON_PACKAGE => -2142109180

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MULTIPLE_PRINTTICKETS_ON_PAGE => -2142109179

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MULTIPLE_PRINTTICKETS_ON_DOCUMENT => -2142109178

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MULTIPLE_PRINTTICKETS_ON_DOCUMENTSEQUENCE => -2142109177

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MULTIPLE_REFERENCES_TO_PART => -2142109176

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_DUPLICATE_NAMES => -2142109175

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_STRING_TOO_LONG => -2142108928

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_TOO_MANY_INDICES => -2142108927

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MAPPING_OUT_OF_ORDER => -2142108926

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MAPPING_OUTSIDE_STRING => -2142108925

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_MAPPING_OUTSIDE_INDICES => -2142108924

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_CARET_OUTSIDE_STRING => -2142108923

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_CARET_OUT_OF_ORDER => -2142108922

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_ODD_BIDILEVEL => -2142108921

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_ONE_TO_ONE_MAPPING_EXPECTED => -2142108920

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_RESTRICTED_FONT_NOT_OBFUSCATED => -2142108919

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_NEGATIVE_FLOAT => -2142108918

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_XKEY_ATTR_PRESENT_OUTSIDE_RES_DICT => -2142108672

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_DICTIONARY_ITEM_NAMED => -2142108671

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_NESTED_REMOTE_DICTIONARY => -2142108670

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_INDEX_OUT_OF_RANGE => -2142108416

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_VISUAL_CIRCULAR_REF => -2142108415

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_NO_CUSTOM_OBJECTS => -2142108414

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_ALREADY_OWNED => -2142108413

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_RESOURCE_NOT_OWNED => -2142108412

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_UNEXPECTED_COLORPROFILE => -2142108411

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_COLOR_COMPONENT_OUT_OF_RANGE => -2142108410

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_BOTH_PATHFIGURE_AND_ABBR_SYNTAX_PRESENT => -2142108409

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_BOTH_RESOURCE_AND_SOURCEATTR_PRESENT => -2142108408

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_BLEED_BOX_PAGE_DIMENSIONS_NOT_IN_SYNC => -2142108407

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_RELATIONSHIP_EXTERNAL => -2142108406

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_NOT_ENOUGH_GRADIENT_STOPS => -2142108405

    /**
     * @type {Integer (Int32)}
     */
    static XPS_E_PACKAGE_WRITER_NOT_CLOSED => -2142108404
;@endregion Constants

;@region Methods
    /**
     * The DeviceCapabilities function retrieves the capabilities of a printer driver.
     * @param {PSTR} pDevice A pointer to a null-terminated string that contains the name of the printer. Note that this is the name of the printer, not of the printer driver.
     * @param {PSTR} pPort A pointer to a null-terminated string that contains the name of the port to which the device is connected, such as LPT1.
     * @param {Integer} fwCapability 
     * @param {PSTR} pOutput A pointer to an array. The format of the array depends on the setting of the <i>fwCapability</i> parameter. See each capability above to find out what is returned if <i>pOutput</i> is <b>NULL</b>.
     * @param {Pointer<DEVMODEA>} pDevMode A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure. If this parameter is <b>NULL</b>, <b>DeviceCapabilities</b> retrieves the current default initialization values for the specified printer driver. Otherwise, the function retrieves the values contained in the structure to which <i>pDevMode</i> points.
     * @returns {Integer} If the function succeeds, the return value depends on the setting of the <i>fwCapability</i> parameter. A return value of zero generally indicates that, while the function completed successfully, there was some type of failure, such as a capability that is not supported. For more details, see the descriptions for the <i>fwCapability</i> values.
     * 
     * If the function returns -1, this may mean either that the capability is not supported or there was a general function failure.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-devicecapabilitiesa
     * @since windows5.0
     */
    static DeviceCapabilitiesA(pDevice, pPort, fwCapability, pOutput, pDevMode) {
        pDevice := pDevice is String ? StrPtr(pDevice) : pDevice
        pPort := pPort is String ? StrPtr(pPort) : pPort
        pOutput := pOutput is String ? StrPtr(pOutput) : pOutput

        result := DllCall("winspool.drv\DeviceCapabilitiesA", "ptr", pDevice, "ptr", pPort, "ushort", fwCapability, "ptr", pOutput, "ptr", pDevMode, "int")
        return result
    }

    /**
     * The DeviceCapabilities function retrieves the capabilities of a printer driver.
     * @param {PWSTR} pDevice A pointer to a null-terminated string that contains the name of the printer. Note that this is the name of the printer, not of the printer driver.
     * @param {PWSTR} pPort A pointer to a null-terminated string that contains the name of the port to which the device is connected, such as LPT1.
     * @param {Integer} fwCapability 
     * @param {PWSTR} pOutput A pointer to an array. The format of the array depends on the setting of the <i>fwCapability</i> parameter. See each capability above to find out what is returned if <i>pOutput</i> is <b>NULL</b>.
     * @param {Pointer<DEVMODEW>} pDevMode A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure. If this parameter is <b>NULL</b>, <b>DeviceCapabilities</b> retrieves the current default initialization values for the specified printer driver. Otherwise, the function retrieves the values contained in the structure to which <i>pDevMode</i> points.
     * @returns {Integer} If the function succeeds, the return value depends on the setting of the <i>fwCapability</i> parameter. A return value of zero generally indicates that, while the function completed successfully, there was some type of failure, such as a capability that is not supported. For more details, see the descriptions for the <i>fwCapability</i> values.
     * 
     * If the function returns -1, this may mean either that the capability is not supported or there was a general function failure.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-devicecapabilitiesw
     * @since windows5.0
     */
    static DeviceCapabilitiesW(pDevice, pPort, fwCapability, pOutput, pDevMode) {
        pDevice := pDevice is String ? StrPtr(pDevice) : pDevice
        pPort := pPort is String ? StrPtr(pPort) : pPort
        pOutput := pOutput is String ? StrPtr(pOutput) : pOutput

        result := DllCall("winspool.drv\DeviceCapabilitiesW", "ptr", pDevice, "ptr", pPort, "ushort", fwCapability, "ptr", pOutput, "ptr", pDevMode, "int")
        return result
    }

    /**
     * Enables an application to access the system-defined device capabilities that are not available through GDI.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} iEscape The escape function to be performed. This parameter must be one of the predefined escape values listed in Remarks. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-extescape">ExtEscape</a> function if your application defines a private escape value.
     * @param {Integer} cjIn The number of bytes of data pointed to by the <i>lpvInData</i> parameter. This can be 0.
     * @param {Pointer} pvIn A pointer to the input structure required for the specified escape.
     * @param {Pointer<Void>} pvOut A pointer to the structure that receives output from this escape. This parameter should be <b>NULL</b> if no data is returned.
     * @returns {Integer} If the function succeeds, the return value is greater than zero, except with the <a href="/previous-versions/windows/desktop/legacy/ff686811(v=vs.85)">QUERYESCSUPPORT</a> printer escape, which checks for implementation only. If the escape is not implemented, the return value is zero.
     * 
     * If the function fails, the return value is a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-escape
     * @since windows5.0
     */
    static Escape(hdc, iEscape, cjIn, pvIn, pvOut) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\Escape", "ptr", hdc, "int", iEscape, "int", cjIn, "ptr", pvIn, "ptr", pvOut, "int")
        return result
    }

    /**
     * The ExtEscape function enables an application to access device capabilities that are not available through GDI.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} iEscape The escape function to be performed. It can be one of the following or it can be an application-defined escape function.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CHECKJPEGFORMAT"></a><a id="checkjpegformat"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd183421(v=vs.85)">CHECKJPEGFORMAT</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Checks whether the printer supports a JPEG image.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CHECKPNGFORMAT"></a><a id="checkpngformat"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd183424(v=vs.85)">CHECKPNGFORMAT</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Checks whether the printer supports a PNG image.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DRAWPATTERNRECT"></a><a id="drawpatternrect"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162495(v=vs.85)">DRAWPATTERNRECT</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Draws a white, gray-scale, or black rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GET_PS_FEATURESETTING"></a><a id="get_ps_featuresetting"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd144954(v=vs.85)">GET_PS_FEATURESETTING</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Gets information on a specified feature setting for a PostScript driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GETTECHNOLOGY"></a><a id="gettechnology"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd144931(v=vs.85)">GETTECHNOLOGY</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reports on whether or not the driver is a Postscript driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PASSTHROUGH"></a><a id="passthrough"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162776(v=vs.85)">PASSTHROUGH</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows the application to send data directly to a printer. Supported in compatibility mode and GDI-centric mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POSTSCRIPT_DATA"></a><a id="postscript_data"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162828(v=vs.85)">POSTSCRIPT_DATA</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows the application to send data directly to a printer. Supported only in compatibility mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POSTSCRIPT_IDENTIFY"></a><a id="postscript_identify"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162829(v=vs.85)">POSTSCRIPT_IDENTIFY</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets a PostScript driver to GDI-centric or PostScript-centric mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POSTSCRIPT_INJECTION"></a><a id="postscript_injection"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162830(v=vs.85)">POSTSCRIPT_INJECTION</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Inserts a block of raw data in a PostScript job stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POSTSCRIPT_PASSTHROUGH"></a><a id="postscript_passthrough"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162831(v=vs.85)">POSTSCRIPT_PASSTHROUGH</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sends data directly to a PostScript printer driver. Supported in compatibility mode and PostScript-centric mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="QUERYESCSUPPORT"></a><a id="queryescsupport"></a><dl>
     * <dt><b>QUERYESCSUPPORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Determines whether a particular escape is implemented by the device driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SPCLPASSTHROUGH2"></a><a id="spclpassthrough2"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd145110(v=vs.85)">SPCLPASSTHROUGH2</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables applications to include private procedures and other resources at the document level-save context.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} cjInput The number of bytes of data pointed to by the <i>lpszInData</i> parameter.
     * @param {Pointer} lpInData A pointer to the input structure required for the specified escape. See also Remarks.
     * @param {Integer} cjOutput The number of bytes of data pointed to by the <i>lpszOutData</i> parameter.
     * @param {Pointer} lpOutData A pointer to the structure that receives output from this escape. This parameter must not be <b>NULL</b> if <b>ExtEscape</b> is called as a query function. If no data is to be returned in this structure, set <i>cbOutput</i> to 0. See also Remarks.
     * @returns {Integer} The return value specifies the outcome of the function. It is greater than zero if the function is successful, except for the QUERYESCSUPPORT printer escape, which checks for implementation only. The return value is zero if the escape is not implemented. A return value less than zero indicates an error.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-extescape
     * @since windows5.0
     */
    static ExtEscape(hdc, iEscape, cjInput, lpInData, cjOutput, lpOutData) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\ExtEscape", "ptr", hdc, "int", iEscape, "int", cjInput, "ptr", lpInData, "int", cjOutput, "ptr", lpOutData, "int")
        return result
    }

    /**
     * The StartDoc function starts a print job.
     * @param {HDC} hdc A handle to the device context for the print job.
     * @param {Pointer<DOCINFOA>} lpdi A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-docinfoa">DOCINFO</a> structure containing the name of the document file and the name of the output file.
     * @returns {Integer} If the function succeeds, the return value is greater than zero. This value is the print job identifier for the document.
     * 
     * If the function fails, the return value is less than or equal to zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-startdoca
     * @since windows5.0
     */
    static StartDocA(hdc, lpdi) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\StartDocA", "ptr", hdc, "ptr", lpdi, "int")
        return result
    }

    /**
     * The StartDoc function starts a print job.
     * @param {HDC} hdc A handle to the device context for the print job.
     * @param {Pointer<DOCINFOW>} lpdi A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-docinfoa">DOCINFO</a> structure containing the name of the document file and the name of the output file.
     * @returns {Integer} If the function succeeds, the return value is greater than zero. This value is the print job identifier for the document.
     * 
     * If the function fails, the return value is less than or equal to zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-startdocw
     * @since windows5.0
     */
    static StartDocW(hdc, lpdi) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\StartDocW", "ptr", hdc, "ptr", lpdi, "int")
        return result
    }

    /**
     * The EndDoc function ends a print job.
     * @param {HDC} hdc Handle to the device context for the print job.
     * @returns {Integer} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is less than or equal to zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-enddoc
     * @since windows5.0
     */
    static EndDoc(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\EndDoc", "ptr", hdc, "int")
        return result
    }

    /**
     * The StartPage function prepares the printer driver to accept data.
     * @param {HDC} hdc A handle to the device context for the print job.
     * @returns {Integer} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is less than or equal to zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-startpage
     * @since windows5.0
     */
    static StartPage(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\StartPage", "ptr", hdc, "int")
        return result
    }

    /**
     * The EndPage function notifies the device that the application has finished writing to a page. This function is typically used to direct the device driver to advance to a new page.
     * @param {HDC} hdc A handle to the device context for the print job.
     * @returns {Integer} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is less than or equal to zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-endpage
     * @since windows5.0
     */
    static EndPage(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\EndPage", "ptr", hdc, "int")
        return result
    }

    /**
     * The AbortDoc function stops the current print job and erases everything drawn since the last call to the StartDoc function.
     * @param {HDC} hdc Handle to the device context for the print job.
     * @returns {Integer} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is SP_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-abortdoc
     * @since windows5.0
     */
    static AbortDoc(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\AbortDoc", "ptr", hdc, "int")
        return result
    }

    /**
     * The SetAbortProc function sets the application-defined abort function that allows a print job to be canceled during spooling.
     * @param {HDC} hdc Handle to the device context for the print job.
     * @param {Pointer<ABORTPROC>} proc Pointer to the application-defined abort function. For more information about the callback function, see the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nc-wingdi-abortproc">AbortProc</a> callback function.
     * @returns {Integer} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is SP_ERROR.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setabortproc
     * @since windows5.0
     */
    static SetAbortProc(hdc, proc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetAbortProc", "ptr", hdc, "ptr", proc, "int")
        return result
    }

    /**
     * The PrintWindow function copies a visual window into the specified device context (DC), typically a printer DC.
     * @param {HWND} hwnd A handle to the window that will be copied.
     * @param {HDC} hdcBlt A handle to the device context.
     * @param {Integer} nFlags 
     * @returns {BOOL} If the function succeeds, it returns a nonzero value.
     * 
     * If the function fails, it returns zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-printwindow
     * @since windows5.1.2600
     */
    static PrintWindow(hwnd, hdcBlt, nFlags) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        hdcBlt := hdcBlt is Win32Handle ? NumGet(hdcBlt, "ptr") : hdcBlt

        result := DllCall("USER32.dll\PrintWindow", "ptr", hwnd, "ptr", hdcBlt, "uint", nFlags, "int")
        return result
    }

;@endregion Methods
}
