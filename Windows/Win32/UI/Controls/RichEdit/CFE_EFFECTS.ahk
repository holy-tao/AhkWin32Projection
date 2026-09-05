#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
class CFE_EFFECTS extends Win32BitflagEnum {

    /**
     * Native name: CFE_ALLCAPS
     * @type {Integer (UInt32)}
     */
    static ALLCAPS => 128

    /**
     * Native name: CFE_AUTOBACKCOLOR
     * @type {Integer (UInt32)}
     */
    static AUTOBACKCOLOR => 67108864

    /**
     * Native name: CFE_DISABLED
     * @type {Integer (UInt32)}
     */
    static DISABLED => 8192

    /**
     * Native name: CFE_EMBOSS
     * @type {Integer (UInt32)}
     */
    static EMBOSS => 2048

    /**
     * Native name: CFE_HIDDEN
     * @type {Integer (UInt32)}
     */
    static HIDDEN => 256

    /**
     * Native name: CFE_IMPRINT
     * @type {Integer (UInt32)}
     */
    static IMPRINT => 4096

    /**
     * Native name: CFE_OUTLINE
     * @type {Integer (UInt32)}
     */
    static OUTLINE => 512

    /**
     * Native name: CFE_REVISED
     * @type {Integer (UInt32)}
     */
    static REVISED => 16384

    /**
     * Native name: CFE_SHADOW
     * @type {Integer (UInt32)}
     */
    static SHADOW => 1024

    /**
     * Native name: CFE_SMALLCAPS
     * @type {Integer (UInt32)}
     */
    static SMALLCAPS => 64

    /**
     * Native name: CFE_AUTOCOLOR
     * @type {Integer (UInt32)}
     */
    static AUTOCOLOR => 1073741824

    /**
     * Native name: CFE_BOLD
     * @type {Integer (UInt32)}
     */
    static BOLD => 1

    /**
     * Native name: CFE_ITALIC
     * @type {Integer (UInt32)}
     */
    static ITALIC => 2

    /**
     * Native name: CFE_STRIKEOUT
     * @type {Integer (UInt32)}
     */
    static STRIKEOUT => 8

    /**
     * Native name: CFE_UNDERLINE
     * @type {Integer (UInt32)}
     */
    static UNDERLINE => 4

    /**
     * Native name: CFE_PROTECTED
     * @type {Integer (UInt32)}
     */
    static PROTECTED => 16

    /**
     * Native name: CFE_LINK
     * @type {Integer (UInt32)}
     */
    static LINK => 32

    /**
     * Native name: CFE_SUBSCRIPT
     * @type {Integer (UInt32)}
     */
    static SUBSCRIPT => 65536

    /**
     * Native name: CFE_SUPERSCRIPT
     * @type {Integer (UInt32)}
     */
    static SUPERSCRIPT => 131072

    /**
     * Native name: CFE_FONTBOUND
     * @type {Integer (UInt32)}
     */
    static FONTBOUND => 1048576

    /**
     * Native name: CFE_LINKPROTECTED
     * @type {Integer (UInt32)}
     */
    static LINKPROTECTED => 8388608

    /**
     * Native name: CFE_EXTENDED
     * @type {Integer (UInt32)}
     */
    static EXTENDED => 33554432

    /**
     * Native name: CFE_MATHNOBUILDUP
     * @type {Integer (UInt32)}
     */
    static MATHNOBUILDUP => 134217728

    /**
     * Native name: CFE_MATH
     * @type {Integer (UInt32)}
     */
    static MATH => 268435456

    /**
     * Native name: CFE_MATHORDINARY
     * @type {Integer (UInt32)}
     */
    static MATHORDINARY => 536870912
}
