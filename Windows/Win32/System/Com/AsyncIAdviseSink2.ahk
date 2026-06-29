#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMoniker.ahk" { IMoniker }
#Import ".\AsyncIAdviseSink.ahk" { AsyncIAdviseSink }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct AsyncIAdviseSink2 extends AsyncIAdviseSink {
    /**
     * The interface identifier for AsyncIAdviseSink2
     * @type {Guid}
     */
    static IID := Guid("{00000151-0000-0000-c000-000000000046}")

    /**
     * The class identifier for AsyncIAdviseSink2
     * @type {Guid}
     */
    static CLSID := Guid("{00000151-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIAdviseSink2 interfaces
    */
    struct Vtbl extends AsyncIAdviseSink.Vtbl {
        Begin_OnLinkSrcChange  : IntPtr
        Finish_OnLinkSrcChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIAdviseSink2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IMoniker} pmk 
     * @returns {String} Nothing - always returns an empty string
     */
    Begin_OnLinkSrcChange(pmk) {
        ComCall(13, this, "ptr", pmk)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Finish_OnLinkSrcChange() {
        ComCall(14, this)
    }

    Query(iid) {
        if (AsyncIAdviseSink2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_OnLinkSrcChange := CallbackCreate(GetMethod(implObj, "Begin_OnLinkSrcChange"), flags, 2)
        this.vtbl.Finish_OnLinkSrcChange := CallbackCreate(GetMethod(implObj, "Finish_OnLinkSrcChange"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_OnLinkSrcChange)
        CallbackFree(this.vtbl.Finish_OnLinkSrcChange)
    }
}
