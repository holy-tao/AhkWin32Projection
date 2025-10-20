#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IProtectFocus extends IUnknown{
    /**
     * The interface identifier for IProtectFocus
     * @type {Guid}
     */
    static IID => Guid("{d81f90a3-8156-44f7-ad28-5abb87003274}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} pfAllow 
     * @returns {HRESULT} 
     */
    AllowFocusChange(pfAllow) {
        result := ComCall(3, this, "ptr", pfAllow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
