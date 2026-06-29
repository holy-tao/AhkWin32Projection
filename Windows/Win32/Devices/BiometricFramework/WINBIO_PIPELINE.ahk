#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINIBIO_SENSOR_CONTEXT.ahk" { WINIBIO_SENSOR_CONTEXT }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\WINBIO_SENSOR_INTERFACE.ahk" { WINBIO_SENSOR_INTERFACE }
#Import ".\WINBIO_ENGINE_INTERFACE.ahk" { WINBIO_ENGINE_INTERFACE }
#Import ".\WINBIO_STORAGE_INTERFACE.ahk" { WINBIO_STORAGE_INTERFACE }
#Import ".\WINIBIO_ENGINE_CONTEXT.ahk" { WINIBIO_ENGINE_CONTEXT }
#Import ".\WINBIO_FRAMEWORK_INTERFACE.ahk" { WINBIO_FRAMEWORK_INTERFACE }
#Import ".\WINIBIO_STORAGE_CONTEXT.ahk" { WINIBIO_STORAGE_CONTEXT }

/**
 * Contains shared context information used by the sensor, engine, and storage adapter components in a single biometric unit.
 * @remarks
 * Each biometric unit has its own unique <b>WINBIO_PIPELINE</b> structure to maintain the current processing state of operations performed by the biometric unit. The Windows Biometric Framework automatically passes the address of the pipeline structure to each adapter in the component stack. Adapters use this pipeline pointer to access their own private context data and to call functions in lower levels of the component stack.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct WINBIO_PIPELINE {
    #StructPack 8

    /**
     * File handle to the sensor device associated with the biometric unit. Adapters should treat this as a read-only field.
     */
    SensorHandle : HANDLE

    /**
     * File handle to the dedicated hardware matching engine, if one is present. This is modified only by the engine adapter. It is read by the Windows Biometric Framework.
     */
    EngineHandle : HANDLE

    /**
     * File handle to the template storage database. This is read by the Windows Biometric Framework, but it is modified only by the storage adapter.
     */
    StorageHandle : HANDLE

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_sensor_interface">WINBIO_SENSOR_INTERFACE</a> structure for the biometric unit. Adapters should ignore this field.
     */
    SensorInterface : WINBIO_SENSOR_INTERFACE.Ptr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_engine_interface">WINBIO_ENGINE_INTERFACE</a> structure for the biometric unit. Adapters should ignore this field.
     */
    EngineInterface : WINBIO_ENGINE_INTERFACE.Ptr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/win32/api/winbio_adapter/ns-winbio_adapter-winbio_storage_interface">WINBIO_STORAGE_INTERFACE</a> structure for the biometric unit. Adapters should ignore this field.
     */
    StorageInterface : WINBIO_STORAGE_INTERFACE.Ptr

    /**
     * Pointer to a private data structure defined by the sensor adapter. This pointer and the structure contents are managed by the sensor adapter and are never accessed by the Windows Biometric Framework.
     */
    SensorContext : WINIBIO_SENSOR_CONTEXT.Ptr

    /**
     * Pointer to a private data structure defined by the engine adapter. This pointer and the structure contents are managed by the engine adapter and are never accessed by the Windows Biometric Framework.
     */
    EngineContext : WINIBIO_ENGINE_CONTEXT.Ptr

    /**
     * Pointer to a private data structure defined by the storage adapter. This pointer and the structure contents are managed by the storage adapter and are never accessed by the Windows Biometric Framework.
     */
    StorageContext : WINIBIO_STORAGE_CONTEXT.Ptr

    FrameworkInterface : WINBIO_FRAMEWORK_INTERFACE.Ptr

}
