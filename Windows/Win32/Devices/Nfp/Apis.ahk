#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\DEVPROPKEY.ahk

/**
 * @namespace Windows.Win32.Devices.Nfp
 * @version v4.0.30319
 */
class Nfp {

;@region Constants

    /**
     * @type {Guid}
     */
    static GUID_DEVINTERFACE_NFP => Guid("{fb3842cd-9e2a-4f83-8fcc-4b0761139ae9}")

    /**
     * @type {DEVPROPKEY}
     */
    static DEVPKEY_NFP_Capabilities {
        get {
            value := DEVPROPKEY()
            static fmtid_guid := Guid("{fb3842cd-9e2a-4f83-8fcc-4b0761139ae9}")
            value.fmtid := fmtid_guid.ptr
            value.pid := 2
            return value
        }
    }

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFP_GET_NEXT_SUBSCRIBED_MESSAGE => 5308480

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFP_SET_PAYLOAD => 5308484

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFP_GET_NEXT_TRANSMITTED_MESSAGE => 5308488

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFP_DISABLE => 5308492

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFP_ENABLE => 5308496

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFP_GET_MAX_MESSAGE_BYTES => 5308544

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_NFP_GET_KILO_BYTES_PER_SECOND => 5308548
;@endregion Constants

;@region Methods
;@endregion Methods
}
