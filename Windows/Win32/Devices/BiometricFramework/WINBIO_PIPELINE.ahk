#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains shared context information used by the sensor, engine, and storage adapter components in a single biometric unit.
 * @remarks
 * Each biometric unit has its own unique <b>WINBIO_PIPELINE</b> structure to maintain the current processing state of operations performed by the biometric unit. The Windows Biometric Framework automatically passes the address of the pipeline structure to each adapter in the component stack. Adapters use this pipeline pointer to access their own private context data and to call functions in lower levels of the component stack.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_PIPELINE extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * File handle to the sensor device associated with the biometric unit. Adapters should treat this as a read-only field.
     * @type {Pointer<Void>}
     */
    SensorHandle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * File handle to the dedicated hardware matching engine, if one is present. This is modified only by the engine adapter. It is read by the Windows Biometric Framework.
     * @type {Pointer<Void>}
     */
    EngineHandle {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * File handle to the template storage database. This is read by the Windows Biometric Framework, but it is modified only by the storage adapter.
     * @type {Pointer<Void>}
     */
    StorageHandle {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_sensor_interface">WINBIO_SENSOR_INTERFACE</a> structure for the biometric unit. Adapters should ignore this field.
     * @type {Pointer<WINBIO_SENSOR_INTERFACE>}
     */
    SensorInterface {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_engine_interface">WINBIO_ENGINE_INTERFACE</a> structure for the biometric unit. Adapters should ignore this field.
     * @type {Pointer<WINBIO_ENGINE_INTERFACE>}
     */
    EngineInterface {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_storage_interface">WINBIO_STORAGE_INTERFACE</a> structure for the biometric unit. Adapters should ignore this field.
     * @type {Pointer<WINBIO_STORAGE_INTERFACE>}
     */
    StorageInterface {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to a private data structure defined by the sensor adapter. This pointer and the structure contents are managed by the sensor adapter and are never accessed by the Windows Biometric Framework.
     * @type {Pointer<IntPtr>}
     */
    SensorContext {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to a private data structure defined by the engine adapter. This pointer and the structure contents are managed by the engine adapter and are never accessed by the Windows Biometric Framework.
     * @type {Pointer<IntPtr>}
     */
    EngineContext {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to a private data structure defined by the storage adapter. This pointer and the structure contents are managed by the storage adapter and are never accessed by the Windows Biometric Framework.
     * @type {Pointer<IntPtr>}
     */
    StorageContext {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * 
     * @type {Pointer<WINBIO_FRAMEWORK_INTERFACE>}
     */
    FrameworkInterface {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
