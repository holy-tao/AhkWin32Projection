#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies an H.264 encoding level.
 * @remarks
 * This values are used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-mpeg2-level-attribute">MF_MT_MPEG2_LEVEL</a> attribute.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavench264vlevel
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncH264VLevel extends Win32Enum{

    /**
     * Level 1.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel1 => 10

    /**
     * Level 1b.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel1_b => 11

    /**
     * Level 1.1.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel1_1 => 11

    /**
     * Level 1.2.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel1_2 => 12

    /**
     * Level 1.3.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel1_3 => 13

    /**
     * Level 2.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel2 => 20

    /**
     * Level 2.1.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel2_1 => 21

    /**
     * Level 2.2.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel2_2 => 22

    /**
     * Level 3.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel3 => 30

    /**
     * Level 3.1.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel3_1 => 31

    /**
     * Level 3.2.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel3_2 => 32

    /**
     * Level 4.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel4 => 40

    /**
     * Level 4.1.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel4_1 => 41

    /**
     * Level 4.2.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel4_2 => 42

    /**
     * Level 5.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel5 => 50

    /**
     * Level 5.1.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel5_1 => 51

    /**
     * Level 5.2
     * 
     * Supported in Windows 8.1 and later.
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel5_2 => 52

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel6 => 60

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel6_1 => 61

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH264VLevel6_2 => 62
}
