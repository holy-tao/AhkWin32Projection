#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpObjectWithToken.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpPhoneConverter extends ISpObjectWithToken{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpPhoneConverter
     * @type {Guid}
     */
    static IID => Guid("{8445c581-0cac-4a38-abfe-9b2ce2826455}")

    /**
     * The class identifier for SpPhoneConverter
     * @type {Guid}
     */
    static CLSID => Guid("{9185f743-1143-4c28-86b5-bff14f20e5c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PhoneToId", "IdToPhone"]

    /**
     * 
     * @param {PWSTR} pszPhone 
     * @param {Pointer<Integer>} pId 
     * @returns {HRESULT} 
     */
    PhoneToId(pszPhone, pId) {
        pszPhone := pszPhone is String ? StrPtr(pszPhone) : pszPhone

        pIdMarshal := pId is VarRef ? "ushort*" : "ptr"

        result := ComCall(5, this, "ptr", pszPhone, pIdMarshal, pId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pId 
     * @param {PWSTR} pszPhone 
     * @returns {HRESULT} 
     */
    IdToPhone(pId, pszPhone) {
        pszPhone := pszPhone is String ? StrPtr(pszPhone) : pszPhone

        pIdMarshal := pId is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, pIdMarshal, pId, "ptr", pszPhone, "HRESULT")
        return result
    }
}
