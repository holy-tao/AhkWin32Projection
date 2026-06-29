#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CSV_CONTROL_OP.ahk" { CSV_CONTROL_OP }

/**
 * Represents a type of CSV control operation.
 * @remarks
 * This structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_csv_control">FSCTL_CSV_CONTROL</a> 
 *     control code to indicate what kind of CSV control operation is being undertaken. It is an alternative to calling 
 *     that control code by just passing a <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-csv_control_op">CSV_CONTROL_OP</a> 
 *     enumeration value, as the structure encapsulates an enumeration value of that type.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-csv_control_param
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CSV_CONTROL_PARAM {
    #StructPack 8

    /**
     * The type of CSV control operation to undertake.
     */
    Operation : CSV_CONTROL_OP

    /**
     * Unused.
     */
    Unused : Int64

}
