#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_ROOT_PROGRAM_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_ROOT_PROGRAM_FLAG_LSC => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_ROOT_PROGRAM_FLAG_ORG => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_ROOT_PROGRAM_FLAG_SUBJECT_LOGO => 32
}
