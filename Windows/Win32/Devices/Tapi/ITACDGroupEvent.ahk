#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITACDGroup.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITACDGroupEvent interface contains methods that retrieve the description of Automatic Call Distribution (ACD) group events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3cc/nn-tapi3cc-itacdgroupevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITACDGroupEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITACDGroupEvent
     * @type {Guid}
     */
    static IID => Guid("{297f3032-bd11-11d1-a0a7-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Group", "get_Event"]

    /**
     * @type {ITACDGroup} 
     */
    Group {
        get => this.get_Group()
    }

    /**
     * @type {Integer} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * 
     * @returns {ITACDGroup} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itacdgroupevent-get_group
     */
    get_Group() {
        result := ComCall(7, this, "ptr*", &ppGroup := 0, "HRESULT")
        return ITACDGroup(ppGroup)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itacdgroupevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }
}
