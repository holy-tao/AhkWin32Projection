#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Specifies search criteria for Bluetooth device searches.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_search_params
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BLUETOOTH_DEVICE_SEARCH_PARAMS {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    dwSize : UInt32

    /**
     * A value that specifies that the search should return authenticated Bluetooth devices.
     */
    fReturnAuthenticated : BOOL

    /**
     * A value that specifies that the search should return remembered Bluetooth devices.
     */
    fReturnRemembered : BOOL

    /**
     * A value that specifies that the search should return unknown Bluetooth devices.
     */
    fReturnUnknown : BOOL

    /**
     * A value that specifies that the search should return connected Bluetooth devices.
     */
    fReturnConnected : BOOL

    /**
     * A value that specifies that a new inquiry should be issued.
     */
    fIssueInquiry : BOOL

    /**
     * A value that indicates the time out for the inquiry, expressed in increments of 1.28 seconds. For example, an inquiry of 12.8 seconds has a <b>cTimeoutMultiplier</b> value of 10. The maximum value for this member is 48. When a value greater than 48 is used, the calling function immediately fails and returns <b>E_INVALIDARG</b>.
     */
    cTimeoutMultiplier : Int8

    /**
     * A handle for the radio on which to perform the inquiry. Set to <b>NULL</b> to perform the inquiry on all local Bluetooth radios.
     */
    hRadio : HANDLE

}
