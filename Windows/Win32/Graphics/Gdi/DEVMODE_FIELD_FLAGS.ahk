#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class DEVMODE_FIELD_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DM_SPECVERSION => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static DM_ORIENTATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DM_PAPERSIZE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DM_PAPERLENGTH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DM_PAPERWIDTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DM_SCALE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DM_POSITION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DM_NUP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DM_DISPLAYORIENTATION => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DM_COPIES => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DM_DEFAULTSOURCE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DM_PRINTQUALITY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DM_COLOR => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DM_DUPLEX => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DM_YRESOLUTION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DM_TTOPTION => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DM_COLLATE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DM_FORMNAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DM_LOGPIXELS => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DM_BITSPERPEL => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DM_PELSWIDTH => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static DM_PELSHEIGHT => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static DM_DISPLAYFLAGS => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static DM_DISPLAYFREQUENCY => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static DM_ICMMETHOD => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static DM_ICMINTENT => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static DM_MEDIATYPE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static DM_DITHERTYPE => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static DM_PANNINGWIDTH => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static DM_PANNINGHEIGHT => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DM_DISPLAYFIXEDOUTPUT => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static DM_INTERLACED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DM_UPDATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DM_COPY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DM_PROMPT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DM_MODIFY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DM_IN_BUFFER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DM_IN_PROMPT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DM_OUT_BUFFER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DM_OUT_DEFAULT => 1
}
