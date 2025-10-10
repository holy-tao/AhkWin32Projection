#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides model-specific information relating to the device.
 * @remarks
 * 
  * <b>WSD_THIS_MODEL_METADATA</b> specifies manufacturer metadata that is common to all instances of a specific model.
  * 
  * 
  * 
  * 
  * 
  * Model metadata follows this form:
  * 
  * <pre class="syntax" xml:space="preserve"><code>&lt;wsd:ThisModel&gt;
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
  * </code></pre>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdtypes/ns-wsdtypes-wsd_this_model_metadata
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_THIS_MODEL_METADATA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_localized_string_list">WSD_LOCALIZED_STRING_LIST</a> structure that contains the manufacturer name. The name should be set to fewer than 2048 characters.
     * @type {Pointer<WSD_LOCALIZED_STRING_LIST>}
     */
    Manufacturer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The URL to a Web site for the device manufacturer. The URL should have fewer than 2048 characters.
     * @type {Pointer<Char>}
     */
    ManufacturerUrl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_localized_string_list">WSD_LOCALIZED_STRING_LIST</a> structure that specifies model names. This is a list of localized friendly names that should be set to fewer than 256 characters.
     * @type {Pointer<WSD_LOCALIZED_STRING_LIST>}
     */
    ModelName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The model number. This should be set to fewer than 256 characters.
     * @type {Pointer<Char>}
     */
    ModelNumber {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The URL to a Web site for this device model. The URL should have fewer than 2048 characters.
     * @type {Pointer<Char>}
     */
    ModelUrl {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * An HTML page for this device. This can be relative to a base URL set by XML Base. The URL should have fewer than 2048 characters.
     * @type {Pointer<Char>}
     */
    PresentationUrl {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     * @type {Pointer<WSDXML_ELEMENT>}
     */
    Any {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
