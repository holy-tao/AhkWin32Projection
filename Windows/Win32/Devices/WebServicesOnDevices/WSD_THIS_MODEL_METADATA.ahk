#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSD_LOCALIZED_STRING_LIST.ahk" { WSD_LOCALIZED_STRING_LIST }

/**
 * Provides model-specific information relating to the device.
 * @remarks
 * <b>WSD_THIS_MODEL_METADATA</b> specifies manufacturer metadata that is common to all instances of a specific model.
 * 
 * 
 * 
 * 
 * 
 * Model metadata follows this form:
 * 
 * 
 * ``` syntax
 * &lt;wsd:ThisModel&gt;
 *     &lt;wsd:Manufacturer&gt;
 *         A. Datum Corporation
 *     &lt;/wsd:Manufacturer&gt;
 *     &lt;wsd:ManufacturerURL&gt;
 *         http://www.adatum.com
 *     &lt;/wsd:ManufacturerURL&gt;
 *     &lt;wsd:ModelName&gt;
 *         WebWeigh
 *     &lt;/wsd:ModelName&gt;
 *     &lt;wsd:ModelNumber&gt;
 *         9-23492-83049
 *     &lt;/wsd:ModelNumber&gt;
 *     &lt;wsd:ModelURL&gt;
 *         http://www.adatum.com/WebWeighOwner.html 
 *     &lt;/wsd:ModelURL&gt;
 *     &lt;wsd:PresentationURL&gt;
 *         presentation/menu.html
 *     &lt;/wsd:PresentationURL&gt;
 * &lt;/wsd:ThisModel&gt;
 * 
 * 
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_this_model_metadata
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_THIS_MODEL_METADATA {
    #StructPack 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_localized_string_list">WSD_LOCALIZED_STRING_LIST</a> structure that contains the manufacturer name. The name should be set to fewer than 2048 characters.
     */
    Manufacturer : WSD_LOCALIZED_STRING_LIST.Ptr

    /**
     * The URL to a Web site for the device manufacturer. The URL should have fewer than 2048 characters.
     */
    ManufacturerUrl : PWSTR

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_localized_string_list">WSD_LOCALIZED_STRING_LIST</a> structure that specifies model names. This is a list of localized friendly names that should be set to fewer than 256 characters.
     */
    ModelName : WSD_LOCALIZED_STRING_LIST.Ptr

    /**
     * The model number. This should be set to fewer than 256 characters.
     */
    ModelNumber : PWSTR

    /**
     * The URL to a Web site for this device model. The URL should have fewer than 2048 characters.
     */
    ModelUrl : PWSTR

    /**
     * An HTML page for this device. This can be relative to a base URL set by XML Base. The URL should have fewer than 2048 characters.
     */
    PresentationUrl : PWSTR

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     */
    Any : WSDXML_ELEMENT.Ptr

}
