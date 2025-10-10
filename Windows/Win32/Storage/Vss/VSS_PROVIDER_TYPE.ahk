#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the provider type.
 * @see https://docs.microsoft.com/windows/win32/api//vss/ne-vss-vss_provider_type
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_PROVIDER_TYPE{

    /**
     * The provider type is unknown. 
 *      
 * 
 * This indicates an error in the application or the VSS service, or that no provider is available.
     * @type {Integer (Int32)}
     */
    static VSS_PROV_UNKNOWN => 0

    /**
     * The default provider that ships with Windows.
     * @type {Integer (Int32)}
     */
    static VSS_PROV_SYSTEM => 1

    /**
     * A software provider.
     * @type {Integer (Int32)}
     */
    static VSS_PROV_SOFTWARE => 2

    /**
     * A hardware provider.
     * @type {Integer (Int32)}
     */
    static VSS_PROV_HARDWARE => 3

    /**
     * A file share provider.
 * 
 * <b>Windows 7, Windows Server 2008 R2, Windows Vista, Windows Server 2008, Windows XP and Windows Server 2003:  </b>This enumeration value is not supported until Windows 8 and Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static VSS_PROV_FILESHARE => 4
}
