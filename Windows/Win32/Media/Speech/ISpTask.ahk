#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpTask extends Win32ComInterface{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * 
     * @param {Pointer<Void>} pvTaskData 
     * @param {Pointer<Int32>} pfContinueProcessing 
     * @returns {HRESULT} 
     */
    Execute(pvTaskData, pfContinueProcessing) {
        result := ComCall(0, this, "ptr", pvTaskData, "int*", pfContinueProcessing, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
