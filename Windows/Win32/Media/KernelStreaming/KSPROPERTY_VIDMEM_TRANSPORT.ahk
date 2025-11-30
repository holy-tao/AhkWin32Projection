#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_VIDMEM_TRANSPORT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DISPLAY_ADAPTER_GUID => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PREFERRED_CAPTURE_SURFACE => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CURRENT_CAPTURE_SURFACE => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_MAP_CAPTURE_HANDLE_TO_VRAM_ADDRESS => 4
}
