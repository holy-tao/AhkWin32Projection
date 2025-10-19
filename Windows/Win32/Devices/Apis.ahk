#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Devices
 * @version v4.0.30319
 */
class Devices {

;@region Constants

    /**
     * @type {String}
     */
    static BUS1394_VIRTUAL_DEVICE_LIST_KEY => "Virtual Device List"

    /**
     * @type {String}
     */
    static BUS1394_LOCAL_HOST_INSTANCE_KEY => "LOCAL HOST EUI64"

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_IEEE1394_API_REQUEST => 2229248

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394_API_ADD_VIRTUAL_DEVICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394_API_REMOVE_VIRTUAL_DEVICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394_API_DEVICE_ACCESS_TRANSFER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394_API_SET_LOCAL_NODE_PROPERTIES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394_REQUEST_FLAG_UNICODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394_REQUEST_FLAG_PERSISTENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394_REQUEST_FLAG_USE_LOCAL_HOST_EUI => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394API_NOTIFICATION_DEVICE_ACCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394API_NOTIFICATION_BUS_RESET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394API_DEVICE_OWNERSHIP_LOCAL_NODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394API_RESOURCE_OWNERSHIP_LOCAL_NODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394API_DEVICE_OWNERSHIP_REMOTE_NODE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394API_RESOURCE_OWNERSHIP_REMOTE_NODE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394API_ACCESS_SHARED_READ => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394API_ACCESS_SHARED_WRITE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394API_ACCESS_EXCLUSIVE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394API_REMOTE_ACCESS_TRANSFER_REQUEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394API_BUS_RESET_LOCAL_NODE_IS_ROOT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394API_BUS_RESET_LOCAL_NODE_IS_IRM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IEEE1394API_BUS_RESET_LOCAL_NODE_INITIATED => 4
;@endregion Constants

;@region Methods
;@endregion Methods
}
