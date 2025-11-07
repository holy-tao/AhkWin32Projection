#Requires AutoHotkey v2.0.0 64-bit

/**
 * The VMR9Mode enumeration type specifies the rendering mode of the Video Mixing Renderer 9 (VMR-9) filter.
 * @remarks
 * 
 * For a description of the various VMR-9 modes, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/vmr-modes-of-operation">VMR Modes of Operation</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/ne-vmr9-vmr9mode
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9Mode{

    /**
     * Windowed mode.
     * @type {Integer (Int32)}
     */
    static VMR9Mode_Windowed => 1

    /**
     * Windowless mode.
     * @type {Integer (Int32)}
     */
    static VMR9Mode_Windowless => 2

    /**
     * Renderless mode.
     * @type {Integer (Int32)}
     */
    static VMR9Mode_Renderless => 4

    /**
     * Bitwise <b>OR</b> of all above flags; not used by applications.
     * @type {Integer (Int32)}
     */
    static VMR9Mode_Mask => 7
}
