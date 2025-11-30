#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class GET_CHARACTER_PLACEMENT_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_CLASSIN => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_DIACRITIC => 256

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_DISPLAYZWG => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_GLYPHSHAPE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_JUSTIFY => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_KASHIDA => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_LIGATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_MAXEXTENT => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_NEUTRALOVERRIDE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_NUMERICOVERRIDE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_NUMERICSLATIN => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_NUMERICSLOCAL => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_REORDER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_SYMSWAPOFF => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static GCP_USEKERNING => 8
}
