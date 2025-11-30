#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class MQWARNING extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MQ_INFORMATION_PROPERTY => 1074659329

    /**
     * @type {Integer (Int32)}
     */
    static MQ_INFORMATION_ILLEGAL_PROPERTY => 1074659330

    /**
     * @type {Integer (Int32)}
     */
    static MQ_INFORMATION_PROPERTY_IGNORED => 1074659331

    /**
     * @type {Integer (Int32)}
     */
    static MQ_INFORMATION_UNSUPPORTED_PROPERTY => 1074659332

    /**
     * @type {Integer (Int32)}
     */
    static MQ_INFORMATION_DUPLICATE_PROPERTY => 1074659333

    /**
     * @type {Integer (Int32)}
     */
    static MQ_INFORMATION_OPERATION_PENDING => 1074659334

    /**
     * @type {Integer (Int32)}
     */
    static MQ_INFORMATION_FORMATNAME_BUFFER_TOO_SMALL => 1074659337

    /**
     * @type {Integer (Int32)}
     */
    static MQ_INFORMATION_INTERNAL_USER_CERT_EXIST => 1074659338

    /**
     * @type {Integer (Int32)}
     */
    static MQ_INFORMATION_OWNER_IGNORED => 1074659339
}
