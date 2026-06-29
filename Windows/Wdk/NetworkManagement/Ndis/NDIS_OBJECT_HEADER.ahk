#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Packages the object type, version, and size information that is required in many NDIS 6.0 structures.
 * @see https://learn.microsoft.com/windows/win32/NativeWiFi/ndis-object-header
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_OBJECT_HEADER {
    #StructPack 2

    /**
     * Specifies the type of NDIS object that a structure describes.
     */
    Type : Int8

    /**
     * Specifies the revision number of this structure.
     */
    Revision : Int8

    /**
     * Specifies the total size, in bytes, of the NDIS structure that contains the **NDIS\_OBJECT\_HEADER**. This size includes the size of the **NDIS\_OBJECT\_HEADER** member and all other members of the structure.
     */
    Size : UInt16

}
