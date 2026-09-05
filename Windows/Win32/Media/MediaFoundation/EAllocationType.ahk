#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class EAllocationType extends Win32Enum {

    /**
     * Native name: eAllocationTypeDynamic
     * @type {Integer (Int32)}
     */
    static Dynamic => 0

    /**
     * Native name: eAllocationTypeRT
     * @type {Integer (Int32)}
     */
    static TypeRT => 1

    /**
     * Native name: eAllocationTypePageable
     * @type {Integer (Int32)}
     */
    static Pageable => 2

    /**
     * Native name: eAllocationTypeIgnore
     * @type {Integer (Int32)}
     */
    static Ignore => 3
}
