#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the IASCOMMONPROPERTIES enumeration type enumerate properties that are present in all SDO objects.
 * @remarks
 * 
 * The following code snippet retrieves the name of the SDO object, if it exists. The variable pSdo is a pointer to an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nn-sdoias-isdo">ISdo</a> interface.
 * 
 * 
 * ```cpp
 * HRESULT hr;
 * _variant_t vtItemName;
 * hr = pSdo->GetProperty(PROPERTY_SDO_NAME, &vtItemName);
 * 
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-iascommonproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class IASCOMMONPROPERTIES{

    /**
     * This property is reserved.
     * @type {Integer (Int32)}
     */
    static PROPERTY_SDO_RESERVED => 0

    /**
     * The program ID for the SDO object.
     * @type {Integer (Int32)}
     */
    static PROPERTY_SDO_CLASS => 1

    /**
     * The name of the SDO object.
     * @type {Integer (Int32)}
     */
    static PROPERTY_SDO_NAME => 2

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static PROPERTY_SDO_DESCRIPTION => 3

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static PROPERTY_SDO_ID => 4

    /**
     * The name of the datastore for the object.
     * @type {Integer (Int32)}
     */
    static PROPERTY_SDO_DATASTORE_NAME => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PROPERTY_SDO_TEMPLATE_GUID => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PROPERTY_SDO_OPAQUE => 7

    /**
     * Indicates the start of <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-userproperties">USERPROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static PROPERTY_SDO_START => 1024
}
