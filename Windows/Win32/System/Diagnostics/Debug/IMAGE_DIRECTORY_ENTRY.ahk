#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class IMAGE_DIRECTORY_ENTRY extends Win32Enum {

    /**
     * Native name: IMAGE_DIRECTORY_ENTRY_ARCHITECTURE
     * @type {Integer (UInt16)}
     */
    static ARCHITECTURE => 7

    /**
     * Native name: IMAGE_DIRECTORY_ENTRY_BASERELOC
     * @type {Integer (UInt16)}
     */
    static BASERELOC => 5

    /**
     * Native name: IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT
     * @type {Integer (UInt16)}
     */
    static BOUND_IMPORT => 11

    /**
     * Native name: IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR
     * @type {Integer (UInt16)}
     */
    static COM_DESCRIPTOR => 14

    /**
     * Native name: IMAGE_DIRECTORY_ENTRY_DEBUG
     * @type {Integer (UInt16)}
     */
    static DEBUG => 6

    /**
     * Native name: IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT
     * @type {Integer (UInt16)}
     */
    static DELAY_IMPORT => 13

    /**
     * Native name: IMAGE_DIRECTORY_ENTRY_EXCEPTION
     * @type {Integer (UInt16)}
     */
    static EXCEPTION => 3

    /**
     * Native name: IMAGE_DIRECTORY_ENTRY_EXPORT
     * @type {Integer (UInt16)}
     */
    static EXPORT => 0

    /**
     * Native name: IMAGE_DIRECTORY_ENTRY_GLOBALPTR
     * @type {Integer (UInt16)}
     */
    static GLOBALPTR => 8

    /**
     * Native name: IMAGE_DIRECTORY_ENTRY_IAT
     * @type {Integer (UInt16)}
     */
    static IAT => 12

    /**
     * Native name: IMAGE_DIRECTORY_ENTRY_IMPORT
     * @type {Integer (UInt16)}
     */
    static IMPORT => 1

    /**
     * Native name: IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG
     * @type {Integer (UInt16)}
     */
    static LOAD_CONFIG => 10

    /**
     * Native name: IMAGE_DIRECTORY_ENTRY_RESOURCE
     * @type {Integer (UInt16)}
     */
    static RESOURCE => 2

    /**
     * Native name: IMAGE_DIRECTORY_ENTRY_SECURITY
     * @type {Integer (UInt16)}
     */
    static SECURITY => 4

    /**
     * Native name: IMAGE_DIRECTORY_ENTRY_TLS
     * @type {Integer (UInt16)}
     */
    static TLS => 9
}
