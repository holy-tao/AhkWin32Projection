#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IEnumDialableAddrs.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITDirectoryObject interface is the common interface supported by all objects that can be added and deleted by using the ITDirectory interface.
 * @see https://docs.microsoft.com/windows/win32/api//rend/nn-rend-itdirectoryobject
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITDirectoryObject extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITDirectoryObject
     * @type {Guid}
     */
    static IID => Guid("{34621d6e-6cff-11d1-aff7-00c04fc31fee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ObjectType", "get_Name", "put_Name", "get_DialableAddrs", "EnumerateDialableAddrs", "get_SecurityDescriptor", "put_SecurityDescriptor"]

    /**
     * @type {Integer} 
     */
    ObjectType {
        get => this.get_ObjectType()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {IDispatch} 
     */
    SecurityDescriptor {
        get => this.get_SecurityDescriptor()
        set => this.put_SecurityDescriptor(value)
    }

    /**
     * The get_ObjectType method gets a DIRECTORY_OBJECT_TYPE descriptor of the object.
     * @returns {Integer} Pointer to descriptor of directory object type.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobject-get_objecttype
     */
    get_ObjectType() {
        result := ComCall(7, this, "int*", &pObjectType := 0, "HRESULT")
        return pObjectType
    }

    /**
     * The get_Name method gets the name of the directory object.
     * @returns {BSTR} Pointer to <b>BSTR</b> representation of directory name.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobject-get_name
     */
    get_Name() {
        ppName := BSTR()
        result := ComCall(8, this, "ptr", ppName, "HRESULT")
        return ppName
    }

    /**
     * The put_Name method sets the name of the directory object.
     * @param {BSTR} pName Pointer to <b>BSTR</b> representation of directory name.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pName</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not yet implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobject-put_name
     */
    put_Name(pName) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(9, this, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * The get_DialableAddrs method gets all dialable addresses of a given type from the directory. This method performs the same function as EnumerateDialableAddrs but is used by scripting languages such as Visual Basic.
     * @param {Integer} dwAddressType Indicator of address type.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of <b>BSTR</b> strings, each containing a dialable address.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobject-get_dialableaddrs
     */
    get_DialableAddrs(dwAddressType) {
        pVariant := VARIANT()
        result := ComCall(10, this, "int", dwAddressType, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * The EnumerateDialableAddrs method creates an enumerator of all dialable addresses of a given type from the directory.
     * @param {Integer} dwAddressType Indicator of the address type.
     * @returns {IEnumDialableAddrs} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rend/nn-rend-ienumdialableaddrs">IEnumDialableAddrs</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobject-enumeratedialableaddrs
     */
    EnumerateDialableAddrs(dwAddressType) {
        result := ComCall(11, this, "uint", dwAddressType, "ptr*", &ppEnumDialableAddrs := 0, "HRESULT")
        return IEnumDialableAddrs(ppEnumDialableAddrs)
    }

    /**
     * The get_SecurityDescriptor method gets an IDispatch pointer on a directory service security descriptor object describing current security permissions.
     * @returns {IDispatch} <b>IDispatch</b> pointer on a directory service security descriptor object.
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobject-get_securitydescriptor
     */
    get_SecurityDescriptor() {
        result := ComCall(12, this, "ptr*", &ppSecDes := 0, "HRESULT")
        return IDispatch(ppSecDes)
    }

    /**
     * The put_SecurityDescriptor method sets an IDispatch pointer on a directory service security descriptor object describing current security permissions.
     * @param {IDispatch} pSecDes <b>IDispatch</b> pointer on a directory service security descriptor object.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pSecDes</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unspecified error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not yet implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rend/nf-rend-itdirectoryobject-put_securitydescriptor
     */
    put_SecurityDescriptor(pSecDes) {
        result := ComCall(13, this, "ptr", pSecDes, "HRESULT")
        return result
    }
}
