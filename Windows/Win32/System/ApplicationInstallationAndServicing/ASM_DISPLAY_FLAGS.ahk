#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values of the ASM_DISPLAY_FLAGS enumeration are used by the GetDisplayName method to specify which portions of the assembly's full name to include in the string representation of the assembly name.
 * @see https://learn.microsoft.com/windows/win32/api/winsxs/ne-winsxs-asm_display_flags
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class ASM_DISPLAY_FLAGS extends Win32Enum {

    /**
     * Include the version number.
     * Native name: ASM_DISPLAYF_VERSION
     * @type {Integer (Int32)}
     */
    static DISPLAYF_VERSION => 1

    /**
     * Include the culture.
     * Native name: ASM_DISPLAYF_CULTURE
     * @type {Integer (Int32)}
     */
    static DISPLAYF_CULTURE => 2

    /**
     * Include the public key token.
     * Native name: ASM_DISPLAYF_PUBLIC_KEY_TOKEN
     * @type {Integer (Int32)}
     */
    static DISPLAYF_PUBLIC_KEY_TOKEN => 4

    /**
     * Include the public key.
     * Native name: ASM_DISPLAYF_PUBLIC_KEY
     * @type {Integer (Int32)}
     */
    static DISPLAYF_PUBLIC_KEY => 8

    /**
     * Include the custom part of the assembly name.
     * Native name: ASM_DISPLAYF_CUSTOM
     * @type {Integer (Int32)}
     */
    static DISPLAYF_CUSTOM => 16

    /**
     * Include the processor architecture.
     * Native name: ASM_DISPLAYF_PROCESSORARCHITECTURE
     * @type {Integer (Int32)}
     */
    static DISPLAYF_PROCESSORARCHITECTURE => 32

    /**
     * Reserved.
     * Native name: ASM_DISPLAYF_LANGUAGEID
     * @type {Integer (Int32)}
     */
    static DISPLAYF_LANGUAGEID => 64
}
