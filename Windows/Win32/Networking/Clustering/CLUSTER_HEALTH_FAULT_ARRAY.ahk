#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_HEALTH_FAULT.ahk" { CLUSTER_HEALTH_FAULT }

/**
 * The CLUSTER_HEALTH_FAULT_ARRAY structure is part of the resapi.h header used by Windows Clustering.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-cluster_health_fault_array
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_HEALTH_FAULT_ARRAY {
    #StructPack 8

    /**
     * The number of faults in the array.
     */
    numFaults : UInt32

    /**
     * The array of faults.
     */
    faults : CLUSTER_HEALTH_FAULT.Ptr

}
