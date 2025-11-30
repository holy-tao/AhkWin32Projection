#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class HEADER_CONTROL_FORMAT_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HDF_LEFT => 0

    /**
     * @type {Integer (Int32)}
     */
    static HDF_RIGHT => 1

    /**
     * @type {Integer (Int32)}
     */
    static HDF_CENTER => 2

    /**
     * @type {Integer (Int32)}
     */
    static HDF_JUSTIFYMASK => 3

    /**
     * @type {Integer (Int32)}
     */
    static HDF_RTLREADING => 4

    /**
     * @type {Integer (Int32)}
     */
    static HDF_BITMAP => 8192

    /**
     * @type {Integer (Int32)}
     */
    static HDF_STRING => 16384

    /**
     * @type {Integer (Int32)}
     */
    static HDF_OWNERDRAW => 32768

    /**
     * @type {Integer (Int32)}
     */
    static HDF_IMAGE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static HDF_BITMAP_ON_RIGHT => 4096

    /**
     * @type {Integer (Int32)}
     */
    static HDF_SORTUP => 1024

    /**
     * @type {Integer (Int32)}
     */
    static HDF_SORTDOWN => 512

    /**
     * @type {Integer (Int32)}
     */
    static HDF_CHECKBOX => 64

    /**
     * @type {Integer (Int32)}
     */
    static HDF_CHECKED => 128

    /**
     * @type {Integer (Int32)}
     */
    static HDF_FIXEDWIDTH => 256

    /**
     * @type {Integer (Int32)}
     */
    static HDF_SPLITBUTTON => 16777216
}
