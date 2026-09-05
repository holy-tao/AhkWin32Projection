#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_VIDMEM_TRANSPORT extends Win32Enum {

    /**
     * Native name: KSPROPERTY_DISPLAY_ADAPTER_GUID
     * @type {Integer (Int32)}
     */
    static DISPLAY_ADAPTER_GUID => 1

    /**
     * Native name: KSPROPERTY_PREFERRED_CAPTURE_SURFACE
     * @type {Integer (Int32)}
     */
    static PREFERRED_CAPTURE_SURFACE => 2

    /**
     * Native name: KSPROPERTY_CURRENT_CAPTURE_SURFACE
     * @type {Integer (Int32)}
     */
    static CURRENT_CAPTURE_SURFACE => 3

    /**
     * Native name: KSPROPERTY_MAP_CAPTURE_HANDLE_TO_VRAM_ADDRESS
     * @type {Integer (Int32)}
     */
    static MAP_CAPTURE_HANDLE_TO_VRAM_ADDRESS => 4
}
