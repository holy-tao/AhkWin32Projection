#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVDecVideoH264ErrorConcealment extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static eErrorConcealmentTypeDrop => 0

    /**
     * @type {Integer (Int32)}
     */
    static eErrorConcealmentTypeBasic => 1

    /**
     * @type {Integer (Int32)}
     */
    static eErrorConcealmentTypeAdvanced => 2

    /**
     * @type {Integer (Int32)}
     */
    static eErrorConcealmentTypeDXVASetBlack => 3
}
