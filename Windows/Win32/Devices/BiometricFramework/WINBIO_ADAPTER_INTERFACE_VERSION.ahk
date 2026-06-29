#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct WINBIO_ADAPTER_INTERFACE_VERSION {
    #StructPack 2

    /**
     * Contains the major version number.
     */
    MajorVersion : UInt16

    /**
     * Contains the minor version number.
     */
    MinorVersion : UInt16

}
