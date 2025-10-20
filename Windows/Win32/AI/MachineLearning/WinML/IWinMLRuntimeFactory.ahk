#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents the factory that creates the WinML runtime for model loading and evaluation.
 * @see https://docs.microsoft.com/windows/win32/api//winml/nn-winml-iwinmlruntimefactory
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class IWinMLRuntimeFactory extends IUnknown{
    /**
     * The interface identifier for IWinMLRuntimeFactory
     * @type {Guid}
     */
    static IID => Guid("{a807b84d-4ae5-4bc0-a76a-941aa246bd41}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} RuntimeType 
     * @param {Pointer<IWinMLRuntime>} ppRuntime 
     * @returns {HRESULT} 
     */
    CreateRuntime(RuntimeType, ppRuntime) {
        result := ComCall(3, this, "int", RuntimeType, "ptr", ppRuntime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
