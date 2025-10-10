#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a type of CSV control operation.
 * @remarks
 * 
  * This structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_csv_control">FSCTL_CSV_CONTROL</a> 
  *     control code to indicate what kind of CSV control operation is being undertaken. It is an alternative to calling 
  *     that control code by just passing a <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-csv_control_op">CSV_CONTROL_OP</a> 
  *     enumeration value, as the structure encapsulates an enumeration value of that type.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-csv_control_param
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CSV_CONTROL_PARAM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The type of CSV control operation to undertake.
     * @type {Integer}
     */
    Operation {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Unused.
     * @type {Integer}
     */
    Unused {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}
