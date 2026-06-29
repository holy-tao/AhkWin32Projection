#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ITACDGroup.ahk" { ITACDGroup }
#Import ".\ACDGROUP_EVENT.ahk" { ACDGROUP_EVENT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITACDGroupEvent interface (tapi3cc.h) contains methods that retrieve the description of Automatic Call Distribution (ACD) group events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nn-tapi3cc-itacdgroupevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITACDGroupEvent extends IDispatch {
    /**
     * The interface identifier for ITACDGroupEvent
     * @type {Guid}
     */
    static IID := Guid("{297f3032-bd11-11d1-a0a7-00805fc147d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITACDGroupEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Group : IntPtr
        get_Event : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITACDGroupEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ITACDGroup} 
     */
    Group {
        get => this.get_Group()
    }

    /**
     * @type {ACDGROUP_EVENT} 
     */
    Event {
        get => this.get_Event()
    }

    /**
     * The ITACDGroupEvent::get_Group method (tapi3cc.h) gets the ITACDGroup interface pointer for the group on which the event occurred.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itacdgroup">ITACDGroup</a> interface returned by <b>ITACDGroupEvent::get_Group</b>. The application must call <b>Release</b> on the 
     * <b>ITACDGroup</b> interface to free resources associated with it.
     * @returns {ITACDGroup} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/nn-tapi3-itacdgroup">ITACDGroup</a> interface on which the event occurred.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itacdgroupevent-get_group
     */
    get_Group() {
        result := ComCall(7, this, "ptr*", &ppGroup := 0, "HRESULT")
        return ITACDGroup(ppGroup)
    }

    /**
     * The ITACDGroupEvent::get_Event method (tapi3cc.h) gets the descriptor of an event which indicates that a new ACD group has been added.
     * @remarks
     * The ACDGE_NEW_GROUP and ACDGE_REMOVE_GROUP values are not currently supported.
     * @returns {ACDGROUP_EVENT} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3/ne-tapi3-acdgroup_event">ACDGROUP_EVENT</a> descriptor of event.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/nf-tapi3cc-itacdgroupevent-get_event
     */
    get_Event() {
        result := ComCall(8, this, "int*", &pEvent := 0, "HRESULT")
        return pEvent
    }

    Query(iid) {
        if (ITACDGroupEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Group := CallbackCreate(GetMethod(implObj, "get_Group"), flags, 2)
        this.vtbl.get_Event := CallbackCreate(GetMethod(implObj, "get_Event"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Group)
        CallbackFree(this.vtbl.get_Event)
    }
}
