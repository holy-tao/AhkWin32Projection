#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VMRMode enumeration type is used in calls to the IVMRFilterConfig::GetRenderingMode and IVMRFilterConfig::SetRenderingMode methods to retrieve or specify the Video Mixing Renderer Filter 7 (VMR-7) rendering mode.
 * @remarks
 * These modes are mutually exclusive. The <b>VMRMode_Renderless</b> flag means that the application is providing its own allocator-presenter, which is responsible for all drawing to the screen. The <b>VMRMode_Windowed</b> flag is the default mode of the VMR-7. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/vmr-modes-of-operation">VMR Modes of Operation</a> for more information on the rendering modes.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-vmrmode
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMRMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Windowed mode.
     * @type {Integer (Int32)}
     */
    static VMRMode_Windowed => 1

    /**
     * Windowless mode.
     * @type {Integer (Int32)}
     */
    static VMRMode_Windowless => 2

    /**
     * Renderless mode.
     * @type {Integer (Int32)}
     */
    static VMRMode_Renderless => 4

    /**
     * Bitwise <b>OR</b> of all above flags; this is not a valid value to pass to <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrfilterconfig-setrenderingmode">SetRenderingMode</a>.
     * @type {Integer (Int32)}
     */
    static VMRMode_Mask => 7
}
