#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.SecurityCenter
 * @version v4.0.30319
 */
class IWSCDefaultProduct extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSCDefaultProduct
     * @type {Guid}
     */
    static IID => Guid("{0476d69c-f21a-11e5-9ce9-5e5517507c66}")

    /**
     * The class identifier for WSCDefaultProduct
     * @type {Guid}
     */
    static CLSID => Guid("{2981a36e-f22d-11e5-9ce9-5e5517507c66}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDefaultProduct"]

    /**
     * 
     * @param {Integer} eType 
     * @param {BSTR} pGuid 
     * @returns {HRESULT} 
     */
    SetDefaultProduct(eType, pGuid) {
        pGuid := pGuid is String ? BSTR.Alloc(pGuid).Value : pGuid

        result := ComCall(7, this, "int", eType, "ptr", pGuid, "HRESULT")
        return result
    }
}
