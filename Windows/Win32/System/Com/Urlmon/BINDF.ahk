#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class BINDF extends Win32Enum {

    /**
     * Native name: BINDF_ASYNCHRONOUS
     * @type {Integer (Int32)}
     */
    static ASYNCHRONOUS => 1

    /**
     * Native name: BINDF_ASYNCSTORAGE
     * @type {Integer (Int32)}
     */
    static ASYNCSTORAGE => 2

    /**
     * Native name: BINDF_NOPROGRESSIVERENDERING
     * @type {Integer (Int32)}
     */
    static NOPROGRESSIVERENDERING => 4

    /**
     * Native name: BINDF_OFFLINEOPERATION
     * @type {Integer (Int32)}
     */
    static OFFLINEOPERATION => 8

    /**
     * Native name: BINDF_GETNEWESTVERSION
     * @type {Integer (Int32)}
     */
    static GETNEWESTVERSION => 16

    /**
     * Native name: BINDF_NOWRITECACHE
     * @type {Integer (Int32)}
     */
    static NOWRITECACHE => 32

    /**
     * Native name: BINDF_NEEDFILE
     * @type {Integer (Int32)}
     */
    static NEEDFILE => 64

    /**
     * Native name: BINDF_PULLDATA
     * @type {Integer (Int32)}
     */
    static PULLDATA => 128

    /**
     * Native name: BINDF_IGNORESECURITYPROBLEM
     * @type {Integer (Int32)}
     */
    static IGNORESECURITYPROBLEM => 256

    /**
     * Native name: BINDF_RESYNCHRONIZE
     * @type {Integer (Int32)}
     */
    static RESYNCHRONIZE => 512

    /**
     * Native name: BINDF_HYPERLINK
     * @type {Integer (Int32)}
     */
    static HYPERLINK => 1024

    /**
     * Native name: BINDF_NO_UI
     * @type {Integer (Int32)}
     */
    static NO_UI => 2048

    /**
     * Native name: BINDF_SILENTOPERATION
     * @type {Integer (Int32)}
     */
    static SILENTOPERATION => 4096

    /**
     * Native name: BINDF_PRAGMA_NO_CACHE
     * @type {Integer (Int32)}
     */
    static PRAGMA_NO_CACHE => 8192

    /**
     * Native name: BINDF_GETCLASSOBJECT
     * @type {Integer (Int32)}
     */
    static GETCLASSOBJECT => 16384

    /**
     * Native name: BINDF_RESERVED_1
     * @type {Integer (Int32)}
     */
    static RESERVED_1 => 32768

    /**
     * Native name: BINDF_FREE_THREADED
     * @type {Integer (Int32)}
     */
    static FREE_THREADED => 65536

    /**
     * Native name: BINDF_DIRECT_READ
     * @type {Integer (Int32)}
     */
    static DIRECT_READ => 131072

    /**
     * Native name: BINDF_FORMS_SUBMIT
     * @type {Integer (Int32)}
     */
    static FORMS_SUBMIT => 262144

    /**
     * Native name: BINDF_GETFROMCACHE_IF_NET_FAIL
     * @type {Integer (Int32)}
     */
    static GETFROMCACHE_IF_NET_FAIL => 524288

    /**
     * Native name: BINDF_FROMURLMON
     * @type {Integer (Int32)}
     */
    static FROMURLMON => 1048576

    /**
     * Native name: BINDF_FWD_BACK
     * @type {Integer (Int32)}
     */
    static FWD_BACK => 2097152

    /**
     * Native name: BINDF_PREFERDEFAULTHANDLER
     * @type {Integer (Int32)}
     */
    static PREFERDEFAULTHANDLER => 4194304

    /**
     * Native name: BINDF_ENFORCERESTRICTED
     * @type {Integer (Int32)}
     */
    static ENFORCERESTRICTED => 8388608

    /**
     * Native name: BINDF_RESERVED_2
     * @type {Integer (Int32)}
     */
    static RESERVED_2 => -2147483648

    /**
     * Native name: BINDF_RESERVED_3
     * @type {Integer (Int32)}
     */
    static RESERVED_3 => 16777216

    /**
     * Native name: BINDF_RESERVED_4
     * @type {Integer (Int32)}
     */
    static RESERVED_4 => 33554432

    /**
     * Native name: BINDF_RESERVED_5
     * @type {Integer (Int32)}
     */
    static RESERVED_5 => 67108864

    /**
     * Native name: BINDF_RESERVED_6
     * @type {Integer (Int32)}
     */
    static RESERVED_6 => 134217728

    /**
     * Native name: BINDF_RESERVED_7
     * @type {Integer (Int32)}
     */
    static RESERVED_7 => 1073741824

    /**
     * Native name: BINDF_RESERVED_8
     * @type {Integer (Int32)}
     */
    static RESERVED_8 => 536870912
}
