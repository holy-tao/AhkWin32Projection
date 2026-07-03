#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SETUP_DI_DEVICE_INSTALL_FLAGS.ahk" { SETUP_DI_DEVICE_INSTALL_FLAGS }
#Import ".\SETUP_DI_DEVICE_INSTALL_FLAGS_EX.ahk" { SETUP_DI_DEVICE_INSTALL_FLAGS_EX }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * An SP_DEVINSTALL_PARAMS structure contains device installation parameters associated with a particular device information element or associated globally with a device information set. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The setupapi.h header defines SP_DEVINSTALL_PARAMS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_devinstall_params_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset Unicode
 * @architecture X64, Arm64
 */
export default struct SP_DEVINSTALL_PARAMS_W {
    #StructPack 8

    /**
     * The size, in bytes, of the SP_DEVINSTALL_PARAMS structure.
     */
    cbSize : UInt32 := this.Size

    Flags : SETUP_DI_DEVICE_INSTALL_FLAGS

    FlagsEx : SETUP_DI_DEVICE_INSTALL_FLAGS_EX

    /**
     * Window handle that will own the user interface dialogs related to this device.
     */
    hwndParent : HWND

    /**
     * Callback used to handle events during file copying. An installer can use a callback, for example, to perform special processing when committing a file queue.
     */
    InstallMsgHandler : IntPtr

    /**
     * Private data that is used by the <b>InstallMsgHandler</b> callback.
     */
    InstallMsgHandlerContext : IntPtr

    /**
     * A handle to a caller-supplied file queue where file operations should be queued but not committed.
     * 
     * If you associate a file queue with a device information set (<a href="https://docs.microsoft.com/windows/desktop/api/setupapi/nf-setupapi-setupdisetdeviceinstallparamsa">SetupDiSetDeviceInstallParams</a>), you must disassociate the queue from the device information set before you delete the device information set. If you fail to disassociate the file queue, Windows cannot decrement its reference count on the device information set and cannot free the memory.
     * 
     * This queue is only used if the DI_NOVCP flag is set, indicating that file operations should be enqueued but not committed.
     */
    FileQueue : IntPtr

    /**
     * A pointer for class-installer data. Co-installers must not use this field.
     */
    ClassInstallReserved : IntPtr

    /**
     * Reserved. For internal use only.
     */
    Reserved : UInt32

    /**
     * This path is used by the <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/nf-setupapi-setupdibuilddriverinfolist">SetupDiBuildDriverInfoList</a> function.
     */
    DriverPath : WCHAR[260]

}
