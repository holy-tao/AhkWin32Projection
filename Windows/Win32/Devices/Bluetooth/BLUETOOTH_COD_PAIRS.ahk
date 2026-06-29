#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The BLUETOOTH_COD_PAIRS structure provides for specification and retrieval of Bluetooth Class Of Device (COD) information.
 * @remarks
 * If a minor code is provided in <b>ulCODMask</b> it must also match the minor code returned by the remote device.  A major code must be set if a minor code is specified; zero is not a valid major code.
 * 
 * See the Bluetooth specification at 
 * <a href="https://www.bluetooth.com/">www.bluetooth.com</a> for Class Of Device information.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_cod_pairs
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BLUETOOTH_COD_PAIRS {
    #StructPack 8

    /**
     * A mask to compare to determine the class of device. The major and minor codes of <b>ulCODMask</b> are used to compare  the class of device found.  If a major code is provided  it must match the major code returned by the remote device, such that GET_COD_MAJOR(ulCODMask) is equal to GET_COD_MAJOR([class of device of the remote device]).
     */
    ulCODMask : UInt32

    /**
     * Descriptive string of the mask.
     */
    pcszDescription : PWSTR

}
