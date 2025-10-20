#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicepropvariantcollection
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDevicePropVariantCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDevicePropVariantCollection
     * @type {Guid}
     */
    static IID => Guid("{89b2e422-4f1b-4316-bcef-a44afea83eb3}")

    /**
     * The class identifier for PortableDevicePropVariantCollection
     * @type {Guid}
     */
    static CLSID => Guid("{08a99e2f-6d6d-4b80-af5a-baf2bcbe4cb9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "Add", "GetType", "ChangeType", "Clear", "RemoveAt"]

    /**
     * 
     * @param {Pointer<Integer>} pcElems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicepropvariantcollection-getcount
     */
    GetCount(pcElems) {
        result := ComCall(3, this, "uint*", pcElems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicepropvariantcollection-getat
     */
    GetAt(dwIndex, pValue) {
        result := ComCall(4, this, "uint", dwIndex, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicepropvariantcollection-add
     */
    Add(pValue) {
        result := ComCall(5, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pvt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicepropvariantcollection-gettype
     */
    GetType(pvt) {
        result := ComCall(6, this, "ushort*", pvt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} vt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicepropvariantcollection-changetype
     */
    ChangeType(vt) {
        result := ComCall(7, this, "ushort", vt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicepropvariantcollection-clear
     */
    Clear() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicepropvariantcollection-removeat
     */
    RemoveAt(dwIndex) {
        result := ComCall(9, this, "uint", dwIndex, "HRESULT")
        return result
    }
}
