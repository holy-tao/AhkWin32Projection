#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVDecVideoH264ErrorConcealment extends Win32Enum {

    /**
     * Native name: eErrorConcealmentTypeDrop
     * @type {Integer (Int32)}
     */
    static TypeDrop => 0

    /**
     * Native name: eErrorConcealmentTypeBasic
     * @type {Integer (Int32)}
     */
    static TypeBasic => 1

    /**
     * Native name: eErrorConcealmentTypeAdvanced
     * @type {Integer (Int32)}
     */
    static TypeAdvanced => 2

    /**
     * Native name: eErrorConcealmentTypeDXVASetBlack
     * @type {Integer (Int32)}
     */
    static TypeDXVASetBlack => 3
}
