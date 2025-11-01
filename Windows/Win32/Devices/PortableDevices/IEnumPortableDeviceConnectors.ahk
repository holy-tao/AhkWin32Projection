#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/ienumportabledeviceconnectors
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IEnumPortableDeviceConnectors extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumPortableDeviceConnectors
     * @type {Guid}
     */
    static IID => Guid("{bfdef549-9247-454f-bd82-06fe80853faa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} cRequested 
     * @param {Pointer<IPortableDeviceConnector>} pConnectors 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/ienumportabledeviceconnectors-next
     */
    Next(cRequested, pConnectors, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cRequested, "ptr*", pConnectors, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cConnectors 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/ienumportabledeviceconnectors-skip
     */
    Skip(cConnectors) {
        result := ComCall(4, this, "uint", cConnectors, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/ienumportabledeviceconnectors-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumPortableDeviceConnectors>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/ienumportabledeviceconnectors-clone
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
