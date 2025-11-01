#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<Integer>} pObjectType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobject-get_objecttype
     */
    get_ObjectType(pObjectType) {
        pObjectTypeMarshal := pObjectType is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pObjectTypeMarshal, pObjectType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobject-get_name
     */
    get_Name(ppName) {
        result := ComCall(8, this, "ptr", ppName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobject-put_name
     */
    put_Name(pName) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(9, this, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAddressType 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobject-get_dialableaddrs
     */
    get_DialableAddrs(dwAddressType, pVariant) {
        result := ComCall(10, this, "int", dwAddressType, "ptr", pVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAddressType 
     * @param {Pointer<IEnumDialableAddrs>} ppEnumDialableAddrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobject-enumeratedialableaddrs
     */
    EnumerateDialableAddrs(dwAddressType, ppEnumDialableAddrs) {
        result := ComCall(11, this, "uint", dwAddressType, "ptr*", ppEnumDialableAddrs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppSecDes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobject-get_securitydescriptor
     */
    get_SecurityDescriptor(ppSecDes) {
        result := ComCall(12, this, "ptr*", ppSecDes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pSecDes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobject-put_securitydescriptor
     */
    put_SecurityDescriptor(pSecDes) {
        result := ComCall(13, this, "ptr", pSecDes, "HRESULT")
        return result
    }
}
