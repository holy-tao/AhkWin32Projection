#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Options for enumerating display modes.
 * @remarks
 * These flag options are used in [**IDXGIOutput::GetDisplayModeList**](/windows/desktop/api/DXGI/nf-dxgi-idxgioutput-getdisplaymodelist) to enumerate display modes.
 * 
 * These flag options are also used in [**IDXGIOutput1::GetDisplayModeList1**](/windows/desktop/api/DXGI1_2/nf-dxgi1_2-idxgioutput1-getdisplaymodelist1) to enumerate display modes.
 * @see https://learn.microsoft.com/windows/win32/direct3ddxgi/dxgi-enum-modes
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class DXGI_ENUM_MODES extends Win32BitflagEnum {

    /**
     * Native name: DXGI_ENUM_MODES_INTERLACED
     * @type {Integer (UInt32)}
     */
    static INTERLACED => 1

    /**
     * Native name: DXGI_ENUM_MODES_SCALING
     * @type {Integer (UInt32)}
     */
    static SCALING => 2

    /**
     * Native name: DXGI_ENUM_MODES_STEREO
     * @type {Integer (UInt32)}
     */
    static STEREO => 4

    /**
     * Native name: DXGI_ENUM_MODES_DISABLED_STEREO
     * @type {Integer (UInt32)}
     */
    static DISABLED_STEREO => 8
}
