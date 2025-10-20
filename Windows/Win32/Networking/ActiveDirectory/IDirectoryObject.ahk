#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDirectoryObject interface is a non-Automation COM interface that provides clients with direct access to directory service objects.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-idirectoryobject
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IDirectoryObject extends IUnknown{
    /**
     * The interface identifier for IDirectoryObject
     * @type {Guid}
     */
    static IID => Guid("{e798de2c-22e4-11d0-84fe-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ADS_OBJECT_INFO>} ppObjInfo 
     * @returns {HRESULT} 
     */
    GetObjectInformation(ppObjInfo) {
        result := ComCall(3, this, "ptr", ppObjInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pAttributeNames 
     * @param {Integer} dwNumberAttributes 
     * @param {Pointer<ADS_ATTR_INFO>} ppAttributeEntries 
     * @param {Pointer<UInt32>} pdwNumAttributesReturned 
     * @returns {HRESULT} 
     */
    GetObjectAttributes(pAttributeNames, dwNumberAttributes, ppAttributeEntries, pdwNumAttributesReturned) {
        result := ComCall(4, this, "ptr", pAttributeNames, "uint", dwNumberAttributes, "ptr", ppAttributeEntries, "uint*", pdwNumAttributesReturned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ADS_ATTR_INFO>} pAttributeEntries 
     * @param {Integer} dwNumAttributes 
     * @param {Pointer<UInt32>} pdwNumAttributesModified 
     * @returns {HRESULT} 
     */
    SetObjectAttributes(pAttributeEntries, dwNumAttributes, pdwNumAttributesModified) {
        result := ComCall(5, this, "ptr", pAttributeEntries, "uint", dwNumAttributes, "uint*", pdwNumAttributesModified, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszRDNName 
     * @param {Pointer<ADS_ATTR_INFO>} pAttributeEntries 
     * @param {Integer} dwNumAttributes 
     * @param {Pointer<IDispatch>} ppObject 
     * @returns {HRESULT} 
     */
    CreateDSObject(pszRDNName, pAttributeEntries, dwNumAttributes, ppObject) {
        pszRDNName := pszRDNName is String ? StrPtr(pszRDNName) : pszRDNName

        result := ComCall(6, this, "ptr", pszRDNName, "ptr", pAttributeEntries, "uint", dwNumAttributes, "ptr", ppObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszRDNName 
     * @returns {HRESULT} 
     */
    DeleteDSObject(pszRDNName) {
        pszRDNName := pszRDNName is String ? StrPtr(pszRDNName) : pszRDNName

        result := ComCall(7, this, "ptr", pszRDNName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
