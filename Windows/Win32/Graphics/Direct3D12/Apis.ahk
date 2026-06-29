#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_VERSIONED_ROOT_SIGNATURE_DESC.ahk" { D3D12_VERSIONED_ROOT_SIGNATURE_DESC }
#Import "..\Direct3D\ID3DBlob.ahk" { ID3DBlob }
#Import ".\D3D_ROOT_SIGNATURE_VERSION.ahk" { D3D_ROOT_SIGNATURE_VERSION }
#Import ".\D3D12_ROOT_SIGNATURE_DESC.ahk" { D3D12_ROOT_SIGNATURE_DESC }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Direct3D\D3D_FEATURE_LEVEL.ahk" { D3D_FEATURE_LEVEL }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */

;@region Functions
/**
 * Serializes a root signature version 1.0 that can be passed to ID3D12Device::CreateRootSignature.
 * @remarks
 * This function has been superceded by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12serializeversionedrootsignature">D3D12SerializeVersionedRootSignature</a> as of the Windows 10 Anniversary Update (14393).
 * 
 * If an application procedurally generates a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_signature_desc">D3D12_ROOT_SIGNATURE_DESC</a> data structure, it must pass a pointer to this <b>D3D12_ROOT_SIGNATURE_DESC</b> in a call to <b>D3D12SerializeRootSignature</b> to make the serialized form.
 *         The application then passes the serialized form to which <i>ppBlob</i> points into <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createrootsignature">ID3D12Device::CreateRootSignature</a>.
 *       
 * 
 * If a shader has been authored with a root signature in it, the compiled shader will contain a serialized root signature in it already. In this case, pass the compiled shader blob to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createrootsignature">ID3D12Device::CreateRootSignature</a> to obtain the runtime root signature object.
 *       
 * 
 * The function signature PFN_D3D12_SERIALIZE_ROOT_SIGNATURE is provided as a typedef, so that you can use dynamic linking techniques (<a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>) instead of statically linking.
 * @param {Pointer<D3D12_ROOT_SIGNATURE_DESC>} pRootSignature Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_signature_desc">D3D12_ROOT_SIGNATURE_DESC</a>*</b>
 * 
 * The description of the root signature, as a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_signature_desc">D3D12_ROOT_SIGNATURE_DESC</a> structure.
 * @param {D3D_ROOT_SIGNATURE_VERSION} _Version Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d_root_signature_version">D3D_ROOT_SIGNATURE_VERSION</a></b>
 * 
 * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d_root_signature_version">D3D_ROOT_SIGNATURE_VERSION</a>-typed value that specifies the version of root signature.
 * @param {Pointer<ID3DBlob>} ppBlob Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
 * 
 * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access the serialized root signature.
 * @param {Pointer<ID3DBlob>} ppErrorBlob Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
 * 
 * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access serializer error messages, or <b>NULL</b> if there are no errors.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * Returns <b>S_OK</b> if successful; otherwise, returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12serializerootsignature
 */
export D3D12SerializeRootSignature(pRootSignature, _Version, ppBlob, ppErrorBlob) {
    result := DllCall("d3d12.dll\D3D12SerializeRootSignature", D3D12_ROOT_SIGNATURE_DESC.Ptr, pRootSignature, D3D_ROOT_SIGNATURE_VERSION, _Version, ID3DBlob.Ptr, ppBlob, ID3DBlob.Ptr, ppErrorBlob, "HRESULT")
    return result
}

/**
 * Deserializes a root signature so you can determine the layout definition (D3D12_ROOT_SIGNATURE_DESC).
 * @remarks
 * This function has been superceded by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12createversionedrootsignaturedeserializer">D3D12CreateVersionedRootSignatureDeserializer</a>.
 * 
 * If an application has a serialized root signature already or has a compiled shader that contains a root signature and wants to determine the layout definition, it can call <b>D3D12CreateRootSignatureDeserializer</b> to generate a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12rootsignaturedeserializer">ID3D12RootSignatureDeserializer</a> interface. <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12rootsignaturedeserializer-getrootsignaturedesc">ID3D12RootSignatureDeserializer::GetRootSignature</a> can return the deserialized data structure
 *         (<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_signature_desc">D3D12_ROOT_SIGNATURE_DESC</a>).
 *         <b>ID3D12RootSignatureDeserializer</b> just owns the lifetime of the memory for the deserialized data structure.
 *       
 * 
 * The <b>REFIID</b>, or <b>GUID</b>, of the interface to the root signature deserializer can be obtained by using the __uuidof() macro. For example, __uuidof(<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12rootsignaturedeserializer">ID3D12RootSignatureDeserializer</a>) will get the <b>GUID</b> of the interface to a root signature deserializer.
 *       
 * 
 * The function signature PFN_D3D12_CREATE_ROOT_SIGNATURE_DESERIALIZER is provided as a typedef, so that you can use dynamic linking techniques (<a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>) instead of statically linking.
 * @param {Integer} pSrcData Type: <b>LPCVOID</b>
 * 
 * A pointer to the source data for the serialized root signature.
 * @param {Pointer} SrcDataSizeInBytes Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
 * 
 * The size, in bytes, of the block of memory that <i>pSrcData</i> points to.
 * @param {Pointer<Guid>} pRootSignatureDeserializerInterface Type: <b><b>REFIID</b></b>
 * 
 * The globally unique identifier (<b>GUID</b>) for the root signature deserializer interface. See remarks.
 * @returns {Pointer<Void>} Type: <b><b>void</b>**</b>
 * 
 * A pointer to a memory block that receives a pointer to the root signature deserializer.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12createrootsignaturedeserializer
 */
export D3D12CreateRootSignatureDeserializer(pSrcData, SrcDataSizeInBytes, pRootSignatureDeserializerInterface) {
    result := DllCall("d3d12.dll\D3D12CreateRootSignatureDeserializer", "ptr", pSrcData, "ptr", SrcDataSizeInBytes, Guid.Ptr, pRootSignatureDeserializerInterface, "ptr*", &ppRootSignatureDeserializer := 0, "HRESULT")
    return ppRootSignatureDeserializer
}

/**
 * Serializes a root signature of any version that can be passed to ID3D12Device::CreateRootSignature.
 * @remarks
 * If an application procedurally generates a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_signature_desc1">D3D12_ROOT_SIGNATURE_DESC1</a> data structure, it must pass a pointer to this <b>D3D12_ROOT_SIGNATURE_DESC1</b> in a call to <b>D3D12SerializeVersionedRootSignature</b> to make the serialized form.
 *         The application then passes the serialized form to which <i>ppBlob</i> points into <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createrootsignature">ID3D12Device::CreateRootSignature</a>.
 * 
 * 
 * If a shader has been authored with a root signature in it, the compiled shader will contain a serialized root signature in it already. In this case, pass the compiled shader blob to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createrootsignature">ID3D12Device::CreateRootSignature</a> to obtain the runtime root signature object.
 * 
 * > Note that for Xbox developers, use of HLSL-authored root signatures is strongly recommended.
 * 
 * 
 * The function signature PFN_D3D12_SERIALIZE_VERSIONED_ROOT_SIGNATURE is provided as a typedef, so that you can use dynamic linking techniques (<a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>) instead of statically linking.
 *       
 * 
 * This function was released with the Windows 10 Anniversary Update (14393) and supersedes <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12serializerootsignature">D3D12SerializeRootSignature</a>.
 * @param {Pointer<D3D12_VERSIONED_ROOT_SIGNATURE_DESC>} pRootSignature Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_versioned_root_signature_desc">D3D12_VERSIONED_ROOT_SIGNATURE_DESC</a>*</b>
 * 
 * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_versioned_root_signature_desc">D3D12_VERSIONED_ROOT_SIGNATURE_DESC</a> that contains a description of any version of a root signature.
 * @param {Pointer<ID3DBlob>} ppBlob Type: <b>ID3DBlob**</b>
 * 
 * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access the serialized root signature.
 * @param {Pointer<ID3DBlob>} ppErrorBlob Type: <b>ID3DBlob**</b>
 * 
 * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access serializer error messages, or <b>NULL</b> if there are no errors.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * Returns <b>S_OK</b> if successful; otherwise, returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12serializeversionedrootsignature
 */
export D3D12SerializeVersionedRootSignature(pRootSignature, ppBlob, ppErrorBlob) {
    result := DllCall("d3d12.dll\D3D12SerializeVersionedRootSignature", D3D12_VERSIONED_ROOT_SIGNATURE_DESC.Ptr, pRootSignature, ID3DBlob.Ptr, ppBlob, ID3DBlob.Ptr, ppErrorBlob, "HRESULT")
    return result
}

/**
 * Generates an interface that can return the deserialized data structure, via GetUnconvertedRootSignatureDesc.
 * @remarks
 * If an application has a serialized root signature already or has a compiled shader that contains a root signature and wants to determine the layout definition, it can call <b>D3D12CreateVersionedRootSignatureDeserializer</b> to generate a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12versionedrootsignaturedeserializer">ID3D12VersionedRootSignatureDeserializer</a> interface. <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12versionedrootsignaturedeserializer-getrootsignaturedescatversion">ID3D12VersionedRootSignatureDeserializer::GetRootSignatureDescAtVersion</a> can return the deserialized data structure
 *         (<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_signature_desc1">D3D12_ROOT_SIGNATURE_DESC1</a>).
 *         <b>ID3D12VersionedRootSignatureDeserializer</b> just owns the lifetime of the memory for the deserialized data structure.
 *       
 * 
 * The <b>REFIID</b>, or <b>GUID</b>, of the interface to the root signature deserializer can be obtained by using the __uuidof() macro. For example, __uuidof(<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12versionedrootsignaturedeserializer">ID3D12VersionedRootSignatureDeserializer</a>) will get the <b>GUID</b> of the interface to a root signature deserializer.
 *       
 * 
 * The function signature PFN_D3D12_CREATE_ROOT_SIGNATURE_DESERIALIZER is provided as a typedef, so that you can use dynamic linking techniques (<a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>) instead of statically linking.
 *       
 * 
 * This function supercedes <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12createrootsignaturedeserializer">D3D12CreateRootSignatureDeserializer</a>.
 * @param {Integer} pSrcData Type: <b>LPCVOID</b>
 * 
 * A pointer to the source data for the serialized root signature.
 * @param {Pointer} SrcDataSizeInBytes Type: <b>SIZE_T</b>
 * 
 * The size, in bytes, of the block of memory that <i>pSrcData</i> points to.
 * @param {Pointer<Guid>} pRootSignatureDeserializerInterface Type: <b>REFIID</b>
 * 
 * The globally unique identifier (<b>GUID</b>) for the root signature deserializer interface. See remarks.
 * @returns {Pointer<Void>} Type: <b>void**</b>
 * 
 * A pointer to a memory block that receives a pointer to the root signature deserializer.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12createversionedrootsignaturedeserializer
 */
export D3D12CreateVersionedRootSignatureDeserializer(pSrcData, SrcDataSizeInBytes, pRootSignatureDeserializerInterface) {
    result := DllCall("d3d12.dll\D3D12CreateVersionedRootSignatureDeserializer", "ptr", pSrcData, "ptr", SrcDataSizeInBytes, Guid.Ptr, pRootSignatureDeserializerInterface, "ptr*", &ppRootSignatureDeserializer := 0, "HRESULT")
    return ppRootSignatureDeserializer
}

/**
 * Creates a device that represents the display adapter. (D3D12CreateDevice)
 * @remarks
 * Direct3D 12 devices are singletons per adapter. If a Direct3D 12 device already exists in the current process for a given adapter, then a subsequent call to **D3D12CreateDevice** returns the existing device. If the current Direct3D 12 device is in a removed state (that is, [ID3D12Device::GetDeviceRemovedReason](nf-d3d12-id3d12device-getdeviceremovedreason.md) returns a failing HRESULT), then **D3D12CreateDevice** fails instead of returning the existing device. The sameness of two adapters (that is, they have the same identity) is determined by comparing their LUIDs, not their pointers.
 * 
 * In order to be sure to pick up the first adapter that supports D3D12, use the following code. 
 * 
 * 
 * ``` syntax
 * void GetHardwareAdapter(IDXGIFactory4* pFactory, IDXGIAdapter1** ppAdapter)
 * {
 *     *ppAdapter = nullptr;
 *     for (UINT adapterIndex = 0; ; ++adapterIndex)
 *     {
 *         IDXGIAdapter1* pAdapter = nullptr;
 *         if (DXGI_ERROR_NOT_FOUND == pFactory->EnumAdapters1(adapterIndex, &pAdapter))
 *         {
 *             // No more adapters to enumerate.
 *             break;
 *         } 
 * 
 *         // Check to see if the adapter supports Direct3D 12, but don't create the
 *         // actual device yet.
 *         if (SUCCEEDED(D3D12CreateDevice(pAdapter, D3D_FEATURE_LEVEL_11_0, _uuidof(ID3D12Device), nullptr)))
 *         {
 *             *ppAdapter = pAdapter;
 *             return;
 *         }
 *         pAdapter->Release();
 *     }
 * }
 * 
 * ```
 * 
 * The function signature PFN_D3D12_CREATE_DEVICE is provided as a typedef, so that you can use dynamic linking techniques (<a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>) instead of statically linking.
 *       
 * 
 * The <b>REFIID</b>, or <b>GUID</b>, of the interface to a device can be obtained by using the<c> __uuidof()</c> macro.
 *         For example, <c>__uuidof</c>(<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12device">ID3D12Device</a>) will get the <b>GUID</b> of the interface to a device.
 * @param {IUnknown} pAdapter Type: <b>IUnknown*</b>
 * 
 * A pointer to the video adapter to use when creating a <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-intro">device</a>.
 *             Pass <b>NULL</b> to use the default adapter, which is the first adapter that is enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-enumadapters">IDXGIFactory1::EnumAdapters</a>.
 *             
 * 
 * <div class="alert"><b>Note</b>  Don't mix the use of DXGI 1.0 (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory">IDXGIFactory</a>) and DXGI 1.1 (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory1">IDXGIFactory1</a>) in an application.
 *               Use <b>IDXGIFactory</b> or <b>IDXGIFactory1</b>, but not both in an application.
 *             </div>
 * <div> </div>
 * @param {D3D_FEATURE_LEVEL} MinimumFeatureLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a></b>
 * 
 * The minimum <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a> required for successful device creation.
 * @param {Pointer<Guid>} riid Type: <b><b>REFIID</b></b>
 * 
 * The globally unique identifier (<b>GUID</b>) for the device interface.
 *             This parameter, and <i>ppDevice</i>, can be addressed with the single macro
 *           <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-iid_ppv_args">IID_PPV_ARGS</a>.
 * @returns {Pointer<Void>} Type: <b><b>void</b>**</b>
 * 
 * A pointer to a memory block that receives a pointer to the device. Pass **NULL** to test if device creation would succeed, but to not actually create the device. If **NULL** is passed and device creation would succeed, **S_FALSE** is returned.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12createdevice
 */
export D3D12CreateDevice(pAdapter, MinimumFeatureLevel, riid) {
    result := DllCall("d3d12.dll\D3D12CreateDevice", "ptr", pAdapter, D3D_FEATURE_LEVEL, MinimumFeatureLevel, Guid.Ptr, riid, "ptr*", &ppDevice := 0, "HRESULT")
    return ppDevice
}

/**
 * Gets a debug interface.
 * @remarks
 * The function signature PFN_D3D12_GET_DEBUG_INTERFACE is provided as a typedef, so that you can use dynamic linking techniques (<a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>) instead of statically linking.
 * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
 * 
 * The globally unique identifier (<b>GUID</b>) for the debug interface.
 *             The <b>REFIID</b>, or <b>GUID</b>, of the debug interface can be obtained by using the __uuidof() macro.
 *             For example, __uuidof(<a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug">ID3D12Debug</a>) will get the <b>GUID</b> of the debug interface.
 * @returns {Pointer<Void>} Type: <b>void**</b>
 * 
 * The debug interface, as a pointer to pointer to void.
 *             See
 *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug">ID3D12Debug</a> and
 *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debugdevice">ID3D12DebugDevice</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12getdebuginterface
 */
export D3D12GetDebugInterface(riid) {
    result := DllCall("d3d12.dll\D3D12GetDebugInterface", Guid.Ptr, riid, "ptr*", &ppvDebug := 0, "HRESULT")
    return ppvDebug
}

/**
 * Enables a list of experimental features.
 * @remarks
 * Call this function before device creation.
 * 
 * Because the set of experimental features will change over time, and because these features may not be stable, they are intended for development and experimentation only. This is enforced by requiring Developer Mode to be active before any experimental features can be enabled.
 * 
 * The set of experimental features that are currently supported can be found in the D3D12.h header, near the definition of the D3D12EnableExperimentalFeatures function; because experimental features are only made available infrequently, its typical to find that no experimental features are currently supported.
 * 
 * Some experimental features might be identified by using an IID as the GUID. For these features, you can use D3D12GetDebugInterface, passing an IID as a parameter, to retrieve the interface for manipulating that feature.
 * 
 * If this function is called again with a different list of features to enable, all current D3D12 devices are set to the DEVICE_REMOVED state.
 * @param {Integer} NumFeatures Type: <b>UINT</b>
 * 
 * The number of experimental features to enable.
 * @param {Pointer<Guid>} pIIDs Type: <b>const IID*</b>
 * 
 * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015&preserve-view=true">SAL</a>: <c>__in_ecount(NumFeatures)</c>
 * 
 * A pointer to an array of IDs that specify which of the available experimental features to enable.
 * @param {Pointer<Void>} pConfigurationStructs Type: <b>void*</b>
 * 
 * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015&preserve-view=true">SAL</a>: <c>__in_ecount(NumFeatures)</c>
 * 
 * Structures that contain additional configuration details that some experimental features might need to be enabled.
 * @param {Pointer<Integer>} pConfigurationStructSizes Type: <b>UINT*</b>
 * 
 * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015&preserve-view=true">SAL</a>: <c>__in_ecount(NumFeatures)</c>
 * 
 * The sizes of any configuration structs passed in pConfigurationStructs parameter.
 * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
 * 
 * This method returns an HRESULT success or error code that can include E_NOINTERFACE if an unrecognized feature is specified or Developer Mode is not enabled, or E_INVALIDARG if the configuration of a feature is in correct, the experimental features specified are not compatible, or other errors.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12enableexperimentalfeatures
 */
export D3D12EnableExperimentalFeatures(NumFeatures, pIIDs, pConfigurationStructs, pConfigurationStructSizes) {
    pConfigurationStructsMarshal := pConfigurationStructs is VarRef ? "ptr" : "ptr"
    pConfigurationStructSizesMarshal := pConfigurationStructSizes is VarRef ? "uint*" : "ptr"

    result := DllCall("d3d12.dll\D3D12EnableExperimentalFeatures", "uint", NumFeatures, Guid.Ptr, pIIDs, pConfigurationStructsMarshal, pConfigurationStructs, pConfigurationStructSizesMarshal, pConfigurationStructSizes, "HRESULT")
    return result
}

/**
 * Selects an SDK version at runtime when the system is in Windows Developer Mode.
 * @param {Pointer<Guid>} rclsid Type: \_In\_ **[REFCLSID](/openspecs/windows_protocols/ms-oaut/bbde795f-5398-42d8-9f59-3613da03c318)**
 * 
 * The CLSID associated with the data and code that will be used to create the object.
 * 
 * The following CLSIDs are defined.
 * 
 * * DEFINE_GUID(CLSID_D3D12Debug,                        0xf2352aeb, 0xdd84, 0x49fe, 0xb9, 0x7b, 0xa9, 0xdc, 0xfd, 0xcc, 0x1b, 0x4f);
 * * DEFINE_GUID(CLSID_D3D12Tools,                        0xe38216b1, 0x3c8c, 0x4833, 0xaa, 0x09, 0x0a, 0x06, 0xb6, 0x5d, 0x96, 0xc8);
 * * DEFINE_GUID(CLSID_D3D12DeviceRemovedExtendedData,    0x4a75bbc4, 0x9ff4, 0x4ad8, 0x9f, 0x18, 0xab, 0xae, 0x84, 0xdc, 0x5f, 0xf2);
 * * DEFINE_GUID(CLSID_D3D12SDKConfiguration,             0x7cda6aca, 0xa03e, 0x49c8, 0x94, 0x58, 0x03, 0x34, 0xd2, 0x0e, 0x07, 0xce);
 * 
 * They correspond, respectively, to the following interfaces.
 * 
 * * [ID3D12Debug interface](/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug)
 * * [ID3D12Tools interface](/windows/win32/api/d3d12/nn-d3d12-id3d12tools)
 * * [ID3D12DeviceRemovedExtendedDataSettings interface](/windows/win32/api/d3d12/nn-d3d12-id3d12deviceremovedextendeddatasettings)
 * * [ID3D12SDKConfiguration interface](nn-d3d12-id3d12sdkconfiguration.md)
 * @param {Pointer<Guid>} riid Type: \_In\_ **[REFIID](/openspecs/windows_protocols/ms-oaut/bbde795f-5398-42d8-9f59-3613da03c318)**
 * 
 * The globally unique identifier (**GUID**) for the SDK configuration interface. The **REFIID**, or **GUID**, of the interface can be obtained by using the `__uuidof` macro. For example, `__uuidof(ID3D12SDKConfiguration)` will retrieve the **GUID** of the debug interface.
 * @returns {Pointer<Void>} Type: \_COM\_Outptr\_opt\_ **[void](/windows/win32/winprog/windows-data-types)\*\***
 * 
 * The `out` parameter that contains the requested interface on return (for example, the SDK configuration interface), as a pointer to pointer to void. See [ID3D12SDKConfiguration](nn-d3d12-id3d12sdkconfiguration.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12getinterface
 */
export D3D12GetInterface(rclsid, riid) {
    result := DllCall("d3d12.dll\D3D12GetInterface", Guid.Ptr, rclsid, Guid.Ptr, riid, "ptr*", &ppvDebug := 0, "HRESULT")
    return ppvDebug
}

;@endregion Functions
