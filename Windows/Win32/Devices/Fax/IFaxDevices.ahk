#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IFaxDevices interface defines a collection used by a fax client application to manage fax devices, where each device is represented by a FaxDevice object.
 * @remarks
 * 
  * A default implementation of <b>IFaxDevices</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxdevices">FaxDevices</a> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxdevices
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxDevices extends IDispatch{
    /**
     * The interface identifier for IFaxDevices
     * @type {Guid}
     */
    static IID => Guid("{9e46783e-f34f-482e-a360-0416becbbd96}")

    /**
     * The class identifier for FaxDevices
     * @type {Guid}
     */
    static CLSID => Guid("{5589e28e-23cb-4919-8808-e6101846e80d}")

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
     * @param {Pointer<IFaxDevice>} pFaxDevice 
     * @returns {HRESULT} 
     */
    get_Item(vIndex, pFaxDevice) {
        result := ComCall(8, this, "ptr", vIndex, "ptr", pFaxDevice, "int")
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

    /**
     * 
     * @param {Integer} lId 
     * @param {Pointer<IFaxDevice>} ppFaxDevice 
     * @returns {HRESULT} 
     */
    get_ItemById(lId, ppFaxDevice) {
        result := ComCall(10, this, "int", lId, "ptr", ppFaxDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
