#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class SFGAO_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_CANCOPY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_CANMOVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_CANLINK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_STORAGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_CANRENAME => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_CANDELETE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_HASPROPSHEET => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_DROPTARGET => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_CAPABILITYMASK => 375

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_PLACEHOLDER => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_SYSTEM => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_ENCRYPTED => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_ISSLOW => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_GHOSTED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_LINK => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_SHARE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_READONLY => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_HIDDEN => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_DISPLAYATTRMASK => 1032192

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_FILESYSANCESTOR => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_FOLDER => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_FILESYSTEM => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_HASSUBFOLDER => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_CONTENTSMASK => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_VALIDATE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_REMOVABLE => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_COMPRESSED => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_BROWSABLE => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_NONENUMERATED => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_NEWCONTENT => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_CANMONIKER => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_HASSTORAGE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_STREAM => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_STORAGEANCESTOR => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_STORAGECAPMASK => 1891958792

    /**
     * @type {Integer (UInt32)}
     */
    static SFGAO_PKEYSFGAOMASK => 2164539392
}
