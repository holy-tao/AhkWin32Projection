#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Implement this interface to receive notifications of the current erase operation.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-ddiscformat2eraseevents
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct DDiscFormat2EraseEvents extends IDispatch {
    /**
     * The interface identifier for DDiscFormat2EraseEvents
     * @type {Guid}
     */
    static IID := Guid("{2735413a-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The class identifier for DDiscFormat2EraseEvents
     * @type {Guid}
     */
    static CLSID := Guid("{2735413a-7f64-5b0f-8f00-5d77afbe261e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for DDiscFormat2EraseEvents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Update : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := DDiscFormat2EraseEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Implement this method to receive progress notification of the current erase operation.
     * @remarks
     * Notifications are sent in response to calling the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2erase-erasemedia">IDiscFormat2Erase::EraseMedia</a> method. 
     * 
     * Notification is sent every 0.5 or 1.0 seconds depending on the method required to blank the media.
     * 
     * Total time estimates for a single erasure can vary as the operation progresses. The drive provides updated information that can affect the projected duration of the erasure.
     * @param {IDispatch} _object The <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscformat2erase">IDiscFormat2Erase</a> interface that initiated the erase operation. 
     * 
     * This parameter is a <b>MsftDiscFormat2Erase</b> object in script.
     * @param {Integer} elapsedSeconds Elapsed time, in seconds, of the erase operation.
     * @param {Integer} estimatedTotalSeconds Estimated time, in seconds, to complete the erase operation.
     * @returns {HRESULT} Return values are ignored.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-ddiscformat2eraseevents-update
     */
    Update(_object, elapsedSeconds, estimatedTotalSeconds) {
        result := ComCall(7, this, "ptr", _object, "int", elapsedSeconds, "int", estimatedTotalSeconds, "HRESULT")
        return result
    }

    Query(iid) {
        if (DDiscFormat2EraseEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Update := CallbackCreate(GetMethod(implObj, "Update"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Update)
    }
}
