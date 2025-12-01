#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PHONE_TONE enum identifies a phone tone.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ne-tapi3if-phone_tone
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class PHONE_TONE extends Win32Enum{

    /**
     * Zero.
     * @type {Integer (Int32)}
     */
    static PT_KEYPADZERO => 0

    /**
     * One.
     * @type {Integer (Int32)}
     */
    static PT_KEYPADONE => 1

    /**
     * Two.
     * @type {Integer (Int32)}
     */
    static PT_KEYPADTWO => 2

    /**
     * Three.
     * @type {Integer (Int32)}
     */
    static PT_KEYPADTHREE => 3

    /**
     * Four.
     * @type {Integer (Int32)}
     */
    static PT_KEYPADFOUR => 4

    /**
     * Five.
     * @type {Integer (Int32)}
     */
    static PT_KEYPADFIVE => 5

    /**
     * Six.
     * @type {Integer (Int32)}
     */
    static PT_KEYPADSIX => 6

    /**
     * Seven.
     * @type {Integer (Int32)}
     */
    static PT_KEYPADSEVEN => 7

    /**
     * Eight.
     * @type {Integer (Int32)}
     */
    static PT_KEYPADEIGHT => 8

    /**
     * Nine.
     * @type {Integer (Int32)}
     */
    static PT_KEYPADNINE => 9

    /**
     * Star key.
     * @type {Integer (Int32)}
     */
    static PT_KEYPADSTAR => 10

    /**
     * Pound sign key.
     * @type {Integer (Int32)}
     */
    static PT_KEYPADPOUND => 11

    /**
     * Supplemental A.
     * @type {Integer (Int32)}
     */
    static PT_KEYPADA => 12

    /**
     * Supplemental B.
     * @type {Integer (Int32)}
     */
    static PT_KEYPADB => 13

    /**
     * Supplemental C.
     * @type {Integer (Int32)}
     */
    static PT_KEYPADC => 14

    /**
     * Supplemental D.
     * @type {Integer (Int32)}
     */
    static PT_KEYPADD => 15

    /**
     * Normal dial tone.
     * @type {Integer (Int32)}
     */
    static PT_NORMALDIALTONE => 16

    /**
     * External dial tone.
     * @type {Integer (Int32)}
     */
    static PT_EXTERNALDIALTONE => 17

    /**
     * Busy signal tone.
     * @type {Integer (Int32)}
     */
    static PT_BUSY => 18

    /**
     * Ringback tone.
     * @type {Integer (Int32)}
     */
    static PT_RINGBACK => 19

    /**
     * Error tone.
     * @type {Integer (Int32)}
     */
    static PT_ERRORTONE => 20

    /**
     * No tone.
     * @type {Integer (Int32)}
     */
    static PT_SILENCE => 21
}
