#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IObjectIdentity extends IUnknown{
    /**
     * The interface identifier for IObjectIdentity
     * @type {Guid}
     */
    static IID => Guid("{ca04b7e6-0d21-11d1-8cc5-00c04fc2b085}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @returns {HRESULT} 
     */
    IsEqualObject(punk) {
        result := ComCall(3, this, "ptr", punk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
