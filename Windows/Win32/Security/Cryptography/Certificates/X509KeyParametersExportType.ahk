#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509KeyParametersExportType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_OID_USE_CURVE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_OID_USE_CURVE_NAME_FOR_ENCODE_FLAG => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static XCN_CRYPT_OID_USE_CURVE_PARAMETERS_FOR_ENCODE_FLAG => 268435456
}
