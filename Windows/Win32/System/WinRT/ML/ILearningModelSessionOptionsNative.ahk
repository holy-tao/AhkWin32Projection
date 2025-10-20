#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.ML
 * @version v4.0.30319
 */
class ILearningModelSessionOptionsNative extends IUnknown{
    /**
     * The interface identifier for ILearningModelSessionOptionsNative
     * @type {Guid}
     */
    static IID => Guid("{c71e953f-37b4-4564-8658-d8396866db0d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} intraOpNumThreads 
     * @returns {HRESULT} 
     */
    SetIntraOpNumThreadsOverride(intraOpNumThreads) {
        result := ComCall(3, this, "uint", intraOpNumThreads, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
