#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class FONT_CLIP_PRECISION extends Win32BitflagEnum {

    /**
     * Native name: CLIP_DEFAULT_PRECIS
     * @type {Integer (Byte)}
     */
    static DEFAULT_PRECIS => 0x00

    /**
     * Native name: CLIP_CHARACTER_PRECIS
     * @type {Integer (Byte)}
     */
    static CHARACTER_PRECIS => 0x01

    /**
     * Native name: CLIP_STROKE_PRECIS
     * @type {Integer (Byte)}
     */
    static STROKE_PRECIS => 0x02

    /**
     * Native name: CLIP_MASK
     * @type {Integer (Byte)}
     */
    static MASK => 0x0F

    /**
     * Native name: CLIP_LH_ANGLES
     * @type {Integer (Byte)}
     */
    static LH_ANGLES => 0x10

    /**
     * Native name: CLIP_TT_ALWAYS
     * @type {Integer (Byte)}
     */
    static TT_ALWAYS => 0x20

    /**
     * Native name: CLIP_DFA_DISABLE
     * @type {Integer (Byte)}
     */
    static DFA_DISABLE => 0x40

    /**
     * Native name: CLIP_EMBEDDED
     * @type {Integer (Byte)}
     */
    static EMBEDDED => 0x80

    /**
     * Native name: CLIP_DFA_OVERRIDE
     * @type {Integer (Byte)}
     */
    static DFA_OVERRIDE => 0x40
}
