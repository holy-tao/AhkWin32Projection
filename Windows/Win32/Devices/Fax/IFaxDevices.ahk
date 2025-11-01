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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "get_ItemById"]

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevices-get__newenum
     */
    get__NewEnum(ppUnk) {
        result := ComCall(7, this, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vIndex 
     * @param {Pointer<IFaxDevice>} pFaxDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevices-get_item
     */
    get_Item(vIndex, pFaxDevice) {
        result := ComCall(8, this, "ptr", vIndex, "ptr*", pFaxDevice, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevices-get_count
     */
    get_Count(plCount) {
        result := ComCall(9, this, "int*", plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lId 
     * @param {Pointer<IFaxDevice>} ppFaxDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxdevices-get_itembyid
     */
    get_ItemById(lId, ppFaxDevice) {
        result := ComCall(10, this, "int", lId, "ptr*", ppFaxDevice, "HRESULT")
        return result
    }
}
