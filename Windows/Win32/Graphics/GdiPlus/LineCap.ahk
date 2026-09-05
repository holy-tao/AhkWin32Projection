#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class LineCap extends Win32Enum {

    /**
     * Native name: LineCapFlat
     * @type {Integer (Int32)}
     */
    static Flat => 0

    /**
     * Native name: LineCapSquare
     * @type {Integer (Int32)}
     */
    static Square => 1

    /**
     * Native name: LineCapRound
     * @type {Integer (Int32)}
     */
    static Round => 2

    /**
     * Native name: LineCapTriangle
     * @type {Integer (Int32)}
     */
    static Triangle => 3

    /**
     * Native name: LineCapNoAnchor
     * @type {Integer (Int32)}
     */
    static NoAnchor => 16

    /**
     * Native name: LineCapSquareAnchor
     * @type {Integer (Int32)}
     */
    static SquareAnchor => 17

    /**
     * Native name: LineCapRoundAnchor
     * @type {Integer (Int32)}
     */
    static RoundAnchor => 18

    /**
     * Native name: LineCapDiamondAnchor
     * @type {Integer (Int32)}
     */
    static DiamondAnchor => 19

    /**
     * Native name: LineCapArrowAnchor
     * @type {Integer (Int32)}
     */
    static ArrowAnchor => 20

    /**
     * Native name: LineCapCustom
     * @type {Integer (Int32)}
     */
    static Custom => 255

    /**
     * Native name: LineCapAnchorMask
     * @type {Integer (Int32)}
     */
    static AnchorMask => 240
}
