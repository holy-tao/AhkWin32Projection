#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Implement this interface to receive notifications of the current write operation. (DDiscFormat2DataEvents)
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-ddiscformat2dataevents
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct DDiscFormat2DataEvents extends IDispatch {
    /**
     * The interface identifier for DDiscFormat2DataEvents
     * @type {Guid}
     */
    static IID := Guid("{2735413c-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The class identifier for DDiscFormat2DataEvents
     * @type {Guid}
     */
    static CLSID := Guid("{2735413c-7f64-5b0f-8f00-5d77afbe261e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for DDiscFormat2DataEvents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Update : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := DDiscFormat2DataEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Implement this method to receive progress notification of the current write operation. (DDiscFormat2DataEvents.Update)
     * @remarks
     * Notifications are sent in response to calling the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-write">IDiscFormat2Data::Write</a> method.
     * 
     * Notification is sent when the current action changes:
     * 
     * <ul>
     * <li>Once when initializing the hardware</li>
     * <li>Once when calibrating the power</li>
     * <li>Once when formatting the media, if required by the media type</li>
     * <li>Every 0.5 seconds during the write operation</li>
     * <li>Once after the operation completes</li>
     * </ul>
     * To stop the write process, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-cancelwrite">IDiscFormat2Data::CancelWrite</a> method.
     * @param {IDispatch} _object The <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscformat2data">IDiscFormat2Data</a> interface that initiated the write operation. 
     * 
     * This parameter is a <b>MsftDiscFormat2Data</b> object in script.
     * @param {IDispatch} progress An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscformat2dataeventargs">IDiscFormat2DataEventArgs</a> interface that you use to determine the progress of the write operation. 
     * 
     * This parameter is a <b>MsftDiscFormat2Data</b> object in script.
     * @returns {HRESULT} Return values are ignored.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-ddiscformat2dataevents-update
     */
    Update(_object, progress) {
        result := ComCall(7, this, "ptr", _object, "ptr", progress, "HRESULT")
        return result
    }

    Query(iid) {
        if (DDiscFormat2DataEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Update := CallbackCreate(GetMethod(implObj, "Update"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Update)
    }
}
