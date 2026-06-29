#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Direct3D\D3D_FEATURE_LEVEL.ahk" { D3D_FEATURE_LEVEL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_DEVICE_FACTORY_FLAGS.ahk" { D3D12_DEVICE_FACTORY_FLAGS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DeviceFactory extends IUnknown {
    /**
     * The interface identifier for ID3D12DeviceFactory
     * @type {Guid}
     */
    static IID := Guid("{61f307d3-d34e-4e7c-8374-3ba4de23cccb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DeviceFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitializeFromGlobalState  : IntPtr
        ApplyToGlobalState         : IntPtr
        SetFlags                   : IntPtr
        GetFlags                   : IntPtr
        GetConfigurationInterface  : IntPtr
        EnableExperimentalFeatures : IntPtr
        CreateDevice               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DeviceFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InitializeFromGlobalState() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ApplyToGlobalState() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Specifies how the recognizer interprets the ink and determines the result string.Call this function before processing the ink for the first time. Therefore, call the SetFlags function before calling the Process function.
     * @remarks
     * Prior to Microsoft Windows XP Tablet PC Edition Development Kit 1.7, Tablet PC Input Panel performed smart spacing. Starting with Tablet PC SDK 1.7, Input Panel continues to produce results with preliminary spacing recommendations. Tablet PC Input Panel's spacing results may however be changed by the recognizer's recommendations (results). The recognizer is able to do this by using text contextual information (based on the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-settextcontext">SetTextContext</a> call made by Input Panel) and its internal language model rules.
     * 
     * Input Panel is able to determine whether the recognizer is capable of doing auto-spacing by calling this function with the RECOFLAG_AUTOSPACE flag set. If the recognizer does not support auto-spacing, E_INVALIDARG is returned.
     * 
     * <div class="alert"><b>Note</b>  Only line mode is supported in the <b>SetFlags</b> function. Boxed mode, free mode, and single-line mode are not supported.</div>
     * <div> </div>
     * @param {D3D12_DEVICE_FACTORY_FLAGS} flags 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>HRESULT value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is invalid or one of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-setflags
     */
    SetFlags(flags) {
        result := ComCall(5, this, D3D12_DEVICE_FACTORY_FLAGS, flags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {D3D12_DEVICE_FACTORY_FLAGS} 
     */
    GetFlags() {
        result := ComCall(6, this, D3D12_DEVICE_FACTORY_FLAGS)
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {Pointer<Guid>} iid 
     * @returns {Pointer<Void>} 
     */
    GetConfigurationInterface(clsid, iid) {
        result := ComCall(7, this, Guid.Ptr, clsid, Guid.Ptr, iid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Integer} NumFeatures 
     * @param {Pointer<Guid>} pIIDs 
     * @param {Pointer<Void>} pConfigurationStructs 
     * @param {Pointer<Integer>} pConfigurationStructSizes 
     * @returns {HRESULT} 
     */
    EnableExperimentalFeatures(NumFeatures, pIIDs, pConfigurationStructs, pConfigurationStructSizes) {
        pConfigurationStructsMarshal := pConfigurationStructs is VarRef ? "ptr" : "ptr"
        pConfigurationStructSizesMarshal := pConfigurationStructSizes is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", NumFeatures, Guid.Ptr, pIIDs, pConfigurationStructsMarshal, pConfigurationStructs, pConfigurationStructSizesMarshal, pConfigurationStructSizes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} _adapter 
     * @param {D3D_FEATURE_LEVEL} FeatureLevel 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateDevice(_adapter, FeatureLevel, riid) {
        result := ComCall(9, this, "ptr", _adapter, D3D_FEATURE_LEVEL, FeatureLevel, Guid.Ptr, riid, "ptr*", &ppvDevice := 0, "HRESULT")
        return ppvDevice
    }

    Query(iid) {
        if (ID3D12DeviceFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeFromGlobalState := CallbackCreate(GetMethod(implObj, "InitializeFromGlobalState"), flags, 1)
        this.vtbl.ApplyToGlobalState := CallbackCreate(GetMethod(implObj, "ApplyToGlobalState"), flags, 1)
        this.vtbl.SetFlags := CallbackCreate(GetMethod(implObj, "SetFlags"), flags, 2)
        this.vtbl.GetFlags := CallbackCreate(GetMethod(implObj, "GetFlags"), flags, 1)
        this.vtbl.GetConfigurationInterface := CallbackCreate(GetMethod(implObj, "GetConfigurationInterface"), flags, 4)
        this.vtbl.EnableExperimentalFeatures := CallbackCreate(GetMethod(implObj, "EnableExperimentalFeatures"), flags, 5)
        this.vtbl.CreateDevice := CallbackCreate(GetMethod(implObj, "CreateDevice"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeFromGlobalState)
        CallbackFree(this.vtbl.ApplyToGlobalState)
        CallbackFree(this.vtbl.SetFlags)
        CallbackFree(this.vtbl.GetFlags)
        CallbackFree(this.vtbl.GetConfigurationInterface)
        CallbackFree(this.vtbl.EnableExperimentalFeatures)
        CallbackFree(this.vtbl.CreateDevice)
    }
}
