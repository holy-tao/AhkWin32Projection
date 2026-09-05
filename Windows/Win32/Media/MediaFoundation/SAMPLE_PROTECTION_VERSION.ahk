#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the version number for sample protection.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-sample_protection_version
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class SAMPLE_PROTECTION_VERSION extends Win32Enum {

    /**
     * No sample protection.
     * Native name: SAMPLE_PROTECTION_VERSION_NO
     * @type {Integer (Int32)}
     */
    static NO => 0

    /**
     * Version 1.
     * Native name: SAMPLE_PROTECTION_VERSION_BASIC_LOKI
     * @type {Integer (Int32)}
     */
    static BASIC_LOKI => 1

    /**
     * Version 2.
     * Native name: SAMPLE_PROTECTION_VERSION_SCATTER
     * @type {Integer (Int32)}
     */
    static SCATTER => 2

    /**
     * Version 3.
     * Native name: SAMPLE_PROTECTION_VERSION_RC4
     * @type {Integer (Int32)}
     */
    static RC4 => 3

    /**
     * Native name: SAMPLE_PROTECTION_VERSION_AES128CTR
     * @type {Integer (Int32)}
     */
    static AES128CTR => 4
}
