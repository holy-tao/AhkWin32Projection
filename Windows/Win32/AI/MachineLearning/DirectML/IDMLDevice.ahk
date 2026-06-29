#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DML_OPERATOR_DESC.ahk" { DML_OPERATOR_DESC }
#Import ".\IDMLOperator.ahk" { IDMLOperator }
#Import ".\DML_FEATURE.ahk" { DML_FEATURE }
#Import ".\IDMLCompiledOperator.ahk" { IDMLCompiledOperator }
#Import ".\IDMLObject.ahk" { IDMLObject }
#Import ".\DML_EXECUTION_FLAGS.ahk" { DML_EXECUTION_FLAGS }
#Import ".\IDMLPageable.ahk" { IDMLPageable }
#Import ".\DML_BINDING_TABLE_DESC.ahk" { DML_BINDING_TABLE_DESC }

/**
 * Represents a DirectML device, which is used to create operators, binding tables, command recorders, and other objects. (IDMLDevice)
 * @see https://learn.microsoft.com/windows/win32/api/directml/nn-directml-idmldevice
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct IDMLDevice extends IDMLObject {
    /**
     * The interface identifier for IDMLDevice
     * @type {Guid}
     */
    static IID := Guid("{6dbd6437-96fd-423f-a98c-ae5e7c2a573f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDMLDevice interfaces
    */
    struct Vtbl extends IDMLObject.Vtbl {
        CheckFeatureSupport       : IntPtr
        CreateOperator            : IntPtr
        CompileOperator           : IntPtr
        CreateOperatorInitializer : IntPtr
        CreateCommandRecorder     : IntPtr
        CreateBindingTable        : IntPtr
        Evict                     : IntPtr
        MakeResident              : IntPtr
        GetDeviceRemovedReason    : IntPtr
        GetParentDevice           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDMLDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets information about the optional features and capabilities that are supported by the DirectML device.
     * @param {DML_FEATURE} feature Type: [**DML_FEATURE**](/windows/win32/api/directml/ne-directml-dml_feature)
     * 
     * A constant from the [DML_FEATURE](/windows/win32/api/directml/ne-directml-dml_feature) enumeration describing the feature(s) that you want to query for support.
     * @param {Integer} featureQueryDataSize Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The size of the structure pointed to by the <i>featureQueryData</i> parameter, if provided, otherwise 0.
     * @param {Integer} featureQueryData Type: <b>const void*</b>
     * 
     * An optional pointer to a query structure that corresponds to the value of the <i>feature</i> parameter. To determine the corresponding query type for each constant, see [DML_FEATURE](/windows/win32/api/directml/ne-directml-dml_feature).
     * @param {Integer} featureSupportDataSize Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The size of the structure pointed to by the <i>featureSupportData</i> parameter.
     * @param {Integer} featureSupportData Type: <b>void*</b>
     * 
     * A pointer to a support data structure that corresponds to the value of the <i>feature</i> parameter. To determine the corresponding support data type for each constant, see [DML_FEATURE](/windows/win32/api/directml/ne-directml-dml_feature).
     * @returns {HRESULT} Type: [**HRESULT**](/windows/desktop/winprog/windows-data-types)
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns **DXGI_ERROR_UNSUPPORTED** if the [DML_FEATURE](/windows/win32/api/directml/ne-directml-dml_feature) is unrecognized or unsupported, and **E_INVALIDARG** if the parameters are incorrect.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-checkfeaturesupport
     */
    CheckFeatureSupport(feature, featureQueryDataSize, featureQueryData, featureSupportDataSize, featureSupportData) {
        result := ComCall(7, this, DML_FEATURE, feature, "uint", featureQueryDataSize, "ptr", featureQueryData, "uint", featureSupportDataSize, "ptr", featureSupportData, "HRESULT")
        return result
    }

    /**
     * Creates a DirectML operator.
     * @param {Pointer<DML_OPERATOR_DESC>} desc Type: **const [DML_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_operator_desc)\***
     * 
     * The description of the operator to be created.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in <i>ppv</i>. This is expected to be the GUID of [IDMLOperator](/windows/win32/api/directml/nn-directml-idmloperator).
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the operator. This is the address of a pointer to an [IDMLOperator](/windows/win32/api/directml/nn-directml-idmloperator), representing  the operator created.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-createoperator
     */
    CreateOperator(desc, riid) {
        result := ComCall(8, this, DML_OPERATOR_DESC.Ptr, desc, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Compiles an operator into an object that can be dispatched to the GPU.
     * @param {IDMLOperator} op Type: <b>[IDMLOperator](/windows/win32/api/directml/nn-directml-idmloperator)*</b>
     * 
     * The operator (created with [IDMLDevice::CreateOperator](/windows/win32/api/directml/nf-directml-idmldevice-createoperator)) to compile.
     * @param {DML_EXECUTION_FLAGS} flags Type: [**DML_EXECUTION_FLAGS**](/windows/win32/api/directml/ne-directml-dml_execution_flags)
     * 
     * Any flags to control the execution of this operator.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in <i>ppv</i>. This is expected to be the GUID of [IDMLCompiledOperator](/windows/win32/api/directml/nn-directml-idmlcompiledoperator).
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the compiled operator. This is the address of a pointer to an [IDMLCompiledOperator](/windows/win32/api/directml/nn-directml-idmlcompiledoperator), representing  the compiled operator created.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-compileoperator
     */
    CompileOperator(op, flags, riid) {
        result := ComCall(9, this, "ptr", op, DML_EXECUTION_FLAGS, flags, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates an object that can be used to initialize compiled operators.
     * @param {Integer} operatorCount Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * This parameter determines the number of elements in the array passed in the  <i>operators</i> parameter.
     * @param {Pointer<IDMLCompiledOperator>} operators Type: <b>[IDMLCompiledOperator](/windows/win32/api/directml/nn-directml-idmlcompiledoperator)*</b>
     * 
     * An optional pointer to a constant array of [IDMLCompiledOperator](/windows/win32/api/directml/nn-directml-idmlcompiledoperator) pointers containing the set of operators that this initializer will target. Upon execution of the initializer, the target
     *           operators become initialized. This array may be null or empty, indicating that the initializer has no target
     *           operators.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in <i>ppv</i>. This is expected to be the GUID of [IDMLOperatorInitializer](/windows/win32/api/directml/nn-directml-idmloperatorinitializer).
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the operator initializer. This is the address of a pointer to an [IDMLOperatorInitializer](/windows/win32/api/directml/nn-directml-idmloperatorinitializer), representing  the operator initializer created.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-createoperatorinitializer
     */
    CreateOperatorInitializer(operatorCount, operators, riid) {
        result := ComCall(10, this, "uint", operatorCount, IDMLCompiledOperator.Ptr, operators, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates a DirectML command recorder.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in <i>ppv</i>. This is expected to be the GUID of [IDMLCommandRecorder](/windows/win32/api/directml/nn-directml-idmlcommandrecorder).
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the command recorder. This is the address of a pointer to an [IDMLCommandRecorder](/windows/win32/api/directml/nn-directml-idmlcommandrecorder), representing  the command recorder created.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-createcommandrecorder
     */
    CreateCommandRecorder(riid) {
        result := ComCall(11, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates a binding table, which is an object that can be used to bind resources (such as tensors) to the pipeline.
     * @param {Pointer<DML_BINDING_TABLE_DESC>} desc Type: <b>const [DML_BINDING_TABLE_DESC](/windows/win32/api/directml/ns-directml-dml_binding_table_desc)*</b>
     * 
     * An optional pointer to a [DML_BINDING_TABLE_DESC](/windows/win32/api/directml/ns-directml-dml_binding_table_desc) containing the binding table parameters. This may be <b>nullptr</b>, indicating an empty binding table.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in <i>ppv</i>. This is expected to be the GUID of [IDMLBindingTable](/windows/win32/api/directml/nn-directml-idmlbindingtable).
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the binding table. This is the address of a pointer to an [IDMLBindingTable](/windows/win32/api/directml/nn-directml-idmlbindingtable), representing  the binding table created.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-createbindingtable
     */
    CreateBindingTable(desc, riid) {
        result := ComCall(12, this, DML_BINDING_TABLE_DESC.Ptr, desc, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Evicts one or more pageable objects from GPU memory. Also see IDMLDevice::MakeResident.
     * @param {Integer} count Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * This parameter determines the number of elements in the array passed in the  <i>ppObjects</i> parameter.
     * @param {Pointer<IDMLPageable>} ppObjects Type: <b>[IDMLPageable](/windows/win32/api/directml/nn-directml-idmlpageable)*</b>
     * 
     * A pointer to a constant array of [IDMLPageable](/windows/win32/api/directml/nn-directml-idmlpageable) pointers containing the pageable objects to evict from GPU memory.
     * @returns {HRESULT} Type: [**HRESULT**](/windows/desktop/winprog/windows-data-types)
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-evict
     */
    Evict(count, ppObjects) {
        result := ComCall(13, this, "uint", count, IDMLPageable.Ptr, ppObjects, "HRESULT")
        return result
    }

    /**
     * Causes one or more pageable objects to become resident in GPU memory. Also see IDMLDevice::Evict.
     * @param {Integer} count Type: <b>UINT</b>
     * 
     * This parameter determines the number of elements in the array passed in the  <i>ppObjects</i> parameter.
     * @param {Pointer<IDMLPageable>} ppObjects Type: <b>[IDMLPageable](/windows/win32/api/directml/nn-directml-idmlpageable)*</b>
     * 
     * A pointer to a constant array of [IDMLPageable](/windows/win32/api/directml/nn-directml-idmlpageable) pointers containing the pageable objects to make resident in GPU memory.
     * @returns {HRESULT} Type: [**HRESULT**](/windows/desktop/winprog/windows-data-types)
     * 
     * If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-makeresident
     */
    MakeResident(count, ppObjects) {
        result := ComCall(14, this, "uint", count, IDMLPageable.Ptr, ppObjects, "HRESULT")
        return result
    }

    /**
     * Retrieves the reason that the DirectML device was removed.
     * @returns {HRESULT} Type: [**HRESULT**](/windows/desktop/winprog/windows-data-types)
     * 
     * An [HRESULT](/windows/desktop/winprog/windows-data-types) containing the reason that the device was removed, or **S_OK** if the device has not been removed.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-getdeviceremovedreason
     */
    GetDeviceRemovedReason() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the Direct3D 12 device that was used to create this DirectML device.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in <i>ppv</i>. This is expected to be the GUID of <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device">ID3D12Device</a>.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the device. This is the address of a pointer to an <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device">ID3D12Device</a>, representing  the device.
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-getparentdevice
     */
    GetParentDevice(riid) {
        result := ComCall(16, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IDMLDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CheckFeatureSupport := CallbackCreate(GetMethod(implObj, "CheckFeatureSupport"), flags, 6)
        this.vtbl.CreateOperator := CallbackCreate(GetMethod(implObj, "CreateOperator"), flags, 4)
        this.vtbl.CompileOperator := CallbackCreate(GetMethod(implObj, "CompileOperator"), flags, 5)
        this.vtbl.CreateOperatorInitializer := CallbackCreate(GetMethod(implObj, "CreateOperatorInitializer"), flags, 5)
        this.vtbl.CreateCommandRecorder := CallbackCreate(GetMethod(implObj, "CreateCommandRecorder"), flags, 3)
        this.vtbl.CreateBindingTable := CallbackCreate(GetMethod(implObj, "CreateBindingTable"), flags, 4)
        this.vtbl.Evict := CallbackCreate(GetMethod(implObj, "Evict"), flags, 3)
        this.vtbl.MakeResident := CallbackCreate(GetMethod(implObj, "MakeResident"), flags, 3)
        this.vtbl.GetDeviceRemovedReason := CallbackCreate(GetMethod(implObj, "GetDeviceRemovedReason"), flags, 1)
        this.vtbl.GetParentDevice := CallbackCreate(GetMethod(implObj, "GetParentDevice"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CheckFeatureSupport)
        CallbackFree(this.vtbl.CreateOperator)
        CallbackFree(this.vtbl.CompileOperator)
        CallbackFree(this.vtbl.CreateOperatorInitializer)
        CallbackFree(this.vtbl.CreateCommandRecorder)
        CallbackFree(this.vtbl.CreateBindingTable)
        CallbackFree(this.vtbl.Evict)
        CallbackFree(this.vtbl.MakeResident)
        CallbackFree(this.vtbl.GetDeviceRemovedReason)
        CallbackFree(this.vtbl.GetParentDevice)
    }
}
