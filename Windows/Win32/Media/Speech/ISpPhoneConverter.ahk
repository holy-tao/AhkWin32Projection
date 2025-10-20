#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpObjectWithToken.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpPhoneConverter extends ISpObjectWithToken{
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
     * 
     * @param {PWSTR} pszPhone 
     * @param {Pointer<UInt16>} pId 
     * @returns {HRESULT} 
     */
    PhoneToId(pszPhone, pId) {
        pszPhone := pszPhone is String ? StrPtr(pszPhone) : pszPhone

        result := ComCall(5, this, "ptr", pszPhone, "ushort*", pId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pId 
     * @param {PWSTR} pszPhone 
     * @returns {HRESULT} 
     */
    IdToPhone(pId, pszPhone) {
        pszPhone := pszPhone is String ? StrPtr(pszPhone) : pszPhone

        result := ComCall(6, this, "ushort*", pId, "ptr", pszPhone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
