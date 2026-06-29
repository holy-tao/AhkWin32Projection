#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DIOBJECTATTRIBUTES structure describes the information contained in the &quot;Attributes&quot; value of the registry key for each &quot;object&quot; on a device. If the &quot;Attributes&quot; value is absent, then default attributes are used.
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/ns-dinputd-diobjectattributes
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIOBJECTATTRIBUTES {
    #StructPack 4

    /**
     * There may be zero, one, or more of the following flags:
     */
    dwFlags : UInt32

    /**
     * Specifies the HID usage page to associate with the object.
     */
    wUsagePage : UInt16

    /**
     * Specifies the HID usage to associate with the object.
     */
    wUsage : UInt16

}
