#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FILE_SFIO_VOLUME_INFORMATION {
    #StructPack 4

    MaximumRequestsPerPeriod : UInt32

    MinimumPeriod : UInt32

    MinimumTransferSize : UInt32

}
