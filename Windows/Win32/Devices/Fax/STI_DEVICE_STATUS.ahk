#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct STI_DEVICE_STATUS {
    #StructPack 4

    dwSize : UInt32

    StatusMask : UInt32

    dwOnlineState : UInt32

    dwHardwareStatusCode : UInt32

    dwEventHandlingState : UInt32

    dwPollingInterval : UInt32

}
