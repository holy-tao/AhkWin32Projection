#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class IMLOperatorKernel extends IUnknown{
    /**
     * The interface identifier for IMLOperatorKernel
     * @type {Guid}
     */
    static IID => Guid("{11c4b4a0-b467-4eaa-a1a6-b961d8d0ed79}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMLOperatorKernelContext>} context 
     * @returns {HRESULT} 
     */
    Compute(context) {
        result := ComCall(3, this, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
