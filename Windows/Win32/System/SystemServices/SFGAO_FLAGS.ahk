#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class SFGAO_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: SFGAO_CANCOPY
     * @type {Integer (UInt32)}
     */
    static CANCOPY => 1

    /**
     * Native name: SFGAO_CANMOVE
     * @type {Integer (UInt32)}
     */
    static CANMOVE => 2

    /**
     * Native name: SFGAO_CANLINK
     * @type {Integer (UInt32)}
     */
    static CANLINK => 4

    /**
     * Native name: SFGAO_STORAGE
     * @type {Integer (UInt32)}
     */
    static STORAGE => 8

    /**
     * Native name: SFGAO_CANRENAME
     * @type {Integer (UInt32)}
     */
    static CANRENAME => 16

    /**
     * Native name: SFGAO_CANDELETE
     * @type {Integer (UInt32)}
     */
    static CANDELETE => 32

    /**
     * Native name: SFGAO_HASPROPSHEET
     * @type {Integer (UInt32)}
     */
    static HASPROPSHEET => 64

    /**
     * Native name: SFGAO_DROPTARGET
     * @type {Integer (UInt32)}
     */
    static DROPTARGET => 256

    /**
     * Native name: SFGAO_CAPABILITYMASK
     * @type {Integer (UInt32)}
     */
    static CAPABILITYMASK => 375

    /**
     * Native name: SFGAO_PLACEHOLDER
     * @type {Integer (UInt32)}
     */
    static PLACEHOLDER => 2048

    /**
     * Native name: SFGAO_SYSTEM
     * @type {Integer (UInt32)}
     */
    static SYSTEM => 4096

    /**
     * Native name: SFGAO_ENCRYPTED
     * @type {Integer (UInt32)}
     */
    static ENCRYPTED => 8192

    /**
     * Native name: SFGAO_ISSLOW
     * @type {Integer (UInt32)}
     */
    static ISSLOW => 16384

    /**
     * Native name: SFGAO_GHOSTED
     * @type {Integer (UInt32)}
     */
    static GHOSTED => 32768

    /**
     * Native name: SFGAO_LINK
     * @type {Integer (UInt32)}
     */
    static LINK => 65536

    /**
     * Native name: SFGAO_SHARE
     * @type {Integer (UInt32)}
     */
    static SHARE => 131072

    /**
     * Native name: SFGAO_READONLY
     * @type {Integer (UInt32)}
     */
    static READONLY => 262144

    /**
     * Native name: SFGAO_HIDDEN
     * @type {Integer (UInt32)}
     */
    static HIDDEN => 524288

    /**
     * Native name: SFGAO_DISPLAYATTRMASK
     * @type {Integer (UInt32)}
     */
    static DISPLAYATTRMASK => 1032192

    /**
     * Native name: SFGAO_FILESYSANCESTOR
     * @type {Integer (UInt32)}
     */
    static FILESYSANCESTOR => 268435456

    /**
     * Native name: SFGAO_FOLDER
     * @type {Integer (UInt32)}
     */
    static FOLDER => 536870912

    /**
     * Native name: SFGAO_FILESYSTEM
     * @type {Integer (UInt32)}
     */
    static FILESYSTEM => 1073741824

    /**
     * Native name: SFGAO_HASSUBFOLDER
     * @type {Integer (UInt32)}
     */
    static HASSUBFOLDER => 2147483648

    /**
     * Native name: SFGAO_CONTENTSMASK
     * @type {Integer (UInt32)}
     */
    static CONTENTSMASK => 2147483648

    /**
     * Native name: SFGAO_VALIDATE
     * @type {Integer (UInt32)}
     */
    static VALIDATE => 16777216

    /**
     * Native name: SFGAO_REMOVABLE
     * @type {Integer (UInt32)}
     */
    static REMOVABLE => 33554432

    /**
     * Native name: SFGAO_COMPRESSED
     * @type {Integer (UInt32)}
     */
    static COMPRESSED => 67108864

    /**
     * Native name: SFGAO_BROWSABLE
     * @type {Integer (UInt32)}
     */
    static BROWSABLE => 134217728

    /**
     * Native name: SFGAO_NONENUMERATED
     * @type {Integer (UInt32)}
     */
    static NONENUMERATED => 1048576

    /**
     * Native name: SFGAO_NEWCONTENT
     * @type {Integer (UInt32)}
     */
    static NEWCONTENT => 2097152

    /**
     * Native name: SFGAO_CANMONIKER
     * @type {Integer (UInt32)}
     */
    static CANMONIKER => 4194304

    /**
     * Native name: SFGAO_HASSTORAGE
     * @type {Integer (UInt32)}
     */
    static HASSTORAGE => 4194304

    /**
     * Native name: SFGAO_STREAM
     * @type {Integer (UInt32)}
     */
    static STREAM => 4194304

    /**
     * Native name: SFGAO_STORAGEANCESTOR
     * @type {Integer (UInt32)}
     */
    static STORAGEANCESTOR => 8388608

    /**
     * Native name: SFGAO_STORAGECAPMASK
     * @type {Integer (UInt32)}
     */
    static STORAGECAPMASK => 1891958792

    /**
     * Native name: SFGAO_PKEYSFGAOMASK
     * @type {Integer (UInt32)}
     */
    static PKEYSFGAOMASK => 2164539392
}
