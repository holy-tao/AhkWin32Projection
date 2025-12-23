#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CERTADMIN_GET_ROLES_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CA_ACCESS_ADMIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CA_ACCESS_AUDITOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CA_ACCESS_ENROLL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CA_ACCESS_OFFICER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CA_ACCESS_OPERATOR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CA_ACCESS_READ => 256
}
