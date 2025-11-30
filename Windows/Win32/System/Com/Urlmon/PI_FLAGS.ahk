#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class PI_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PI_PARSE_URL => 1

    /**
     * @type {Integer (Int32)}
     */
    static PI_FILTER_MODE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PI_FORCE_ASYNC => 4

    /**
     * @type {Integer (Int32)}
     */
    static PI_USE_WORKERTHREAD => 8

    /**
     * @type {Integer (Int32)}
     */
    static PI_MIMEVERIFICATION => 16

    /**
     * @type {Integer (Int32)}
     */
    static PI_CLSIDLOOKUP => 32

    /**
     * @type {Integer (Int32)}
     */
    static PI_DATAPROGRESS => 64

    /**
     * @type {Integer (Int32)}
     */
    static PI_SYNCHRONOUS => 128

    /**
     * @type {Integer (Int32)}
     */
    static PI_APARTMENTTHREADED => 256

    /**
     * @type {Integer (Int32)}
     */
    static PI_CLASSINSTALL => 512

    /**
     * @type {Integer (Int32)}
     */
    static PI_PASSONBINDCTX => 8192

    /**
     * @type {Integer (Int32)}
     */
    static PI_NOMIMEHANDLER => 32768

    /**
     * @type {Integer (Int32)}
     */
    static PI_LOADAPPDIRECT => 16384

    /**
     * @type {Integer (Int32)}
     */
    static PD_FORCE_SWITCH => 65536

    /**
     * @type {Integer (Int32)}
     */
    static PI_PREFERDEFAULTHANDLER => 131072
}
