#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11DeviceContext1.ahk
#Include .\ID3D11BlendState1.ahk
#Include .\ID3D11RasterizerState1.ahk
#Include .\ID3D11Device.ahk

/**
 * The device interface represents a virtual adapter; it is used to create resources. ID3D11Device1 adds new methods to those in ID3D11Device.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nn-d3d11_1-id3d11device1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Device1 extends ID3D11Device{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Device1
     * @type {Guid}
     */
    static IID => Guid("{a04bfb29-08ef-43d6-a49c-a9bdbdcbe686}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 43

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetImmediateContext1", "CreateDeferredContext1", "CreateBlendState1", "CreateRasterizerState1", "CreateDeviceContextState", "OpenSharedResource1", "OpenSharedResourceByName"]

    /**
     * Gets an immediate context, which can play back command lists.
     * @remarks
     * 
     * <b>GetImmediateContext1</b> returns an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11devicecontext1">ID3D11DeviceContext1</a> object that represents an immediate context. You can use this immediate context to perform rendering that you want immediately submitted to a device. For most applications, an immediate context is the primary object that is used to draw your scene.
     * 
     * <b>GetImmediateContext1</b> increments the reference count of the immediate context by one. So, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the returned interface pointer when you are done with it to avoid a memory leak.
     * 
     * 
     * @param {Pointer<ID3D11DeviceContext1>} ppImmediateContext Upon completion of the method, the passed pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11devicecontext1">ID3D11DeviceContext1</a> interface pointer is initialized.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11device1-getimmediatecontext1
     */
    GetImmediateContext1(ppImmediateContext) {
        ComCall(43, this, "ptr*", ppImmediateContext)
    }

    /**
     * Creates a deferred context, which can record command lists.
     * @param {Integer} ContextFlags Reserved for future use.
     *             Pass 0.
     * @returns {ID3D11DeviceContext1} Upon completion of the method, the passed pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11devicecontext1">ID3D11DeviceContext1</a> interface pointer is initialized.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11device1-createdeferredcontext1
     */
    CreateDeferredContext1(ContextFlags) {
        result := ComCall(44, this, "uint", ContextFlags, "ptr*", &ppDeferredContext := 0, "HRESULT")
        return ID3D11DeviceContext1(ppDeferredContext)
    }

    /**
     * Creates a blend-state object that encapsulates blend state for the output-merger stage and allows the configuration of logic operations.
     * @param {Pointer<D3D11_BLEND_DESC1>} pBlendStateDesc A pointer to a  <a href="https://docs.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_blend_desc1">D3D11_BLEND_DESC1</a> structure that describes blend state.
     * @returns {ID3D11BlendState1} Address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11blendstate1">ID3D11BlendState1</a> interface for the blend-state object created.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11device1-createblendstate1
     */
    CreateBlendState1(pBlendStateDesc) {
        result := ComCall(45, this, "ptr", pBlendStateDesc, "ptr*", &ppBlendState := 0, "HRESULT")
        return ID3D11BlendState1(ppBlendState)
    }

    /**
     * Creates a rasterizer state object that informs the rasterizer stage how to behave and forces the sample count while UAV rendering or rasterizing.
     * @param {Pointer<D3D11_RASTERIZER_DESC1>} pRasterizerDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-cd3d11_rasterizer_desc1">D3D11_RASTERIZER_DESC1</a> structure that describes the  rasterizer state.
     * @returns {ID3D11RasterizerState1} Address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11rasterizerstate1">ID3D11RasterizerState1</a> interface for the rasterizer state object created.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11device1-createrasterizerstate1
     */
    CreateRasterizerState1(pRasterizerDesc) {
        result := ComCall(46, this, "ptr", pRasterizerDesc, "ptr*", &ppRasterizerState := 0, "HRESULT")
        return ID3D11RasterizerState1(ppRasterizerState)
    }

    /**
     * Creates a context state object that holds all Microsoft Direct3D state and some Direct3D behavior.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of 
     *               <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ne-d3d11_1-d3d11_1_create_device_context_state_flag">D3D11_1_CREATE_DEVICE_CONTEXT_STATE_FLAG</a> 
     *               values that are combined by using a bitwise <b>OR</b> operation. 
     *               The resulting value specifies how to create the context state object. 
     *               The 
     *               <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ne-d3d11_1-d3d11_1_create_device_context_state_flag">D3D11_1_CREATE_DEVICE_CONTEXT_STATE_SINGLETHREADED</a>flag is currently the only defined flag. 
     *               If the original device was created with 
     *               <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_create_device_flag">D3D11_CREATE_DEVICE_SINGLETHREADED</a>, 
     *               you must create all context state objects from that device with the 
     *               <b>D3D11_1_CREATE_DEVICE_CONTEXT_STATE_SINGLETHREADED</b>flag.
     *             
     * 
     * 
     * 
     * If you set the single-threaded flag for both the context state object and the device, you guarantee that you will call the whole set of context methods and device methods only from one thread. 
     *             You therefore do not need to use critical sections to synchronize access to the device context, and the runtime can avoid working with those processor-intensive critical sections.
     * @param {Pointer<Integer>} pFeatureLevels Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a> values. The array can contain elements from the following list and determines the order of feature levels for which creation is attempted.
     *               Unlike <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a>, you can't set <i>pFeatureLevels</i> to <b>NULL</b> because  there is no default feature level array.
     *             
     * 
     * 
     * ```
     * {
     *     D3D_FEATURE_LEVEL_11_1,
     *     D3D_FEATURE_LEVEL_11_0,
     *     D3D_FEATURE_LEVEL_10_1,
     *     D3D_FEATURE_LEVEL_10_0,
     *     D3D_FEATURE_LEVEL_9_3,
     *     D3D_FEATURE_LEVEL_9_2,
     *     D3D_FEATURE_LEVEL_9_1,
     * };
     *           
     * ```
     * @param {Integer} FeatureLevels Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of elements in <i>pFeatureLevels</i>. Unlike <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a>, you must set <i>FeatureLevels</i> to greater than 0 because you can't set <i>pFeatureLevels</i> to <b>NULL</b>.
     * @param {Integer} SDKVersion Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The SDK version. You must set this parameter to <b>D3D11_SDK_VERSION</b>.
     * @param {Pointer<Guid>} EmulatedInterface Type: <b>REFIID</b>
     * 
     * The globally unique identifier (GUID) for the emulated interface. This value specifies the behavior of the device when the context state object is active. Valid values are  obtained by using the <b>__uuidof</b> operator on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nn-d3d10_1-id3d10device1">ID3D10Device1</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11device1">ID3D11Device1</a> interfaces. See Remarks.
     * @param {Pointer<Integer>} pChosenFeatureLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a> value from the <i>pFeatureLevels</i> array. This is the first array value with which <b>CreateDeviceContextState</b> succeeded in creating the context state object. If the call to <b>CreateDeviceContextState</b> fails, the variable pointed to by <i>pChosenFeatureLevel</i> is set to zero.
     * @param {Pointer<ID3DDeviceContextState>} ppContextState Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3ddevicecontextstate">ID3DDeviceContextState</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3ddevicecontextstate">ID3DDeviceContextState</a> object that represents the state of a Direct3D device.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11device1-createdevicecontextstate
     */
    CreateDeviceContextState(Flags, pFeatureLevels, FeatureLevels, SDKVersion, EmulatedInterface, pChosenFeatureLevel, ppContextState) {
        pFeatureLevelsMarshal := pFeatureLevels is VarRef ? "int*" : "ptr"
        pChosenFeatureLevelMarshal := pChosenFeatureLevel is VarRef ? "int*" : "ptr"

        result := ComCall(47, this, "uint", Flags, pFeatureLevelsMarshal, pFeatureLevels, "uint", FeatureLevels, "uint", SDKVersion, "ptr", EmulatedInterface, pChosenFeatureLevelMarshal, pChosenFeatureLevel, "ptr*", ppContextState, "HRESULT")
        return result
    }

    /**
     * Gives a device access to a shared resource that is referenced by a handle and that was created on a different device.
     * @param {HANDLE} hResource A handle to the resource to open. For more info about this parameter, see Remarks.
     * @param {Pointer<Guid>} returnedInterface The globally unique identifier (GUID) for the resource interface. For more info about this parameter, see Remarks.
     * @returns {Pointer<Void>} A pointer to a variable that receives a pointer to the interface for the shared resource object to access.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11device1-opensharedresource1
     */
    OpenSharedResource1(hResource, returnedInterface) {
        hResource := hResource is Win32Handle ? NumGet(hResource, "ptr") : hResource

        result := ComCall(48, this, "ptr", hResource, "ptr", returnedInterface, "ptr*", &ppResource := 0, "HRESULT")
        return ppResource
    }

    /**
     * Gives a device access to a shared resource that is referenced by name and that was created on a different device.
     * @param {PWSTR} lpName The name of the resource to open. This parameter cannot be <b>NULL</b>.
     * @param {Integer} dwDesiredAccess The requested access rights to the resource.  In addition to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/generic-access-rights">generic access rights</a>, DXGI defines the following values:
     * 
     * <ul>
     * <li><b>DXGI_SHARED_RESOURCE_READ</b> ( 0x80000000L ) - specifies read access to the resource.</li>
     * <li><b>DXGI_SHARED_RESOURCE_WRITE</b>	( 1 ) - specifies write access to the resource.</li>
     * </ul>
     * You can combine values by using a bitwise <b>OR</b> operation.
     * @param {Pointer<Guid>} returnedInterface The globally unique identifier (GUID) for the resource interface. For more info, see Remarks.
     * @returns {Pointer<Void>} A pointer to a variable that receives a pointer to the interface for the shared resource object to access.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11device1-opensharedresourcebyname
     */
    OpenSharedResourceByName(lpName, dwDesiredAccess, returnedInterface) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := ComCall(49, this, "ptr", lpName, "uint", dwDesiredAccess, "ptr", returnedInterface, "ptr*", &ppResource := 0, "HRESULT")
        return ppResource
    }
}
