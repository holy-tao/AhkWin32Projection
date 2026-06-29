#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DIFFDEVICEATTRIBUTES structure describes the information contained in the &quot;Attributes&quot; value of the OEMForceFeedback registry key.
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/ns-dinputd-diffdeviceattributes
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIFFDEVICEATTRIBUTES {
    #StructPack 4

    /**
     * Reserved for future use. This member must be set to zero.
     */
    dwFlags : UInt32

    /**
     * Specifies the minimum time between playback of force commands, in microseconds.
     */
    dwFFSamplePeriod : UInt32

    /**
     * Specifies the minimum amount of time that the device can resolve, in microseconds. The device rounds any time values to the nearest supported increment. For example, if the value of <b>dwFFMinTimeResolution</b> is 1000, then the device would round any times to the nearest millisecond.
     */
    dwFFMinTimeResolution : UInt32

}
