#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.Memory.NonVolatile
 * @version v4.0.30319
 */
class NonVolatile {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer} NvBuffer 
     * @param {Pointer} Size 
     * @param {Pointer<Void>} NvToken 
     * @returns {Integer} 
     */
    static RtlGetNonVolatileToken(NvBuffer, Size, NvToken) {
        result := DllCall("ntdll.dll\RtlGetNonVolatileToken", "ptr", NvBuffer, "ptr", Size, "ptr", NvToken, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NvToken 
     * @returns {Integer} 
     */
    static RtlFreeNonVolatileToken(NvToken) {
        result := DllCall("ntdll.dll\RtlFreeNonVolatileToken", "ptr", NvToken, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NvToken 
     * @param {Pointer} NvBuffer 
     * @param {Pointer} Size 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static RtlFlushNonVolatileMemory(NvToken, NvBuffer, Size, Flags) {
        result := DllCall("ntdll.dll\RtlFlushNonVolatileMemory", "ptr", NvToken, "ptr", NvBuffer, "ptr", Size, "uint", Flags, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NvToken 
     * @returns {Integer} 
     */
    static RtlDrainNonVolatileFlush(NvToken) {
        result := DllCall("ntdll.dll\RtlDrainNonVolatileFlush", "ptr", NvToken, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NvToken 
     * @param {Pointer} NvDestination 
     * @param {Pointer} Source 
     * @param {Pointer} Size 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static RtlWriteNonVolatileMemory(NvToken, NvDestination, Source, Size, Flags) {
        result := DllCall("ntdll.dll\RtlWriteNonVolatileMemory", "ptr", NvToken, "ptr", NvDestination, "ptr", Source, "ptr", Size, "uint", Flags, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NvToken 
     * @param {Pointer} NvDestination 
     * @param {Pointer} Size 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static RtlFillNonVolatileMemory(NvToken, NvDestination, Size, Value, Flags) {
        result := DllCall("ntdll.dll\RtlFillNonVolatileMemory", "ptr", NvToken, "ptr", NvDestination, "ptr", Size, "char", Value, "uint", Flags, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NvToken 
     * @param {Pointer<NV_MEMORY_RANGE>} NvRanges 
     * @param {Pointer} NumRanges 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static RtlFlushNonVolatileMemoryRanges(NvToken, NvRanges, NumRanges, Flags) {
        result := DllCall("ntdll.dll\RtlFlushNonVolatileMemoryRanges", "ptr", NvToken, "ptr", NvRanges, "ptr", NumRanges, "uint", Flags, "uint")
        return result
    }

;@endregion Methods
}
