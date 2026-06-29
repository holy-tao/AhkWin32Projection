#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROFILER_HEAP_SUMMARY_VERSION.ahk" { PROFILER_HEAP_SUMMARY_VERSION }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct PROFILER_HEAP_SUMMARY {
    #StructPack 4

    version : PROFILER_HEAP_SUMMARY_VERSION

    totalHeapSize : UInt32

}
