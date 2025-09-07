#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An SP_DEVINSTALL_PARAMS structure contains device installation parameters associated with a particular device information element or associated globally with a device information set. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The setupapi.h header defines SP_DEVINSTALL_PARAMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_devinstall_params_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_DEVINSTALL_PARAMS_A extends Win32Struct
{
    static sizeof => 316

    static packingSize => 1

    /**
     * The size, in bytes, of the SP_DEVINSTALL_PARAMS structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    FlagsEx {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Window handle that will own the user interface dialogs related to this device.
     * @type {Pointer<Ptr>}
     */
    hwndParent {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * Callback used to handle events during file copying. An installer can use a callback, for example, to perform special processing when committing a file queue.
     * @type {Pointer<Ptr>}
     */
    InstallMsgHandler {
        get => NumGet(this, 20, "ptr")
        set => NumPut("ptr", value, this, 20)
    }

    /**
     * Private data that is used by the <b>InstallMsgHandler</b> callback.
     * @type {Pointer<Void>}
     */
    InstallMsgHandlerContext {
        get => NumGet(this, 28, "ptr")
        set => NumPut("ptr", value, this, 28)
    }

    /**
     * A handle to a caller-supplied file queue where file operations should be queued but not committed.
     * 
     * If you associate a file queue with a device information set (<a href="https://docs.microsoft.com/windows/desktop/api/setupapi/nf-setupapi-setupdisetdeviceinstallparamsa">SetupDiSetDeviceInstallParams</a>), you must disassociate the queue from the device information set before you delete the device information set. If you fail to disassociate the file queue, Windows cannot decrement its reference count on the device information set and cannot free the memory.
     * 
     * This queue is only used if the DI_NOVCP flag is set, indicating that file operations should be enqueued but not committed.
     * @type {Pointer<Void>}
     */
    FileQueue {
        get => NumGet(this, 36, "ptr")
        set => NumPut("ptr", value, this, 36)
    }

    /**
     * A pointer for class-installer data. Co-installers must not use this field.
     * @type {Pointer}
     */
    ClassInstallReserved {
        get => NumGet(this, 44, "ptr")
        set => NumPut("ptr", value, this, 44)
    }

    /**
     * Reserved. For internal use only.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * This path is used by the <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/nf-setupapi-setupdibuilddriverinfolist">SetupDiBuildDriverInfoList</a> function.
     * @type {String}
     */
    DriverPath {
        get => StrGet(this.ptr + 56, 259, "UTF-8")
        set => StrPut(value, this.ptr + 56, 259, "UTF-8")
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 316
    }
}
