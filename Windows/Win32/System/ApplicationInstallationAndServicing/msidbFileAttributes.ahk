#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbFileAttributes extends Win32Enum {

    /**
     * Native name: msidbFileAttributesReadOnly
     * @type {Integer (Int32)}
     */
    static ReadOnly => 1

    /**
     * Native name: msidbFileAttributesHidden
     * @type {Integer (Int32)}
     */
    static Hidden => 2

    /**
     * Native name: msidbFileAttributesSystem
     * @type {Integer (Int32)}
     */
    static System => 4

    /**
     * Native name: msidbFileAttributesReserved0
     * @type {Integer (Int32)}
     */
    static Reserved0 => 8

    /**
     * Native name: msidbFileAttributesIsolatedComp
     * @type {Integer (Int32)}
     */
    static IsolatedComp => 16

    /**
     * Native name: msidbFileAttributesReserved1
     * @type {Integer (Int32)}
     */
    static Reserved1 => 64

    /**
     * Native name: msidbFileAttributesReserved2
     * @type {Integer (Int32)}
     */
    static Reserved2 => 128

    /**
     * Native name: msidbFileAttributesReserved3
     * @type {Integer (Int32)}
     */
    static Reserved3 => 256

    /**
     * Native name: msidbFileAttributesVital
     * @type {Integer (Int32)}
     */
    static Vital => 512

    /**
     * Native name: msidbFileAttributesChecksum
     * @type {Integer (Int32)}
     */
    static Checksum => 1024

    /**
     * Native name: msidbFileAttributesPatchAdded
     * @type {Integer (Int32)}
     */
    static PatchAdded => 4096

    /**
     * Native name: msidbFileAttributesNoncompressed
     * @type {Integer (Int32)}
     */
    static Noncompressed => 8192

    /**
     * Native name: msidbFileAttributesCompressed
     * @type {Integer (Int32)}
     */
    static Compressed => 16384

    /**
     * Native name: msidbFileAttributesReserved4
     * @type {Integer (Int32)}
     */
    static Reserved4 => 32768
}
