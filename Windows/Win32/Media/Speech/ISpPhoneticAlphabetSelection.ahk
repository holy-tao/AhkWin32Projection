#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpPhoneticAlphabetSelection extends IUnknown{
    /**
     * The interface identifier for ISpPhoneticAlphabetSelection
     * @type {Guid}
     */
    static IID => Guid("{b2745efd-42ce-48ca-81f1-a96e02538a90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} pfIsUPS 
     * @returns {HRESULT} 
     */
    IsAlphabetUPS(pfIsUPS) {
        result := ComCall(3, this, "ptr", pfIsUPS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fForceUPS 
     * @returns {HRESULT} 
     */
    SetAlphabetToUPS(fForceUPS) {
        result := ComCall(4, this, "int", fForceUPS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
