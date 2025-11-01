#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceServiceOpenCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceServiceOpenCallback
     * @type {Guid}
     */
    static IID => Guid("{bced49c8-8efe-41ed-960b-61313abd47a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnComplete"]

    /**
     * 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    OnComplete(hrStatus) {
        result := ComCall(3, this, "int", hrStatus, "HRESULT")
        return result
    }
}
