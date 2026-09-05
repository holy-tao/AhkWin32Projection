#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VMR9Mode enumeration type specifies the rendering mode of the Video Mixing Renderer 9 (VMR-9) filter.
 * @remarks
 * For a description of the various VMR-9 modes, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/vmr-modes-of-operation">VMR Modes of Operation</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ne-vmr9-vmr9mode
 * @namespace Windows.Win32.Media.DirectShow
 */
class VMR9Mode extends Win32Enum {

    /**
     * Windowed mode.
     * Native name: VMR9Mode_Windowed
     * @type {Integer (Int32)}
     */
    static Windowed => 1

    /**
     * Windowless mode.
     * Native name: VMR9Mode_Windowless
     * @type {Integer (Int32)}
     */
    static Windowless => 2

    /**
     * Renderless mode.
     * Native name: VMR9Mode_Renderless
     * @type {Integer (Int32)}
     */
    static Renderless => 4

    /**
     * Bitwise <b>OR</b> of all above flags; not used by applications.
     * Native name: VMR9Mode_Mask
     * @type {Integer (Int32)}
     */
    static Mask => 7
}
