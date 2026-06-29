#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The values of the ASM_CMP_FLAGS enumeration are used by the IsEqual method to specify which portions of two assembly names to compare.
 * @see https://learn.microsoft.com/windows/win32/api/winsxs/ne-winsxs-asm_cmp_flags
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct ASM_CMP_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Compare the name portion of the assembly names.
     * @type {Integer (Int32)}
     */
    static ASM_CMPF_NAME => 1

    /**
     * Compare the major version portion of the assembly names.
     * @type {Integer (Int32)}
     */
    static ASM_CMPF_MAJOR_VERSION => 2

    /**
     * Compare the minor version portion of the assembly names.
     * @type {Integer (Int32)}
     */
    static ASM_CMPF_MINOR_VERSION => 4

    /**
     * Compare the build version portion of the assembly names.
     * @type {Integer (Int32)}
     */
    static ASM_CMPF_BUILD_NUMBER => 8

    /**
     * Compare the revision version portion of the assembly names.
     * @type {Integer (Int32)}
     */
    static ASM_CMPF_REVISION_NUMBER => 16

    /**
     * Compare the public key token portion of the assembly names.
     * @type {Integer (Int32)}
     */
    static ASM_CMPF_PUBLIC_KEY_TOKEN => 32

    /**
     * Compare the culture portion of the assembly names.
     * @type {Integer (Int32)}
     */
    static ASM_CMPF_CULTURE => 64

    /**
     * Compare the custom portion of the assembly names.
     * @type {Integer (Int32)}
     */
    static ASM_CMPF_CUSTOM => 128

    /**
     * Compare all portions of the assembly names. This is equivalent to setting:
     * 
     * ```
     * ASM_CMPF_NAME | ASM_CMPF_MAJOR_VERSION | ASM_CMPF_MINOR_VERSION | ASM_CMPF_REVISION_NUMBER | ASM_CMPF_BUILD_NUMBER | ASM_CMPF_PUBLIC_KEY_TOKEN | ASM_CMPF_CULTURE | ASM_CMPF_CUSTOM
     * ```
     * @type {Integer (Int32)}
     */
    static ASM_CMPF_ALL => 255

    /**
     * Ignore the version number to compare assemblies with simple names.
     * @type {Integer (Int32)}
     */
    static ASM_CMPF_DEFAULT => 256
}
