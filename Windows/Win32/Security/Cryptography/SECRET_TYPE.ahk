#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SECRET_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AlphaNumericPinType => 0

    /**
     * @type {Integer (Int32)}
     */
    static ExternalPinType => 1

    /**
     * @type {Integer (Int32)}
     */
    static ChallengeResponsePinType => 2

    /**
     * @type {Integer (Int32)}
     */
    static EmptyPinType => 3
}
