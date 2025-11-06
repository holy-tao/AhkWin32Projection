#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDMLObject.ahk

/**
 * Represents a DirectML device, which is used to create operators, binding tables, command recorders, and other objects.
 * @see https://docs.microsoft.com/windows/win32/api//directml/nn-directml-idmldevice
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class IDMLDevice extends IDMLObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDMLDevice
     * @type {Guid}
     */
    static IID => Guid("{6dbd6437-96fd-423f-a98c-ae5e7c2a573f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CheckFeatureSupport", "CreateOperator", "CompileOperator", "CreateOperatorInitializer", "CreateCommandRecorder", "CreateBindingTable", "Evict", "MakeResident", "GetDeviceRemovedReason", "GetParentDevice"]

    /**
     * 
     * @param {Integer} feature 
     * @param {Integer} featureQueryDataSize 
     * @param {Pointer} featureQueryData 
     * @param {Integer} featureSupportDataSize 
     * @param {Pointer} featureSupportData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-checkfeaturesupport
     */
    CheckFeatureSupport(feature, featureQueryDataSize, featureQueryData, featureSupportDataSize, featureSupportData) {
        result := ComCall(7, this, "int", feature, "uint", featureQueryDataSize, "ptr", featureQueryData, "uint", featureSupportDataSize, "ptr", featureSupportData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DML_OPERATOR_DESC>} desc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-createoperator
     */
    CreateOperator(desc, riid) {
        result := ComCall(8, this, "ptr", desc, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {IDMLOperator} op 
     * @param {Integer} flags 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-compileoperator
     */
    CompileOperator(op, flags, riid) {
        result := ComCall(9, this, "ptr", op, "int", flags, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Integer} operatorCount 
     * @param {Pointer<IDMLCompiledOperator>} operators 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-createoperatorinitializer
     */
    CreateOperatorInitializer(operatorCount, operators, riid) {
        result := ComCall(10, this, "uint", operatorCount, "ptr*", operators, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-createcommandrecorder
     */
    CreateCommandRecorder(riid) {
        result := ComCall(11, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<DML_BINDING_TABLE_DESC>} desc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-createbindingtable
     */
    CreateBindingTable(desc, riid) {
        result := ComCall(12, this, "ptr", desc, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Integer} count 
     * @param {Pointer<IDMLPageable>} ppObjects 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-evict
     */
    Evict(count, ppObjects) {
        result := ComCall(13, this, "uint", count, "ptr*", ppObjects, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} count 
     * @param {Pointer<IDMLPageable>} ppObjects 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-makeresident
     */
    MakeResident(count, ppObjects) {
        result := ComCall(14, this, "uint", count, "ptr*", ppObjects, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-getdeviceremovedreason
     */
    GetDeviceRemovedReason() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevice-getparentdevice
     */
    GetParentDevice(riid) {
        result := ComCall(16, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
