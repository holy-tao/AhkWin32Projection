#Requires AutoHotkey v2.0.0 64-bit

/**
 * The FAX_PROVIDER_STATUS_ENUM enumeration defines the status values for a fax extension (a fax service provider (FSP) or a fax inbound routing extension).
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/ne-faxcomex-fax_provider_status_enum
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_PROVIDER_STATUS_ENUM{

    /**
     * The extension loaded, linked, and initialized successfully.
     * @type {Integer (Int32)}
     */
    static fpsSUCCESS => 0

    /**
     * A server-related error occurred while the fax service was trying to load, link, and initialize the extension; for example, there may have been insufficient memory resources. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdeviceprovider-initerrorcode-vb">IFaxDeviceProvider::get_InitErrorCode</a> method or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingextension-initerrorcode-vb">IFaxInboundRoutingExtension::get_InitErrorCode</a> method to return the last error code.
     * @type {Integer (Int32)}
     */
    static fpsSERVER_ERROR => 1

    /**
     * An error occurred while the fax service was parsing the extension's installation data; the extension's GUID is invalid. Refer to the <b>InitErrorCode</b> property to get the error code.
     * @type {Integer (Int32)}
     */
    static fpsBAD_GUID => 2

    /**
     * An error occurred while the fax service was parsing the extension's installation data; the extension reports an invalid version of the FSP or routing extension API; the routing extension is the non-default MS routing extension for a desktop computer installation. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdeviceprovider-initerrorcode-vb">IFaxDeviceProvider::get_InitErrorCode</a> method or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingextension-initerrorcode-vb">IFaxInboundRoutingExtension::get_InitErrorCode</a> method to return the last error code.
     * @type {Integer (Int32)}
     */
    static fpsBAD_VERSION => 3

    /**
     * An error occurred while the fax service was loading the FSP or routing extension's DLL. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdeviceprovider-initerrorcode-vb">IFaxDeviceProvider::get_InitErrorCode</a> method or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingextension-initerrorcode-vb">IFaxInboundRoutingExtension::get_InitErrorCode</a> method to return the last error code.
     * @type {Integer (Int32)}
     */
    static fpsCANT_LOAD => 4

    /**
     * An error occurred when the fax service attempted to dynamically link to one of the functions that the FSP or routing extension's DLL must export. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdeviceprovider-initerrorcode-vb">IFaxDeviceProvider::get_InitErrorCode</a> method or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingextension-initerrorcode-vb">IFaxInboundRoutingExtension::get_InitErrorCode</a> method to return the last error code.
     * @type {Integer (Int32)}
     */
    static fpsCANT_LINK => 5

    /**
     * An error occurred when the fax service called the extension's initialization function. For virtual devices, the <b>InitErrorCode</b> property is an <b>HRESULT</b> value; otherwise, it is a Win32 error code. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdeviceprovider-initerrorcode-vb">IFaxDeviceProvider::get_InitErrorCode</a> method or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxinboundroutingextension-initerrorcode-vb">IFaxInboundRoutingExtension::get_InitErrorCode</a> method to return the last error code.
     * @type {Integer (Int32)}
     */
    static fpsCANT_INIT => 6
}
