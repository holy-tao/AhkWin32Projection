#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk

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
     * @param {HANDLE} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-clearcommbreak
     * @since windows5.1.2600
     */
    static ClearCommBreak(hFile) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ClearCommBreak", "ptr", hFile, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about a communications error and reports the current status of a communications device.
     * @param {HANDLE} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer<UInt32>} lpErrors 
     * @param {Pointer<COMSTAT>} lpStat A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-comstat">COMSTAT</a> structure in which the device's status information is returned. If this parameter is <b>NULL</b>, no status information is returned.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-clearcommerror
     * @since windows5.1.2600
     */
    static ClearCommError(hFile, lpErrors, lpStat) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\ClearCommError", "ptr", hFile, "uint*", lpErrors, "ptr", lpStat, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes the communications parameters for a specified communications device.
     * @param {HANDLE} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Integer} dwInQueue The recommended size of the device's internal input buffer, in bytes.
     * @param {Integer} dwOutQueue The recommended size of the device's internal output buffer, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setupcomm
     * @since windows5.1.2600
     */
    static SetupComm(hFile, dwInQueue, dwOutQueue) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetupComm", "ptr", hFile, "uint", dwInQueue, "uint", dwOutQueue, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Directs the specified communications device to perform an extended function.
     * @param {HANDLE} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Integer} dwFunc 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-escapecommfunction
     * @since windows5.1.2600
     */
    static EscapeCommFunction(hFile, dwFunc) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\EscapeCommFunction", "ptr", hFile, "uint", dwFunc, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current configuration of a communications device.
     * @param {HANDLE} hCommDev A handle to the open communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer} lpCC A pointer to a buffer that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commconfig">COMMCONFIG</a> structure.
     * @param {Pointer<UInt32>} lpdwSize The size, in bytes, of the buffer pointed to by <i>lpCC</i>. When the function returns, the variable contains the number of bytes copied if the function succeeds, or the number of bytes required if the buffer was too small.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, use the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getcommconfig
     * @since windows5.1.2600
     */
    static GetCommConfig(hCommDev, lpCC, lpdwSize) {
        hCommDev := hCommDev is Win32Handle ? NumGet(hCommDev, "ptr") : hCommDev

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCommConfig", "ptr", hCommDev, "ptr", lpCC, "uint*", lpdwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the value of the event mask for a specified communications device.
     * @param {HANDLE} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer<UInt32>} lpEvtMask 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getcommmask
     * @since windows5.1.2600
     */
    static GetCommMask(hFile, lpEvtMask) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCommMask", "ptr", hFile, "uint*", lpEvtMask, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the communications properties for a specified communications device.
     * @param {HANDLE} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer<COMMPROP>} lpCommProp A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commprop">COMMPROP</a> structure in which the communications properties information is returned. This information can be used in subsequent calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcommstate">SetCommState</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcommtimeouts">SetCommTimeouts</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setupcomm">SetupComm</a> function to configure the communications device.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getcommproperties
     * @since windows5.1.2600
     */
    static GetCommProperties(hFile, lpCommProp) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCommProperties", "ptr", hFile, "ptr", lpCommProp, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the modem control-register values.
     * @param {HANDLE} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer<UInt32>} lpModemStat 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getcommmodemstatus
     * @since windows5.1.2600
     */
    static GetCommModemStatus(hFile, lpModemStat) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCommModemStatus", "ptr", hFile, "uint*", lpModemStat, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current control settings for a specified communications device.
     * @param {HANDLE} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer<DCB>} lpDCB A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure that receives the control settings information.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getcommstate
     * @since windows5.1.2600
     */
    static GetCommState(hFile, lpDCB) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCommState", "ptr", hFile, "ptr", lpDCB, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the time-out parameters for all read and write operations on a specified communications device.
     * @param {HANDLE} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer<COMMTIMEOUTS>} lpCommTimeouts A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commtimeouts">COMMTIMEOUTS</a> structure in which the time-out information is returned.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getcommtimeouts
     * @since windows5.1.2600
     */
    static GetCommTimeouts(hFile, lpCommTimeouts) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetCommTimeouts", "ptr", hFile, "ptr", lpCommTimeouts, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Discards all characters from the output or input buffer of a specified communications resource. It can also terminate pending read or write operations on the resource.
     * @param {HANDLE} hFile A handle to the communications resource. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Integer} dwFlags 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-purgecomm
     * @since windows5.1.2600
     */
    static PurgeComm(hFile, dwFlags) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\PurgeComm", "ptr", hFile, "uint", dwFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Suspends character transmission for a specified communications device and places the transmission line in a break state until the ClearCommBreak function is called.
     * @param {HANDLE} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setcommbreak
     * @since windows5.1.2600
     */
    static SetCommBreak(hFile) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetCommBreak", "ptr", hFile, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the current configuration of a communications device.
     * @param {HANDLE} hCommDev A handle to the open communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer} lpCC A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commconfig">COMMCONFIG</a> structure.
     * @param {Integer} dwSize The size of the structure pointed to by <i>lpCC</i>, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setcommconfig
     * @since windows5.1.2600
     */
    static SetCommConfig(hCommDev, lpCC, dwSize) {
        hCommDev := hCommDev is Win32Handle ? NumGet(hCommDev, "ptr") : hCommDev

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetCommConfig", "ptr", hCommDev, "ptr", lpCC, "uint", dwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Specifies a set of events to be monitored for a communications device.
     * @param {HANDLE} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Integer} dwEvtMask 
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setcommmask
     * @since windows5.1.2600
     */
    static SetCommMask(hFile, dwEvtMask) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetCommMask", "ptr", hFile, "uint", dwEvtMask, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Configures a communications device according to the specifications in a device-control block (a DCB structure). The function reinitializes all hardware and control settings, but it does not empty output or input queues.
     * @param {HANDLE} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer<DCB>} lpDCB A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-dcb">DCB</a> structure that contains the configuration information for the specified communications device.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setcommstate
     * @since windows5.1.2600
     */
    static SetCommState(hFile, lpDCB) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetCommState", "ptr", hFile, "ptr", lpDCB, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the time-out parameters for all read and write operations on a specified communications device.
     * @param {HANDLE} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {Pointer<COMMTIMEOUTS>} lpCommTimeouts A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commtimeouts">COMMTIMEOUTS</a> structure that contains the new time-out values.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setcommtimeouts
     * @since windows5.1.2600
     */
    static SetCommTimeouts(hFile, lpCommTimeouts) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetCommTimeouts", "ptr", hFile, "ptr", lpCommTimeouts, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Transmits a specified character ahead of any pending data in the output buffer of the specified communications device.
     * @param {HANDLE} hFile A handle to the communications device. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function returns this handle.
     * @param {CHAR} cChar The character to be transmitted.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-transmitcommchar
     * @since windows5.1.2600
     */
    static TransmitCommChar(hFile, cChar) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\TransmitCommChar", "ptr", hFile, "char", cChar, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Waits for an event to occur for a specified communications device. The set of events that are monitored by this function is contained in the event mask associated with the device handle.
     * @param {HANDLE} hFile A handle to the communications device. The 
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
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-waitcommevent
     * @since windows5.1.2600
     */
    static WaitCommEvent(hFile, lpEvtMask, lpOverlapped) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        A_LastError := 0

        result := DllCall("KERNEL32.dll\WaitCommEvent", "ptr", hFile, "uint*", lpEvtMask, "ptr", lpOverlapped, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Attempts to open a communication device.
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
     * @returns {HANDLE} If the function succeeds, the function returns a valid <b>HANDLE</b>. Use <a href="/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> to close that handle.
     * 
     * If an error occurs, the function returns <b>INVALID_HANDLE_VALUE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-opencommport
     * @since windows10.0.16299
     */
    static OpenCommPort(uPortNumber, dwDesiredAccess, dwFlagsAndAttributes) {
        result := DllCall("api-ms-win-core-comm-l1-1-1.dll\OpenCommPort", "uint", uPortNumber, "uint", dwDesiredAccess, "uint", dwFlagsAndAttributes, "ptr")
        return HANDLE({Value: result}, True)
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
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getcommports
     * @since windows10.0.17134
     */
    static GetCommPorts(lpPortNumbers, uPortNumbersCount, puPortNumbersFound) {
        result := DllCall("api-ms-win-core-comm-l1-1-2.dll\GetCommPorts", "uint*", lpPortNumbers, "uint", uPortNumbersCount, "uint*", puPortNumbersFound, "uint")
        return result
    }

    /**
     * Fills a specified DCB structure with values specified in a device-control string.
     * @param {PSTR} lpDef The device-control information. The function takes this string, parses it, and then sets appropriate values in the 
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
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-buildcommdcba
     * @since windows5.1.2600
     */
    static BuildCommDCBA(lpDef, lpDCB) {
        lpDef := lpDef is String ? StrPtr(lpDef) : lpDef

        A_LastError := 0

        result := DllCall("KERNEL32.dll\BuildCommDCBA", "ptr", lpDef, "ptr", lpDCB, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Fills a specified DCB structure with values specified in a device-control string.
     * @param {PWSTR} lpDef The device-control information. The function takes this string, parses it, and then sets appropriate values in the 
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
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-buildcommdcbw
     * @since windows5.1.2600
     */
    static BuildCommDCBW(lpDef, lpDCB) {
        lpDef := lpDef is String ? StrPtr(lpDef) : lpDef

        A_LastError := 0

        result := DllCall("KERNEL32.dll\BuildCommDCBW", "ptr", lpDef, "ptr", lpDCB, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Translates a device-definition string into appropriate device-control block codes and places them into a device control block.
     * @param {PSTR} lpDef The device-control information. The function takes this string, parses it, and then sets appropriate values 
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
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-buildcommdcbandtimeoutsa
     * @since windows5.1.2600
     */
    static BuildCommDCBAndTimeoutsA(lpDef, lpDCB, lpCommTimeouts) {
        lpDef := lpDef is String ? StrPtr(lpDef) : lpDef

        A_LastError := 0

        result := DllCall("KERNEL32.dll\BuildCommDCBAndTimeoutsA", "ptr", lpDef, "ptr", lpDCB, "ptr", lpCommTimeouts, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Translates a device-definition string into appropriate device-control block codes and places them into a device control block.
     * @param {PWSTR} lpDef The device-control information. The function takes this string, parses it, and then sets appropriate values 
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
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-buildcommdcbandtimeoutsw
     * @since windows5.1.2600
     */
    static BuildCommDCBAndTimeoutsW(lpDef, lpDCB, lpCommTimeouts) {
        lpDef := lpDef is String ? StrPtr(lpDef) : lpDef

        A_LastError := 0

        result := DllCall("KERNEL32.dll\BuildCommDCBAndTimeoutsW", "ptr", lpDef, "ptr", lpDCB, "ptr", lpCommTimeouts, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Displays a driver-supplied configuration dialog box.
     * @param {PSTR} lpszName The name of the device for which a dialog box should be displayed. For example, COM1 through COM9 are serial ports and LPT1 through LPT9 are parallel ports.
     * @param {HWND} hWnd A handle to the window that owns the dialog box. This parameter can be any valid window handle, or it should be <b>NULL</b> if the dialog box is to have no owner.
     * @param {Pointer<COMMCONFIG>} lpCC A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commconfig">COMMCONFIG</a> structure. This structure contains initial settings for the dialog box before the call, and changed values after the call.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-commconfigdialoga
     * @since windows5.1.2600
     */
    static CommConfigDialogA(lpszName, hWnd, lpCC) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CommConfigDialogA", "ptr", lpszName, "ptr", hWnd, "ptr", lpCC, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Displays a driver-supplied configuration dialog box.
     * @param {PWSTR} lpszName The name of the device for which a dialog box should be displayed. For example, COM1 through COM9 are serial ports and LPT1 through LPT9 are parallel ports.
     * @param {HWND} hWnd A handle to the window that owns the dialog box. This parameter can be any valid window handle, or it should be <b>NULL</b> if the dialog box is to have no owner.
     * @param {Pointer<COMMCONFIG>} lpCC A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commconfig">COMMCONFIG</a> structure. This structure contains initial settings for the dialog box before the call, and changed values after the call.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-commconfigdialogw
     * @since windows5.1.2600
     */
    static CommConfigDialogW(lpszName, hWnd, lpCC) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        A_LastError := 0

        result := DllCall("KERNEL32.dll\CommConfigDialogW", "ptr", lpszName, "ptr", hWnd, "ptr", lpCC, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the default configuration for the specified communications device.
     * @param {PSTR} lpszName The name of the device. For example, COM1 through COM9 are serial ports and LPT1 through LPT9 are parallel ports.
     * @param {Pointer} lpCC A pointer to a buffer that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commconfig">COMMCONFIG</a> structure.
     * @param {Pointer<UInt32>} lpdwSize A pointer to a variable that specifies the size of the buffer pointed to by <i>lpCC</i>, in bytes. Upon return, the variable contains the number of bytes copied if the function succeeds, or the number of bytes required if the buffer was too small.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, use the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getdefaultcommconfiga
     * @since windows5.1.2600
     */
    static GetDefaultCommConfigA(lpszName, lpCC, lpdwSize) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetDefaultCommConfigA", "ptr", lpszName, "ptr", lpCC, "uint*", lpdwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the default configuration for the specified communications device.
     * @param {PWSTR} lpszName The name of the device. For example, COM1 through COM9 are serial ports and LPT1 through LPT9 are parallel ports.
     * @param {Pointer} lpCC A pointer to a buffer that receives a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commconfig">COMMCONFIG</a> structure.
     * @param {Pointer<UInt32>} lpdwSize A pointer to a variable that specifies the size of the buffer pointed to by <i>lpCC</i>, in bytes. Upon return, the variable contains the number of bytes copied if the function succeeds, or the number of bytes required if the buffer was too small.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, use the 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getdefaultcommconfigw
     * @since windows5.1.2600
     */
    static GetDefaultCommConfigW(lpszName, lpCC, lpdwSize) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetDefaultCommConfigW", "ptr", lpszName, "ptr", lpCC, "uint*", lpdwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the default configuration for a communications device.
     * @param {PSTR} lpszName The name of the device. For example, COM1 through COM9 are serial ports and LPT1 through LPT9 are parallel ports.
     * @param {Pointer} lpCC A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commconfig">COMMCONFIG</a> structure.
     * @param {Integer} dwSize The size of the structure pointed to by <i>lpCC</i>, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setdefaultcommconfiga
     * @since windows5.1.2600
     */
    static SetDefaultCommConfigA(lpszName, lpCC, dwSize) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetDefaultCommConfigA", "ptr", lpszName, "ptr", lpCC, "uint", dwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the default configuration for a communications device.
     * @param {PWSTR} lpszName The name of the device. For example, COM1 through COM9 are serial ports and LPT1 through LPT9 are parallel ports.
     * @param {Pointer} lpCC A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-commconfig">COMMCONFIG</a> structure.
     * @param {Integer} dwSize The size of the structure pointed to by <i>lpCC</i>, in bytes.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-setdefaultcommconfigw
     * @since windows5.1.2600
     */
    static SetDefaultCommConfigW(lpszName, lpCC, dwSize) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        A_LastError := 0

        result := DllCall("KERNEL32.dll\SetDefaultCommConfigW", "ptr", lpszName, "ptr", lpCC, "uint", dwSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}
