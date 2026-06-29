#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct PROFILER_HEAP_OBJECT_SCOPE_LIST {
    #StructPack 8

    count : UInt32

    scopes : IntPtr[1]

}
