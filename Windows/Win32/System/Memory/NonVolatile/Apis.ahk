#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\NV_MEMORY_RANGE.ahk" { NV_MEMORY_RANGE }

/**
 * @namespace Windows.Win32.System.Memory.NonVolatile
 */

;@region Functions
/**
 * 
 * @param {Integer} NvBuffer 
 * @param {Pointer} _Size 
 * @param {Pointer<Pointer<Void>>} NvToken 
 * @returns {Integer} 
 */
export RtlGetNonVolatileToken(NvBuffer, _Size, NvToken) {
    NvTokenMarshal := NvToken is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\RtlGetNonVolatileToken", IntPtr, NvBuffer, IntPtr, _Size, NvTokenMarshal, NvToken, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NvToken 
 * @returns {Integer} 
 */
export RtlFreeNonVolatileToken(NvToken) {
    NvTokenMarshal := NvToken is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlFreeNonVolatileToken", NvTokenMarshal, NvToken, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NvToken 
 * @param {Integer} NvBuffer 
 * @param {Pointer} _Size 
 * @param {Integer} Flags 
 * @returns {Integer} 
 */
export RtlFlushNonVolatileMemory(NvToken, NvBuffer, _Size, Flags) {
    NvTokenMarshal := NvToken is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlFlushNonVolatileMemory", NvTokenMarshal, NvToken, IntPtr, NvBuffer, IntPtr, _Size, UInt32, Flags, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NvToken 
 * @returns {Integer} 
 */
export RtlDrainNonVolatileFlush(NvToken) {
    NvTokenMarshal := NvToken is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlDrainNonVolatileFlush", NvTokenMarshal, NvToken, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NvToken 
 * @param {Integer} NvDestination 
 * @param {Integer} Source 
 * @param {Pointer} _Size 
 * @param {Integer} Flags 
 * @returns {Integer} 
 */
export RtlWriteNonVolatileMemory(NvToken, NvDestination, Source, _Size, Flags) {
    NvTokenMarshal := NvToken is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlWriteNonVolatileMemory", NvTokenMarshal, NvToken, IntPtr, NvDestination, IntPtr, Source, IntPtr, _Size, UInt32, Flags, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NvToken 
 * @param {Integer} NvDestination 
 * @param {Pointer} _Size 
 * @param {Integer} Value 
 * @param {Integer} Flags 
 * @returns {Integer} 
 */
export RtlFillNonVolatileMemory(NvToken, NvDestination, _Size, Value, Flags) {
    NvTokenMarshal := NvToken is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlFillNonVolatileMemory", NvTokenMarshal, NvToken, IntPtr, NvDestination, IntPtr, _Size, Int8, Value, UInt32, Flags, UInt32)
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
export RtlFlushNonVolatileMemoryRanges(NvToken, NvRanges, NumRanges, Flags) {
    NvTokenMarshal := NvToken is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\RtlFlushNonVolatileMemoryRanges", NvTokenMarshal, NvToken, NV_MEMORY_RANGE.Ptr, NvRanges, IntPtr, NumRanges, UInt32, Flags, UInt32)
    return result
}

;@endregion Functions
