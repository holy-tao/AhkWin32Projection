#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.ML
 * @version v4.0.30319
 */
class ILearningModelSessionOptionsNative1 extends IUnknown{
    /**
     * The interface identifier for ILearningModelSessionOptionsNative1
     * @type {Guid}
     */
    static IID => Guid("{5da37a26-0526-414b-91e4-2a0fa3ddba40}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} allowSpinning 
     * @returns {HRESULT} 
     */
    SetIntraOpThreadSpinning(allowSpinning) {
        result := ComCall(3, this, "char", allowSpinning, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
