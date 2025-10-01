#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class Communication {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_COMPRESSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_ERROR_CONTROL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_FORCED_EC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_CELLULAR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_FLOWCONTROL_HARD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_FLOWCONTROL_SOFT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_CCITT_OVERRIDE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_SPEED_ADJUST => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_TONE_DIAL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_BLIND_DIAL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_V23_OVERRIDE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_DIAGNOSTICS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_MASK_BEARERMODE => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_SHIFT_BEARERMODE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_MASK_PROTOCOLID => 983040

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_SHIFT_PROTOCOLID => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_MASK_PROTOCOLDATA => 267386880

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_SHIFT_PROTOCOLDATA => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_SHIFT_PROTOCOLINFO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_SHIFT_EXTENDEDINFO => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_BEARERMODE_ANALOG => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_BEARERMODE_ISDN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_BEARERMODE_GSM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_PROTOCOLID_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_PROTOCOLID_HDLCPPP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_PROTOCOLID_V128 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_PROTOCOLID_X75 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_PROTOCOLID_V110 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_PROTOCOLID_V120 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_PROTOCOLID_AUTO => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_PROTOCOLID_ANALOG => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_PROTOCOLID_GPRS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_PROTOCOLID_PIAFS => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_SHIFT_HDLCPPP_SPEED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_MASK_HDLCPPP_SPEED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_HDLCPPP_SPEED_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_HDLCPPP_SPEED_64K => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_HDLCPPP_SPEED_56K => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_SHIFT_HDLCPPP_AUTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_MASK_HDLCPPP_AUTH => 56

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_HDLCPPP_AUTH_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_HDLCPPP_AUTH_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_HDLCPPP_AUTH_PAP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_HDLCPPP_AUTH_CHAP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_HDLCPPP_AUTH_MSCHAP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_SHIFT_HDLCPPP_ML => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_MASK_HDLCPPP_ML => 192

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_HDLCPPP_ML_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_HDLCPPP_ML_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_HDLCPPP_ML_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_SHIFT_V120_SPEED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_MASK_V120_SPEED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_V120_SPEED_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_V120_SPEED_64K => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_V120_SPEED_56K => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_SHIFT_V120_ML => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_MASK_V120_ML => 192

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_V120_ML_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_V120_ML_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_V120_ML_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_SHIFT_X75_DATA => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_MASK_X75_DATA => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_X75_DATA_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_X75_DATA_64K => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_X75_DATA_128K => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_X75_DATA_T_70 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_X75_DATA_BTX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_SHIFT_V110_SPEED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_MASK_V110_SPEED => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_V110_SPEED_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_V110_SPEED_1DOT2K => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_V110_SPEED_2DOT4K => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_V110_SPEED_4DOT8K => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_V110_SPEED_9DOT6K => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_V110_SPEED_12DOT0K => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_V110_SPEED_14DOT4K => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_V110_SPEED_19DOT2K => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_V110_SPEED_28DOT8K => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_V110_SPEED_38DOT4K => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_V110_SPEED_57DOT6K => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_SHIFT_AUTO_SPEED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_MASK_AUTO_SPEED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_AUTO_SPEED_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_SHIFT_AUTO_ML => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_MASK_AUTO_ML => 192

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_AUTO_ML_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_AUTO_ML_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_AUTO_ML_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_ANALOG_RLP_ON => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_ANALOG_RLP_OFF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_ANALOG_V34 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_PIAFS_INCOMING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MDM_PIAFS_OUTGOING => 1

    /**
     * @type {String}
     */
    static SID_3GPP_SUPSVCMODEL => "{d7d08e07-d767-4478-b14a-eecc87ea12f7}"

    /**
     * @type {Integer (UInt32)}
     */
    static MAXLENGTH_NAI => 72

    /**
     * @type {Integer (UInt32)}
     */
    static MAXLENGTH_UICCDATASTORE => 10
;@endregion Constants

;@region Methods
    /**
     * Restores character transmission for a specified communications device and places the transmission line in a nonbreak state.
     * @remarks
     * A communications device is placed in a break state by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcommbreak">SetCommBreak</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-escapecommfunction">EscapeCommFunction</a> function. Character transmission is then suspended until the break state is cleared by calling 
     * <b>ClearCommBreak</b>.
     * @param {Pointer<Void>} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-clearcommbreak
     * @since windows5.1.2600
     */
    static ClearCommBreak(hFile) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ClearCommBreak", "ptr", hFile, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about a communications error and reports the current status of a communications device.
     * @remarks
     * If a communications port has been set up with a <b>TRUE</b> value for the <b>fAbortOnError</b> member of the setup 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure, the communications software will terminate all read and write operations on the communications port when a communications error occurs. No new read or write operations will be accepted until the application acknowledges the communications error by calling the 
     * <b>ClearCommError</b> function.
     * 
     * The 
     * <b>ClearCommError</b> function fills the status buffer pointed to by the <i>lpStat</i> parameter with the current status of the communications device specified by the <i>hFile</i> parameter.
     * @param {Pointer<Void>} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer<UInt32>} lpErrors 
     * @param {Pointer<COMSTAT>} lpStat A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-comstat">COMSTAT</a> structure in which the device's status information is returned. If this parameter is <b>NULL</b>, no status information is returned.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-clearcommerror
     * @since windows5.1.2600
     */
    static ClearCommError(hFile, lpErrors, lpStat) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\ClearCommError", "ptr", hFile, "uint*", lpErrors, "ptr", lpStat, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes the communications parameters for a specified communications device.
     * @remarks
     * After a process uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function to open a handle to a communications device, but before doing any I/O with the device, it can call 
     * <b>SetupComm</b> to set the communications parameters for the device. If it does not set them, the device uses the default parameters when the first call to another communications function occurs.
     * 
     * The <i>dwInQueue</i> and <i>dwOutQueue</i> parameters specify the recommended sizes for the internal buffers used by the driver for the specified device. For example, YMODEM protocol packets are slightly larger than 1024 bytes. Therefore, a recommended buffer size might be 1200 bytes for YMODEM communications. For Ethernet-based communications, a recommended buffer size might be 1600 bytes, which is slightly larger than a single Ethernet frame.
     * 
     * The device driver receives the recommended buffer sizes, but is free to use any input and output (I/O) buffering scheme, as long as it provides reasonable performance and data is not lost due to overrun (except under extreme circumstances). For example, the function can succeed even though the driver does not allocate a buffer, as long as some other portion of the system provides equivalent functionality.
     * @param {Pointer<Void>} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Integer} dwInQueue The recommended size of the device's internal input buffer, in bytes.
     * @param {Integer} dwOutQueue The recommended size of the device's internal output buffer, in bytes.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setupcomm
     * @since windows5.1.2600
     */
    static SetupComm(hFile, dwInQueue, dwOutQueue) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetupComm", "ptr", hFile, "uint", dwInQueue, "uint", dwOutQueue, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Directs the specified communications device to perform an extended function.
     * @param {Pointer<Void>} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Integer} dwFunc 
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-escapecommfunction
     * @since windows5.1.2600
     */
    static EscapeCommFunction(hFile, dwFunc) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\EscapeCommFunction", "ptr", hFile, "uint", dwFunc, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current configuration of a communications device.
     * @param {Pointer<Void>} hCommDev A handle to the open communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer} lpCC A pointer to a buffer that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commconfig">COMMCONFIG</a> structure.
     * @param {Pointer<UInt32>} lpdwSize The size, in bytes, of the buffer pointed to by <i>lpCC</i>. When the function returns, the variable contains the number of bytes copied if the function succeeds, or the number of bytes required if the buffer was too small.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getcommconfig
     * @since windows5.1.2600
     */
    static GetCommConfig(hCommDev, lpCC, lpdwSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCommConfig", "ptr", hCommDev, "ptr", lpCC, "uint*", lpdwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the value of the event mask for a specified communications device.
     * @remarks
     * The 
     * <b>GetCommMask</b> function uses a mask variable to indicate the set of events that can be monitored for a particular communications resource. A handle to the communications resource can be specified in a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-waitcommevent">WaitCommEvent</a> function, which waits for one of the events to occur. To modify the event mask of a communications resource, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcommmask">SetCommMask</a> function.
     * @param {Pointer<Void>} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer<UInt32>} lpEvtMask 
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getcommmask
     * @since windows5.1.2600
     */
    static GetCommMask(hFile, lpEvtMask) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCommMask", "ptr", hFile, "uint*", lpEvtMask, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the communications properties for a specified communications device.
     * @remarks
     * The 
     * <b>GetCommProperties</b> function returns information from a device driver about the configuration settings that are supported by the driver.
     * @param {Pointer<Void>} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer<COMMPROP>} lpCommProp A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commprop">COMMPROP</a> structure in which the communications properties information is returned. This information can be used in subsequent calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcommstate">SetCommState</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcommtimeouts">SetCommTimeouts</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setupcomm">SetupComm</a> function to configure the communications device.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getcommproperties
     * @since windows5.1.2600
     */
    static GetCommProperties(hFile, lpCommProp) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCommProperties", "ptr", hFile, "ptr", lpCommProp, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the modem control-register values.
     * @remarks
     * The 
     * <b>GetCommModemStatus</b> function is useful when you are using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-waitcommevent">WaitCommEvent</a> function to monitor the CTS, RLSD, DSR, or ring indicator signals. To detect when these signals change state, use 
     * <b>WaitCommEvent</b> and then use 
     * <b>GetCommModemStatus</b> to determine the state after a change occurs.
     * 
     * The function fails if the hardware does not support the control-register values.
     * @param {Pointer<Void>} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer<UInt32>} lpModemStat 
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getcommmodemstatus
     * @since windows5.1.2600
     */
    static GetCommModemStatus(hFile, lpModemStat) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCommModemStatus", "ptr", hFile, "uint*", lpModemStat, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current control settings for a specified communications device.
     * @param {Pointer<Void>} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer<DCB>} lpDCB A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure that receives the control settings information.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getcommstate
     * @since windows5.1.2600
     */
    static GetCommState(hFile, lpDCB) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCommState", "ptr", hFile, "ptr", lpDCB, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the time-out parameters for all read and write operations on a specified communications device.
     * @remarks
     * For more information about time-out values for communications devices, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcommtimeouts">SetCommTimeouts</a> function.
     * @param {Pointer<Void>} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer<COMMTIMEOUTS>} lpCommTimeouts A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commtimeouts">COMMTIMEOUTS</a> structure in which the time-out information is returned.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getcommtimeouts
     * @since windows5.1.2600
     */
    static GetCommTimeouts(hFile, lpCommTimeouts) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCommTimeouts", "ptr", hFile, "ptr", lpCommTimeouts, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Discards all characters from the output or input buffer of a specified communications resource. It can also terminate pending read or write operations on the resource.
     * @remarks
     * If a thread uses 
     * <b>PurgeComm</b> to flush an output buffer, the deleted characters are not transmitted. To empty the output buffer while ensuring that the contents are transmitted, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-flushfilebuffers">FlushFileBuffers</a> function (a synchronous operation). Note, however, that <b>FlushFileBuffers</b> is subject to flow control but not to write time-outs, and it will not return until all pending write operations have been transmitted.
     * @param {Pointer<Void>} hFile A handle to the communications resource. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Integer} dwFlags 
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-purgecomm
     * @since windows5.1.2600
     */
    static PurgeComm(hFile, dwFlags) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\PurgeComm", "ptr", hFile, "uint", dwFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Suspends character transmission for a specified communications device and places the transmission line in a break state until the ClearCommBreak function is called.
     * @param {Pointer<Void>} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setcommbreak
     * @since windows5.1.2600
     */
    static SetCommBreak(hFile) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetCommBreak", "ptr", hFile, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the current configuration of a communications device.
     * @param {Pointer<Void>} hCommDev A handle to the open communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer} lpCC A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commconfig">COMMCONFIG</a> structure.
     * @param {Integer} dwSize The size of the structure pointed to by <i>lpCC</i>, in bytes.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setcommconfig
     * @since windows5.1.2600
     */
    static SetCommConfig(hCommDev, lpCC, dwSize) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetCommConfig", "ptr", hCommDev, "ptr", lpCC, "uint", dwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Specifies a set of events to be monitored for a communications device.
     * @remarks
     * The 
     * <b>SetCommMask</b> function specifies the set of events that can be monitored for a particular communications resource. A handle to the communications resource can be specified in a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-waitcommevent">WaitCommEvent</a> function, which waits for one of the events to occur. To get the current event mask of a communications resource, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getcommmask">GetCommMask</a> function.
     * @param {Pointer<Void>} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Integer} dwEvtMask 
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setcommmask
     * @since windows5.1.2600
     */
    static SetCommMask(hFile, dwEvtMask) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetCommMask", "ptr", hFile, "uint", dwEvtMask, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Configures a communications device according to the specifications in a device-control block (a DCB structure). The function reinitializes all hardware and control settings, but it does not empty output or input queues.
     * @remarks
     * The 
     * <b>SetCommState</b> function uses a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure to specify the desired configuration. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getcommstate">GetCommState</a> function returns the current configuration.
     * 
     * To set only a few members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure, you should modify a 
     * <b>DCB</b> structure that has been filled in by a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getcommstate">GetCommState</a>. This ensures that the other members of the 
     * <b>DCB</b> structure have appropriate values.
     * 
     * The 
     * <b>SetCommState</b> function fails if the <b>XonChar</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure is equal to the <b>XoffChar</b> member.
     * 
     * When 
     * <b>SetCommState</b> is used to configure the 8250, the following restrictions apply to the values for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure's <b>ByteSize</b> and <b>StopBits</b> members:
     * 
     * The number of data bits must be 5 to 8 bits.
     * @param {Pointer<Void>} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer<DCB>} lpDCB A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure that contains the configuration information for the specified communications device.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setcommstate
     * @since windows5.1.2600
     */
    static SetCommState(hFile, lpDCB) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetCommState", "ptr", hFile, "ptr", lpDCB, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the time-out parameters for all read and write operations on a specified communications device.
     * @param {Pointer<Void>} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer<COMMTIMEOUTS>} lpCommTimeouts A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commtimeouts">COMMTIMEOUTS</a> structure that contains the new time-out values.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setcommtimeouts
     * @since windows5.1.2600
     */
    static SetCommTimeouts(hFile, lpCommTimeouts) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetCommTimeouts", "ptr", hFile, "ptr", lpCommTimeouts, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Transmits a specified character ahead of any pending data in the output buffer of the specified communications device.
     * @remarks
     * The 
     * <b>TransmitCommChar</b> function is useful for sending an interrupt character (such as a CTRL+C) to a host system.
     * 
     * If the device is not transmitting, 
     * <b>TransmitCommChar</b> cannot be called repeatedly. Once 
     * <b>TransmitCommChar</b> places a character in the output buffer, the character must be transmitted before the function can be called again. If the previous character has not yet been sent, 
     * <b>TransmitCommChar</b> returns an error.
     * @param {Pointer<Void>} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Integer} cChar The character to be transmitted.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-transmitcommchar
     * @since windows5.1.2600
     */
    static TransmitCommChar(hFile, cChar) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\TransmitCommChar", "ptr", hFile, "char", cChar, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Waits for an event to occur for a specified communications device. The set of events that are monitored by this function is contained in the event mask associated with the device handle.
     * @remarks
     * The 
     * <b>WaitCommEvent</b> function monitors a set of events for a specified communications resource. To set and query the current event mask of a communications resource, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcommmask">SetCommMask</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getcommmask">GetCommMask</a> functions.
     * 
     * If the overlapped operation cannot be completed immediately, the function returns <b>FALSE</b> and the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_IO_PENDING</b>, indicating that the operation is executing in the background. When this happens, the system sets the <b>hEvent</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure to the not-signaled state before 
     * <b>WaitCommEvent</b> returns, and then it sets it to the signaled state when one of the specified events or an error occurs. The calling process can use one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/wait-functions">wait functions</a> to determine the event object's state and then use the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> function to determine the results of the 
     * <b>WaitCommEvent</b> operation. 
     * <b>GetOverlappedResult</b> reports the success or failure of the operation, and the variable pointed to by the <i>lpEvtMask</i> parameter is set to indicate the event that occurred.
     * 
     * If a process attempts to change the device handle's event mask by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcommmask">SetCommMask</a> function while an overlapped 
     * <b>WaitCommEvent</b> operation is in progress, 
     * <b>WaitCommEvent</b> returns immediately. The variable pointed to by the <i>lpEvtMask</i> parameter is set to zero.
     * @param {Pointer<Void>} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer<UInt32>} lpEvtMask 
     * @param {Pointer<OVERLAPPED>} lpOverlapped A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. This structure is required if <i>hFile</i> was opened with <b>FILE_FLAG_OVERLAPPED</b>. 
     * 
     * 
     * 
     * 
     * If <i>hFile</i> was opened with <b>FILE_FLAG_OVERLAPPED</b>, the <i>lpOverlapped</i> parameter must not be <b>NULL</b>. It must point to a valid <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. If <i>hFile</i> was opened with <b>FILE_FLAG_OVERLAPPED</b> and <i>lpOverlapped</i> is <b>NULL</b>, the function can incorrectly report that the operation is complete.
     * 
     * If <i>hFile</i> was opened with <b>FILE_FLAG_OVERLAPPED</b> and <i>lpOverlapped</i> is not <b>NULL</b>, 
     * <b>WaitCommEvent</b> is performed as an overlapped operation. In this case, the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure must contain a handle to a manual-reset event object (created by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> function).
     * 
     * If <i>hFile</i> was not opened with <b>FILE_FLAG_OVERLAPPED</b>, 
     * <b>WaitCommEvent</b> does not return until one of the specified events or an error occurs.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-waitcommevent
     * @since windows5.1.2600
     */
    static WaitCommEvent(hFile, lpEvtMask, lpOverlapped) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\WaitCommEvent", "ptr", hFile, "uint*", lpEvtMask, "ptr", lpOverlapped, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Attempts to open a communication device.
     * @remarks
     * The <i>uPortNumber</i> parameter accepts one-based values. A value of 1 for <i>uPortNumber</i> causes this function to attempt to open COM1.
     * 
     * To support UWP, link against WindowsApp.lib.
     * @param {Integer} uPortNumber A one-based port number for the communication device to open.
     * @param {Integer} dwDesiredAccess The requested access to the device.
     * 
     * For more information about requested access, see <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> and <a href="https://docs.microsoft.com/windows/desktop/FileIO/creating-and-opening-files">Creating and Opening Files</a>.
     * @param {Integer} dwFlagsAndAttributes The requested flags and attributes to the device. 
     * 
     * <div class="alert"><b>Note</b>  <p class="note">For this function, only values of <b>FILE_FLAG_OVERLAPPED</b> or 0x0 are expected for this parameter. 
     * 
     * </div>
     * <div> </div>
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILE_FLAG_OVERLAPPED"></a><a id="file_flag_overlapped"></a><dl>
     * <dt><b>FILE_FLAG_OVERLAPPED</b></dt>
     * <dt>0x40000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or device is being opened or created for asynchronous I/O.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Pointer<Void>} If the function succeeds, the function returns a valid <b>HANDLE</b>. Use <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> to close that handle.
     * 
     * If an error occurs, the function returns <b>INVALID_HANDLE_VALUE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-opencommport
     * @since windows10.0.16299
     */
    static OpenCommPort(uPortNumber, dwDesiredAccess, dwFlagsAndAttributes) {
        result := DllCall("api-ms-win-core-comm-l1-1-1.dll\OpenCommPort", "uint", uPortNumber, "uint", dwDesiredAccess, "uint", dwFlagsAndAttributes)
        return result
    }

    /**
     * Gets an array that contains the well-formed COM ports.
     * @param {Pointer<UInt32>} lpPortNumbers An array for the port numbers.
     * @param {Integer} uPortNumbersCount The length of the array in the <i>lpPortNumbers</i> parameter.
     * @param {Pointer<UInt32>} puPortNumbersFound The number of port numbers written to the <i>lpPortNumbers</i> or the length of the array required for the port numbers.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call succeeded. The <i>lpPortNumbers</i> array was large enough for the result.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpPortNumbers</i> array was too small to contain all available port numbers. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no comm ports available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getcommports
     * @since windows10.0.17134
     */
    static GetCommPorts(lpPortNumbers, uPortNumbersCount, puPortNumbersFound) {
        result := DllCall("api-ms-win-core-comm-l1-1-2.dll\GetCommPorts", "uint*", lpPortNumbers, "uint", uPortNumbersCount, "uint*", puPortNumbersFound, "uint")
        return result
    }

    /**
     * Fills a specified DCB structure with values specified in a device-control string. (ANSI)
     * @remarks
     * The 
     * <b>BuildCommDCB</b> function adjusts only those members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure that are specifically affected by the <i>lpDef</i> parameter, with the following exceptions:
     * 
     * <ul>
     * <li>If the specified baud rate is 110, the function sets the stop bits to 2 to remain compatible with the system's <b>mode</b> command.</li>
     * <li>By default, 
     * <b>BuildCommDCB</b> disables XON/XOFF and hardware flow control. To enable flow control, you must explicitly set the appropriate members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure.</li>
     * </ul>
     * The 
     * <b>BuildCommDCB</b> function only fills in the members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure. To apply these settings to a serial port, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcommstate">SetCommState</a> function.
     * 
     * There are older and newer forms of the <b>mode</b> syntax. The 
     * <b>BuildCommDCB</b> function supports both forms. However, you cannot mix the two forms together.
     * 
     * The newer form of the <b>mode</b> syntax lets you explicitly set the values of the flow control members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure. If you use an older form of the <b>mode</b> syntax, the 
     * <b>BuildCommDCB</b> function sets the flow control members of the 
     * <b>DCB</b> structure, as follows:
     * 
     * <ul>
     * <li>For a string that does not end with an x or a p: 
     * 
     * 
     * <ul>
     * <li><b>fInX</b>, <b>fOutX</b>, <b>fOutXDsrFlow</b>, and <b>fOutXCtsFlow</b> are all set to <b>FALSE</b></li>
     * <li><b>fDtrControl</b> is set to DTR_CONTROL_ENABLE</li>
     * <li><b>fRtsControl</b> is set to RTS_CONTROL_ENABLE</li>
     * </ul>
     * </li>
     * <li>For a string that ends with an x: 
     * 
     * 
     * <ul>
     * <li><b>fInX</b> and <b>fOutX</b> are both set to <b>TRUE</b></li>
     * <li><b>fOutXDsrFlow</b> and <b>fOutXCtsFlow</b> are both set to <b>FALSE</b></li>
     * <li><b>fDtrControl</b> is set to DTR_CONTROL_ENABLE</li>
     * <li><b>fRtsControl</b> is set to RTS_CONTROL_ENABLE</li>
     * </ul>
     * </li>
     * <li>For a string that ends with a p: 
     * 
     * 
     * <ul>
     * <li><b>fInX</b> and <b>fOutX</b> are both set to <b>FALSE</b></li>
     * <li><b>fOutXDsrFlow</b> and <b>fOutXCtsFlow</b> are both set to <b>TRUE</b></li>
     * <li><b>fDtrControl</b> is set to DTR_CONTROL_HANDSHAKE</li>
     * <li><b>fRtsControl</b> is set to RTS_CONTROL_HANDSHAKE</li>
     * </ul>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines BuildCommDCB as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} lpDef The device-control information. The function takes this string, parses it, and then sets appropriate values in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure pointed to by <i>lpDCB</i>. 
     * 
     * 
     * 
     * 
     * The string must have the same form as the <b>mode</b> command's command-line arguments:
     * 
     * COM<i>x</i>[:][baud=<i>b</i>][parity=<i>p</i>][data=<i>d</i>][stop=<i>s</i>][to={on|off}][xon={on|off}][odsr={on|off}][octs={on|off}][dtr={on|off|hs}][rts={on|off|hs|tg}][idsr={on|off}]
     * 
     * The device name is optional, but it must specify a valid device if used.
     * 
     * For example, the following string specifies a baud rate of 1200, no parity, 8 data bits, and 1 stop bit:
     * 
     * <c>baud=1200 parity=N data=8 stop=1</c>
     * @param {Pointer<DCB>} lpDCB A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure that receives the information.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-buildcommdcba
     * @since windows5.1.2600
     */
    static BuildCommDCBA(lpDef, lpDCB) {
        lpDef := lpDef is String? StrPtr(lpDef) : lpDef

        A_LastError := 0

        result := DllCall("KERNEL32.dll\BuildCommDCBA", "ptr", lpDef, "ptr", lpDCB, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Fills a specified DCB structure with values specified in a device-control string. (Unicode)
     * @remarks
     * The 
     * <b>BuildCommDCB</b> function adjusts only those members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure that are specifically affected by the <i>lpDef</i> parameter, with the following exceptions:
     * 
     * <ul>
     * <li>If the specified baud rate is 110, the function sets the stop bits to 2 to remain compatible with the system's <b>mode</b> command.</li>
     * <li>By default, 
     * <b>BuildCommDCB</b> disables XON/XOFF and hardware flow control. To enable flow control, you must explicitly set the appropriate members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure.</li>
     * </ul>
     * The 
     * <b>BuildCommDCB</b> function only fills in the members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure. To apply these settings to a serial port, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcommstate">SetCommState</a> function.
     * 
     * There are older and newer forms of the <b>mode</b> syntax. The 
     * <b>BuildCommDCB</b> function supports both forms. However, you cannot mix the two forms together.
     * 
     * The newer form of the <b>mode</b> syntax lets you explicitly set the values of the flow control members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure. If you use an older form of the <b>mode</b> syntax, the 
     * <b>BuildCommDCB</b> function sets the flow control members of the 
     * <b>DCB</b> structure, as follows:
     * 
     * <ul>
     * <li>For a string that does not end with an x or a p: 
     * 
     * 
     * <ul>
     * <li><b>fInX</b>, <b>fOutX</b>, <b>fOutXDsrFlow</b>, and <b>fOutXCtsFlow</b> are all set to <b>FALSE</b></li>
     * <li><b>fDtrControl</b> is set to DTR_CONTROL_ENABLE</li>
     * <li><b>fRtsControl</b> is set to RTS_CONTROL_ENABLE</li>
     * </ul>
     * </li>
     * <li>For a string that ends with an x: 
     * 
     * 
     * <ul>
     * <li><b>fInX</b> and <b>fOutX</b> are both set to <b>TRUE</b></li>
     * <li><b>fOutXDsrFlow</b> and <b>fOutXCtsFlow</b> are both set to <b>FALSE</b></li>
     * <li><b>fDtrControl</b> is set to DTR_CONTROL_ENABLE</li>
     * <li><b>fRtsControl</b> is set to RTS_CONTROL_ENABLE</li>
     * </ul>
     * </li>
     * <li>For a string that ends with a p: 
     * 
     * 
     * <ul>
     * <li><b>fInX</b> and <b>fOutX</b> are both set to <b>FALSE</b></li>
     * <li><b>fOutXDsrFlow</b> and <b>fOutXCtsFlow</b> are both set to <b>TRUE</b></li>
     * <li><b>fDtrControl</b> is set to DTR_CONTROL_HANDSHAKE</li>
     * <li><b>fRtsControl</b> is set to RTS_CONTROL_HANDSHAKE</li>
     * </ul>
     * </li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines BuildCommDCB as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} lpDef The device-control information. The function takes this string, parses it, and then sets appropriate values in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure pointed to by <i>lpDCB</i>. 
     * 
     * 
     * 
     * 
     * The string must have the same form as the <b>mode</b> command's command-line arguments:
     * 
     * COM<i>x</i>[:][baud=<i>b</i>][parity=<i>p</i>][data=<i>d</i>][stop=<i>s</i>][to={on|off}][xon={on|off}][odsr={on|off}][octs={on|off}][dtr={on|off|hs}][rts={on|off|hs|tg}][idsr={on|off}]
     * 
     * The device name is optional, but it must specify a valid device if used.
     * 
     * For example, the following string specifies a baud rate of 1200, no parity, 8 data bits, and 1 stop bit:
     * 
     * <c>baud=1200 parity=N data=8 stop=1</c>
     * @param {Pointer<DCB>} lpDCB A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure that receives the information.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-buildcommdcbw
     * @since windows5.1.2600
     */
    static BuildCommDCBW(lpDef, lpDCB) {
        lpDef := lpDef is String? StrPtr(lpDef) : lpDef

        A_LastError := 0

        result := DllCall("KERNEL32.dll\BuildCommDCBW", "ptr", lpDef, "ptr", lpDCB, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Translates a device-definition string into appropriate device-control block codes and places them into a device control block. (ANSI)
     * @remarks
     * The <b>BuildCommDCBAndTimeouts</b> function 
     *     modifies its time-out setting behavior based on the presence or absence of a "to={on|off}" 
     *     substring in <i>lpDef</i>:
     * 
     * <ul>
     * <li>If that string contains the substring "to=on", the function sets the 
     *       <b>WriteTotalTimeoutConstant</b> member of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commtimeouts">COMMTIMEOUTS</a> structure to 60000 and all other members 
     *       to 0.</li>
     * <li>If that string contains the substring "to=off", the function sets the members of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commtimeouts">COMMTIMEOUTS</a> to 0.</li>
     * <li>If that string does not specify a "to={on|off}" substring, the function ignores the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commtimeouts">COMMTIMEOUTS</a> structure in 
     *       <i>lpCommTimeouts</i>.</li>
     * </ul>
     * For more information, see the Remarks for the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-buildcommdcba">BuildCommDCB</a> function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines BuildCommDCBAndTimeouts as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} lpDef The device-control information. The function takes this string, parses it, and then sets appropriate values 
     *        in the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure pointed to by 
     *        <i>lpDCB</i>.
     * 
     * The string must have the same form as the <b>mode</b> command's command-line arguments:
     * 
     * <b>COM</b><i>x</i>[<b>:</b>][<b>baud=</b>{<b>11</b>|<b>110</b>|<b>15</b>|<b>150</b>|<b>30</b>|<b>300</b>|<b>60</b>|<b>600</b>|<b>12</b>|<b>1200</b>|<b>24</b>|<b>2400</b>|<b>48</b>|<b>4800</b>|<b>96</b>|<b>9600</b>|<b>19</b>|<b>19200</b>}][<b>parity=</b>{<b>n</b>|<b>e</b>|<b>o</b>|<b>m</b>|<b>s</b>}][<b>data=</b>{<b>5</b>|<b>6</b>|<b>7</b>|<b>8</b>}][<b>stop=</b>{<b>1</b>|<b>1.5</b>|<b>2</b>}][<b>to=</b>{<b>on</b>|<b>off</b>}][<b>xon=</b>{<b>on</b>|<b>off</b>}][<b>odsr=</b>{<b>on</b>|<b>off</b>}][<b>octs=</b>{<b>on</b>|<b>off</b>}][<b>dtr=</b>{<b>on</b>|<b>off</b>|<b>hs</b>}][<b>rts=</b>{<b>on</b>|<b>off</b>|<b>hs</b>|<b>tg</b>}][<b>idsr=</b>{<b>on</b>|<b>off</b>}]
     * 
     * The "baud" substring can be any of the values listed, which are in pairs. The two-digit 
     *        values are the first two digits of the associated values that they represent. For example, 11 represents 110 baud, 19 
     *        represents 19,200 baud.
     * 
     * The "parity" substring indicates how the parity bit is used to detect transmission errors. 
     *        The values represent "none", "even", "odd",        
     *        "mark", and "space".
     * 
     * For more information, see the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/cc732236(v=ws.11)">Mode</a> command 
     *        reference in TechNet.
     * 
     * For example, the following string specifies a baud rate of 1200, no parity, 8 data bits, and 1 stop bit:
     * 
     * <c>baud=1200 parity=N data=8 stop=1</c>
     * @param {Pointer<DCB>} lpDCB A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure that receives information 
     *       from the device-control information string pointed to by <i>lpDef</i>. This 
     *       <b>DCB</b> structure defines the control settings for a 
     *       communications device.
     * @param {Pointer<COMMTIMEOUTS>} lpCommTimeouts A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commtimeouts">COMMTIMEOUTS</a> structure that 
     *       receives time-out information.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-buildcommdcbandtimeoutsa
     * @since windows5.1.2600
     */
    static BuildCommDCBAndTimeoutsA(lpDef, lpDCB, lpCommTimeouts) {
        lpDef := lpDef is String? StrPtr(lpDef) : lpDef

        A_LastError := 0

        result := DllCall("KERNEL32.dll\BuildCommDCBAndTimeoutsA", "ptr", lpDef, "ptr", lpDCB, "ptr", lpCommTimeouts, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Translates a device-definition string into appropriate device-control block codes and places them into a device control block. (Unicode)
     * @remarks
     * The <b>BuildCommDCBAndTimeouts</b> function 
     *     modifies its time-out setting behavior based on the presence or absence of a "to={on|off}" 
     *     substring in <i>lpDef</i>:
     * 
     * <ul>
     * <li>If that string contains the substring "to=on", the function sets the 
     *       <b>WriteTotalTimeoutConstant</b> member of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commtimeouts">COMMTIMEOUTS</a> structure to 60000 and all other members 
     *       to 0.</li>
     * <li>If that string contains the substring "to=off", the function sets the members of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commtimeouts">COMMTIMEOUTS</a> to 0.</li>
     * <li>If that string does not specify a "to={on|off}" substring, the function ignores the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commtimeouts">COMMTIMEOUTS</a> structure in 
     *       <i>lpCommTimeouts</i>.</li>
     * </ul>
     * For more information, see the Remarks for the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-buildcommdcba">BuildCommDCB</a> function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines BuildCommDCBAndTimeouts as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} lpDef The device-control information. The function takes this string, parses it, and then sets appropriate values 
     *        in the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure pointed to by 
     *        <i>lpDCB</i>.
     * 
     * The string must have the same form as the <b>mode</b> command's command-line arguments:
     * 
     * <b>COM</b><i>x</i>[<b>:</b>][<b>baud=</b>{<b>11</b>|<b>110</b>|<b>15</b>|<b>150</b>|<b>30</b>|<b>300</b>|<b>60</b>|<b>600</b>|<b>12</b>|<b>1200</b>|<b>24</b>|<b>2400</b>|<b>48</b>|<b>4800</b>|<b>96</b>|<b>9600</b>|<b>19</b>|<b>19200</b>}][<b>parity=</b>{<b>n</b>|<b>e</b>|<b>o</b>|<b>m</b>|<b>s</b>}][<b>data=</b>{<b>5</b>|<b>6</b>|<b>7</b>|<b>8</b>}][<b>stop=</b>{<b>1</b>|<b>1.5</b>|<b>2</b>}][<b>to=</b>{<b>on</b>|<b>off</b>}][<b>xon=</b>{<b>on</b>|<b>off</b>}][<b>odsr=</b>{<b>on</b>|<b>off</b>}][<b>octs=</b>{<b>on</b>|<b>off</b>}][<b>dtr=</b>{<b>on</b>|<b>off</b>|<b>hs</b>}][<b>rts=</b>{<b>on</b>|<b>off</b>|<b>hs</b>|<b>tg</b>}][<b>idsr=</b>{<b>on</b>|<b>off</b>}]
     * 
     * The "baud" substring can be any of the values listed, which are in pairs. The two-digit 
     *        values are the first two digits of the associated values that they represent. For example, 11 represents 110 baud, 19 
     *        represents 19,200 baud.
     * 
     * The "parity" substring indicates how the parity bit is used to detect transmission errors. 
     *        The values represent "none", "even", "odd",        
     *        "mark", and "space".
     * 
     * For more information, see the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/cc732236(v=ws.11)">Mode</a> command 
     *        reference in TechNet.
     * 
     * For example, the following string specifies a baud rate of 1200, no parity, 8 data bits, and 1 stop bit:
     * 
     * <c>baud=1200 parity=N data=8 stop=1</c>
     * @param {Pointer<DCB>} lpDCB A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure that receives information 
     *       from the device-control information string pointed to by <i>lpDef</i>. This 
     *       <b>DCB</b> structure defines the control settings for a 
     *       communications device.
     * @param {Pointer<COMMTIMEOUTS>} lpCommTimeouts A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commtimeouts">COMMTIMEOUTS</a> structure that 
     *       receives time-out information.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-buildcommdcbandtimeoutsw
     * @since windows5.1.2600
     */
    static BuildCommDCBAndTimeoutsW(lpDef, lpDCB, lpCommTimeouts) {
        lpDef := lpDef is String? StrPtr(lpDef) : lpDef

        A_LastError := 0

        result := DllCall("KERNEL32.dll\BuildCommDCBAndTimeoutsW", "ptr", lpDef, "ptr", lpDCB, "ptr", lpCommTimeouts, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Displays a driver-supplied configuration dialog box. (ANSI)
     * @remarks
     * The 
     * <b>CommConfigDialog</b> function requires a dynamic-link library (DLL) provided by the communications hardware vendor.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines CommConfigDialog as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} lpszName The name of the device for which a dialog box should be displayed. For example, COM1 through COM9 are serial ports and LPT1 through LPT9 are parallel ports.
     * @param {Pointer<Void>} hWnd A handle to the window that owns the dialog box. This parameter can be any valid window handle, or it should be <b>NULL</b> if the dialog box is to have no owner.
     * @param {Pointer<COMMCONFIG>} lpCC A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commconfig">COMMCONFIG</a> structure. This structure contains initial settings for the dialog box before the call, and changed values after the call.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-commconfigdialoga
     * @since windows5.1.2600
     */
    static CommConfigDialogA(lpszName, hWnd, lpCC) {
        lpszName := lpszName is String? StrPtr(lpszName) : lpszName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CommConfigDialogA", "ptr", lpszName, "ptr", hWnd, "ptr", lpCC, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Displays a driver-supplied configuration dialog box. (Unicode)
     * @remarks
     * The 
     * <b>CommConfigDialog</b> function requires a dynamic-link library (DLL) provided by the communications hardware vendor.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines CommConfigDialog as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} lpszName The name of the device for which a dialog box should be displayed. For example, COM1 through COM9 are serial ports and LPT1 through LPT9 are parallel ports.
     * @param {Pointer<Void>} hWnd A handle to the window that owns the dialog box. This parameter can be any valid window handle, or it should be <b>NULL</b> if the dialog box is to have no owner.
     * @param {Pointer<COMMCONFIG>} lpCC A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commconfig">COMMCONFIG</a> structure. This structure contains initial settings for the dialog box before the call, and changed values after the call.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-commconfigdialogw
     * @since windows5.1.2600
     */
    static CommConfigDialogW(lpszName, hWnd, lpCC) {
        lpszName := lpszName is String? StrPtr(lpszName) : lpszName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CommConfigDialogW", "ptr", lpszName, "ptr", hWnd, "ptr", lpCC, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the default configuration for the specified communications device. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The winbase.h header defines GetDefaultCommConfig as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} lpszName The name of the device. For example, COM1 through COM9 are serial ports and LPT1 through LPT9 are parallel ports.
     * @param {Pointer} lpCC A pointer to a buffer that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commconfig">COMMCONFIG</a> structure.
     * @param {Pointer<UInt32>} lpdwSize A pointer to a variable that specifies the size of the buffer pointed to by <i>lpCC</i>, in bytes. Upon return, the variable contains the number of bytes copied if the function succeeds, or the number of bytes required if the buffer was too small.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getdefaultcommconfiga
     * @since windows5.1.2600
     */
    static GetDefaultCommConfigA(lpszName, lpCC, lpdwSize) {
        lpszName := lpszName is String? StrPtr(lpszName) : lpszName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetDefaultCommConfigA", "ptr", lpszName, "ptr", lpCC, "uint*", lpdwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the default configuration for the specified communications device. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The winbase.h header defines GetDefaultCommConfig as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} lpszName The name of the device. For example, COM1 through COM9 are serial ports and LPT1 through LPT9 are parallel ports.
     * @param {Pointer} lpCC A pointer to a buffer that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commconfig">COMMCONFIG</a> structure.
     * @param {Pointer<UInt32>} lpdwSize A pointer to a variable that specifies the size of the buffer pointed to by <i>lpCC</i>, in bytes. Upon return, the variable contains the number of bytes copied if the function succeeds, or the number of bytes required if the buffer was too small.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getdefaultcommconfigw
     * @since windows5.1.2600
     */
    static GetDefaultCommConfigW(lpszName, lpCC, lpdwSize) {
        lpszName := lpszName is String? StrPtr(lpszName) : lpszName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetDefaultCommConfigW", "ptr", lpszName, "ptr", lpCC, "uint*", lpdwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the default configuration for a communications device. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The winbase.h header defines SetDefaultCommConfig as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} lpszName The name of the device. For example, COM1 through COM9 are serial ports and LPT1 through LPT9 are parallel ports.
     * @param {Pointer} lpCC A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commconfig">COMMCONFIG</a> structure.
     * @param {Integer} dwSize The size of the structure pointed to by <i>lpCC</i>, in bytes.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setdefaultcommconfiga
     * @since windows5.1.2600
     */
    static SetDefaultCommConfigA(lpszName, lpCC, dwSize) {
        lpszName := lpszName is String? StrPtr(lpszName) : lpszName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetDefaultCommConfigA", "ptr", lpszName, "ptr", lpCC, "uint", dwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the default configuration for a communications device. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The winbase.h header defines SetDefaultCommConfig as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} lpszName The name of the device. For example, COM1 through COM9 are serial ports and LPT1 through LPT9 are parallel ports.
     * @param {Pointer} lpCC A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commconfig">COMMCONFIG</a> structure.
     * @param {Integer} dwSize The size of the structure pointed to by <i>lpCC</i>, in bytes.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setdefaultcommconfigw
     * @since windows5.1.2600
     */
    static SetDefaultCommConfigW(lpszName, lpCC, dwSize) {
        lpszName := lpszName is String? StrPtr(lpszName) : lpszName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetDefaultCommConfigW", "ptr", lpszName, "ptr", lpCC, "uint", dwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}
