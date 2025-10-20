#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ICastingEventHandler extends IUnknown{
    /**
     * The interface identifier for ICastingEventHandler
     * @type {Guid}
     */
    static IID => Guid("{c79a6cb7-bebd-47a6-a2ad-4d45ad79c7bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} newState 
     * @returns {HRESULT} 
     */
    OnStateChanged(newState) {
        result := ComCall(3, this, "int", newState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} errorStatus 
     * @param {PWSTR} errorMessage 
     * @returns {HRESULT} 
     */
    OnError(errorStatus, errorMessage) {
        errorMessage := errorMessage is String ? StrPtr(errorMessage) : errorMessage

        result := ComCall(4, this, "int", errorStatus, "ptr", errorMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
