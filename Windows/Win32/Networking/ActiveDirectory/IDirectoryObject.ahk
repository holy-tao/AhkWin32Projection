#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk
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
     * The IDirectoryObject::GetObjectInformation method retrieves a pointer to an ADS_OBJECT_INFO structure that contains data regarding the identity and location of a directory service object.
     * @returns {Pointer<ADS_OBJECT_INFO>} Provides the address of a pointer to an  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_object_info">ADS_OBJECT_INFO</a> structure that contains data regarding the requested directory service object. If <i>ppObjInfo</i> is <b>NULL</b> on return, <b>GetObjectInformation</b> cannot obtain the requested data.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-idirectoryobject-getobjectinformation
     */
    GetObjectInformation() {
        result := ComCall(3, this, "ptr*", &ppObjInfo := 0, "HRESULT")
        return ppObjInfo
    }

    /**
     * Retrieves one or more specified attributes of the directory service object.
     * @param {Pointer<PWSTR>} pAttributeNames Specifies an array of names of the requested attributes. 
     * 
     * 
     * 
     * 
     * To request all of the object's attributes, set <i>pAttributeNames</i> to <b>NULL</b> and set the <i>dwNumberAttributes</i> parameter to (DWORD)-1.
     * @param {Integer} dwNumberAttributes Specifies the size of the <i>pAttributeNames</i> array. If -1, all of the object's attributes are requested.
     * @param {Pointer<Pointer<ADS_ATTR_INFO>>} ppAttributeEntries Pointer to a variable that receives a pointer to an array of  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_attr_info">ADS_ATTR_INFO</a> structures that contain the requested attribute values. If no attributes could be obtained from the directory service object, the returned pointer is <b>NULL</b>.
     * @param {Pointer<Integer>} pdwNumAttributesReturned Pointer to a <b>DWORD</b> variable that receives the number of attributes retrieved in the <i>ppAttributeEntries</i> array.
     * @returns {HRESULT} This method returns the standard values, as well as the following:
     * 
     * For more information and other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-idirectoryobject-getobjectattributes
     */
    GetObjectAttributes(pAttributeNames, dwNumberAttributes, ppAttributeEntries, pdwNumAttributesReturned) {
        pAttributeNamesMarshal := pAttributeNames is VarRef ? "ptr*" : "ptr"
        ppAttributeEntriesMarshal := ppAttributeEntries is VarRef ? "ptr*" : "ptr"
        pdwNumAttributesReturnedMarshal := pdwNumAttributesReturned is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pAttributeNamesMarshal, pAttributeNames, "uint", dwNumberAttributes, ppAttributeEntriesMarshal, ppAttributeEntries, pdwNumAttributesReturnedMarshal, pdwNumAttributesReturned, "HRESULT")
        return result
    }

    /**
     * The IDirectoryObject::SetObjectAttributes method modifies data in one or more specified object attributes defined in the ADS_ATTR_INFO structure.
     * @param {Pointer<ADS_ATTR_INFO>} pAttributeEntries Provides an array of attributes to be modified. Each attribute contains the name of the attribute, the operation to perform, and the attribute value, if applicable. For more information, see the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_attr_info">ADS_ATTR_INFO</a> structure.
     * @param {Integer} dwNumAttributes Provides the number of attributes to be modified. This value should correspond to the size of the <i>pAttributeEntries</i> array.
     * @returns {Integer} Provides a pointer to a <b>DWORD</b> variable that contains the number of attributes modified by the <b>SetObjectAttributes</b> method.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-idirectoryobject-setobjectattributes
     */
    SetObjectAttributes(pAttributeEntries, dwNumAttributes) {
        result := ComCall(5, this, "ptr", pAttributeEntries, "uint", dwNumAttributes, "uint*", &pdwNumAttributesModified := 0, "HRESULT")
        return pdwNumAttributesModified
    }

    /**
     * Creates a child of the current directory service object.
     * @param {PWSTR} pszRDNName Provides the relative distinguished name (relative path) of the object to be created.
     * @param {Pointer<ADS_ATTR_INFO>} pAttributeEntries An array of  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_attr_info">ADS_ATTR_INFO</a> structures that contain attribute definitions to be set when the object is created.
     * @param {Integer} dwNumAttributes Provides a number of attributes set when the object is created.
     * @returns {IDispatch} Provides a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface on the created object.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-idirectoryobject-createdsobject
     */
    CreateDSObject(pszRDNName, pAttributeEntries, dwNumAttributes) {
        pszRDNName := pszRDNName is String ? StrPtr(pszRDNName) : pszRDNName

        result := ComCall(6, this, "ptr", pszRDNName, "ptr", pAttributeEntries, "uint", dwNumAttributes, "ptr*", &ppObject := 0, "HRESULT")
        return IDispatch(ppObject)
    }

    /**
     * Deletes a leaf object in a directory tree.
     * @param {PWSTR} pszRDNName The relative distinguished name (relative path) of the object to be deleted.
     * @returns {HRESULT} This method returns the standard return values, including S_OK for a successful operation. For more information and other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-idirectoryobject-deletedsobject
     */
    DeleteDSObject(pszRDNName) {
        pszRDNName := pszRDNName is String ? StrPtr(pszRDNName) : pszRDNName

        result := ComCall(7, this, "ptr", pszRDNName, "HRESULT")
        return result
    }
}
