#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DirectML {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static DML_TARGET_VERSION => 25088

    /**
     * @type {Integer (UInt32)}
     */
    static DML_TENSOR_DIMENSION_COUNT_MAX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DML_TENSOR_DIMENSION_COUNT_MAX1 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DML_TEMPORARY_BUFFER_ALIGNMENT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DML_PERSISTENT_BUFFER_ALIGNMENT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DML_MINIMUM_BUFFER_TENSOR_ALIGNMENT => 16
;@endregion Constants

;@region Methods
    /**
     * Creates a DirectML device for a given Direct3D 12 device.
     * @param {Pointer<ID3D12Device>} d3d12Device Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device">ID3D12Device</a>*</b>
     * 
     * A pointer to an [ID3D12Device](/windows/win32/api/d3d12/nn-d3d12-id3d12device) representing the Direct3D 12 device to create the DirectML device over. DirectML supports any D3D feature level, and Direct3D 12 devices created on any adapter, including WARP. However, not all features in DirectML may be available depending on the capabilities of the Direct3D 12 device. See [IDMLDevice::CheckFeatureSupport](/windows/win32/api/directml/nf-directml-idmldevice-checkfeaturesupport) for more info.
     * 
     * If the call to **DMLCreateDevice** is successful, then the DirectML device maintains a strong reference to the supplied Direct3D 12 device.
     * @param {Integer} flags Type: <b>DML_CREATE_DEVICE_FLAGS</b>
     * 
     * A [DML_CREATE_DEVICE_FLAGS](/windows/win32/api/directml/ne-directml-dml_create_device_flags) value specifying additional device creation options.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in <i>device</i>. This is expected to be the GUID of [IDMLDevice](/windows/win32/api/directml/nn-directml-idmldevice).
     * @param {Pointer<Void>} ppv Type: \_COM\_Outptr\_opt\_ <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the device. This is the address of a pointer to an [IDMLDevice](/windows/win32/api/directml/nn-directml-idmldevice), representing  the DirectML device created.
     * @returns {HRESULT} Type: [**HRESULT**](/windows/desktop/winprog/windows-data-types)
     * 
     * If the function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an [HRESULT](/windows/desktop/winprog/windows-data-types) error code.
     * 
     * The Graphics Tools Feature on Demand (FOD) must be installed in order to use the DirectML debug layers. If the [DML_CREATE_DEVICE_FLAG_DEBUG](/windows/win32/api/directml/ne-directml-dml_create_device_flags) flag is specified in *flags* and the debug layers are not installed, then **DMLCreateDevice** returns **DXGI_ERROR_SDK_COMPONENT_MISSING**.
     * @see https://docs.microsoft.com/windows/win32/api//directml/nf-directml-dmlcreatedevice
     * @since windows10.0.10240
     */
    static DMLCreateDevice(d3d12Device, flags, riid, ppv) {
        result := DllCall("DirectML.dll\DMLCreateDevice", "ptr", d3d12Device, "int", flags, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a DirectML device for a given Direct3D 12 device.
     * @param {Pointer<ID3D12Device>} d3d12Device Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device">ID3D12Device</a>*</b>
     * 
     * A pointer to an [ID3D12Device](/windows/win32/api/d3d12/nn-d3d12-id3d12device) representing the Direct3D 12 device to create the DirectML device over. DirectML supports any D3D feature level, and Direct3D 12 devices created on any adapter, including WARP. However, not all features in DirectML may be available depending on the capabilities of the Direct3D 12 device. See [IDMLDevice::CheckFeatureSupport](/windows/win32/api/directml/nf-directml-idmldevice-checkfeaturesupport) for more info.
     * 
     * If the call to **DMLCreateDevice1** is successful, then the DirectML device maintains a strong reference to the supplied Direct3D 12 device.
     * @param {Integer} flags Type: <b>DML_CREATE_DEVICE_FLAGS</b>
     * 
     * A [DML_CREATE_DEVICE_FLAGS](/windows/win32/api/directml/ne-directml-dml_create_device_flags) value specifying additional device creation options.
     * @param {Integer} minimumFeatureLevel Type: <b>DML_FEATURE_LEVEL</b>
     * 
     * A [DML_FEATURE_LEVEL](/windows/win32/api/directml/ne-directml-dml_feature_level) value specifying the minimum feature level support required.
     * 
     * This parameter can be useful for callers that require a specific version of DirectML, but who may find themselves calling into an older version of DirectML. This can happen, for example, when the user runs your application on an older version of Windows 10.
     * 
     * Applications that explicitly depend on functionality introduced in a particular feature level can specify it as a *minimumFeatureLevel*. This will guarantee that **DMLCreateDevice1** won't succeed unless the underlying implementation is *at least* as capable as this requested minimum feature level.
     * 
     * Note that as this parameter specifies a *minimum* feature level, the underlying DirectML device may in fact support a higher feature level than the requested minimum. Once device creation succeeds, you can query all of the feature levels supported by this device using [IDMLDevice::CheckFeatureSupport](/windows/win32/api/directml/nf-directml-idmldevice-checkfeaturesupport).
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in <i>device</i>. This is expected to be the GUID of [IDMLDevice](/windows/win32/api/directml/nn-directml-idmldevice).
     * @param {Pointer<Void>} ppv Type: \_COM\_Outptr\_opt\_ <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the device. This is the address of a pointer to an [IDMLDevice](/windows/win32/api/directml/nn-directml-idmldevice), representing  the DirectML device created.
     * @returns {HRESULT} Type: [**HRESULT**](/windows/desktop/winprog/windows-data-types)
     * 
     * If the function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an [HRESULT](/windows/desktop/winprog/windows-data-types) error code.
     * 
     * If this version of DirectML doesn't support the *minimumFeatureLevel* requested, then this function will return **DXGI_ERROR_UNSUPPORTED**.
     * 
     * The Graphics Tools Feature on Demand (FOD) must be installed in order to use the DirectML debug layers. If the [DML_CREATE_DEVICE_FLAG_DEBUG](/windows/win32/api/directml/ne-directml-dml_create_device_flags) flag is specified in *flags* and the debug layers are not installed, then **DMLCreateDevice1** returns **DXGI_ERROR_SDK_COMPONENT_MISSING**.
     * @see https://docs.microsoft.com/windows/win32/api//directml/nf-directml-dmlcreatedevice1
     */
    static DMLCreateDevice1(d3d12Device, flags, minimumFeatureLevel, riid, ppv) {
        result := DllCall("DirectML.dll\DMLCreateDevice1", "ptr", d3d12Device, "int", flags, "int", minimumFeatureLevel, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
