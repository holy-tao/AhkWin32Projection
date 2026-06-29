#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IRealTimeStylus3 interface enables multitouch for the realtime stylus.
 * @see https://learn.microsoft.com/windows/win32/api/rtscom/nn-rtscom-irealtimestylus3
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IRealTimeStylus3 extends IUnknown {
    /**
     * The interface identifier for IRealTimeStylus3
     * @type {Guid}
     */
    static IID := Guid("{d70230a3-6986-4051-b57a-1cf69f4d9db5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRealTimeStylus3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_MultiTouchEnabled : IntPtr
        put_MultiTouchEnabled : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRealTimeStylus3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    MultiTouchEnabled {
        get => this.get_MultiTouchEnabled()
        set => this.put_MultiTouchEnabled(value)
    }

    /**
     * Indicates whether the IRealTimeStylus3 object has multitouch input enabled. (Get)
     * @remarks
     * The following table lists the defined opt-in options for multitouch.
     * 
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td>TABLET_ENABLE_MULTITOUCHDATA</td>
     * <td>Indicates opt-in for multitouch data.</td>
     * <td>0x01000000</td>
     * </tr>
     * </table>
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus3-get_multitouchenabled
     */
    get_MultiTouchEnabled() {
        result := ComCall(3, this, BOOL.Ptr, &pfEnable := 0, "HRESULT")
        return pfEnable
    }

    /**
     * Indicates whether the IRealTimeStylus3 object has multitouch input enabled. (Put)
     * @remarks
     * The following table lists the defined opt-in options for multitouch.
     * 
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td>TABLET_ENABLE_MULTITOUCHDATA</td>
     * <td>Indicates opt-in for multitouch data.</td>
     * <td>0x01000000</td>
     * </tr>
     * </table>
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus3-put_multitouchenabled
     */
    put_MultiTouchEnabled(fEnable) {
        result := ComCall(4, this, BOOL, fEnable, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRealTimeStylus3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MultiTouchEnabled := CallbackCreate(GetMethod(implObj, "get_MultiTouchEnabled"), flags, 2)
        this.vtbl.put_MultiTouchEnabled := CallbackCreate(GetMethod(implObj, "put_MultiTouchEnabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MultiTouchEnabled)
        CallbackFree(this.vtbl.put_MultiTouchEnabled)
    }
}
