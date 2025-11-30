#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class WINDOW_STYLE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static WS_OVERLAPPED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WS_POPUP => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static WS_CHILD => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static WS_MINIMIZE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static WS_VISIBLE => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static WS_DISABLED => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static WS_CLIPSIBLINGS => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static WS_CLIPCHILDREN => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static WS_MAXIMIZE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static WS_CAPTION => 12582912

    /**
     * @type {Integer (UInt32)}
     */
    static WS_BORDER => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static WS_DLGFRAME => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static WS_VSCROLL => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static WS_HSCROLL => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static WS_SYSMENU => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static WS_THICKFRAME => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static WS_GROUP => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WS_TABSTOP => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WS_MINIMIZEBOX => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WS_MAXIMIZEBOX => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WS_TILED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WS_ICONIC => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static WS_SIZEBOX => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static WS_TILEDWINDOW => 13565952

    /**
     * @type {Integer (UInt32)}
     */
    static WS_OVERLAPPEDWINDOW => 13565952

    /**
     * @type {Integer (UInt32)}
     */
    static WS_POPUPWINDOW => 2156396544

    /**
     * @type {Integer (UInt32)}
     */
    static WS_CHILDWINDOW => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static WS_ACTIVECAPTION => 1
}
