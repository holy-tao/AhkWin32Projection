#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MBN_INTERFACE_CAPS structure represents the interface capabilities.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ns-mbnapi-mbn_interface_caps
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_INTERFACE_CAPS extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_cellular_class">MBN_CELLULAR_CLASS</a> value that specifies the cellular technology used by the device.
     * @type {Integer}
     */
    cellularClass {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_voice_class">MBN_VOICE_CLASS</a> value that specifies   how voice calls are handled.
     * @type {Integer}
     */
    voiceClass {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A bitwise OR combination of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_data_class">MBN_DATA_CLASS</a> values that specifies which data services are supported.  For GSM devices, only the GSM-based data services can be present, that is, only GPRS, EDGE, UMTS, LTE, and HSDPA are valid values for GSM devices.
     * 
     * For CDMA devices, only the CDMA-related data services will be present, that is, only 1xRTT, 1xEV-DO, and 1xEV-DO RevA are valid values for CDMA devices.  1xEV-DO RevB is reserved for future use.
     * 
     * This field has the bit value <b>MBN_DATA_CLASS_CUSTOM</b> set if the data class some other data class which is not defined in the enumeration is also supported by device. If <b>MBN_DATA_CLASS_CUSTOM</b> is set then information regarding custom data class is available in <i>customDataClass</i> field.
     * @type {Integer}
     */
    dataClass {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Contains the name of the custom data class.  If the <b>MBN_DATA_CLASS_CUSTOM</b> bit  of <b>dataClass</b> is not set, then the string is <b>NULL</b>.  Otherwise, the caller must free this string by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @type {Pointer<BSTR>}
     */
    customDataClass {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A bit field that specifies the frequency bands  supported by the GSM device.  <b>MBN_BAND_CLASS_I</b> through <b>MBN_BAND_CLASS_X</b> and <b>MBN_BAND_CLASS_CUSTOM</b>  are valid values.  These values are defined by <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_band_class">MBN_BAND_CLASS</a>. If <b>gsmBandClass</b> is set to <b>MBN_BAND_CLASS_CUSTOM</b>, additional information about the band class appears in <b>customBandClass</b>.
     * 
     * The following table provides additional information about  the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_band_class">MBN_BAND_CLASS</a> values. 
     * 
     * <table>
     * <tr>
     * <th>MBN_BAND_CLASS Value</th>
     * <th>Designated spectrum</th>
     * <th>Industry name</th>
     * <th>Uplink (MS to BTS)</th>
     * <th>Downlink (BTS to MS)</th>
     * <th>Regions</th>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_I</b></td>
     * <td>UMTS2100</td>
     * <td>IMT</td>
     * <td>1920-1980</td>
     * <td>2110-2170</td>
     * <td>Europe, Korea, Japan China</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_II</b></td>
     * <td>UMT21900</td>
     * <td>PCS1900</td>
     * <td>1850-1910</td>
     * <td>1930-1990</td>
     * <td>North America, Latin America</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_III</b></td>
     * <td>UMTS1800</td>
     * <td>DCS1800</td>
     * <td>1710-1785</td>
     * <td>1805-1880</td>
     * <td>Europe, China</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_IV</b></td>
     * <td>AWS</td>
     * <td>AWS, 1.7/2.1</td>
     * <td>1710-1785</td>
     * <td>2110-2155</td>
     * <td>North America, Latin America</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_V</b></td>
     * <td>UMTS850</td>
     * <td>GSM850</td>
     * <td>824-849</td>
     * <td>869-894</td>
     * <td>North America, Latin America</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_VI</b></td>
     * <td>UMTS800</td>
     * <td>UMTS800</td>
     * <td>830-840</td>
     * <td>875-885</td>
     * <td>Japan</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_VII</b></td>
     * <td>UMTS2600</td>
     * <td>UMTS2600</td>
     * <td>2500-2570</td>
     * <td>2620-2690</td>
     * <td>Europe</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_VIII</b></td>
     * <td>UMTS900</td>
     * <td>EGSM900</td>
     * <td>880-915</td>
     * <td>925-960</td>
     * <td>Europe, China</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_IX</b></td>
     * <td>UMTS1700</td>
     * <td>UMTS1700</td>
     * <td>1750-1770</td>
     * <td>1845-1880</td>
     * <td>Japan</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_X</b></td>
     * <td></td>
     * <td></td>
     * <td>1710-1770</td>
     * <td>2110-2170</td>
     * <td></td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    gsmBandClass {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A bit field that specifies the frequency bands supported by the CDMA device.  <b>MBN_BAND_CLASS_0</b> through <b>MBN_BAND_CLASS_XVII</b>, <b>MBN_BAND_CLASS_NONE</b>, and  <b>MBN_BAND_CLASS_CUSTOM</b> are valid values.  These values are defined by <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_band_class">MBN_BAND_CLASS</a>.  If <b>cdmaBandClass</b> is set to <b>MBN_BAND_CLASS_CUSTOM</b>, additional information about the band class appears in <b>customBandClass</b>. 
     * 
     * The following table provides additional information about MBN_BAND_CLASS values.
     * 
     * <table>
     * <tr>
     * <th>MBN_BAND_CLASS Value</th>
     * <th>Industry Name</th>
     * <th>Uplink (MS to BTS)</th>
     * <th>Downlink (BTS to MS)</th>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_0</b></td>
     * <td>800MHx Cellular</td>
     * <td>824.025.844.995</td>
     * <td>869.025.889.995</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_I</b></td>
     * <td>1900MHz Band</td>
     * <td>1850-1910</td>
     * <td>1930-1990</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_II</b></td>
     * <td>TACS Band</td>
     * <td>872.025.914.9875</td>
     * <td>917.0125.959.9875</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_III</b></td>
     * <td>JTACS Band</td>
     * <td>887.0125.924.9875</td>
     * <td>832.0125.869.9875</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_IV</b></td>
     * <td>Korean PCS Band</td>
     * <td>1750-1780</td>
     * <td>1840-1870</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_V</b></td>
     * <td>450 MHz Band</td>
     * <td>410-483.475</td>
     * <td>420-493.475</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_VI</b></td>
     * <td>2 GHz Band</td>
     * <td>1920-1979.950</td>
     * <td>2110-2169.950</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_VII</b></td>
     * <td>700 MHz Band</td>
     * <td>776-794</td>
     * <td>746-764</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_VIII</b></td>
     * <td>1800 MHz Band</td>
     * <td>1710-1784.950</td>
     * <td>1805-1879.95</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_IX</b></td>
     * <td>900 MHz Band</td>
     * <td>880-914-950</td>
     * <td>925-959.950</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_X</b></td>
     * <td>Secondary 800 MHz Band</td>
     * <td>806-900.975</td>
     * <td>851-939.975</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_XI</b></td>
     * <td>400 MHz European PAMR Band</td>
     * <td>410-483.475</td>
     * <td>420-493.475</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_XII</b></td>
     * <td>800 MHz PAMR Band</td>
     * <td>870.125-875.9875</td>
     * <td>915.0125-920.9875</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_XIII</b></td>
     * <td>2.5 GHz IMT200 Extension Band</td>
     * <td>2500-2570</td>
     * <td>2620-2690</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_XIV</b></td>
     * <td>US PCS 1.9 GHz Band</td>
     * <td>1850-1915</td>
     * <td>1930-1995</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_XV</b></td>
     * <td>AWS Band</td>
     * <td>1710-1755</td>
     * <td>2110-2155</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_XVI</b></td>
     * <td>US 2.5 GHz Band</td>
     * <td>2502-2568</td>
     * <td>2624-2690</td>
     * </tr>
     * <tr>
     * <td><b>MBN_BAND_CLASS_XVII</b></td>
     * <td>US 2.5 GHz Forward Link Only Band</td>
     * <td></td>
     * <td>2624-2690</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    cdmaBandClass {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Contains the name of the custom band class.  If the <b>MBN_BAND_CLASS_CUSTOM</b> bit  of <b>cdmaBandClass</b> and <b>gsmBandClass</b> is not set, then the string is <b>NULL</b>.  Otherwise, the caller must free this string by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @type {Pointer<BSTR>}
     */
    customBandClass {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A bitwise OR combination of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_sms_caps">MBN_SMS_CAPS</a> values that specifies the SMS capabilities.
     * @type {Integer}
     */
    smsCaps {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * A bitwise OR combination of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_ctrl_caps">MBN_CTRL_CAPS</a> values that represents the Mobile Broadband control capabilities for this interface.
     * @type {Integer}
     */
    controlCaps {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Contains the device ID.  For GSM devices, this must be the IMEI (up to 15 digits).  For CDMA devices, this must be the ESN (11 digits) / MEID (17 digits).  The maximum length of the string is <b>MBN_DEVICEID_LEN</b>.  For the definition of <b>MBN_DEVICEID_LEN</b>, see <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_interface_caps_constants">MBN_INTERFACE_CAPS_CONSTANTS</a>.  The caller must free this string by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @type {Pointer<BSTR>}
     */
    deviceID {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Contains the name of the device manufacturer.  This string can be empty.  The maximum length of the string is <b>MBN_MANUFACTURER_LEN</b>.  For the definition of <b>MBN_MANUFACTURER_LEN</b>, see <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_interface_caps_constants">MBN_INTERFACE_CAPS_CONSTANTS</a>.  The caller must free this string by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @type {Pointer<BSTR>}
     */
    manufacturer {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Contains the device model.  This string can be empty.  The maximum length of this string is <b>MBN_MODEL_LEN</b>.  For the definition of <b>MBN_MODEL_LEN</b>, see <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_interface_caps_constants">MBN_INTERFACE_CAPS_CONSTANTS</a>.  The caller must free this string by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @type {Pointer<BSTR>}
     */
    model {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Contains the firmware-specific information for this device.  This string can be empty.  The maximum length of the string is <b>MBN_FIRMWARE_LEN</b>.  For the definition of <b>MBN_FIRMWARE_LEN</b>, see <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_interface_caps_constants">MBN_INTERFACE_CAPS_CONSTANTS</a>.  The caller must free this string by calling <a href=" http://msdn.microsoft.com/en-us/library/ms221481.aspx">SysFreeString</a>.
     * @type {Pointer<BSTR>}
     */
    firmwareInfo {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
