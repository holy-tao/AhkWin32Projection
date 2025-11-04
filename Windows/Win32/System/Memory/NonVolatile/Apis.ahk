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
     * @param {Pointer<Pointer<Void>>} NvToken 
     * @returns {Integer} 
     */
    static RtlGetNonVolatileToken(NvBuffer, Size, NvToken) {
        NvTokenMarshal := NvToken is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\RtlGetNonVolatileToken", "ptr", NvBuffer, "ptr", Size, NvTokenMarshal, NvToken, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NvToken 
     * @returns {Integer} 
     */
    static RtlFreeNonVolatileToken(NvToken) {
        NvTokenMarshal := NvToken is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlFreeNonVolatileToken", NvTokenMarshal, NvToken, "uint")
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
        NvTokenMarshal := NvToken is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlFlushNonVolatileMemory", NvTokenMarshal, NvToken, "ptr", NvBuffer, "ptr", Size, "uint", Flags, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NvToken 
     * @returns {Integer} 
     */
    static RtlDrainNonVolatileFlush(NvToken) {
        NvTokenMarshal := NvToken is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlDrainNonVolatileFlush", NvTokenMarshal, NvToken, "uint")
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
        NvTokenMarshal := NvToken is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlWriteNonVolatileMemory", NvTokenMarshal, NvToken, "ptr", NvDestination, "ptr", Source, "ptr", Size, "uint", Flags, "uint")
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
        NvTokenMarshal := NvToken is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlFillNonVolatileMemory", NvTokenMarshal, NvToken, "ptr", NvDestination, "ptr", Size, "char", Value, "uint", Flags, "uint")
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
        NvTokenMarshal := NvToken is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlFlushNonVolatileMemoryRanges", NvTokenMarshal, NvToken, "ptr", NvRanges, "ptr", NumRanges, "uint", Flags, "uint")
        return result
    }

;@endregion Methods
}
