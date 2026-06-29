#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Implement this interface to receive notifications of the current track-writing operation.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-ddiscformat2trackatonceevents
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct DDiscFormat2TrackAtOnceEvents extends IDispatch {
    /**
     * The interface identifier for DDiscFormat2TrackAtOnceEvents
     * @type {Guid}
     */
    static IID := Guid("{2735413f-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The class identifier for DDiscFormat2TrackAtOnceEvents
     * @type {Guid}
     */
    static CLSID := Guid("{2735413f-7f64-5b0f-8f00-5d77afbe261e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for DDiscFormat2TrackAtOnceEvents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Update : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := DDiscFormat2TrackAtOnceEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Implement this method to receive progress notification of the current track-writing operation.
     * @remarks
     * Notifications are sent in response to calling the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2trackatonce-addaudiotrack">IDiscFormat2TrackAtOnce::AddAudioTrack</a> method.
     * 
     * To stop the write process, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2trackatonce-canceladdtrack">IDiscFormat2TrackAtOnce::CancelAddTrack</a> method.
     * @param {IDispatch} _object The <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscformat2trackatonce">IDiscFormat2TrackAtOnce</a> interface that initiated the write operation. 
     * 
     * This parameter is a <b>MsftDiscFormat2TrackAtOnce</b> object in script.
     * @param {IDispatch} progress An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscformat2trackatonceeventargs">IDiscFormat2TrackAtOnceEventArgs</a> interface that you use to determine the progress of the write operation. 
     * 
     * This parameter is a <b>MsftDiscFormat2TrackAtOnce</b> object in script.
     * @returns {HRESULT} Return values are ignored.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-ddiscformat2trackatonceevents-update
     */
    Update(_object, progress) {
        result := ComCall(7, this, "ptr", _object, "ptr", progress, "HRESULT")
        return result
    }

    Query(iid) {
        if (DDiscFormat2TrackAtOnceEvents.IID.Equals(iid)) {
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
