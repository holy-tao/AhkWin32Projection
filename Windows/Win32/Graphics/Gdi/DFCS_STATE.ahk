#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class DFCS_STATE extends Win32BitflagEnum {

    /**
     * Native name: DFCS_CAPTIONCLOSE
     * @type {Integer (UInt32)}
     */
    static CAPTIONCLOSE => 0

    /**
     * Native name: DFCS_CAPTIONMIN
     * @type {Integer (UInt32)}
     */
    static CAPTIONMIN => 1

    /**
     * Native name: DFCS_CAPTIONMAX
     * @type {Integer (UInt32)}
     */
    static CAPTIONMAX => 2

    /**
     * Native name: DFCS_CAPTIONRESTORE
     * @type {Integer (UInt32)}
     */
    static CAPTIONRESTORE => 3

    /**
     * Native name: DFCS_CAPTIONHELP
     * @type {Integer (UInt32)}
     */
    static CAPTIONHELP => 4

    /**
     * Native name: DFCS_MENUARROW
     * @type {Integer (UInt32)}
     */
    static MENUARROW => 0

    /**
     * Native name: DFCS_MENUCHECK
     * @type {Integer (UInt32)}
     */
    static MENUCHECK => 1

    /**
     * Native name: DFCS_MENUBULLET
     * @type {Integer (UInt32)}
     */
    static MENUBULLET => 2

    /**
     * Native name: DFCS_MENUARROWRIGHT
     * @type {Integer (UInt32)}
     */
    static MENUARROWRIGHT => 4

    /**
     * Native name: DFCS_SCROLLUP
     * @type {Integer (UInt32)}
     */
    static SCROLLUP => 0

    /**
     * Native name: DFCS_SCROLLDOWN
     * @type {Integer (UInt32)}
     */
    static SCROLLDOWN => 1

    /**
     * Native name: DFCS_SCROLLLEFT
     * @type {Integer (UInt32)}
     */
    static SCROLLLEFT => 2

    /**
     * Native name: DFCS_SCROLLRIGHT
     * @type {Integer (UInt32)}
     */
    static SCROLLRIGHT => 3

    /**
     * Native name: DFCS_SCROLLCOMBOBOX
     * @type {Integer (UInt32)}
     */
    static SCROLLCOMBOBOX => 5

    /**
     * Native name: DFCS_SCROLLSIZEGRIP
     * @type {Integer (UInt32)}
     */
    static SCROLLSIZEGRIP => 8

    /**
     * Native name: DFCS_SCROLLSIZEGRIPRIGHT
     * @type {Integer (UInt32)}
     */
    static SCROLLSIZEGRIPRIGHT => 16

    /**
     * Native name: DFCS_BUTTONCHECK
     * @type {Integer (UInt32)}
     */
    static BUTTONCHECK => 0

    /**
     * Native name: DFCS_BUTTONRADIOIMAGE
     * @type {Integer (UInt32)}
     */
    static BUTTONRADIOIMAGE => 1

    /**
     * Native name: DFCS_BUTTONRADIOMASK
     * @type {Integer (UInt32)}
     */
    static BUTTONRADIOMASK => 2

    /**
     * Native name: DFCS_BUTTONRADIO
     * @type {Integer (UInt32)}
     */
    static BUTTONRADIO => 4

    /**
     * Native name: DFCS_BUTTON3STATE
     * @type {Integer (UInt32)}
     */
    static BUTTON3STATE => 8

    /**
     * Native name: DFCS_BUTTONPUSH
     * @type {Integer (UInt32)}
     */
    static BUTTONPUSH => 16

    /**
     * Native name: DFCS_INACTIVE
     * @type {Integer (UInt32)}
     */
    static INACTIVE => 256

    /**
     * Native name: DFCS_PUSHED
     * @type {Integer (UInt32)}
     */
    static PUSHED => 512

    /**
     * Native name: DFCS_CHECKED
     * @type {Integer (UInt32)}
     */
    static CHECKED => 1024

    /**
     * Native name: DFCS_TRANSPARENT
     * @type {Integer (UInt32)}
     */
    static TRANSPARENT => 2048

    /**
     * Native name: DFCS_HOT
     * @type {Integer (UInt32)}
     */
    static HOT => 4096

    /**
     * Native name: DFCS_ADJUSTRECT
     * @type {Integer (UInt32)}
     */
    static ADJUSTRECT => 8192

    /**
     * Native name: DFCS_FLAT
     * @type {Integer (UInt32)}
     */
    static FLAT => 16384

    /**
     * Native name: DFCS_MONO
     * @type {Integer (UInt32)}
     */
    static MONO => 32768
}
