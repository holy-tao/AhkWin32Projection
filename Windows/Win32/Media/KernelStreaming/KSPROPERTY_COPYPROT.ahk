#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_COPYPROT extends Win32Enum {

    /**
     * Native name: KSPROPERTY_DVDCOPY_CHLG_KEY
     * @type {Integer (Int32)}
     */
    static DVDCOPY_CHLG_KEY => 1

    /**
     * Native name: KSPROPERTY_DVDCOPY_DVD_KEY1
     * @type {Integer (Int32)}
     */
    static DVDCOPY_DVD_KEY1 => 2

    /**
     * Native name: KSPROPERTY_DVDCOPY_DEC_KEY2
     * @type {Integer (Int32)}
     */
    static DVDCOPY_DEC_KEY2 => 3

    /**
     * Native name: KSPROPERTY_DVDCOPY_TITLE_KEY
     * @type {Integer (Int32)}
     */
    static DVDCOPY_TITLE_KEY => 4

    /**
     * Native name: KSPROPERTY_COPY_MACROVISION
     * @type {Integer (Int32)}
     */
    static COPY_MACROVISION => 5

    /**
     * Native name: KSPROPERTY_DVDCOPY_REGION
     * @type {Integer (Int32)}
     */
    static DVDCOPY_REGION => 6

    /**
     * Native name: KSPROPERTY_DVDCOPY_SET_COPY_STATE
     * @type {Integer (Int32)}
     */
    static DVDCOPY_SET_COPY_STATE => 7

    /**
     * Native name: KSPROPERTY_DVDCOPY_DISC_KEY
     * @type {Integer (Int32)}
     */
    static DVDCOPY_DISC_KEY => 128
}
