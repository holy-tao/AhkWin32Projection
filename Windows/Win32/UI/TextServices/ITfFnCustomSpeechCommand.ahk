#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfFunction.ahk

/**
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnCustomSpeechCommand extends ITfFunction{
    /**
     * The interface identifier for ITfFnCustomSpeechCommand
     * @type {Guid}
     */
    static IID => Guid("{fca6c349-a12f-43a3-8dd6-5a5a4282577b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Pointer<IUnknown>} pspcmdProvider 
     * @returns {HRESULT} 
     */
    SetSpeechCommandProvider(pspcmdProvider) {
        result := ComCall(4, this, "ptr", pspcmdProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
