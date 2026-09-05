#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values of the ASM_NAME enumeration are the property IDs for the name-value pairs included in a side-by-side assembly name.
 * @see https://learn.microsoft.com/windows/win32/api/winsxs/ne-winsxs-asm_name
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class ASM_NAME extends Win32Enum {

    /**
     * Property ID for the assembly's public key. The value is a byte array.
     * Native name: ASM_NAME_PUBLIC_KEY
     * @type {Integer (Int32)}
     */
    static PUBLIC_KEY => 0

    /**
     * Property ID for the assembly's public key token. The value is a byte array.
     * Native name: ASM_NAME_PUBLIC_KEY_TOKEN
     * @type {Integer (Int32)}
     */
    static PUBLIC_KEY_TOKEN => 1

    /**
     * Property ID for a reserved name-value pair. The value is a byte array.
     * Native name: ASM_NAME_HASH_VALUE
     * @type {Integer (Int32)}
     */
    static HASH_VALUE => 2

    /**
     * Property ID for the assembly's simple name.  The value is a string value.
     * Native name: ASM_NAME_NAME
     * @type {Integer (Int32)}
     */
    static NAME => 3

    /**
     * Property ID for the assembly's major version.  The value is a <b>WORD</b> value.
     * Native name: ASM_NAME_MAJOR_VERSION
     * @type {Integer (Int32)}
     */
    static MAJOR_VERSION => 4

    /**
     * Property ID for the assembly's minor version. The value is a <b>WORD</b> value.
     * Native name: ASM_NAME_MINOR_VERSION
     * @type {Integer (Int32)}
     */
    static MINOR_VERSION => 5

    /**
     * Property ID for the assembly's build version.  The value  is a <b>WORD</b> value.
     * Native name: ASM_NAME_BUILD_NUMBER
     * @type {Integer (Int32)}
     */
    static BUILD_NUMBER => 6

    /**
     * Property ID for the assembly's revision version.   The value is a <b>WORD</b> value.
     * Native name: ASM_NAME_REVISION_NUMBER
     * @type {Integer (Int32)}
     */
    static REVISION_NUMBER => 7

    /**
     * Property ID for the assembly's culture. The value is a string value.
     * Native name: ASM_NAME_CULTURE
     * @type {Integer (Int32)}
     */
    static CULTURE => 8

    /**
     * Property ID for a reserved name-value pair.
     * Native name: ASM_NAME_PROCESSOR_ID_ARRAY
     * @type {Integer (Int32)}
     */
    static PROCESSOR_ID_ARRAY => 9

    /**
     * Property ID for a reserved name-value pair.
     * Native name: ASM_NAME_OSINFO_ARRAY
     * @type {Integer (Int32)}
     */
    static OSINFO_ARRAY => 10

    /**
     * Property ID for a reserved name-value pair.    The value is a <b>DWORD</b> value.
     * Native name: ASM_NAME_HASH_ALGID
     * @type {Integer (Int32)}
     */
    static HASH_ALGID => 11

    /**
     * Property ID for a reserved name-value pair.
     * Native name: ASM_NAME_ALIAS
     * @type {Integer (Int32)}
     */
    static ALIAS => 12

    /**
     * Property ID for a reserved name-value pair.
     * Native name: ASM_NAME_CODEBASE_URL
     * @type {Integer (Int32)}
     */
    static CODEBASE_URL => 13

    /**
     * Property ID for a reserved name-value pair.    The value is a <b>FILETIME</b> structure.
     * Native name: ASM_NAME_CODEBASE_LASTMOD
     * @type {Integer (Int32)}
     */
    static CODEBASE_LASTMOD => 14

    /**
     * Property ID for the assembly as a simply named assembly that does not have a public key.
     * Native name: ASM_NAME_NULL_PUBLIC_KEY
     * @type {Integer (Int32)}
     */
    static NULL_PUBLIC_KEY => 15

    /**
     * Property ID for the assembly as a simply named assembly that does not have a public key token.
     * Native name: ASM_NAME_NULL_PUBLIC_KEY_TOKEN
     * @type {Integer (Int32)}
     */
    static NULL_PUBLIC_KEY_TOKEN => 16

    /**
     * Property ID for a reserved name-value pair.        The value is a string value.
     * Native name: ASM_NAME_CUSTOM
     * @type {Integer (Int32)}
     */
    static CUSTOM => 17

    /**
     * Property ID for a reserved name-value pair.
     * Native name: ASM_NAME_NULL_CUSTOM
     * @type {Integer (Int32)}
     */
    static NULL_CUSTOM => 18

    /**
     * Property ID for a reserved name-value pair.
     * Native name: ASM_NAME_MVID
     * @type {Integer (Int32)}
     */
    static MVID => 19

    /**
     * Reserved.
     * Native name: ASM_NAME_MAX_PARAMS
     * @type {Integer (Int32)}
     */
    static MAX_PARAMS => 20
}
