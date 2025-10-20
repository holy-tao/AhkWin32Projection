#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class IMLOperatorKernelFactory extends IUnknown{
    /**
     * The interface identifier for IMLOperatorKernelFactory
     * @type {Guid}
     */
    static IID => Guid("{ef15ad6f-0dc9-4908-ab35-a575a30dfbf8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMLOperatorKernelCreationContext>} context 
     * @param {Pointer<IMLOperatorKernel>} kernel 
     * @returns {HRESULT} 
     */
    CreateKernel(context, kernel) {
        result := ComCall(3, this, "ptr", context, "ptr", kernel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
