#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class SPSVCINST_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: SPSVCINST_TAGTOFRONT
     * @type {Integer (UInt32)}
     */
    static TAGTOFRONT => 1

    /**
     * Native name: SPSVCINST_ASSOCSERVICE
     * @type {Integer (UInt32)}
     */
    static ASSOCSERVICE => 2

    /**
     * Native name: SPSVCINST_DELETEEVENTLOGENTRY
     * @type {Integer (UInt32)}
     */
    static DELETEEVENTLOGENTRY => 4

    /**
     * Native name: SPSVCINST_NOCLOBBER_DISPLAYNAME
     * @type {Integer (UInt32)}
     */
    static NOCLOBBER_DISPLAYNAME => 8

    /**
     * Native name: SPSVCINST_NOCLOBBER_STARTTYPE
     * @type {Integer (UInt32)}
     */
    static NOCLOBBER_STARTTYPE => 16

    /**
     * Native name: SPSVCINST_NOCLOBBER_ERRORCONTROL
     * @type {Integer (UInt32)}
     */
    static NOCLOBBER_ERRORCONTROL => 32

    /**
     * Native name: SPSVCINST_NOCLOBBER_LOADORDERGROUP
     * @type {Integer (UInt32)}
     */
    static NOCLOBBER_LOADORDERGROUP => 64

    /**
     * Native name: SPSVCINST_NOCLOBBER_DEPENDENCIES
     * @type {Integer (UInt32)}
     */
    static NOCLOBBER_DEPENDENCIES => 128

    /**
     * Native name: SPSVCINST_NOCLOBBER_DESCRIPTION
     * @type {Integer (UInt32)}
     */
    static NOCLOBBER_DESCRIPTION => 256

    /**
     * Native name: SPSVCINST_STOPSERVICE
     * @type {Integer (UInt32)}
     */
    static STOPSERVICE => 512

    /**
     * Native name: SPSVCINST_CLOBBER_SECURITY
     * @type {Integer (UInt32)}
     */
    static CLOBBER_SECURITY => 1024

    /**
     * Native name: SPSVCINST_STARTSERVICE
     * @type {Integer (UInt32)}
     */
    static STARTSERVICE => 2048

    /**
     * Native name: SPSVCINST_NOCLOBBER_REQUIREDPRIVILEGES
     * @type {Integer (UInt32)}
     */
    static NOCLOBBER_REQUIREDPRIVILEGES => 4096

    /**
     * Native name: SPSVCINST_NOCLOBBER_TRIGGERS
     * @type {Integer (UInt32)}
     */
    static NOCLOBBER_TRIGGERS => 8192

    /**
     * Native name: SPSVCINST_NOCLOBBER_SERVICESIDTYPE
     * @type {Integer (UInt32)}
     */
    static NOCLOBBER_SERVICESIDTYPE => 16384

    /**
     * Native name: SPSVCINST_NOCLOBBER_DELAYEDAUTOSTART
     * @type {Integer (UInt32)}
     */
    static NOCLOBBER_DELAYEDAUTOSTART => 32768

    /**
     * Native name: SPSVCINST_UNIQUE_NAME
     * @type {Integer (UInt32)}
     */
    static UNIQUE_NAME => 65536

    /**
     * Native name: SPSVCINST_NOCLOBBER_FAILUREACTIONS
     * @type {Integer (UInt32)}
     */
    static NOCLOBBER_FAILUREACTIONS => 131072

    /**
     * Native name: SPSVCINST_NOCLOBBER_BOOTFLAGS
     * @type {Integer (UInt32)}
     */
    static NOCLOBBER_BOOTFLAGS => 262144
}
