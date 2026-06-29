#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_GET_BC_PROPERTIES_OUTPUT {
    #StructPack 8

    MaximumRequestsPerPeriod : UInt32

    MinimumPeriod : UInt32

    MaximumRequestSize : Int64

    EstimatedTimePerRequest : UInt32

    NumOutStandingRequests : UInt32

    RequestSize : Int64

}
