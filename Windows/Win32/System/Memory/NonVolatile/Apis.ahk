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
     * @param {Pointer} Size_ 
     * @param {Pointer<Pointer<Void>>} NvToken 
     * @returns {Integer} 
     */
    static RtlGetNonVolatileToken(NvBuffer, Size_, NvToken) {
        NvTokenMarshal := NvToken is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\RtlGetNonVolatileToken", "ptr", NvBuffer, "ptr", Size_, NvTokenMarshal, NvToken, "uint")
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
     * @param {Pointer} Size_ 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static RtlFlushNonVolatileMemory(NvToken, NvBuffer, Size_, Flags) {
        NvTokenMarshal := NvToken is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlFlushNonVolatileMemory", NvTokenMarshal, NvToken, "ptr", NvBuffer, "ptr", Size_, "uint", Flags, "uint")
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
     * @param {Pointer} Size_ 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static RtlWriteNonVolatileMemory(NvToken, NvDestination, Source, Size_, Flags) {
        NvTokenMarshal := NvToken is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlWriteNonVolatileMemory", NvTokenMarshal, NvToken, "ptr", NvDestination, "ptr", Source, "ptr", Size_, "uint", Flags, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} NvToken 
     * @param {Pointer} NvDestination 
     * @param {Pointer} Size_ 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static RtlFillNonVolatileMemory(NvToken, NvDestination, Size_, Value, Flags) {
        NvTokenMarshal := NvToken is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\RtlFillNonVolatileMemory", NvTokenMarshal, NvToken, "ptr", NvDestination, "ptr", Size_, "char", Value, "uint", Flags, "uint")
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
