#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies an H.264 encoding level.
 * @remarks
 * This values are used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-mpeg2-level-attribute">MF_MT_MPEG2_LEVEL</a> attribute.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavench264vlevel
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncH264VLevel extends Win32Enum {

    /**
     * Level 1.
     * Native name: eAVEncH264VLevel1
     * @type {Integer (Int32)}
     */
    static Level1 => 10

    /**
     * Level 1b.
     * Native name: eAVEncH264VLevel1_b
     * @type {Integer (Int32)}
     */
    static Level1_b => 11

    /**
     * Level 1.1.
     * Native name: eAVEncH264VLevel1_1
     * @type {Integer (Int32)}
     */
    static Level1_1 => 11

    /**
     * Level 1.2.
     * Native name: eAVEncH264VLevel1_2
     * @type {Integer (Int32)}
     */
    static Level1_2 => 12

    /**
     * Level 1.3.
     * Native name: eAVEncH264VLevel1_3
     * @type {Integer (Int32)}
     */
    static Level1_3 => 13

    /**
     * Level 2.
     * Native name: eAVEncH264VLevel2
     * @type {Integer (Int32)}
     */
    static Level2 => 20

    /**
     * Level 2.1.
     * Native name: eAVEncH264VLevel2_1
     * @type {Integer (Int32)}
     */
    static Level2_1 => 21

    /**
     * Level 2.2.
     * Native name: eAVEncH264VLevel2_2
     * @type {Integer (Int32)}
     */
    static Level2_2 => 22

    /**
     * Level 3.
     * Native name: eAVEncH264VLevel3
     * @type {Integer (Int32)}
     */
    static Level3 => 30

    /**
     * Level 3.1.
     * Native name: eAVEncH264VLevel3_1
     * @type {Integer (Int32)}
     */
    static Level3_1 => 31

    /**
     * Level 3.2.
     * Native name: eAVEncH264VLevel3_2
     * @type {Integer (Int32)}
     */
    static Level3_2 => 32

    /**
     * Level 4.
     * Native name: eAVEncH264VLevel4
     * @type {Integer (Int32)}
     */
    static Level4 => 40

    /**
     * Level 4.1.
     * Native name: eAVEncH264VLevel4_1
     * @type {Integer (Int32)}
     */
    static Level4_1 => 41

    /**
     * Level 4.2.
     * Native name: eAVEncH264VLevel4_2
     * @type {Integer (Int32)}
     */
    static Level4_2 => 42

    /**
     * Level 5.
     * Native name: eAVEncH264VLevel5
     * @type {Integer (Int32)}
     */
    static Level5 => 50

    /**
     * Level 5.1.
     * Native name: eAVEncH264VLevel5_1
     * @type {Integer (Int32)}
     */
    static Level5_1 => 51

    /**
     * Level 5.2
     * 
     * Supported in Windows 8.1 and later.
     * Native name: eAVEncH264VLevel5_2
     * @type {Integer (Int32)}
     */
    static Level5_2 => 52

    /**
     * Native name: eAVEncH264VLevel6
     * @type {Integer (Int32)}
     */
    static Level6 => 60

    /**
     * Native name: eAVEncH264VLevel6_1
     * @type {Integer (Int32)}
     */
    static Level6_1 => 61

    /**
     * Native name: eAVEncH264VLevel6_2
     * @type {Integer (Int32)}
     */
    static Level6_2 => 62
}
