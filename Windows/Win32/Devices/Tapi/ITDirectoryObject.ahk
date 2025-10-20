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
     * 
     * @param {Pointer<Int32>} pObjectType 
     * @returns {HRESULT} 
     */
    get_ObjectType(pObjectType) {
        result := ComCall(7, this, "int*", pObjectType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppName 
     * @returns {HRESULT} 
     */
    get_Name(ppName) {
        result := ComCall(8, this, "ptr", ppName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pName 
     * @returns {HRESULT} 
     */
    put_Name(pName) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(9, this, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAddressType 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_DialableAddrs(dwAddressType, pVariant) {
        result := ComCall(10, this, "int", dwAddressType, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAddressType 
     * @param {Pointer<IEnumDialableAddrs>} ppEnumDialableAddrs 
     * @returns {HRESULT} 
     */
    EnumerateDialableAddrs(dwAddressType, ppEnumDialableAddrs) {
        result := ComCall(11, this, "uint", dwAddressType, "ptr", ppEnumDialableAddrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppSecDes 
     * @returns {HRESULT} 
     */
    get_SecurityDescriptor(ppSecDes) {
        result := ComCall(12, this, "ptr", ppSecDes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pSecDes 
     * @returns {HRESULT} 
     */
    put_SecurityDescriptor(pSecDes) {
        result := ComCall(13, this, "ptr", pSecDes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
