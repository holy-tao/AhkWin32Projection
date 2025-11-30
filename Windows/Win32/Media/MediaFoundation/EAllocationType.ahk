#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class EAllocationType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static eAllocationTypeDynamic => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAllocationTypeRT => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAllocationTypePageable => 2

    /**
     * @type {Integer (Int32)}
     */
    static eAllocationTypeIgnore => 3
}
