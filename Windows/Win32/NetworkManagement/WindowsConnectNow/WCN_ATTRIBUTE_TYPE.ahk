#Requires AutoHotkey v2.0.0 64-bit

/**
 * WCN_ATTRIBUTE_TYPE enumeration defines the attribute buffer types defined for Wi-Fi Protected Setup. The overall size occupied by each attribute buffer includes an additional 4 bytes (2 bytes of ID, 2 bytes of Length).
 * @see https://docs.microsoft.com/windows/win32/api//wcntypes/ne-wcntypes-wcn_attribute_type
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class WCN_ATTRIBUTE_TYPE{

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is a value containing data that specifies the 802.11 channel the access point is hosting.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_AP_CHANNEL => 0

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/win32/api/wcntypes/ne-wcntypes-wcn_value_type_association_state">IWCNDevice::GetIntegerAttribute</a> method is a value containing the association   state or configuration information defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcntypes/ne-wcntypes-wcn_value_type_association_state">WCN_VALUE_TYPE_ASSOCIATION_STATE</a>.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_ASSOCIATION_STATE => 1

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/win32/api/wcntypes/ne-wcntypes-wcn_value_type_authentication_type">IWCNDevice::GetIntegerAttribute</a> method is a value containing an authentication type defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcntypes/ne-wcntypes-wcn_value_type_authentication_type">WCN_VALUE_TYPE_AUTHENTICATION_TYPE</a>.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_AUTHENTICATION_TYPE => 2

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is a value containing  data that specifies the network authentication capabilities of the Enrollee (access point or station) by providing a
 *  value defined by <a href="https://docs.microsoft.com/windows/win32/api/wcntypes/ne-wcntypes-wcn_value_type_authentication_type">WCN_VALUE_TYPE_AUTHENTICATION_TYPE</a>.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_AUTHENTICATION_TYPE_FLAGS => 3

    /**
     * This attribute value indicates that the <i>wszString</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetStringAttribute</a> method is a buffer containing a keyed hash of data.
 * 
 * <div class="alert"><b>Note</b>  Security is handled transparently by Windows.  As a result, applications do not need to query or set this attribute.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_AUTHENTICATOR => 4

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method contains values, defined by   <a href="https://docs.microsoft.com/windows/desktop/api/wcntypes/ne-wcntypes-wcn_value_type_config_methods">WCN_VALUE_TYPE_CONFIG_METHODS</a>, that specify the configuration methods supported by the Enrollee or Registrar. Additionally, access points and stations
 * that support the UPnP Management Interface must also support this attribute, which
 * is used to control the configuration methods that are enabled on the access point.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_CONFIG_METHODS => 5

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/win32/api/wcntypes/ne-wcntypes-wcn_value_type_configuration_error">IWCNDevice::GetIntegerAttribute</a> method is a value, defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcntypes/ne-wcntypes-wcn_value_type_configuration_error">WCN_VALUE_TYPE_CONFIGURATION_ERROR</a>, that specifies the result of the device attempting to configure itself and associate with the WLAN.
 * 
 * If a configuration session fails with the error code WCN_E_CONNECTION_REJECTED, any error code returned by the remote device can be obtained by querying this attribute. It is important to note that some devices will return WCN_VALUE_CE_NO_ERROR even if an error has occurred.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_CONFIGURATION_ERROR => 6

    /**
     * This attribute value indicates that the <i>wszString</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getstringattribute">IWCNDevice::GetStringAttribute</a> method is  a buffer that contains data representing the URL (IPv4 address based) provided by the Registrar to the Enrollee for use in posting confirmation
 * once settings have been successfully applied and the network has been joined. This configuration
 * parameter is optional for a Registrar, and it is optional for the Enrollee to post to the URL if the Registrar
 * includes it. 
 * 
 * <div class="alert"><b>Note</b>  An Enrollee must not connect to a confirmation URL that is on a different subnet.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_CONFIRMATION_URL4 => 7

    /**
     * This attribute value indicates that the <i>wszString</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getstringattribute">IWCNDevice::GetStringAttribute</a> method is a buffer that contains data representing the URL (IPv6 address based) provided by the Registrar to the Enrollee for use in posting a confirmation
 * once settings have been successfully applied and the network has been joined. This configuration
 * parameter is optional for a Registrar and it is optional for the Enrollee to post to the URL if the Registrar
 * includes it. 
 * 
 * <div class="alert"><b>Note</b>  The Enrollee must not connect to a confirmation URL that is on a different subnet.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_CONFIRMATION_URL6 => 8

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method contains a value, defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcntypes/ne-wcntypes-wcn_value_type_connection_type">WCN_VALUE_TYPE_CONNECTION_TYPE</a>, that specifies the connection capability of the Enrollee.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_CONNECTION_TYPE => 9

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method contains a value, defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcntypes/ne-wcntypes-wcn_value_type_connection_type">WCN_VALUE_TYPE_CONNECTION_TYPE</a>, that specifies the connection capability of the Enrollee.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_CONNECTION_TYPE_FLAGS => 10

    /**
     * This compound attribute value indicates that the <i>pbBuffer</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getattribute">IWCNDevice::GetAttribute</a> method contains a single WLAN Credential. There can be either multiple Credential attributes for each Network Key, or multiple
 * Network Keys in a single Credential attribute, which is accomplished by repeating the Network Key Index and attributes that
 * follow it.  Generally, multiple
 * keys in a single Credential for a single SSID should be used, and multiple Credential attributes for
 * separate SSIDs should be used. The following attributes are contained in each instance of Credential:
 * 
 * <ul>
 * <li>WCN_TYPE_AUTHENTICATION_TYPE</li>
 * <li>WCN_TYPE_ENCRYPTION_TYPE</li>
 * <li>WCN_TYPE_SSID</li>
 * <li>WCN_TYPE_NETWORK_INDEX</li>
 * </ul>
 * If an application intends to use the network credential with the WLAN API, it should use <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getnetworkprofile">IWCNDevice::GetNetworkProfile</a> to get a compatible XML network profile directly.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_CREDENTIAL => 11

    /**
     * This attribute value indicates that the <i>wszString</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetStringAttribute</a> method is a buffer that contains  a user-friendly description of the device encoded in UTF-8. Typically, the component
 * would be a unique identifier that describes the product in a way that is recognizable to the user.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_DEVICE_NAME => 12

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method contains a value, defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcntypes/ne-wcntypes-wcn_value_type_device_password_id">WCN VALUE TYPE DEVICE_PASSWORD_ID</a>, that is used to identify a device password.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_DEVICE_PASSWORD_ID => 13

    /**
     * This attribute value indicates that the <i>pbBuffer</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getattribute">IWCNDevice::GetAttribute</a> method contains the HMAC-SHA-256 hash of the first half of the device password and the Enrollee’s first secret
 * nonce.
 * 
 * <div class="alert"><b>Note</b>  Security is handled transparently by Windows.  As a result, applications do not need to query or set this attribute.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_E_HASH1 => 14

    /**
     * This attribute value indicates that the <i>pbBuffer</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getattribute">IWCNDevice::GetAttribute</a> method contains the HMAC-SHA-256 hash of the second half of the device password, and the Enrollee’s second
 * secret nonce.
 * 
 * <div class="alert"><b>Note</b>  Security is handled transparently by Windows.  As a result, applications do not need to query or set this attribute.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_E_HASH2 => 15

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method contains the first nonce used by the Enrollee with the first half of the device password.
 * 
 * <div class="alert"><b>Note</b>  Security is handled transparently by Windows.  As a result, applications do not need to query or set this attribute.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_E_SNONCE1 => 16

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method contains the second nonce used by the Enrollee with the second half of the device password.
 * 
 * <div class="alert"><b>Note</b>  Security is handled transparently by Windows.  As a result, applications do not need to query or set this attribute.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_E_SNONCE2 => 17

    /**
     * This attribute value indicates that the <i>pbBuffer</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getattribute">IWCNDevice::GetAttribute</a> method contains an initialization vector (IV) followed by a set
 * of encrypted Wi-Fi Protected Setup TLV attributes. The last attribute in the encrypted set is a Key Wrap
 * Authenticator computed according to the procedure described in section 6.5.
 * 
 * <div class="alert"><b>Note</b>  Security is handled transparently by Windows.  As a result, applications do not need to query or set this attribute.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_ENCRYPTED_SETTINGS => 18

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method contains a value, defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcntypes/ne-wcntypes-wcn_value_type_encryption_type">WCN_VALUE_TYPE_ENCRYPTION_TYPE</a>,  for the Enrollee (AP or
 * station) to use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_ENCRYPTION_TYPE => 19

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method contains a value, defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcntypes/ne-wcntypes-wcn_value_type_encryption_type">WCN_VALUE_TYPE_ENCRYPTION_TYPE</a>,  for the Enrollee (AP or
 * station) to use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_ENCRYPTION_TYPE_FLAGS => 20

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method contains a randomly generated binary value that is created by the Enrollee for
 * setup operations.
 * 
 * <div class="alert"><b>Note</b>  Security is handled transparently by Windows.  As a result, applications do not need to query or set this attribute.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_ENROLLEE_NONCE => 21

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method contains data that indicates a particular feature build for an operating system running on the device. The most significant bit of the 4 byte integer is reserved, and always set to one.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_FEATURE_ID => 22

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_IDENTITY => 23

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_IDENTITY_PROOF => 24

    /**
     * This attribute value indicates that the <i>wszString</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetStringAttribute</a> method is a 8 byte buffer containing the first 64 bits of the HMAC-SHA-256 computed over the data to be encrypted
 * with the key wrap algorithm. It is appended to the end of the ConfigData prior to encryption.
 * 
 * <div class="alert"><b>Note</b>  Security is handled transparently by Windows.  As a result, applications do not need to query or set this attribute.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_KEY_WRAP_AUTHENTICATOR => 25

    /**
     * This attribute value indicates that the <i>wszString</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getattribute">IWCNDevice::GetAttribute</a> method is a 16 byte buffer containing a 128-bit key identifier. If this attribute immediately precedes an Encrypted Data
 * or Authenticator attribute, then the key corresponding to the 128-bit identifier should be used to decrypt
 * or verify the Data field.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_KEY_IDENTIFIER => 26

    /**
     * This attribute value indicates that the <i>pbBuffer</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getattribute">IWCNDevice::GetAttribute</a> method is a 6 byte buffer containing the 48 bit value of the MAC Address. For 
 * example: 0x00 0x07 0xE9 0x4C 0xA8 0x1C.
 * 
 * This address is supplied by the remote device.  Some Access Points give the MAC address of their Ethernet interface, in which case, the address cannot be used to locate the AP’s wireless radio.  If an application needs to locate an AP’s radio, the application should query the WCN_TYPE_BSSID attribute, which is populated by Windows and is generally more reliable.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_MAC_ADDRESS => 27

    /**
     * This attribute value indicates that the <i>pbBuffer</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getattribute">IWCNDevice::GetAttribute</a> method is a buffer containing a string that identifies the manufacturer of the device.
 * Generally, this field should allow a user to make an association with a device with the labeling on the
 * device.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_MANUFACTURER => 28

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_MESSAGE_TYPE => 29

    /**
     * This attribute value indicates that the <i>wszString</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetStringAttribute</a> method is a buffer that identifies the model of the device. Generally, this field
 * should allow a user to create an association of a device with the labeling on the device.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_MODEL_NAME => 30

    /**
     * This attribute value indicates that the <i>wszString</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetStringAttribute</a> method is a string containing additional descriptive  data associated with the device.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_MODEL_NUMBER => 31

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is a 1 byte buffer  used to get and set network settings for devices that host more than one network. The
 * default value is '1' which refers to the primary WLAN network on the device.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_NETWORK_INDEX => 32

    /**
     * This attribute value indicates that the <i>wszString</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetStringAttribute</a> method is a buffer containing  the wireless encryption key to be used by the Enrollee. Note that it is recommended that applications  implement  <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getnetworkprofile">IWCNDevice::GetNetworkProfile</a>  to get network settings in a convenient format that is ready to be used with the WLAN connection and profile management APIs.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_NETWORK_KEY => 33

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_NETWORK_KEY_INDEX => 34

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_NEW_DEVICE_NAME => 35

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_NEW_PASSWORD => 36

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_OOB_DEVICE_PASSWORD => 37

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is a 4 byte buffer that contains the operating system version running on the device. The most significant bit of this 4 byte field is reserved, and always set to one.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_OS_VERSION => 38

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_POWER_LEVEL => 39

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_PSK_CURRENT => 40

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_PSK_MAX => 41

    /**
     * Reserved. Do not use.  We recommend that a shared secret be sent by way of a vendor extension or that you find another way to do cryptography.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_PUBLIC_KEY => 42

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_RADIO_ENABLED => 43

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_REBOOT => 44

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_REGISTRAR_CURRENT => 45

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_REGISTRAR_ESTABLISHED => 46

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_REGISTRAR_LIST => 47

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_REGISTRAR_MAX => 48

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is a 16 byte buffer containing a randomly generated binary value  created by the Registrar for
 * setup.
 * 
 * <div class="alert"><b>Note</b>  Security is handled transparently by Windows.  As a result, applications do not need to query or set this attribute.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_REGISTRAR_NONCE => 49

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_REQUEST_TYPE => 50

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_RESPONSE_TYPE => 51

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is an integer value, defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcntypes/ne-wcntypes-wcn_value_type_rf_bands">WCN_VALUE_TYPE_RF_BANDS</a>, that indicates which RF band is utilized during message exchange, permitting end
 * points and proxies to communicate over a consistent radio interface. It may also be used as an optional
 * attribute in a <b>WCN_TYPE_CREDENTIAL</b> or <b>WCN_TYPE_ENCRYPTED_SETTINGS</b> to indicate a specific (or group) of RF bands to which a
 * setting applies.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_RF_BANDS => 52

    /**
     * This attribute value indicates that the <i>wszString</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetStringAttribute</a> method is a 32 byte buffer that containing  the HMAC-SHA-256 hash of the first half of the device password and the Registrar’s first secret
 * nonce.
 * 
 * <div class="alert"><b>Note</b>  Security is handled transparently by Windows.  As a result, applications do not need to query or set this attribute.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_R_HASH1 => 53

    /**
     * This attribute value indicates that the <i>wszString</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetStringAttribute</a> method is a 32 byte buffer containing the HMAC-SHA-256 hash of the second half of the device password and the Registrar’s second
 * secret nonce.
 * 
 * <div class="alert"><b>Note</b>  Security is handled transparently by Windows.  As a result, applications do not need to query or set this attribute.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_R_HASH2 => 54

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is a 16 byte buffer containing the first nonce used by the Registrar with the first half of the device password.
 * 
 * <div class="alert"><b>Note</b>  Security is handled transparently by Windows.  As a result, applications do not need to query or set this attribute.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_R_SNONCE1 => 55

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is a 16 byte buffer containing the second nonce used by the Registrar with the second half of the device password.
 * 
 * <div class="alert"><b>Note</b>  Security is handled transparently by Windows.  As a result, applications do not need to query or set this attribute.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_R_SNONCE2 => 56

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is an integer value, defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcntypes/ne-wcntypes-wcn_value_type_boolean">WCN_VALUE_TYPE_BOOLEAN</a>, that indicates if a Registrar has been selected by a user and that an Enrollee can proceed with
 * setting up an 802.1X uncontrolled data port with the Registrar.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_SELECTED_REGISTRAR => 57

    /**
     * This attribute value indicates that the <i>wszString</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetStringAttribute</a> method is a string containing the serial number of the Enrollee.
 * 
 * <div class="alert"><b>Note</b>  Not all devices supply a serial number. Some devices return a string of non-numeric characters, and as a result it is not always possible to convert this value to a number. </div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_SERIAL_NUMBER => 58

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method an integer value, defined by WCN_VALUE_TYPE_WI_FI_PROTECTED_SETUP, that indicates if a device is configured.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_WI_FI_PROTECTED_SETUP_STATE => 59

    /**
     * This attribute value indicates that the <i>pbData</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getattribute">IWCNDevice::GetAttribute</a> method is a  buffer, up to 32 bytes in size, containing the Service Set Identifier (SSID) or network name.
 * 
 * Instead of querying this attribute, it is recommended that applications implement <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getnetworkprofile">IWCNDevice::GetNetworkProfile</a> to retrieve network settings in a convenient format that is ready to be used with the WLAN connection and profile management APIs.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_SSID => 60

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_TOTAL_NETWORKS => 61

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is a 16 byte buffer containing the Universally Unique Identifier (UUID) generated by the Enrollee. It
 * uniquely identifies an operational device and should survive reboots and resets. The UUID is provided in
 * binary format. If the device also supports UPnP, then the UUID corresponds to the UPnP UUID.
 * 
 * Instead of querying this attribute, applications should instead query the WCN_TYPE_UUID attribute, as it is available for both enrollees and registrars. WCN_TYPE_UUID_E_ is only available for devices that act as an enrollee.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_UUID_E => 62

    /**
     * This attribute value indicates that the <i>pbBuffer</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getattribute">IWCNDevice::GetAttribute</a> method is a 16 byte buffer containing the  Universally Unique Identifier (UUID) element generated by the Registrar. It
 * uniquely identifies an operational device and should survive reboots and resets. The UUID is provided in
 * binary format. If the device also supports UPnP, then the UUID corresponds to the UPnP UUID.
 * 
 * Instead of querying this attribute, applications should instead query the WCN_TYPE_UUID attribute, as it is available for both enrollees and registrars.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_UUID_R => 63

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetAttribute</a> method is    a buffer, up to 1024 bytes in size, that permits the use of vendor extensions in the Wi-Fi Protected Setup TLV framework. The Vendor
 * Extension figure illustrates the implementation of vendor extensions. Vendor ID is the SMI network management private enterprise code. 
 * 
 *  Instead of querying this value, implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getvendorextension">IWCNDevice::GetVendorExtension</a> API is recommended for convenience and flexibilty while accessing the raw vendor extension attribute directly.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_VENDOR_EXTENSION => 64

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is an integer value that indicates the Wi-Fi Protected Setup version. The one-byte field is broken into a four-bit major part using the
 * top MSBs and four-bit minor part using the LSBs. As an example, version 3.2 would be 0x32.
 * 
 * <div class="alert"><b>Note</b>  Windows will automatically use the correct WPS version for each device, so applications are not required to query or set this value.</div>
 * <div> </div>
 * <div class="alert"><b>Note</b>  When using  WPS 2.0, <b>WCN_TYPE_VERSION</b> will always be set to 0x10 and <b>WCN_TYPE_VERSION2</b> is used instead</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_VERSION => 65

    /**
     * This attribute value indicates that the <i>pbBuffer</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetAttribute</a> method is    a buffer containing an X.509 certificate request payload as specified in RFC 2511.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_X_509_CERTIFICATE_REQUEST => 66

    /**
     * This attribute value indicates that the <i>pbBuffer</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetAttribute</a> method is    a buffer containing an X.509 certificate.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_X_509_CERTIFICATE => 67

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_EAP_IDENTITY => 68

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_MESSAGE_COUNTER => 69

    /**
     * This attribute value indicates that the <i>wszString</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetStringAttribute</a> method is a 20 byte buffer containing the first 160 bits of the SHA-256 hash of a public key.
 * 
 * <div class="alert"><b>Note</b>  Security is handled transparently by Windows.  As a result, applications do not need to query or set this attribute.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_PUBLIC_KEY_HASH => 70

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_REKEY_KEY => 71

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_KEY_LIFETIME => 72

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is an integer defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcntypes/ne-wcntypes-wcn_value_type_config_methods">WCN_VALUE_TYPE_CONFIG_METHODS</a>, that indicates which of the configuration methods supported by the device are enabled.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_PERMITTED_CONFIG_METHODS => 73

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is an integer defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcntypes/ne-wcntypes-wcn_value_type_config_methods">WCN_VALUE_TYPE_CONFIG_METHODS</a>, that is used in Probe Response messages to
 * convey the current supported Config Methods of a specific Registrar.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_SELECTED_REGISTRAR_CONFIG_METHODS => 74

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/win32/api/wcntypes/ns-wcntypes-wcn_value_type_primary_device_type">IWCNDevice::GetIntegerAttribute</a> method is an 8 byte buffer containing values, contained in <a href="https://docs.microsoft.com/windows/desktop/api/wcntypes/ns-wcntypes-wcn_value_type_primary_device_type">WCN_VALUE_TYPE_PRIMARY_DEVICE_TYPE</a>, that indicates the primary type of the device. It is recommended that applications instead query the WCN_TYPE_PRIMARY_DEVICE_TYPE_CATEGORY, WCN_TYPE_PRIMARY_DEVICE_TYPE_SUBCATEGORY_OUI, and WCN_TYPE_PRIMARY_DEVICE_TYPE_SUBCATEGORY attributes as they are more convenient.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_PRIMARY_DEVICE_TYPE => 75

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_SECONDARY_DEVICE_TYPE_LIST => 76

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_PORTABLE_DEVICE => 77

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is a buffer containing a value, defined by <a href="https://docs.microsoft.com/windows/desktop/api/wcntypes/ne-wcntypes-wcn_value_type_boolean">WCN_VALUE_TYPE_BOOLEAN</a>, that indicates if the access point has entered a state in which it will refuse to allow an external Registrar
 * to attempt to run the Registration Protocol using the AP’s PIN (with the AP acting as Enrollee). The AP
 * should enter this state if it believes a brute force attack is underway against the AP’s PIN.
 * When the AP is in this state, it MUST continue to allow other Enrollees to connect and run the
 * Registration Protocol with any external Registrars or the AP’s built-in Registrar (if any). It is only the use
 * of the AP’s PIN for adding external Registrars that is disabled in this state.
 * The AP Setup Locked state can be reset to <b>FALSE</b> through an authenticated call to SetAPSettings. APs
 * may provide other implementation-specific methods of resetting the AP Setup Locked state as well.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_AP_SETUP_LOCKED => 78

    /**
     * This attribute value indicates that the <i>pvBuffer</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetAttribute</a> method is    a buffer, up to 512 bytes in size,  used to pass parameters for enabling applications during the WSC
 * exchange. It is similar to the Vendor Extension attribute except that instead of a 3-byte Vendor ID prefix
 * to the Vendor Data field, a 16-byte UUID (as defined in RFC 4122) is used. This provides a virtually
 * unlimited application ID space with a regular structure that can be easily mapped onto a generic
 * application extension API. Furthermore, the 16-byte UUID value can be used to derive applicationspecific
 * AMSKs as described in Section 6.3 or pass any necessary keying directly.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_APPLICATION_EXTENSION => 79

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_EAP_TYPE => 80

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_INITIALIZATION_VECTOR => 81

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_KEY_PROVIDED_AUTOMATICALLY => 82

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_802_1X_ENABLED => 83

    /**
     * This attribute value represents the buffer, up to 128 bytes in size, containing data that indicates an exchange of application specific session keys and, alternatively, may be used
 * to calculate AMSKs.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_APPSESSIONKEY => 84

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is a 1 byte buffer containing data that identifies the Key Index value  used as the Access Point transmit key for WEP configurations.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_WEPTRANSMITKEY => 85

    /**
     * This compound attribute indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is a 16 byte buffer that contains data that is always equal to the UUID of the device, regardless if the device is enrollee or registrar.  (Effectively, merges WCN_TYPE_UUID_E and WCN_TYPE_UUID_R).
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_UUID => 86

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> is an integer that represents the major device category of a WCN device. The major device category is one of the WCN_VALUE_TYPE_DEVICE_TYPE_CATEGORY values.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_PRIMARY_DEVICE_TYPE_CATEGORY => 87

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> is an integer that represents the OUI that defines the device subcategory of a WCN device. The most common OUI is WCN_VALUE_DT_SUBTYPE_WIFI_OUI which indicates that the subcategory is defined by the Wi-Fi Alliance.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_PRIMARY_DEVICE_TYPE_SUBCATEGORY_OUI => 88

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> is an integer that represents the device subcategory of a WCN device. The subcategory must be interpreted along with the OUI from WCN_TYPE_PRIMARY_DEVICE_TYPE_SUBCATEGORY_OUI. For devices using the Wi-Fi Alliance OUI. The subcategory is one of the WCN_VALUE_TYPE_DEVICE_TYPE_SUBCATEGORY values.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_PRIMARY_DEVICE_TYPE_SUBCATEGORY => 89

    /**
     * This attribute value indicates that the <i>wszString</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetStringAttribute</a> method is buffer, up to 32 bytes in size, containing  the current SSID of a wireless access point.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_CURRENT_SSID => 90

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_BSSID => 91

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_DOT11_MAC_ADDRESS => 92

    /**
     * . This attribute value indicates that a registrar is providing a list of MAC addresses that are authorized to start WSC. The <i>pbBuffer</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetAttribute</a> method is a 6-30 byte buffer containing the 48 bit value of each MAC Address in the list of authorized MACs. For example: 0x00 0x07 0xE9 0x4C 0xA8 0x1C.
 * 
 * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_AUTHORIZED_MACS => 93

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is a 1 byte buffer used to get and set network settings for devices that host more than one network. A value of '1' indicates that  the Network Key may be shared with other devices.
 * 
 * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_NETWORK_KEY_SHAREABLE => 94

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_REQUEST_TO_ENROLL => 95

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_REQUESTED_DEVICE_TYPE => 96

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is a 1 byte buffer indicating the estimated length of time (in seconds) that an access point will require to reconfigure itself and become available, or that a  device will require to apply settings and connect to a network. 
 * 
 * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_SETTINGS_DELAY_TIME => 97

    /**
     * This attribute value indicates that the <i>puInteger</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-getintegerattribute">IWCNDevice::GetIntegerAttribute</a> method is an integer value that indicates the Wi-Fi Protected Setup version. The one-byte field is broken into a four-bit major part using the
 * top MSBs and four-bit minor part using the LSBs. As an example, version 3.2 would be 0x32.
 * 
 * <div class="alert"><b>Note</b>  Windows will automatically use the correct WPS version for each device, so applications are not required to query or set this value.</div>
 * <div> </div>
 * <div class="alert"><b>Note</b>  Only available  in Windows 8.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_VERSION2 => 98

    /**
     * Reserved. Do not use.
 * 
 * <div class="alert"><b>Note</b>  The attributes within the WFA vendor extension may be queried directly.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static WCN_TYPE_VENDOR_EXTENSION_WFA => 99

    /**
     * The number of assigned attributes.
     * @type {Integer (Int32)}
     */
    static WCN_NUM_ATTRIBUTE_TYPES => 100
}
