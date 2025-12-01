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
     * The DeviceCapabilities function retrieves the capabilities of a printer driver. (ANSI)
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * The <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure pointed to by the <i>pDevMode</i> parameter may be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/printdocs/documentproperties">DocumentProperties</a> function.
     * 
     * If a printer driver supports custom device capabilities, the driver must call the <a href="https://docs.microsoft.com/windows/desktop/printdocs/setprinterdata">SetPrinterData</a> function for each custom capability. The <b>SetPrinterData</b> function adds the appropriate printer data to the print system, which enables 32-bit applications to access the custom capabilities on 64-bit Windows installations.
     * 
     * For each custom capability, you must first add printer data that describes the type of the capability. To do this, when you call <b>SetPrinterData</b>, set the <i>pValueName</i> string to <b>CustomDeviceCapabilityType_Xxx</b>, where "Xxx" is the hexadecimal representation of the capability. For example, you might have "CustomDeviceCapabilityType_1234". The registry data that you set must be of the <b>REG_DWORD</b> type, and you must set its value to one of the following:
     * 
     * <ul>
     * <li>0, if the custom capability is a <b>DWORD</b></li>
     * <li>1, if the custom capability is a buffer of bytes</li>
     * <li>2, if the custom capability is an array of items</li>
     * </ul>
     * If the custom capability is an array of items, you must call <b>SetPinterData</b> a second time to provide information about the size of an item in the array. To do this, when you call <b>SetPinterData</b>, the <i>pValueName</i> string that you provide must be "CustomDeviceCapabilitySize_Xxx" where Xxx is the hexadecimal representation of the capability. For example, you might have "CustomDeviceCapabilitySize_1234". The registry data that you set must be of the <b>REG_DWORD</b> type, and you must set its value to the size in bytes of an item in the array.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wingdi.h header defines DeviceCapabilities as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} pDevice A pointer to a null-terminated string that contains the name of the printer. Note that this is the name of the printer, not of the printer driver.
     * @param {PSTR} pPort A pointer to a null-terminated string that contains the name of the port to which the device is connected, such as LPT1.
     * @param {Integer} fwCapability 
     * @param {PSTR} pOutput A pointer to an array. The format of the array depends on the setting of the <i>fwCapability</i> parameter. See each capability above to find out what is returned if <i>pOutput</i> is <b>NULL</b>.
     * @param {Pointer<DEVMODEA>} pDevMode A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure. If this parameter is <b>NULL</b>, <b>DeviceCapabilities</b> retrieves the current default initialization values for the specified printer driver. Otherwise, the function retrieves the values contained in the structure to which <i>pDevMode</i> points.
     * @returns {Integer} If the function succeeds, the return value depends on the setting of the <i>fwCapability</i> parameter. A return value of zero generally indicates that, while the function completed successfully, there was some type of failure, such as a capability that is not supported. For more details, see the descriptions for the <i>fwCapability</i> values.
     * 
     * If the function returns -1, this may mean either that the capability is not supported or there was a general function failure.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-devicecapabilitiesa
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
     * The DeviceCapabilities function retrieves the capabilities of a printer driver. (Unicode)
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * The <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure pointed to by the <i>pDevMode</i> parameter may be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/printdocs/documentproperties">DocumentProperties</a> function.
     * 
     * If a printer driver supports custom device capabilities, the driver must call the <a href="https://docs.microsoft.com/windows/desktop/printdocs/setprinterdata">SetPrinterData</a> function for each custom capability. The <b>SetPrinterData</b> function adds the appropriate printer data to the print system, which enables 32-bit applications to access the custom capabilities on 64-bit Windows installations.
     * 
     * For each custom capability, you must first add printer data that describes the type of the capability. To do this, when you call <b>SetPrinterData</b>, set the <i>pValueName</i> string to <b>CustomDeviceCapabilityType_Xxx</b>, where "Xxx" is the hexadecimal representation of the capability. For example, you might have "CustomDeviceCapabilityType_1234". The registry data that you set must be of the <b>REG_DWORD</b> type, and you must set its value to one of the following:
     * 
     * <ul>
     * <li>0, if the custom capability is a <b>DWORD</b></li>
     * <li>1, if the custom capability is a buffer of bytes</li>
     * <li>2, if the custom capability is an array of items</li>
     * </ul>
     * If the custom capability is an array of items, you must call <b>SetPinterData</b> a second time to provide information about the size of an item in the array. To do this, when you call <b>SetPinterData</b>, the <i>pValueName</i> string that you provide must be "CustomDeviceCapabilitySize_Xxx" where Xxx is the hexadecimal representation of the capability. For example, you might have "CustomDeviceCapabilitySize_1234". The registry data that you set must be of the <b>REG_DWORD</b> type, and you must set its value to the size in bytes of an item in the array.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The wingdi.h header defines DeviceCapabilities as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PWSTR} pDevice A pointer to a null-terminated string that contains the name of the printer. Note that this is the name of the printer, not of the printer driver.
     * @param {PWSTR} pPort A pointer to a null-terminated string that contains the name of the port to which the device is connected, such as LPT1.
     * @param {Integer} fwCapability 
     * @param {PWSTR} pOutput A pointer to an array. The format of the array depends on the setting of the <i>fwCapability</i> parameter. See each capability above to find out what is returned if <i>pOutput</i> is <b>NULL</b>.
     * @param {Pointer<DEVMODEW>} pDevMode A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure. If this parameter is <b>NULL</b>, <b>DeviceCapabilities</b> retrieves the current default initialization values for the specified printer driver. Otherwise, the function retrieves the values contained in the structure to which <i>pDevMode</i> points.
     * @returns {Integer} If the function succeeds, the return value depends on the setting of the <i>fwCapability</i> parameter. A return value of zero generally indicates that, while the function completed successfully, there was some type of failure, such as a capability that is not supported. For more details, see the descriptions for the <i>fwCapability</i> values.
     * 
     * If the function returns -1, this may mean either that the capability is not supported or there was a general function failure.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-devicecapabilitiesw
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
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * The effect of passing 0 for <i>cbInput</i> will depend on the value of <i>nEscape</i> and on the driver that is handling the escape.
     * 
     * Of the original printer escapes, only the following can be used.
     * 
     * <table>
     * <tr>
     * <th>Escape</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * QUERYESCSUPPORT
     * 
     * </td>
     * <td>
     * Determines whether a particular escape is implemented by the device driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * PASSTHROUGH
     * 
     * </td>
     * <td>
     * Allows the application to send data directly to a printer.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For information about printer escapes, see <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-extescape">ExtEscape</a>.
     * 
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-startpage">StartPage</a> function to prepare the printer driver to receive data.
     * @param {HDC} hdc A handle to the device context.
     * @param {Integer} iEscape The escape function to be performed. This parameter must be one of the predefined escape values listed in Remarks. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-extescape">ExtEscape</a> function if your application defines a private escape value.
     * @param {Integer} cjIn The number of bytes of data pointed to by the <i>lpvInData</i> parameter. This can be 0.
     * @param {Pointer} pvIn A pointer to the input structure required for the specified escape.
     * @param {Pointer<Void>} pvOut A pointer to the structure that receives output from this escape. This parameter should be <b>NULL</b> if no data is returned.
     * @returns {Integer} If the function succeeds, the return value is greater than zero, except with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff686811(v=vs.85)">QUERYESCSUPPORT</a> printer escape, which checks for implementation only. If the escape is not implemented, the return value is zero.
     * 
     * If the function fails, the return value is a system error code.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-escape
     * @since windows5.0
     */
    static Escape(hdc, iEscape, cjIn, pvIn, pvOut) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        pvOutMarshal := pvOut is VarRef ? "ptr" : "ptr"

        result := DllCall("GDI32.dll\Escape", "ptr", hdc, "int", iEscape, "int", cjIn, "ptr", pvIn, pvOutMarshal, pvOut, "int")
        return result
    }

    /**
     * The ExtEscape function enables an application to access device capabilities that are not available through GDI.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * Use this function to pass a driver-defined escape value to a device.
     * 
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-escape">Escape</a> function to pass one of the system-defined escape values to a device, unless the escape is one of the defined escapes in <i>nEscape</i>. <b>ExtEscape</b> might not work properly with the system-defined escapes. In particular, escapes in which <i>lpszInData</i> is a pointer to a structure that contains a member that is a pointer will fail.
     * 
     * Note, that the behavior described in this article is the expected behavior, but it is up to the driver to comply with this model.
     * 
     * The variables referenced by <i>lpszInData</i> and <i>lpszOutData</i> should not be the same or overlap. If the input and the output buffer size variables overlap, they may not contain the correct values after the call returns. For the best results, <i>lpszInData</i> and <i>lpszOutData</i> should refer to different variables.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd183421(v=vs.85)">CHECKJPEGFORMAT</a> printer escape function determines whether a printer supports printing a JPEG image.
     * 
     * Before using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd183421(v=vs.85)">CHECKJPEGFORMAT</a> printer escape function, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff686811(v=vs.85)">QUERYESCSUPPORT</a> printer escape function to determine whether the driver supports <b>CHECKJPEGFORMAT</b>. For sample code that demonstrates the use of <b>CHECKJPEGFORMAT</b>, see <a href="https://docs.microsoft.com/windows/desktop/gdi/testing-a-printer-for-jpeg-or-png-support">Testing a Printer for JPEG or PNG Support</a>.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd183424(v=vs.85)">CHECKPNGFORMAT</a> printer escape function determines whether a printer supports printing a PNG image.
     * 
     * Before using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd183421(v=vs.85)">CHECKJPEGFORMAT</a> printer escape function, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff686811(v=vs.85)">QUERYESCSUPPORT</a> printer escape function to determine whether the driver supports <b>CHECKJPEGFORMAT</b>. For sample code, see <a href="https://docs.microsoft.com/windows/desktop/gdi/testing-a-printer-for-jpeg-or-png-support">Testing a Printer for JPEG or PNG Support</a>.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162495(v=vs.85)">DRAWPATTERNRECT</a> printer escape creates a white, gray scale, or solid black rectangle by using the pattern and rule capabilities of Page Control Language (PCL) on Hewlett-Packard LaserJet or LaserJet-compatible printers. A gray scale is a gray pattern that contains a specific mixture of black and white pixels.
     * 
     * An application should use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff686811(v=vs.85)">QUERYESCSUPPORT</a> escape to determine whether the printer is capable of drawing patterns and rules before using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162495(v=vs.85)">DRAWPATTERNRECT</a> escape.
     * 
     * 
     * <ul>
     * <li>Rules drawn with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162495(v=vs.85)">DRAWPATTERNRECT</a> are not subject to clipping regions in the device context.</li>
     * <li>Applications should not try to erase patterns and rules created with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162495(v=vs.85)">DRAWPATTERNRECT</a> by placing opaque objects over them. </li>
     * </ul>
     * 
     * 
     * If the printer supports white rules, these can be used to erase patterns created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162495(v=vs.85)">DRAWPATTERNRECT</a>. If the printer does not support white rules, there is no method for erasing these patterns.
     * 
     * If an application cannot use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162495(v=vs.85)">DRAWPATTERNRECT</a> escape and the device is a printer, it should generally use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-patblt">PatBlt</a> function instead. Note that if <b>PatBlt</b> is used to print a black rectangle, the application should use the BLACKNESS raster operator. If the device is a plotter, however, the application should use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rectangle">Rectangle</a> function.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd144954(v=vs.85)">GET_PS_FEATURESETTING</a> printer escape function retrieves information about a specified feature setting for a PostScript driver.
     * 
     * This escape function is supported only if the PostScript driver is in PostScript-centric mode or in GDI-centric mode. To set the PostScript driver mode, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162829(v=vs.85)">POSTSCRIPT_IDENTIFY</a> escape function.
     * 
     * To perform this operation, call the <b>ExtEscape</b> function with the following parameters.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd144954(v=vs.85)">GET_PS_FEATURESETTING</a> printer escape function is valid if called any time after calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdca">CreateDC</a> function and before calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deletedc">DeleteDC</a> function.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd144931(v=vs.85)">GETTECHNOLOGY</a> printer escape function identifies the type of printer driver.
     * 
     * For non-XPSDrv printers, this escape reports whether the driver is a Postscript driver.
     * 
     * For XPSDrv printers, this escape reports whether the driver is the <a href="https://docs.microsoft.com/windows/desktop/printdocs/microsoft-xps-document-converter--mxdc-">Microsoft XPS Document Converter (MXDC)</a>. If it is, the escape returns the zero-terminated string "http://schemas.microsoft.com/xps/2005/06"
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162776(v=vs.85)">PASSTHROUGH</a> printer escape function sends data directly to a printer driver. To perform this operation, call the <b>ExtEscape</b> function with the following parameters.
     * 
     * The <b>PASSTHROUGH</b> printer escape function is supported by PostScript drivers in GDI-centric mode or compatibility mode, but not in PostScript-centric mode. Drivers in PostScript-centric mode can use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162831(v=vs.85)">POSTSCRIPT_PASSTHROUGH</a> escape function. To set a PostScript driver mode, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162829(v=vs.85)">POSTSCRIPT_IDENTIFY</a> escape function.
     * 
     * For PASSTHROUGH data sent by EPSPRINTING or PostScript-centric applications, the PostScript driver will not make any modifications. For PASSTHROUGH data sent by other applications, if the PostScript driver is using BCP (Binary Communication Protocol) or TBCP (Tagged Binary Communication Protocol) output protocol, the driver does the appropriate BCP or TBCP quoting on special characters, as described in "Adobe Serial and Parallel Communications Protocols Specification." This means that the application should send either ASCII or pure binary PASSTHROUGH data.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162828(v=vs.85)">POSTSCRIPT_DATA</a> printer escape function sends data directly to a printer driver. To perform this operation, call the <b>ExtEscape</b> function with the following parameters.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162828(v=vs.85)">POSTSCRIPT_DATA</a> function is identical to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162776(v=vs.85)">PASSTHROUGH</a> escape function except that it is supported by PostScript drivers in compatibility mode only. It is not supported by PostScript drivers in PostScript-centric mode or in GDI-centric mode.
     * 
     * Drivers in PostScript-centric mode can use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162831(v=vs.85)">POSTSCRIPT_PASSTHROUGH</a> escape function, and drivers in GDI-centric mode can use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162776(v=vs.85)">PASSTHROUGH</a> escape function. To set a PostScript driver's mode, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162829(v=vs.85)">POSTSCRIPT_IDENTIFY</a> escape function.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162829(v=vs.85)">POSTSCRIPT_IDENTIFY</a> printer escape function sets a PostScript driver to GDI-centric mode or PostScript-centric mode.
     * 
     * To put the driver in GDI-centric or PostScript-centric modes, first call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff686811(v=vs.85)">QUERYESCSUPPORT</a> printer escape function to determine whether the driver supports the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162829(v=vs.85)">POSTSCRIPT_IDENTIFY</a> printer escape function. If so, you can assume the driver is PSCRIPT 5.0. Then, before you call any other printer escape function, you must call <b>POSTSCRIPT_IDENTIFY</b> and specify either <b>PSIDENT_GDICENTRIC</b> or <b>PSIDENT_PSCENTRIC</b>. You must call the <b>QUERYESCSUPPORT</b> and <b>POSTSCRIPT_IDENTIFY</b> printer escape functions before calling any other printer escape function.
     * 
     * <div class="alert"><b>Note</b>  After the PostScript driver is set to GDI-centric mode or PostScript-centric mode, you will not be allowed to call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162829(v=vs.85)">POSTSCRIPT_IDENTIFY</a> printer escape function anymore.</div>
     * <div> </div>
     * If you do not use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162829(v=vs.85)">POSTSCRIPT_IDENTIFY</a> printer escape function, the PostScript driver is in compatibility mode and provides identical support for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162776(v=vs.85)">PASSTHROUGH</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162831(v=vs.85)">POSTSCRIPT_PASSTHROUGH</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162828(v=vs.85)">POSTSCRIPT_DATA</a> printer escape functions.
     * 
     * For PostScript drivers that support the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162831(v=vs.85)">POSTSCRIPT_PASSTHROUGH</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162776(v=vs.85)">PASSTHROUGH</a>, and <b>POSTSCRIPT_PASSTHROUGH</b> printer escape functions are identical.
     * 
     * In PostScript-centric mode, the application is responsible for all PostScript output that marks the paper using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162831(v=vs.85)">POSTSCRIPT_PASSTHROUGH</a> escape function. GDI functions are not allowed. The driver is responsible for the overall document structure and printer control settings. The application can use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162830(v=vs.85)">POSTSCRIPT_INJECTION</a> printer escape function to inject a block of raw data (including DSC comments) into the job stream at specific places.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162830(v=vs.85)">POSTSCRIPT_INJECTION</a> printer escape function inserts a block of raw data at a specified point in a PostScript job stream.
     * 
     * A PostScript driver supports this escape function in GDI-centric mode or PostScript-centric mode support, but not  in compatibility mode.
     * 
     * To set the PostScript driver's mode, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162829(v=vs.85)">POSTSCRIPT_IDENTIFY</a> escape function.
     * 
     * To perform this operation, call the <b>ExtEscape</b> function with the following parameters.
     * 
     * The driver internally caches the injection data and emits it at appropriate points in the output. The cached information is flushed when it is no longer needed. At the latest, it is flushed after the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enddoc">EndDoc</a> call.
     * 
     * In GDI-centric mode, the application can only inject valid DSC block data by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162830(v=vs.85)">POSTSCRIPT_INJECTION</a> printer escape function. A valid DSC block must satisfy all of the following conditions:
     * 
     * <ul>
     * <li>It consists of an integral sequence of "lines."</li>
     * <li>Each "line" must begin with "%%".</li>
     * <li>Each "line" except the last line must end with &lt;CR&gt;, &lt;LF&gt;, or &lt;CR&gt;&lt;LF&gt; except for the last line. If the last line does not end with &lt;CR&gt;, &lt;LF&gt;, or &lt;CR&gt;&lt;LF&gt;, the driver appends &lt;CR&gt;&lt;LF&gt; after the last byte of the injection data.</li>
     * <li>Each "line" must be 255 bytes or less including the "%%" but not counting the &lt;CR&gt;/&lt;LF&gt; line termination.</li>
     * </ul>
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162831(v=vs.85)">POSTSCRIPT_PASSTHROUGH</a> printer escape function sends data directly to a PostScript printer driver.
     * 
     * A PostScript driver supports this escape function when in PostScript-centric mode or in compatibility mode, but not in GDI-centric mode.
     * 
     * To set the PostScript driver's mode, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd162829(v=vs.85)">POSTSCRIPT_IDENTIFY</a> escape function.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff686811(v=vs.85)">QUERYESCSUPPORT</a> printer escape function checks the implementation of a printer escape function.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd145110(v=vs.85)">SPCLPASSTHROUGH2</a> printer escape function allows applications that print to PostScript devices using EPSPRINTING to include private PostScript procedures and other resources at the document-level save context.
     * 
     * This escape is supported only for backward compatibility with Adobe Acrobat. Other applications should not use this obsolete escape.
     * 
     * The application must call this escape before calling <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-startdoca">StartDoc</a> so that the driver will cache the data for insertion at the correct point in the PostScript stream. If this escape is supported, the driver will also allow escape <b>DOWNLOADFACE</b> calls prior to <b>StartDoc</b>. The driver internally caches the data to be inserted and the data required by any escape <b>DOWNLOADFACE</b> calls prior to <b>StartDoc</b> and emits them all immediately before %%EndProlog. The sequence of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd145110(v=vs.85)">SPCLPASSTHROUGH2</a> and <b>DOWNLOADFACE</b> calls will be preserved in the order their data is passed in, that is, a later call results in data output after an earlier call's data. The driver will consider fonts downloaded by pre-<b>StartDoc</b> escape <b>DOWNLOADFACE</b> calls as unavailable for removal during the scope of the job.
     * 
     * This escape is not recorded in EMF files by the operating system, therefore applications must ensure that EMF recording is turned off for those jobs using the escape.
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
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-extescape
     * @since windows5.0
     */
    static ExtEscape(hdc, iEscape, cjInput, lpInData, cjOutput, lpOutData) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\ExtEscape", "ptr", hdc, "int", iEscape, "int", cjInput, "ptr", lpInData, "int", cjOutput, "ptr", lpOutData, "int")
        return result
    }

    /**
     * The StartDoc function starts a print job. (ANSI)
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * Applications should call the <b>StartDoc</b> function immediately before beginning a print job. Using this function ensures that multipage documents are not interspersed with other print jobs.
     * 
     * Applications can use the value returned by <b>StartDoc</b> to retrieve or set the priority of a print job. Call the <a href="https://docs.microsoft.com/windows/desktop/printdocs/getjob">GetJob</a> or <a href="https://docs.microsoft.com/windows/desktop/printdocs/setjob">SetJob</a> function and supply this value as one of the required arguments.
     * @param {HDC} hdc A handle to the device context for the print job.
     * @param {Pointer<DOCINFOA>} lpdi A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-docinfoa">DOCINFO</a> structure containing the name of the document file and the name of the output file.
     * @returns {Integer} If the function succeeds, the return value is greater than zero. This value is the print job identifier for the document.
     * 
     * If the function fails, the return value is less than or equal to zero.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-startdoca
     * @since windows5.0
     */
    static StartDocA(hdc, lpdi) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\StartDocA", "ptr", hdc, "ptr", lpdi, "int")
        return result
    }

    /**
     * The StartDoc function starts a print job. (Unicode)
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * Applications should call the <b>StartDoc</b> function immediately before beginning a print job. Using this function ensures that multipage documents are not interspersed with other print jobs.
     * 
     * Applications can use the value returned by <b>StartDoc</b> to retrieve or set the priority of a print job. Call the <a href="https://docs.microsoft.com/windows/desktop/printdocs/getjob">GetJob</a> or <a href="https://docs.microsoft.com/windows/desktop/printdocs/setjob">SetJob</a> function and supply this value as one of the required arguments.
     * @param {HDC} hdc A handle to the device context for the print job.
     * @param {Pointer<DOCINFOW>} lpdi A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-docinfow">DOCINFO</a> structure containing the name of the document file and the name of the output file.
     * @returns {Integer} If the function succeeds, the return value is greater than zero. This value is the print job identifier for the document.
     * 
     * If the function fails, the return value is less than or equal to zero.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-startdocw
     * @since windows5.0
     */
    static StartDocW(hdc, lpdi) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\StartDocW", "ptr", hdc, "ptr", lpdi, "int")
        return result
    }

    /**
     * The EndDoc function ends a print job.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * Applications should call <b>EndDoc</b> immediately after finishing a print job.
     * @param {HDC} hdc Handle to the device context for the print job.
     * @returns {Integer} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is less than or equal to zero.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-enddoc
     * @since windows5.0
     */
    static EndDoc(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\EndDoc", "ptr", hdc, "int")
        return result
    }

    /**
     * The StartPage function prepares the printer driver to accept data.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * The system disables the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-resetdca">ResetDC</a> function between calls to the <b>StartPage</b> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-endpage">EndPage</a> functions. This means that you cannot change the device mode except at page boundaries. After calling <b>EndPage</b>, you can call <b>ResetDC</b> to change the device mode, if necessary. Note that a call to <b>ResetDC</b> resets all device context attributes back to default values.
     * 
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-endpage">EndPage</a> nor <b>StartPage</b> resets the device context attributes. Device context attributes remain constant across subsequent pages. You do not need to re-select objects and set up the mapping mode again before printing the next page; however, doing so will produce the same results and reduce code differences between versions of Windows.
     * @param {HDC} hdc A handle to the device context for the print job.
     * @returns {Integer} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is less than or equal to zero.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-startpage
     * @since windows5.0
     */
    static StartPage(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\StartPage", "ptr", hdc, "int")
        return result
    }

    /**
     * The EndPage function notifies the device that the application has finished writing to a page. This function is typically used to direct the device driver to advance to a new page.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-resetdca">ResetDC</a> function to change the device mode, if necessary, after calling the <b>EndPage</b> function. Note that a call to <b>ResetDC</b> resets all device context attributes back to default values. Neither <b>EndPage</b> nor <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-startpage">StartPage</a> resets the device context attributes. Device context attributes remain constant across subsequent pages. You do not need to re-select objects and set up the mapping mode again before printing the next page; however, doing so will produce the same results and reduce code differences between versions of Windows.
     * 
     * When a page in a spooled file exceeds approximately 350 MB, it may fail to print and not send an error message. For example, this can occur when printing large EMF files. The page size limit depends on many factors including the amount of virtual memory available, the amount of memory allocated by calling processes, and the amount of fragmentation in the process heap.
     * @param {HDC} hdc A handle to the device context for the print job.
     * @returns {Integer} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is less than or equal to zero.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-endpage
     * @since windows5.0
     */
    static EndPage(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\EndPage", "ptr", hdc, "int")
        return result
    }

    /**
     * The AbortDoc function stops the current print job and erases everything drawn since the last call to the StartDoc function.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * Applications should call the <b>AbortDoc</b> function to stop a print job if an error occurs, or to stop a print job after the user cancels that job. To end a successful print job, an application should call the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enddoc">EndDoc</a> function.
     * 
     * If Print Manager was used to start the print job, calling <b>AbortDoc</b> erases the entire spool job, so that the printer receives nothing. If Print Manager was not used to start the print job, the data may already have been sent to the printer. In this case, the printer driver resets the printer (when possible) and ends the print job.
     * @param {HDC} hdc Handle to the device context for the print job.
     * @returns {Integer} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is SP_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-abortdoc
     * @since windows5.0
     */
    static AbortDoc(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\AbortDoc", "ptr", hdc, "int")
        return result
    }

    /**
     * The SetAbortProc function sets the application-defined abort function that allows a print job to be canceled during spooling.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * @param {HDC} hdc Handle to the device context for the print job.
     * @param {Pointer<ABORTPROC>} proc Pointer to the application-defined abort function. For more information about the callback function, see the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nc-wingdi-abortproc">AbortProc</a> callback function.
     * @returns {Integer} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is SP_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-setabortproc
     * @since windows5.0
     */
    static SetAbortProc(hdc, proc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("GDI32.dll\SetAbortProc", "ptr", hdc, "ptr", proc, "int")
        return result
    }

    /**
     * The PrintWindow function copies a visual window into the specified device context (DC), typically a printer DC.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * The application that owns the window referenced by hWnd processes the <b>PrintWindow</b> call and renders the image in the device context that is referenced by <i>hdcBlt</i>. The application  receives a <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-print">WM_PRINT</a> message or, if the <b>PW_PRINTCLIENT</b> flag is specified, a <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-printclient">WM_PRINTCLIENT</a> message.
     * For more information, see <b>WM_PRINT</b> and <b>WM_PRINTCLIENT</b>.
     * @param {HWND} hwnd A handle to the window that will be copied.
     * @param {HDC} hdcBlt A handle to the device context.
     * @param {Integer} nFlags 
     * @returns {BOOL} If the function succeeds, it returns a nonzero value.
     * 
     * If the function fails, it returns zero.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-printwindow
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
