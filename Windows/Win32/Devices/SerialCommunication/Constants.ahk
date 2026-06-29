#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 */

;@region Constants

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceInterface_Serial_UsbVendorId := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceInterface_Serial_UsbVendorId.fmtid),
    Guid.Ptr, Guid("{4c6bf15c-4c03-4aac-91f5-64c0f852bcf4}"),
    UInt32, 16)
DEVPKEY_DeviceInterface_Serial_UsbVendorId.pid := 2

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceInterface_Serial_UsbProductId := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceInterface_Serial_UsbProductId.fmtid),
    Guid.Ptr, Guid("{4c6bf15c-4c03-4aac-91f5-64c0f852bcf4}"),
    UInt32, 16)
DEVPKEY_DeviceInterface_Serial_UsbProductId.pid := 3

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_DeviceInterface_Serial_PortName := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_DeviceInterface_Serial_PortName.fmtid),
    Guid.Ptr, Guid("{4c6bf15c-4c03-4aac-91f5-64c0f852bcf4}"),
    UInt32, 16)
DEVPKEY_DeviceInterface_Serial_PortName.pid := 4

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_SET_BAUD_RATE := 1769476

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_SET_QUEUE_SIZE := 1769480

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_SET_LINE_CONTROL := 1769484

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_SET_BREAK_ON := 1769488

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_SET_BREAK_OFF := 1769492

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_IMMEDIATE_CHAR := 1769496

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_SET_TIMEOUTS := 1769500

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_GET_TIMEOUTS := 1769504

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_SET_DTR := 1769508

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_CLR_DTR := 1769512

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_RESET_DEVICE := 1769516

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_SET_RTS := 1769520

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_CLR_RTS := 1769524

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_SET_XOFF := 1769528

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_SET_XON := 1769532

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_GET_WAIT_MASK := 1769536

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_SET_WAIT_MASK := 1769540

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_WAIT_ON_MASK := 1769544

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_PURGE := 1769548

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_GET_BAUD_RATE := 1769552

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_GET_LINE_CONTROL := 1769556

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_GET_CHARS := 1769560

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_SET_CHARS := 1769564

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_GET_HANDFLOW := 1769568

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_SET_HANDFLOW := 1769572

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_GET_MODEMSTATUS := 1769576

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_GET_COMMSTATUS := 1769580

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_XOFF_COUNTER := 1769584

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_GET_PROPERTIES := 1769588

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_GET_DTRRTS := 1769592

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_CONFIG_SIZE := 1769600

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_GET_COMMCONFIG := 1769604

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_SET_COMMCONFIG := 1769608

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_GET_STATS := 1769612

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_CLEAR_STATS := 1769616

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_GET_MODEM_CONTROL := 1769620

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_SET_MODEM_CONTROL := 1769624

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_SET_FIFO_CONTROL := 1769628

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_APPLY_DEFAULT_CONFIGURATION := 1769632

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_SET_INTERVAL_TIMER_RESOLUTION := 1769636

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_INTERNAL_DO_WAIT_WAKE := 1769476

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_INTERNAL_CANCEL_WAIT_WAKE := 1769480

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_INTERNAL_BASIC_SETTINGS := 1769484

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_SERIAL_INTERNAL_RESTORE_SETTINGS := 1769488

/**
 * @type {Integer (UInt32)}
 */
export global SERIAL_EV_RXCHAR := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERIAL_EV_RXFLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global SERIAL_EV_TXEMPTY := 4

/**
 * @type {Integer (UInt32)}
 */
export global SERIAL_EV_CTS := 8

/**
 * @type {Integer (UInt32)}
 */
export global SERIAL_EV_DSR := 16

/**
 * @type {Integer (UInt32)}
 */
export global SERIAL_EV_RLSD := 32

/**
 * @type {Integer (UInt32)}
 */
export global SERIAL_EV_BREAK := 64

/**
 * @type {Integer (UInt32)}
 */
export global SERIAL_EV_ERR := 128

/**
 * @type {Integer (UInt32)}
 */
export global SERIAL_EV_RING := 256

/**
 * @type {Integer (UInt32)}
 */
export global SERIAL_EV_PERR := 512

/**
 * @type {Integer (UInt32)}
 */
export global SERIAL_EV_RX80FULL := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SERIAL_EV_EVENT1 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SERIAL_EV_EVENT2 := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SERIAL_PURGE_TXABORT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERIAL_PURGE_RXABORT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SERIAL_PURGE_TXCLEAR := 4

/**
 * @type {Integer (UInt32)}
 */
export global SERIAL_PURGE_RXCLEAR := 8

/**
 * @type {Integer (UInt32)}
 */
export global STOP_BIT_1 := 0

/**
 * @type {Integer (UInt32)}
 */
export global STOP_BITS_1_5 := 1

/**
 * @type {Integer (UInt32)}
 */
export global STOP_BITS_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global NO_PARITY := 0

/**
 * @type {Integer (UInt32)}
 */
export global ODD_PARITY := 1

/**
 * @type {Integer (UInt32)}
 */
export global EVEN_PARITY := 2

/**
 * @type {Integer (UInt32)}
 */
export global MARK_PARITY := 3

/**
 * @type {Integer (UInt32)}
 */
export global SPACE_PARITY := 4

/**
 * @type {Integer (UInt16)}
 */
export global SERIAL_LSRMST_ESCAPE := 0

/**
 * @type {Integer (UInt16)}
 */
export global SERIAL_LSRMST_LSR_DATA := 1

/**
 * @type {Integer (UInt16)}
 */
export global SERIAL_LSRMST_LSR_NODATA := 2

/**
 * @type {Integer (UInt16)}
 */
export global SERIAL_LSRMST_MST := 3

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_INTERNAL_SERENUM_REMOVE_SELF := 3604999

/**
 * @type {Integer (UInt32)}
 */
export global COMDB_MIN_PORTS_ARBITRATED := 256

/**
 * @type {Integer (UInt32)}
 */
export global COMDB_MAX_PORTS_ARBITRATED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CDB_REPORT_BITS := 0

/**
 * @type {Integer (UInt32)}
 */
export global CDB_REPORT_BYTES := 1
;@endregion Constants
