#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class PUAF extends Win32Enum {

    /**
     * Native name: PUAF_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: PUAF_NOUI
     * @type {Integer (Int32)}
     */
    static NOUI => 1

    /**
     * Native name: PUAF_ISFILE
     * @type {Integer (Int32)}
     */
    static ISFILE => 2

    /**
     * Native name: PUAF_WARN_IF_DENIED
     * @type {Integer (Int32)}
     */
    static WARN_IF_DENIED => 4

    /**
     * Native name: PUAF_FORCEUI_FOREGROUND
     * @type {Integer (Int32)}
     */
    static FORCEUI_FOREGROUND => 8

    /**
     * Native name: PUAF_CHECK_TIFS
     * @type {Integer (Int32)}
     */
    static CHECK_TIFS => 16

    /**
     * Native name: PUAF_DONTCHECKBOXINDIALOG
     * @type {Integer (Int32)}
     */
    static DONTCHECKBOXINDIALOG => 32

    /**
     * Native name: PUAF_TRUSTED
     * @type {Integer (Int32)}
     */
    static TRUSTED => 64

    /**
     * Native name: PUAF_ACCEPT_WILDCARD_SCHEME
     * @type {Integer (Int32)}
     */
    static ACCEPT_WILDCARD_SCHEME => 128

    /**
     * Native name: PUAF_ENFORCERESTRICTED
     * @type {Integer (Int32)}
     */
    static ENFORCERESTRICTED => 256

    /**
     * Native name: PUAF_NOSAVEDFILECHECK
     * @type {Integer (Int32)}
     */
    static NOSAVEDFILECHECK => 512

    /**
     * Native name: PUAF_REQUIRESAVEDFILECHECK
     * @type {Integer (Int32)}
     */
    static REQUIRESAVEDFILECHECK => 1024

    /**
     * Native name: PUAF_DONT_USE_CACHE
     * @type {Integer (Int32)}
     */
    static DONT_USE_CACHE => 4096

    /**
     * Native name: PUAF_RESERVED1
     * @type {Integer (Int32)}
     */
    static RESERVED1 => 8192

    /**
     * Native name: PUAF_RESERVED2
     * @type {Integer (Int32)}
     */
    static RESERVED2 => 16384

    /**
     * Native name: PUAF_LMZ_UNLOCKED
     * @type {Integer (Int32)}
     */
    static LMZ_UNLOCKED => 65536

    /**
     * Native name: PUAF_LMZ_LOCKED
     * @type {Integer (Int32)}
     */
    static LMZ_LOCKED => 131072

    /**
     * Native name: PUAF_DEFAULTZONEPOL
     * @type {Integer (Int32)}
     */
    static DEFAULTZONEPOL => 262144

    /**
     * Native name: PUAF_NPL_USE_LOCKED_IF_RESTRICTED
     * @type {Integer (Int32)}
     */
    static NPL_USE_LOCKED_IF_RESTRICTED => 524288

    /**
     * Native name: PUAF_NOUIIFLOCKED
     * @type {Integer (Int32)}
     */
    static NOUIIFLOCKED => 1048576

    /**
     * Native name: PUAF_DRAGPROTOCOLCHECK
     * @type {Integer (Int32)}
     */
    static DRAGPROTOCOLCHECK => 2097152
}
