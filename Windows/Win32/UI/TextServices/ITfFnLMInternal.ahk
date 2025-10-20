#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfFnLMProcessor.ahk

/**
 * The ITfFnLMInternal interface is not used.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnlminternal
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnLMInternal extends ITfFnLMProcessor{
    /**
     * The interface identifier for ITfFnLMInternal
     * @type {Guid}
     */
    static IID => Guid("{04b825b1-ac9a-4f7b-b5ad-c7168f1ee445}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {Pointer<ITfRange>} pRange 
     * @returns {HRESULT} 
     */
    ProcessLattice(pRange) {
        result := ComCall(11, this, "ptr", pRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
