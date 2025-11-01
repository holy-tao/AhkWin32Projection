#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicekeycollection
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceKeyCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceKeyCollection
     * @type {Guid}
     */
    static IID => Guid("{dada2357-e0ad-492e-98db-dd61c53ba353}")

    /**
     * The class identifier for PortableDeviceKeyCollection
     * @type {Guid}
     */
    static CLSID => Guid("{de2d022d-2480-43be-97f0-d1fa2cf98f4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "Add", "Clear", "RemoveAt"]

    /**
     * 
     * @param {Pointer<Integer>} pcElems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicekeycollection-getcount
     */
    GetCount(pcElems) {
        pcElemsMarshal := pcElems is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcElemsMarshal, pcElems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicekeycollection-getat
     */
    GetAt(dwIndex, pKey) {
        result := ComCall(4, this, "uint", dwIndex, "ptr", pKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicekeycollection-add
     */
    Add(Key) {
        result := ComCall(5, this, "ptr", Key, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicekeycollection-clear
     */
    Clear() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicekeycollection-removeat
     */
    RemoveAt(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "HRESULT")
        return result
    }
}
