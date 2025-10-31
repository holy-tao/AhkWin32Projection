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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateRuntime"]

    /**
     * 
     * @param {Integer} RuntimeType 
     * @param {Pointer<IWinMLRuntime>} ppRuntime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winml/nf-winml-iwinmlruntimefactory-createruntime
     */
    CreateRuntime(RuntimeType, ppRuntime) {
        result := ComCall(3, this, "int", RuntimeType, "ptr*", ppRuntime, "HRESULT")
        return result
    }
}
