#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SP_CLASSINSTALL_HEADER.ahk

/**
 * An SP_DETECTDEVICE_PARAMS structure corresponds to a DIF_DETECT installation request.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_detectdevice_params
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SP_DETECTDEVICE_PARAMS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * An install request header that contains the size of the header and the DIF code for the request. See <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/ns-setupapi-sp_classinstall_header">SP_CLASSINSTALL_HEADER</a>.
     * @type {SP_CLASSINSTALL_HEADER}
     */
    ClassInstallHeader{
        get {
            if(!this.HasProp("__ClassInstallHeader"))
                this.__ClassInstallHeader := SP_CLASSINSTALL_HEADER(this.ptr + 0)
            return this.__ClassInstallHeader
        }
    }

    /**
     * A callback routine that displays a progress bar for the device detection operation. The callback routine is supplied by the <a href="https://docs.microsoft.com/windows-hardware/drivers/install/system-provided-device-installation-components">device installation component</a> that sends the <a href="https://docs.microsoft.com/windows-hardware/drivers/install/dif-detect">DIF_DETECT</a> request. The callback has the following prototype:
     * 
     * 
     * ```
     * typedef BOOL (CALLBACK* PDETECT_PROGRESS_NOTIFY)(
     *     IN PVOID ProgressNotifyParam,
     *     IN DWORD DetectComplete
     *     );
     * ```
     * 
     * 
     * <i>ProgressNotifyParam</i> is an opaque "handle" that identifies the detection operation. This value is supplied by the <a href="https://docs.microsoft.com/windows-hardware/drivers/install/system-provided-device-installation-components">device installation component</a> that sent the DIF_DETECT request. 
     * 
     * <i>DetectComplete</i> is a value between 0 and 100 that indicates the percent completion. The class installer increments this value at various stages of its detection activities, to notify the user of its progress.
     * @type {Pointer<PDETECT_PROGRESS_NOTIFY>}
     */
    DetectProgressNotify {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The opaque <b>ProgressNotifyParam</b> "handle" that the class installer passes to the progress callback routine.
     * @type {Pointer<Void>}
     */
    ProgressNotifyParam {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
