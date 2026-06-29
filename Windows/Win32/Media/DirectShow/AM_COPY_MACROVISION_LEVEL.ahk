#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the analog copy protection level.
 * @remarks
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-am_copy_macrovision">AM_COPY_MACROVISION</a> structure uses this data type.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ne-dvdmedia-am_copy_macrovision_level
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_COPY_MACROVISION_LEVEL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Disabled.
     * @type {Integer (Int32)}
     */
    static AM_MACROVISION_DISABLED => 0

    /**
     * Level 1.
     * @type {Integer (Int32)}
     */
    static AM_MACROVISION_LEVEL1 => 1

    /**
     * Level 2.
     * @type {Integer (Int32)}
     */
    static AM_MACROVISION_LEVEL2 => 2

    /**
     * Level 3.
     * @type {Integer (Int32)}
     */
    static AM_MACROVISION_LEVEL3 => 3
}
