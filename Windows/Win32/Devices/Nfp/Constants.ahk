#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }

/**
 * @namespace Windows.Win32.Devices.Nfp
 */

;@region Constants

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_NFP := Guid("{fb3842cd-9e2a-4f83-8fcc-4b0761139ae9}")

/**
 * @type {DEVPROPKEY}
 */
export global DEVPKEY_NFP_Capabilities := DEVPROPKEY()
DllCall("NtDll.dll\RtlCopyMemory",
    IntPtr, ObjGetDataPtr(DEVPKEY_NFP_Capabilities.fmtid),
    Guid.Ptr, Guid("{fb3842cd-9e2a-4f83-8fcc-4b0761139ae9}"),
    UInt32, 16)
DEVPKEY_NFP_Capabilities.pid := 2

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_NFP_GET_NEXT_SUBSCRIBED_MESSAGE := 5308480

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_NFP_SET_PAYLOAD := 5308484

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_NFP_GET_NEXT_TRANSMITTED_MESSAGE := 5308488

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_NFP_DISABLE := 5308492

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_NFP_ENABLE := 5308496

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_NFP_GET_MAX_MESSAGE_BYTES := 5308544

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_NFP_GET_KILO_BYTES_PER_SECOND := 5308548
;@endregion Constants
