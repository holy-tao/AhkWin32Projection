#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible types of identification rule structures that can be identified by the SAFER_IDENTIFICATION_HEADER structure.
 * @remarks
 * 
 * The <b>SAFER_IDENTIFICATION_TYPES</b> enumeration type is used by the <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_identification_header">SAFER_IDENTIFICATION_HEADER</a> structure.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsafer/ne-winsafer-safer_identification_types
 * @namespace Windows.Win32.Security.AppLocker
 * @version v4.0.30319
 */
class SAFER_IDENTIFICATION_TYPES extends Win32Enum{

    /**
     * The header is for a default level structure.
     * @type {Integer (Int32)}
     */
    static SaferIdentityDefault => 0

    /**
     * The header is for a <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_pathname_identification">SAFER_PATHNAME_IDENTIFICATION</a> structure.
     * @type {Integer (Int32)}
     */
    static SaferIdentityTypeImageName => 1

    /**
     * The header is for a <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_hash_identification">SAFER_HASH_IDENTIFICATION</a> structure.
     * @type {Integer (Int32)}
     */
    static SaferIdentityTypeImageHash => 2

    /**
     * The header is for a <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_urlzone_identification">SAFER_URLZONE_IDENTIFICATION</a> structure.
     * @type {Integer (Int32)}
     */
    static SaferIdentityTypeUrlZone => 3

    /**
     * The header is for a <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_pathname_identification">SAFER_PATHNAME_IDENTIFICATION</a> structure.
     * @type {Integer (Int32)}
     */
    static SaferIdentityTypeCertificate => 4
}
