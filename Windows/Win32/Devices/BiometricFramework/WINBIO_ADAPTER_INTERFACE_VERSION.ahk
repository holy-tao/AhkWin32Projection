#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a major and minor version number used in the engine, sensor, and storage adapter interface tables.
 * @remarks
 * This structure is used by the following structures:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_engine_interface">WINBIO_ENGINE_INTERFACE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_sensor_interface">WINBIO_SENSOR_INTERFACE</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_storage_interface">WINBIO_STORAGE_INTERFACE</a>
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_adapter_interface_version
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_ADAPTER_INTERFACE_VERSION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Contains the major version number.
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Contains the minor version number.
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
