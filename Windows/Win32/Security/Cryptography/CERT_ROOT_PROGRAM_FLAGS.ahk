#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_ROOT_PROGRAM_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CERT_ROOT_PROGRAM_FLAG_LSC
     * @type {Integer (UInt32)}
     */
    static FLAG_LSC => 64

    /**
     * Native name: CERT_ROOT_PROGRAM_FLAG_ORG
     * @type {Integer (UInt32)}
     */
    static FLAG_ORG => 128

    /**
     * Native name: CERT_ROOT_PROGRAM_FLAG_SUBJECT_LOGO
     * @type {Integer (UInt32)}
     */
    static FLAG_SUBJECT_LOGO => 32
}
