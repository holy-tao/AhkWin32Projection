#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CARD_FILE_ACCESS_CONDITION{

    /**
     * @type {Integer (Int32)}
     */
    static InvalidAc => 0

    /**
     * @type {Integer (Int32)}
     */
    static EveryoneReadUserWriteAc => 1

    /**
     * @type {Integer (Int32)}
     */
    static UserWriteExecuteAc => 2

    /**
     * @type {Integer (Int32)}
     */
    static EveryoneReadAdminWriteAc => 3

    /**
     * @type {Integer (Int32)}
     */
    static UnknownAc => 4

    /**
     * @type {Integer (Int32)}
     */
    static UserReadWriteAc => 5

    /**
     * @type {Integer (Int32)}
     */
    static AdminReadWriteAc => 6
}
