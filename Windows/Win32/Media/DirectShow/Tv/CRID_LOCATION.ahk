#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class CRID_LOCATION extends Win32Enum {

    /**
     * Native name: CRID_LOCATION_IN_DESCRIPTOR
     * @type {Integer (Int32)}
     */
    static IN_DESCRIPTOR => 0

    /**
     * Native name: CRID_LOCATION_IN_CIT
     * @type {Integer (Int32)}
     */
    static IN_CIT => 1

    /**
     * Native name: CRID_LOCATION_DVB_RESERVED1
     * @type {Integer (Int32)}
     */
    static DVB_RESERVED1 => 2

    /**
     * Native name: CRID_LOCATION_DVB_RESERVED2
     * @type {Integer (Int32)}
     */
    static DVB_RESERVED2 => 3
}
