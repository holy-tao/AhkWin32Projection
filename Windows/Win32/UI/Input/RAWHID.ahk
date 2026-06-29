#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the format of the raw input from a Human Interface Device (HID).
 * @remarks
 * Each <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-input">WM_INPUT</a> can indicate several inputs, but all of the inputs come from the same HID. The size of the <b>bRawData</b> array is <b>dwSizeHid</b> *	<b>dwCount</b>.
 * 
 * For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/hid/interpreting-hid-reports">Interpreting HID Reports</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-rawhid
 * @namespace Windows.Win32.UI.Input
 */
export default struct RAWHID {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of each HID input in <b>bRawData</b>.
     */
    dwSizeHid : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of HID inputs in <b>bRawData</b>.
     */
    dwCount : UInt32

    /**
     * Type: <b>BYTE[1]</b>
     * 
     * The raw input data, as an array of bytes.
     */
    bRawData : Int8[1]

}
