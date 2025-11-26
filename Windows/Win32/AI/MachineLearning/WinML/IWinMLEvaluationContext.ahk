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
     * Binds the input/output to the given model.
     * @param {Pointer<WINML_BINDING_DESC>} pDescriptor A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winml/ns-winml-winml_binding_desc">WINML_BINDING_DESC</a> containing the input/output binding descriptor.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//winml/nf-winml-iwinmlevaluationcontext-bindvalue
     */
    BindValue(pDescriptor) {
        result := ComCall(3, this, "ptr", pDescriptor, "HRESULT")
        return result
    }

    /**
     * Returns the input/output description for the specific binding name.
     * @param {PWSTR} Name The name of the binding.
     * @returns {Pointer<WINML_BINDING_DESC>} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winml/ns-winml-winml_binding_desc">WINML_BINDING_DESC</a> containing the specified (Name) binding description.
     * @see https://docs.microsoft.com/windows/win32/api//winml/nf-winml-iwinmlevaluationcontext-getvaluebyname
     */
    GetValueByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(4, this, "ptr", Name, "ptr*", &pDescriptor := 0, "HRESULT")
        return pDescriptor
    }

    /**
     * Clears the bindings for a model.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//winml/nf-winml-iwinmlevaluationcontext-clear
     */
    Clear() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
