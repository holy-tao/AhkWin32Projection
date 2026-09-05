#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class PI_FLAGS extends Win32Enum {

    /**
     * Native name: PI_PARSE_URL
     * @type {Integer (Int32)}
     */
    static PARSE_URL => 1

    /**
     * Native name: PI_FILTER_MODE
     * @type {Integer (Int32)}
     */
    static FILTER_MODE => 2

    /**
     * Native name: PI_FORCE_ASYNC
     * @type {Integer (Int32)}
     */
    static FORCE_ASYNC => 4

    /**
     * Native name: PI_USE_WORKERTHREAD
     * @type {Integer (Int32)}
     */
    static USE_WORKERTHREAD => 8

    /**
     * Native name: PI_MIMEVERIFICATION
     * @type {Integer (Int32)}
     */
    static MIMEVERIFICATION => 16

    /**
     * Native name: PI_CLSIDLOOKUP
     * @type {Integer (Int32)}
     */
    static CLSIDLOOKUP => 32

    /**
     * Native name: PI_DATAPROGRESS
     * @type {Integer (Int32)}
     */
    static DATAPROGRESS => 64

    /**
     * Native name: PI_SYNCHRONOUS
     * @type {Integer (Int32)}
     */
    static SYNCHRONOUS => 128

    /**
     * Native name: PI_APARTMENTTHREADED
     * @type {Integer (Int32)}
     */
    static APARTMENTTHREADED => 256

    /**
     * Native name: PI_CLASSINSTALL
     * @type {Integer (Int32)}
     */
    static CLASSINSTALL => 512

    /**
     * Native name: PI_PASSONBINDCTX
     * @type {Integer (Int32)}
     */
    static PASSONBINDCTX => 8192

    /**
     * Native name: PI_NOMIMEHANDLER
     * @type {Integer (Int32)}
     */
    static NOMIMEHANDLER => 32768

    /**
     * Native name: PI_LOADAPPDIRECT
     * @type {Integer (Int32)}
     */
    static LOADAPPDIRECT => 16384

    /**
     * @type {Integer (Int32)}
     */
    static PD_FORCE_SWITCH => 65536

    /**
     * Native name: PI_PREFERDEFAULTHANDLER
     * @type {Integer (Int32)}
     */
    static PREFERDEFAULTHANDLER => 131072
}
