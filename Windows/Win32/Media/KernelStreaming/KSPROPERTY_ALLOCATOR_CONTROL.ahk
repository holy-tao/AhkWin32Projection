#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_ALLOCATOR_CONTROL extends Win32Enum {

    /**
     * Native name: KSPROPERTY_ALLOCATOR_CONTROL_HONOR_COUNT
     * @type {Integer (Int32)}
     */
    static HONOR_COUNT => 0

    /**
     * Native name: KSPROPERTY_ALLOCATOR_CONTROL_SURFACE_SIZE
     * @type {Integer (Int32)}
     */
    static SURFACE_SIZE => 1

    /**
     * Native name: KSPROPERTY_ALLOCATOR_CONTROL_CAPTURE_CAPS
     * @type {Integer (Int32)}
     */
    static CAPTURE_CAPS => 2

    /**
     * Native name: KSPROPERTY_ALLOCATOR_CONTROL_CAPTURE_INTERLEAVE
     * @type {Integer (Int32)}
     */
    static CAPTURE_INTERLEAVE => 3
}
