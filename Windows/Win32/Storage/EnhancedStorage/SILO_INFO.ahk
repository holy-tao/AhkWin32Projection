#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * SILO_INFO structure contains information that identifies and describes the silo.
 * @see https://learn.microsoft.com/windows/win32/api/ehstorapi/ns-ehstorapi-silo_info
 * @namespace Windows.Win32.Storage.EnhancedStorage
 */
export default struct SILO_INFO {
    #StructPack 4

    /**
     * Silo Type Identifier for the silo assigned by IEEE 1667 Working Group.
     */
    ulSTID : UInt32

    /**
     * Major version of the specification implemented in the silo.
     */
    SpecificationMajor : Int8

    /**
     * Minor version of the specification implemented in the silo.
     */
    SpecificationMinor : Int8

    /**
     * Major version of the firmware implemented in the silo.
     */
    ImplementationMajor : Int8

    /**
     * Minor version of the firmware implemented in the silo.
     */
    ImplementationMinor : Int8

    /**
     * Type of the silo.
     */
    type : Int8

    /**
     * Capabilities of the silo.
     */
    capabilities : Int8

}
