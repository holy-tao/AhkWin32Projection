#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the ASM_NAME enumeration are the property IDs for the name-value pairs included in a side-by-side assembly name.
 * @see https://learn.microsoft.com/windows/win32/api/winsxs/ne-winsxs-asm_name
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class ASM_NAME{

    /**
     * Property ID for the assembly's public key. The value is a byte array.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_PUBLIC_KEY => 0

    /**
     * Property ID for the assembly's public key token. The value is a byte array.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_PUBLIC_KEY_TOKEN => 1

    /**
     * Property ID for a reserved name-value pair. The value is a byte array.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_HASH_VALUE => 2

    /**
     * Property ID for the assembly's simple name.  The value is a string value.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_NAME => 3

    /**
     * Property ID for the assembly's major version.  The value is a <b>WORD</b> value.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_MAJOR_VERSION => 4

    /**
     * Property ID for the assembly's minor version. The value is a <b>WORD</b> value.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_MINOR_VERSION => 5

    /**
     * Property ID for the assembly's build version.  The value  is a <b>WORD</b> value.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_BUILD_NUMBER => 6

    /**
     * Property ID for the assembly's revision version.   The value is a <b>WORD</b> value.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_REVISION_NUMBER => 7

    /**
     * Property ID for the assembly's culture. The value is a string value.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_CULTURE => 8

    /**
     * Property ID for a reserved name-value pair.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_PROCESSOR_ID_ARRAY => 9

    /**
     * Property ID for a reserved name-value pair.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_OSINFO_ARRAY => 10

    /**
     * Property ID for a reserved name-value pair.    The value is a <b>DWORD</b> value.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_HASH_ALGID => 11

    /**
     * Property ID for a reserved name-value pair.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_ALIAS => 12

    /**
     * Property ID for a reserved name-value pair.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_CODEBASE_URL => 13

    /**
     * Property ID for a reserved name-value pair.    The value is a <b>FILETIME</b> structure.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_CODEBASE_LASTMOD => 14

    /**
     * Property ID for the assembly as a simply named assembly that does not have a public key.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_NULL_PUBLIC_KEY => 15

    /**
     * Property ID for the assembly as a simply named assembly that does not have a public key token.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_NULL_PUBLIC_KEY_TOKEN => 16

    /**
     * Property ID for a reserved name-value pair.        The value is a string value.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_CUSTOM => 17

    /**
     * Property ID for a reserved name-value pair.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_NULL_CUSTOM => 18

    /**
     * Property ID for a reserved name-value pair.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_MVID => 19

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static ASM_NAME_MAX_PARAMS => 20
}
