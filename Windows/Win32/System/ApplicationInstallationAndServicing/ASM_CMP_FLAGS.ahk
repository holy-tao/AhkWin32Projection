#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values of the ASM_CMP_FLAGS enumeration are used by the IsEqual method to specify which portions of two assembly names to compare.
 * @see https://learn.microsoft.com/windows/win32/api/winsxs/ne-winsxs-asm_cmp_flags
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class ASM_CMP_FLAGS extends Win32Enum {

    /**
     * Compare the name portion of the assembly names.
     * Native name: ASM_CMPF_NAME
     * @type {Integer (Int32)}
     */
    static CMPF_NAME => 1

    /**
     * Compare the major version portion of the assembly names.
     * Native name: ASM_CMPF_MAJOR_VERSION
     * @type {Integer (Int32)}
     */
    static CMPF_MAJOR_VERSION => 2

    /**
     * Compare the minor version portion of the assembly names.
     * Native name: ASM_CMPF_MINOR_VERSION
     * @type {Integer (Int32)}
     */
    static CMPF_MINOR_VERSION => 4

    /**
     * Compare the build version portion of the assembly names.
     * Native name: ASM_CMPF_BUILD_NUMBER
     * @type {Integer (Int32)}
     */
    static CMPF_BUILD_NUMBER => 8

    /**
     * Compare the revision version portion of the assembly names.
     * Native name: ASM_CMPF_REVISION_NUMBER
     * @type {Integer (Int32)}
     */
    static CMPF_REVISION_NUMBER => 16

    /**
     * Compare the public key token portion of the assembly names.
     * Native name: ASM_CMPF_PUBLIC_KEY_TOKEN
     * @type {Integer (Int32)}
     */
    static CMPF_PUBLIC_KEY_TOKEN => 32

    /**
     * Compare the culture portion of the assembly names.
     * Native name: ASM_CMPF_CULTURE
     * @type {Integer (Int32)}
     */
    static CMPF_CULTURE => 64

    /**
     * Compare the custom portion of the assembly names.
     * Native name: ASM_CMPF_CUSTOM
     * @type {Integer (Int32)}
     */
    static CMPF_CUSTOM => 128

    /**
     * Compare all portions of the assembly names. This is equivalent to setting:
     * 
     * ```
     * ASM_CMPF_NAME | ASM_CMPF_MAJOR_VERSION | ASM_CMPF_MINOR_VERSION | ASM_CMPF_REVISION_NUMBER | ASM_CMPF_BUILD_NUMBER | ASM_CMPF_PUBLIC_KEY_TOKEN | ASM_CMPF_CULTURE | ASM_CMPF_CUSTOM
     * ```
     * Native name: ASM_CMPF_ALL
     * @type {Integer (Int32)}
     */
    static CMPF_ALL => 255

    /**
     * Ignore the version number to compare assemblies with simple names.
     * Native name: ASM_CMPF_DEFAULT
     * @type {Integer (Int32)}
     */
    static CMPF_DEFAULT => 256
}
