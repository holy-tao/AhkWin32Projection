#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDvdCmd interface waits for DVD commands to start or end.The DVD Navigator creates synchronization objects that expose this interface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-idvdcmd
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IDvdCmd extends IUnknown {
    /**
     * The interface identifier for IDvdCmd
     * @type {Guid}
     */
    static IID := Guid("{5a4a97e4-94ee-4a55-9751-74b5643aa27d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvdCmd interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        WaitForStart : IntPtr
        WaitForEnd   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvdCmd.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The WaitForStart method blocks the DVD Navigator until the command associated with this object begins.
     * @returns {HRESULT} Returns S_OK if successful or an <b>HRESULT</b> error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcmd-waitforstart
     */
    WaitForStart() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The WaitForEnd method blocks the DVD Navigator until the command associated with this object completes or is canceled.
     * @returns {HRESULT} Returns S_OK if successful or an <b>HRESULT</b> error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcmd-waitforend
     */
    WaitForEnd() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDvdCmd.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.WaitForStart := CallbackCreate(GetMethod(implObj, "WaitForStart"), flags, 1)
        this.vtbl.WaitForEnd := CallbackCreate(GetMethod(implObj, "WaitForEnd"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.WaitForStart)
        CallbackFree(this.vtbl.WaitForEnd)
    }
}
