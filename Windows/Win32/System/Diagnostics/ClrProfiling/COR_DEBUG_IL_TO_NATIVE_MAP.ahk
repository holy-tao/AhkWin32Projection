#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_DEBUG_IL_TO_NATIVE_MAP {
    #StructPack 4

    ilOffset : UInt32

    nativeStartOffset : UInt32

    nativeEndOffset : UInt32

}
