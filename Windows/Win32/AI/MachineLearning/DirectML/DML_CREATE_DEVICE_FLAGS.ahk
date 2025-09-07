#Requires AutoHotkey v2.0.0 64-bit

/**
 * Supplies additional device creation options to DMLCreateDevice. Values can be bitwise OR'd together.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_create_device_flags
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_CREATE_DEVICE_FLAGS{

    /**
     * No creation options are specified.
     * @type {Integer (Int32)}
     */
    static DML_CREATE_DEVICE_FLAG_NONE => 0

    /**
     * Enables the DirectML debug layers. To use the debug layers, developer mode must be enabled, and the DirectML debug layers must be installed. If the <b>DML_CREATE_DEVICE_FLAG_DEBUG</b> flag is specified and either condition is not met, then [DMLCreateDevice](/windows/win32/api/directml/nf-directml-dmlcreatedevice) returns <b>DXGI_ERROR_SDK_COMPONENT_MISSING</b>.
     * @type {Integer (Int32)}
     */
    static DML_CREATE_DEVICE_FLAG_DEBUG => 1
}
