#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies flags for a HeapOptimizeResources operation initiated with HeapSetInformation.
 * @remarks
 * Mandatory parameter to the HeapOptimizeResources class.
  * 
  * The <b>HEAP_OPTIMIZE_RESOURCES_CURRENT_VERSION</b> constant is available to fill in the Version field of the <b>HEAP_OPTIMIZE_RESOURCES_INFORMATION</b> structure. The only legal value for this field is currently 1.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-heap_optimize_resources_information
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class HEAP_OPTIMIZE_RESOURCES_INFORMATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
