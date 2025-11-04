#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents the context to bind inputs and outputs to a WinML model.
 * @see https://docs.microsoft.com/windows/win32/api//winml/nn-winml-iwinmlevaluationcontext
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class IWinMLEvaluationContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWinMLEvaluationContext
     * @type {Guid}
     */
    static IID => Guid("{95848f9e-583d-4054-af12-916387cd8426}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BindValue", "GetValueByName", "Clear"]

    /**
     * 
     * @param {Pointer<WINML_BINDING_DESC>} pDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlevaluationcontext-bindvalue
     */
    BindValue(pDescriptor) {
        result := ComCall(3, this, "ptr", pDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @param {Pointer<Pointer<WINML_BINDING_DESC>>} pDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlevaluationcontext-getvaluebyname
     */
    GetValueByName(Name, pDescriptor) {
        Name := Name is String ? StrPtr(Name) : Name

        pDescriptorMarshal := pDescriptor is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", Name, pDescriptorMarshal, pDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlevaluationcontext-clear
     */
    Clear() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
