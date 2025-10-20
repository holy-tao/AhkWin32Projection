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
     * 
     * @param {Pointer<WINML_BINDING_DESC>} pDescriptor 
     * @returns {HRESULT} 
     */
    BindValue(pDescriptor) {
        result := ComCall(3, this, "ptr", pDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @param {Pointer<WINML_BINDING_DESC>} pDescriptor 
     * @returns {HRESULT} 
     */
    GetValueByName(Name, pDescriptor) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(4, this, "ptr", Name, "ptr", pDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
