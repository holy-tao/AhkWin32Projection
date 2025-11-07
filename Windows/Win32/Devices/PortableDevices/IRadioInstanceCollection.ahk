#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRadioInstance.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IRadioInstanceCollection extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt"]

    /**
     * 
     * @returns {Integer} 
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pcInstance := 0, "HRESULT")
        return pcInstance
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @returns {IRadioInstance} 
     */
    GetAt(uIndex) {
        result := ComCall(4, this, "uint", uIndex, "ptr*", &ppRadioInstance := 0, "HRESULT")
        return IRadioInstance(ppRadioInstance)
    }
}
