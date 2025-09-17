#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAccess
 * @version v4.0.30319
 */
class DeviceAccess {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static ED_BASE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DEV_PORT_SIM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEV_PORT_COM1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEV_PORT_COM2 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DEV_PORT_COM3 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEV_PORT_COM4 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEV_PORT_DIAQ => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DEV_PORT_ARTI => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DEV_PORT_1394 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEV_PORT_USB => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DEV_PORT_MIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEV_PORT_MAX => 9

    /**
     * @type {Integer (UInt32)}
     */
    static ED_TOP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ED_MIDDLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ED_BOTTOM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ED_LEFT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ED_CENTER => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ED_RIGHT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ED_AUDIO_ALL => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_3 => 4

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_4 => 8

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_5 => 16

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_6 => 32

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_7 => 64

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_8 => 128

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_9 => 256

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_10 => 512

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_11 => 1024

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_12 => 2048

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_13 => 4096

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_14 => 8192

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_15 => 16384

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_16 => 32768

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_17 => 65536

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_18 => 131072

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_19 => 262144

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_20 => 524288

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_21 => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_22 => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_23 => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static ED_AUDIO_24 => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static ED_VIDEO => 33554432

    /**
     * @type {String}
     */
    static CLSID_DeviceIoControl => "{12d3e372-874b-457d-9fdf-73977778686c}"
;@endregion Constants

;@region Methods
    /**
     * Creates the object that's used to access a device. The instantiated object implements the IDeviceIoControl and ICreateDeviceAccessAsync interfaces.
     * @param {Pointer<Char>} deviceInterfacePath A valid device interface path for the device that this instance should bind to.
     * @param {Integer} desiredAccess The requested level of access to the device, which can be summarized as read, write, both, or neither (zero).
     *  
     * 
     * 
     * The most commonly used values are <b>GENERIC_READ</b>, <b>GENERIC_WRITE</b>, or both (<b>GENERIC_READ</b> | <b>GENERIC_WRITE</b>). For more information, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/generic-access-rights">Generic Access Rights</a>, <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-security-and-access-rights">File Security and Access Rights</a>, <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-access-rights-constants">File Access Rights Constants</a>, <a href="https://docs.microsoft.com/windows/desktop/FileIO/creating-and-opening-files">Creating and Opening Files</a>, and <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a>.
     * @param {Pointer<ICreateDeviceAccessAsync>} createAsync Asynchronous interface to control binding for this instance.  For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/deviceaccess/nn-deviceaccess-icreatedeviceaccessasync">ICreateDeviceAccessAsync</a>.
     * @returns {Integer} <b>S_OK</b> if the underlying object and asynchronous operation are created successfully; an appropriate error otherwise.  Note that this function doesn't perform the actual binding.That happens as part of the asynchronous operation.
     * @see https://learn.microsoft.com/windows/win32/api/deviceaccess/nf-deviceaccess-createdeviceaccessinstance
     */
    static CreateDeviceAccessInstance(deviceInterfacePath, desiredAccess, createAsync) {
        deviceInterfacePath := deviceInterfacePath is String? StrPtr(deviceInterfacePath) : deviceInterfacePath

        result := DllCall("deviceaccess.dll\CreateDeviceAccessInstance", "ptr", deviceInterfacePath, "uint", desiredAccess, "ptr", createAsync, "int")
        return result
    }

;@endregion Methods
}
