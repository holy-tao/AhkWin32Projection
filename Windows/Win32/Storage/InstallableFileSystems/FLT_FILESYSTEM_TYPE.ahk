#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 */
class FLT_FILESYSTEM_TYPE extends Win32Enum {

    /**
     * Native name: FLT_FSTYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static FSTYPE_UNKNOWN => 0

    /**
     * Native name: FLT_FSTYPE_RAW
     * @type {Integer (Int32)}
     */
    static FSTYPE_RAW => 1

    /**
     * Native name: FLT_FSTYPE_NTFS
     * @type {Integer (Int32)}
     */
    static FSTYPE_NTFS => 2

    /**
     * Native name: FLT_FSTYPE_FAT
     * @type {Integer (Int32)}
     */
    static FSTYPE_FAT => 3

    /**
     * Native name: FLT_FSTYPE_CDFS
     * @type {Integer (Int32)}
     */
    static FSTYPE_CDFS => 4

    /**
     * Native name: FLT_FSTYPE_UDFS
     * @type {Integer (Int32)}
     */
    static FSTYPE_UDFS => 5

    /**
     * Native name: FLT_FSTYPE_LANMAN
     * @type {Integer (Int32)}
     */
    static FSTYPE_LANMAN => 6

    /**
     * Native name: FLT_FSTYPE_WEBDAV
     * @type {Integer (Int32)}
     */
    static FSTYPE_WEBDAV => 7

    /**
     * Native name: FLT_FSTYPE_RDPDR
     * @type {Integer (Int32)}
     */
    static FSTYPE_RDPDR => 8

    /**
     * Native name: FLT_FSTYPE_NFS
     * @type {Integer (Int32)}
     */
    static FSTYPE_NFS => 9

    /**
     * Native name: FLT_FSTYPE_MS_NETWARE
     * @type {Integer (Int32)}
     */
    static FSTYPE_MS_NETWARE => 10

    /**
     * Native name: FLT_FSTYPE_NETWARE
     * @type {Integer (Int32)}
     */
    static FSTYPE_NETWARE => 11

    /**
     * Native name: FLT_FSTYPE_BSUDF
     * @type {Integer (Int32)}
     */
    static FSTYPE_BSUDF => 12

    /**
     * Native name: FLT_FSTYPE_MUP
     * @type {Integer (Int32)}
     */
    static FSTYPE_MUP => 13

    /**
     * Native name: FLT_FSTYPE_RSFX
     * @type {Integer (Int32)}
     */
    static FSTYPE_RSFX => 14

    /**
     * Native name: FLT_FSTYPE_ROXIO_UDF1
     * @type {Integer (Int32)}
     */
    static FSTYPE_ROXIO_UDF1 => 15

    /**
     * Native name: FLT_FSTYPE_ROXIO_UDF2
     * @type {Integer (Int32)}
     */
    static FSTYPE_ROXIO_UDF2 => 16

    /**
     * Native name: FLT_FSTYPE_ROXIO_UDF3
     * @type {Integer (Int32)}
     */
    static FSTYPE_ROXIO_UDF3 => 17

    /**
     * Native name: FLT_FSTYPE_TACIT
     * @type {Integer (Int32)}
     */
    static FSTYPE_TACIT => 18

    /**
     * Native name: FLT_FSTYPE_FS_REC
     * @type {Integer (Int32)}
     */
    static FSTYPE_FS_REC => 19

    /**
     * Native name: FLT_FSTYPE_INCD
     * @type {Integer (Int32)}
     */
    static FSTYPE_INCD => 20

    /**
     * Native name: FLT_FSTYPE_INCD_FAT
     * @type {Integer (Int32)}
     */
    static FSTYPE_INCD_FAT => 21

    /**
     * Native name: FLT_FSTYPE_EXFAT
     * @type {Integer (Int32)}
     */
    static FSTYPE_EXFAT => 22

    /**
     * Native name: FLT_FSTYPE_PSFS
     * @type {Integer (Int32)}
     */
    static FSTYPE_PSFS => 23

    /**
     * Native name: FLT_FSTYPE_GPFS
     * @type {Integer (Int32)}
     */
    static FSTYPE_GPFS => 24

    /**
     * Native name: FLT_FSTYPE_NPFS
     * @type {Integer (Int32)}
     */
    static FSTYPE_NPFS => 25

    /**
     * Native name: FLT_FSTYPE_MSFS
     * @type {Integer (Int32)}
     */
    static FSTYPE_MSFS => 26

    /**
     * Native name: FLT_FSTYPE_CSVFS
     * @type {Integer (Int32)}
     */
    static FSTYPE_CSVFS => 27

    /**
     * Native name: FLT_FSTYPE_REFS
     * @type {Integer (Int32)}
     */
    static FSTYPE_REFS => 28

    /**
     * Native name: FLT_FSTYPE_OPENAFS
     * @type {Integer (Int32)}
     */
    static FSTYPE_OPENAFS => 29

    /**
     * Native name: FLT_FSTYPE_CIMFS
     * @type {Integer (Int32)}
     */
    static FSTYPE_CIMFS => 30
}
