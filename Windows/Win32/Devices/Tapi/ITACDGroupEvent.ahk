#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITACDGroup.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITACDGroupEvent (tapi3.h) interface contains methods that retrieve the description of Automatic Call Distribution (ACD) group events.
 * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nn-tapi3-itacdgroupevent
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
     * The ITACDGroupEvent::get_Group method (tapi3.h) gets the ITACDGroup interface pointer for the group on which the event occurred.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itacdgroup">ITACDGroup</a> interface returned by <b>ITACDGroupEvent::get_Group</b>. The application must call <b>Release</b> on the 
     * <b>ITACDGroup</b> interface to free resources associated with it.
     * @returns {ITACDGroup} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itacdgroup">ITACDGroup</a> interface on which the event occurred.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-itacdgroupevent-get_group
     */
    get_Group() {
        result := ComCall(7, this, "ptr*", &ppGroup := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITACDGroup(ppGroup)
    }

    /**
     * The ITACDGroupEvent::get_Event method (tapi3.h) gets the descriptor of an event which indicates that a new ACD group has been added.
     * @remarks
     * The ACDGE_NEW_GROUP and ACDGE_REMOVE_GROUP values are not currently supported.
     * @returns {Integer} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/ne-tapi3-acdgroup_event">ACDGROUP_EVENT</a> descriptor of event.
     * @see https://learn.microsoft.com/windows/win32/api//content/tapi3/nf-tapi3-itacdgroupevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pEvent
    }
}
