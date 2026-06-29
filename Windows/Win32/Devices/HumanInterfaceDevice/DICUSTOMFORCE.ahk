#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DICUSTOMFORCE {
    #StructPack 8

    cChannels : UInt32

    dwSamplePeriod : UInt32

    cSamples : UInt32

    rglForceData : IntPtr

}
