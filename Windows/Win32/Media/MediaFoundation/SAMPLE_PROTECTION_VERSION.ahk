#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the version number for sample protection.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-sample_protection_version
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class SAMPLE_PROTECTION_VERSION{

    /**
     * No sample protection.
     * @type {Integer (Int32)}
     */
    static SAMPLE_PROTECTION_VERSION_NO => 0

    /**
     * Version 1.
     * @type {Integer (Int32)}
     */
    static SAMPLE_PROTECTION_VERSION_BASIC_LOKI => 1

    /**
     * Version 2.
     * @type {Integer (Int32)}
     */
    static SAMPLE_PROTECTION_VERSION_SCATTER => 2

    /**
     * Version 3.
     * @type {Integer (Int32)}
     */
    static SAMPLE_PROTECTION_VERSION_RC4 => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SAMPLE_PROTECTION_VERSION_AES128CTR => 4
}
