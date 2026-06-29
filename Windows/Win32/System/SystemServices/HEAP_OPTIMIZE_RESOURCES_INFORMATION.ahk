#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies flags for a HeapOptimizeResources operation initiated with HeapSetInformation.
 * @remarks
 * Mandatory parameter to the HeapOptimizeResources class.
 * 
 * The <b>HEAP_OPTIMIZE_RESOURCES_CURRENT_VERSION</b> constant is available to fill in the Version field of the <b>HEAP_OPTIMIZE_RESOURCES_INFORMATION</b> structure. The only legal value for this field is currently 1.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-heap_optimize_resources_information
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct HEAP_OPTIMIZE_RESOURCES_INFORMATION {
    #StructPack 4

    Version : UInt32

    Flags : UInt32

}
