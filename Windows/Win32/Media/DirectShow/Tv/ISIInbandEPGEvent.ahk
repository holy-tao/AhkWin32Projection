#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ISIInbandEPGEvent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISIInbandEPGEvent
     * @type {Guid}
     */
    static IID => Guid("{7e47913a-5a89-423d-9a2b-e15168858934}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SIObjectEvent"]

    /**
     * 
     * @param {IDVB_EIT2} pIDVB_EIT 
     * @param {Integer} dwTable_ID 
     * @param {Integer} dwService_ID 
     * @returns {HRESULT} 
     */
    SIObjectEvent(pIDVB_EIT, dwTable_ID, dwService_ID) {
        result := ComCall(3, this, "ptr", pIDVB_EIT, "uint", dwTable_ID, "uint", dwService_ID, "HRESULT")
        return result
    }
}
