#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class WINDOW_EX_STYLE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_DLGMODALFRAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_NOPARENTNOTIFY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_TOPMOST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_ACCEPTFILES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_TRANSPARENT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_MDICHILD => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_TOOLWINDOW => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_WINDOWEDGE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_CLIENTEDGE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_CONTEXTHELP => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_RIGHT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_LEFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_RTLREADING => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_LTRREADING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_LEFTSCROLLBAR => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_RIGHTSCROLLBAR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_CONTROLPARENT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_STATICEDGE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_APPWINDOW => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_OVERLAPPEDWINDOW => 768

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_PALETTEWINDOW => 392

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_LAYERED => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_NOINHERITLAYOUT => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_NOREDIRECTIONBITMAP => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_LAYOUTRTL => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_COMPOSITED => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static WS_EX_NOACTIVATE => 134217728
}
