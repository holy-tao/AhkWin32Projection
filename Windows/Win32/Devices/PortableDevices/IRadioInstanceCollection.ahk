#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IRadioInstanceCollection extends IUnknown{
    /**
     * The interface identifier for IRadioInstanceCollection
     * @type {Guid}
     */
    static IID => Guid("{e5791fae-5665-4e0c-95be-5fde31644185}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pcInstance 
     * @returns {HRESULT} 
     */
    GetCount(pcInstance) {
        result := ComCall(3, this, "uint*", pcInstance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<IRadioInstance>} ppRadioInstance 
     * @returns {HRESULT} 
     */
    GetAt(uIndex, ppRadioInstance) {
        result := ComCall(4, this, "uint", uIndex, "ptr", ppRadioInstance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
