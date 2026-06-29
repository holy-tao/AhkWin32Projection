#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Properties
 */
export default struct DEVPROPTYPE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPEMOD_ARRAY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPEMOD_LIST => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_EMPTY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_NULL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_SBYTE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_BYTE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_INT16 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_UINT16 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_INT32 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_UINT32 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_INT64 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_UINT64 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_FLOAT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_DOUBLE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_DECIMAL => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_GUID => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_CURRENCY => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_DATE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_FILETIME => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_BOOLEAN => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_STRING => 18

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_STRING_LIST => 8210

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_SECURITY_DESCRIPTOR => 19

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_SECURITY_DESCRIPTOR_STRING => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_DEVPROPKEY => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_DEVPROPTYPE => 22

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_BINARY => 4099

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_ERROR => 23

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_NTSTATUS => 24

    /**
     * @type {Integer (UInt32)}
     */
    static DEVPROP_TYPE_STRING_INDIRECT => 25
}
