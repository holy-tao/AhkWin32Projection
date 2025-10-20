#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IApartmentCallback extends IUnknown{
    /**
     * The interface identifier for IApartmentCallback
     * @type {Guid}
     */
    static IID => Guid("{178e5337-1528-4591-b1c9-1c6e484686d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer} pFunc 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     */
    DoCallback(pFunc, pData) {
        result := ComCall(3, this, "ptr", pFunc, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
