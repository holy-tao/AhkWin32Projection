#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxDeviceProviders interface defines a configuration collection which contains the fax device providers on a connected fax server.
 * @remarks
 * 
  * A default implementation of <b>IFaxDeviceProviders</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdeviceproviders">FaxDeviceProviders</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxdeviceproviders
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxDeviceProviders extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxDeviceProviders
     * @type {Guid}
     */
    static IID => Guid("{9fb76f62-4c7e-43a5-b6fd-502893f7e13e}")

    /**
     * The class identifier for FaxDeviceProviders
     * @type {Guid}
     */
    static CLSID => Guid("{eb8fe768-875a-4f5f-82c5-03f23aac1bd7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count"]

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceproviders-get__newenum
     */
    get__NewEnum(ppUnk) {
        result := ComCall(7, this, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vIndex 
     * @param {Pointer<IFaxDeviceProvider>} pFaxDeviceProvider 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceproviders-get_item
     */
    get_Item(vIndex, pFaxDeviceProvider) {
        result := ComCall(8, this, "ptr", vIndex, "ptr*", pFaxDeviceProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdeviceproviders-get_count
     */
    get_Count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plCountMarshal, plCount, "HRESULT")
        return result
    }
}
