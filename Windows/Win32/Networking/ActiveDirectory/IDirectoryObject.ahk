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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObjectInformation", "GetObjectAttributes", "SetObjectAttributes", "CreateDSObject", "DeleteDSObject"]

    /**
     * 
     * @param {Pointer<Pointer<ADS_OBJECT_INFO>>} ppObjInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-idirectoryobject-getobjectinformation
     */
    GetObjectInformation(ppObjInfo) {
        result := ComCall(3, this, "ptr*", ppObjInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pAttributeNames 
     * @param {Integer} dwNumberAttributes 
     * @param {Pointer<Pointer<ADS_ATTR_INFO>>} ppAttributeEntries 
     * @param {Pointer<Integer>} pdwNumAttributesReturned 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-idirectoryobject-getobjectattributes
     */
    GetObjectAttributes(pAttributeNames, dwNumberAttributes, ppAttributeEntries, pdwNumAttributesReturned) {
        result := ComCall(4, this, "ptr", pAttributeNames, "uint", dwNumberAttributes, "ptr*", ppAttributeEntries, "uint*", pdwNumAttributesReturned, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ADS_ATTR_INFO>} pAttributeEntries 
     * @param {Integer} dwNumAttributes 
     * @param {Pointer<Integer>} pdwNumAttributesModified 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-idirectoryobject-setobjectattributes
     */
    SetObjectAttributes(pAttributeEntries, dwNumAttributes, pdwNumAttributesModified) {
        result := ComCall(5, this, "ptr", pAttributeEntries, "uint", dwNumAttributes, "uint*", pdwNumAttributesModified, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszRDNName 
     * @param {Pointer<ADS_ATTR_INFO>} pAttributeEntries 
     * @param {Integer} dwNumAttributes 
     * @param {Pointer<IDispatch>} ppObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-idirectoryobject-createdsobject
     */
    CreateDSObject(pszRDNName, pAttributeEntries, dwNumAttributes, ppObject) {
        pszRDNName := pszRDNName is String ? StrPtr(pszRDNName) : pszRDNName

        result := ComCall(6, this, "ptr", pszRDNName, "ptr", pAttributeEntries, "uint", dwNumAttributes, "ptr*", ppObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszRDNName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-idirectoryobject-deletedsobject
     */
    DeleteDSObject(pszRDNName) {
        pszRDNName := pszRDNName is String ? StrPtr(pszRDNName) : pszRDNName

        result := ComCall(7, this, "ptr", pszRDNName, "HRESULT")
        return result
    }
}
