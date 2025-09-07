#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CLUSTER_HEALTH_FAULT_ARRAY structure is part of the resapi.h header used by Windows Clustering.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-cluster_health_fault_array
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_HEALTH_FAULT_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of faults in the array.
     * @type {Integer}
     */
    numFaults {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The array of faults.
     * @type {Pointer<CLUSTER_HEALTH_FAULT>}
     */
    faults {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
