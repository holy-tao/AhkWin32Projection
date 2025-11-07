#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the format of the raw input from a Human Interface Device (HID).
 * @remarks
 * 
 * Each <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-input">WM_INPUT</a> can indicate several inputs, but all of the inputs come from the same HID. The size of the <b>bRawData</b> array is <b>dwSizeHid</b> *	<b>dwCount</b>.
 * 
 * For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/hid/interpreting-hid-reports">Interpreting HID Reports</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-rawhid
 * @namespace Windows.Win32.UI.Input
 * @version v4.0.30319
 */
class RAWHID extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of each HID input in <b>bRawData</b>.
     * @type {Integer}
     */
    dwSizeHid {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of HID inputs in <b>bRawData</b>.
     * @type {Integer}
     */
    dwCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>BYTE[1]</b>
     * 
     * The raw input data, as an array of bytes.
     * @type {Array<Byte>}
     */
    bRawData{
        get {
            if(!this.HasProp("__bRawDataProxyArray"))
                this.__bRawDataProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__bRawDataProxyArray
        }
    }
}
