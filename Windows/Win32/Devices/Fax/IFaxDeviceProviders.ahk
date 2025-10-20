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
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppUnk) {
        result := ComCall(7, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vIndex 
     * @param {Pointer<IFaxDeviceProvider>} pFaxDeviceProvider 
     * @returns {HRESULT} 
     */
    get_Item(vIndex, pFaxDeviceProvider) {
        result := ComCall(8, this, "ptr", vIndex, "ptr", pFaxDeviceProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_Count(plCount) {
        result := ComCall(9, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
