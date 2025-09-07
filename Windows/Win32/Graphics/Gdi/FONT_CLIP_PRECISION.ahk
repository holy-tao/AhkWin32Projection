#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class FONT_CLIP_PRECISION{

    /**
     * @type {Integer (Byte)}
     */
    static CLIP_DEFAULT_PRECIS => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static CLIP_CHARACTER_PRECIS => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static CLIP_STROKE_PRECIS => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static CLIP_MASK => 0x0F

    /**
     * @type {Integer (Byte)}
     */
    static CLIP_LH_ANGLES => 0x10

    /**
     * @type {Integer (Byte)}
     */
    static CLIP_TT_ALWAYS => 0x20

    /**
     * @type {Integer (Byte)}
     */
    static CLIP_DFA_DISABLE => 0x40

    /**
     * @type {Integer (Byte)}
     */
    static CLIP_EMBEDDED => 0x80

    /**
     * @type {Integer (Byte)}
     */
    static CLIP_DFA_OVERRIDE => 0x40
}
