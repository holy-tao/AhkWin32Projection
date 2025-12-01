#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the time-out parameters for a communications device.
 * @remarks
 * If an application sets <b>ReadIntervalTimeout</b> and 
 *     <b>ReadTotalTimeoutMultiplier</b> to <b>MAXDWORD</b> and sets 
 *     <b>ReadTotalTimeoutConstant</b> to a value greater than zero and less than 
 *     <b>MAXDWORD</b>, one of the following occurs when the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> function is called:
 * 
 * <ul>
 * <li>If there are any bytes in the input buffer, 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> returns immediately with the bytes in the 
 *       buffer.</li>
 * <li>If there are no bytes in the input buffer, <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> 
 *       waits until a byte arrives and then returns immediately.</li>
 * <li>If no bytes arrive within the time specified by <b>ReadTotalTimeoutConstant</b>, 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> times out.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-commtimeouts
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class COMMTIMEOUTS extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The maximum time allowed to elapse before the arrival of the next byte on the communications line, in 
     *        milliseconds. If the interval between the arrival of any two bytes exceeds this amount, the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> operation is completed and any buffered data is 
     *        returned. A value of zero indicates that interval time-outs are not used.
     * 
     * A value of <b>MAXDWORD</b>, combined with zero values for both the 
     *        <b>ReadTotalTimeoutConstant</b> and <b>ReadTotalTimeoutMultiplier</b> 
     *        members, specifies that the read operation is to return immediately with the bytes that have already been 
     *        received, even if no bytes have been received.
     * @type {Integer}
     */
    ReadIntervalTimeout {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The multiplier used to calculate the total time-out period for read operations, in milliseconds. For each 
     *       read operation, this value is multiplied by the requested number of bytes to be read.
     * @type {Integer}
     */
    ReadTotalTimeoutMultiplier {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A constant used to calculate the total time-out period for read operations, in milliseconds. For each read 
     *        operation, this value is added to the product of the <b>ReadTotalTimeoutMultiplier</b> 
     *        member and the requested number of bytes.
     * 
     * A value of zero for both the <b>ReadTotalTimeoutMultiplier</b> and 
     *        <b>ReadTotalTimeoutConstant</b> members indicates that total time-outs are not used for 
     *        read operations.
     * @type {Integer}
     */
    ReadTotalTimeoutConstant {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The multiplier used to calculate the total time-out period for write operations, in milliseconds. For each 
     *       write operation, this value is multiplied by the number of bytes to be written.
     * @type {Integer}
     */
    WriteTotalTimeoutMultiplier {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A constant used to calculate the total time-out period for write operations, in milliseconds. For each write 
     *        operation, this value is added to the product of the <b>WriteTotalTimeoutMultiplier</b> 
     *        member and the number of bytes to be written.
     * 
     * A value of zero for both the <b>WriteTotalTimeoutMultiplier</b> and 
     *        <b>WriteTotalTimeoutConstant</b> members indicates that total time-outs are not used for 
     *        write operations.
     * @type {Integer}
     */
    WriteTotalTimeoutConstant {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
