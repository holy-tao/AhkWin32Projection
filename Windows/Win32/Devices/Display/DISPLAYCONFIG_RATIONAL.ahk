#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DISPLAYCONFIG_RATIONAL structure describes a fractional value that represents vertical and horizontal frequencies of a video mode (that is, vertical sync and horizontal sync).
 * @remarks
 * A DISPLAYCONFIG_RATIONAL structure is specified in members of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_target_info">DISPLAYCONFIG_PATH_TARGET_INFO</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_video_signal_info">DISPLAYCONFIG_VIDEO_SIGNAL_INFO</a> structures.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_rational
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_RATIONAL {
    #StructPack 4

    /**
     * The numerator of the frequency fraction.
     */
    Numerator : UInt32

    /**
     * The denominator of the frequency fraction.
     */
    Denominator : UInt32

}
