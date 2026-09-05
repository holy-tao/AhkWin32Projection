#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_AUDIOENGINE extends Win32Enum {

    /**
     * Native name: KSPROPERTY_AUDIOENGINE_LFXENABLE
     * @type {Integer (Int32)}
     */
    static LFXENABLE => 0

    /**
     * Native name: KSPROPERTY_AUDIOENGINE_GFXENABLE
     * @type {Integer (Int32)}
     */
    static GFXENABLE => 1

    /**
     * Native name: KSPROPERTY_AUDIOENGINE_MIXFORMAT
     * @type {Integer (Int32)}
     */
    static MIXFORMAT => 2

    /**
     * Native name: KSPROPERTY_AUDIOENGINE_DEVICEFORMAT
     * @type {Integer (Int32)}
     */
    static DEVICEFORMAT => 4

    /**
     * Native name: KSPROPERTY_AUDIOENGINE_SUPPORTEDDEVICEFORMATS
     * @type {Integer (Int32)}
     */
    static SUPPORTEDDEVICEFORMATS => 5

    /**
     * Native name: KSPROPERTY_AUDIOENGINE_DESCRIPTOR
     * @type {Integer (Int32)}
     */
    static DESCRIPTOR => 6

    /**
     * Native name: KSPROPERTY_AUDIOENGINE_BUFFER_SIZE_RANGE
     * @type {Integer (Int32)}
     */
    static BUFFER_SIZE_RANGE => 7

    /**
     * Native name: KSPROPERTY_AUDIOENGINE_LOOPBACK_PROTECTION
     * @type {Integer (Int32)}
     */
    static LOOPBACK_PROTECTION => 8

    /**
     * Native name: KSPROPERTY_AUDIOENGINE_VOLUMELEVEL
     * @type {Integer (Int32)}
     */
    static VOLUMELEVEL => 9

    /**
     * Native name: KSPROPERTY_AUDIOENGINE_DEVICECONTROLS
     * @type {Integer (Int32)}
     */
    static DEVICECONTROLS => 10
}
