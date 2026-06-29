#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The values of the ASM_DISPLAY_FLAGS enumeration are used by the GetDisplayName method to specify which portions of the assembly's full name to include in the string representation of the assembly name.
 * @see https://learn.microsoft.com/windows/win32/api/winsxs/ne-winsxs-asm_display_flags
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct ASM_DISPLAY_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Include the version number.
     * @type {Integer (Int32)}
     */
    static ASM_DISPLAYF_VERSION => 1

    /**
     * Include the culture.
     * @type {Integer (Int32)}
     */
    static ASM_DISPLAYF_CULTURE => 2

    /**
     * Include the public key token.
     * @type {Integer (Int32)}
     */
    static ASM_DISPLAYF_PUBLIC_KEY_TOKEN => 4

    /**
     * Include the public key.
     * @type {Integer (Int32)}
     */
    static ASM_DISPLAYF_PUBLIC_KEY => 8

    /**
     * Include the custom part of the assembly name.
     * @type {Integer (Int32)}
     */
    static ASM_DISPLAYF_CUSTOM => 16

    /**
     * Include the processor architecture.
     * @type {Integer (Int32)}
     */
    static ASM_DISPLAYF_PROCESSORARCHITECTURE => 32

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static ASM_DISPLAYF_LANGUAGEID => 64
}
