#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_CACHEMEM_CAPABILITY_ID extends Win32Enum {

    /**
     * Native name: CxlCacheMemCapabilityID_NullCapability
     * @type {Integer (Int32)}
     */
    static CacheMemCapabilityID_NullCapability => 0

    /**
     * Native name: CxlCacheMemCapabilityID_Capability
     * @type {Integer (Int32)}
     */
    static CacheMemCapabilityID_Capability => 1

    /**
     * Native name: CxlCacheMemCapabilityID_RASCapability
     * @type {Integer (Int32)}
     */
    static CacheMemCapabilityID_RASCapability => 2

    /**
     * Native name: CxlCacheMemCapabilityID_SecurityCapability
     * @type {Integer (Int32)}
     */
    static CacheMemCapabilityID_SecurityCapability => 3

    /**
     * Native name: CxlCacheMemCapabilityID_LinkCapability
     * @type {Integer (Int32)}
     */
    static CacheMemCapabilityID_LinkCapability => 4

    /**
     * Native name: CxlCacheMemCapabilityID_HDMDecoderCapability
     * @type {Integer (Int32)}
     */
    static CacheMemCapabilityID_HDMDecoderCapability => 5

    /**
     * Native name: CxlCacheMemCapabilityID_ExtendedSecurityCapability
     * @type {Integer (Int32)}
     */
    static CacheMemCapabilityID_ExtendedSecurityCapability => 6

    /**
     * Native name: CxlCacheMemCapabilityID_IDECapability
     * @type {Integer (Int32)}
     */
    static CacheMemCapabilityID_IDECapability => 7

    /**
     * Native name: CxlCacheMemCapabilityID_SnoopFilterCapability
     * @type {Integer (Int32)}
     */
    static CacheMemCapabilityID_SnoopFilterCapability => 8

    /**
     * Native name: CxlCacheMemCapabilityID_TimeoutAndIsolationCapability
     * @type {Integer (Int32)}
     */
    static CacheMemCapabilityID_TimeoutAndIsolationCapability => 9

    /**
     * Native name: CxlCacheMemCapabilityID_ExtendedRegisterCapability
     * @type {Integer (Int32)}
     */
    static CacheMemCapabilityID_ExtendedRegisterCapability => 10

    /**
     * Native name: CxlCacheMemCapabilityID_BIRouteTableCapability
     * @type {Integer (Int32)}
     */
    static CacheMemCapabilityID_BIRouteTableCapability => 11

    /**
     * Native name: CxlCacheMemCapabilityID_BIDecoderCapability
     * @type {Integer (Int32)}
     */
    static CacheMemCapabilityID_BIDecoderCapability => 12

    /**
     * Native name: CxlCacheMemCapabilityID_CacheIDRouteTableCapability
     * @type {Integer (Int32)}
     */
    static CacheMemCapabilityID_CacheIDRouteTableCapability => 13

    /**
     * Native name: CxlCacheMemCapabilityID_CacheIDDecoderCapability
     * @type {Integer (Int32)}
     */
    static CacheMemCapabilityID_CacheIDDecoderCapability => 14

    /**
     * Native name: CxlCacheMemCapabilityID_ExtendedHDMDecoderCapability
     * @type {Integer (Int32)}
     */
    static CacheMemCapabilityID_ExtendedHDMDecoderCapability => 15

    /**
     * Native name: CxlCacheMemCapabilityID_ExtendedMetadataCapability
     * @type {Integer (Int32)}
     */
    static CacheMemCapabilityID_ExtendedMetadataCapability => 16
}
