#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the location of the certificate store.
 * @remarks
 * For more information, see [System store locations](/windows/desktop/SecCrypto/system-store-locations).
 * @see https://learn.microsoft.com/windows/win32/api/bits2_5/ne-bits2_5-bg_cert_store_location
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BG_CERT_STORE_LOCATION extends Win32Enum{

    /**
     * Use the current user's certificate store.
     * @type {Integer (Int32)}
     */
    static BG_CERT_STORE_LOCATION_CURRENT_USER => 0

    /**
     * Use the local computer's certificate store.
     * @type {Integer (Int32)}
     */
    static BG_CERT_STORE_LOCATION_LOCAL_MACHINE => 1

    /**
     * Use the current service's certificate store.
     * @type {Integer (Int32)}
     */
    static BG_CERT_STORE_LOCATION_CURRENT_SERVICE => 2

    /**
     * Use a specific service's certificate store.
     * @type {Integer (Int32)}
     */
    static BG_CERT_STORE_LOCATION_SERVICES => 3

    /**
     * Use a specific user's certificate store.
     * @type {Integer (Int32)}
     */
    static BG_CERT_STORE_LOCATION_USERS => 4

    /**
     * Use the current user's group policy certificate store. In a network setting, stores in this location are downloaded to the client computer from the Group Policy Template (GPT) during computer startup, or user logon.
     * @type {Integer (Int32)}
     */
    static BG_CERT_STORE_LOCATION_CURRENT_USER_GROUP_POLICY => 5

    /**
     * Use the local computer's certificate store. In a network setting, stores in this location are downloaded to the client computer from the Group Policy Template (GPT) during computer startup, or user logon.
     * @type {Integer (Int32)}
     */
    static BG_CERT_STORE_LOCATION_LOCAL_MACHINE_GROUP_POLICY => 6

    /**
     * Use the enterprise certificate store. The enterprise store is shared across domains in the enterprise, and downloaded from the global enterprise directory.
     * @type {Integer (Int32)}
     */
    static BG_CERT_STORE_LOCATION_LOCAL_MACHINE_ENTERPRISE => 7
}
