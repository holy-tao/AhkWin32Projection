#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpatialAudioObjectRenderStreamBase.ahk" { ISpatialAudioObjectRenderStreamBase }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides notifications for spatial audio clients to respond to changes in the state of an ISpatialAudioObjectRenderStream.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobjectrenderstreamnotify
 * @namespace Windows.Win32.Media.Audio
 */
export default struct ISpatialAudioObjectRenderStreamNotify extends IUnknown {
    /**
     * The interface identifier for ISpatialAudioObjectRenderStreamNotify
     * @type {Guid}
     */
    static IID := Guid("{dddf83e6-68d7-4c70-883f-a1836afb4a50}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpatialAudioObjectRenderStreamNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnAvailableDynamicObjectCountChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpatialAudioObjectRenderStreamNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the spatial audio client when the rendering capacity for an ISpatialAudioObjectRenderStream is about to change, specifies the time after which the change will occur, and specifies the number of dynamic audio objects that will be available after the change.
     * @remarks
     * A dynamic <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioobject">ISpatialAudioObject</a> is one that was activated by setting the <i>type</i> parameter to the  <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstream-activatespatialaudioobject">ISpatialAudioObjectRenderStream::ActivateSpatialAudioObject</a> method to <b>AudioObjectType_Dynamic</b>. The client has a limit of the maximum number of dynamic spatial audio objects that can be activated at one time. When the capacity of the audio rendering pipeline changes, the system will dynamically adjust the maximum number of concurrent dynamic spatial audio objects. Before doing so, the system will call <b>OnAvailableDynamicObjectCountChange</b> to notify clients of the resource limit change. 
     * 
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on an <b>ISpatialAudioObject</b> when it is no longer being used to free up the resource to create new dynamic spatial audio objects.
     * @param {ISpatialAudioObjectRenderStreamBase} sender The spatial audio render stream for which the available dynamic object count is changing.
     * @param {Integer} hnsComplianceDeadlineTime The time after which the spatial resource limit will change, in 100-nanosecond units. A value of  0 means that the change will occur immediately.
     * @param {Integer} availableDynamicObjectCountChange The number of dynamic spatial audio objects that will be available to the stream after <i>hnsComplianceDeadlineTime</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-ispatialaudioobjectrenderstreamnotify-onavailabledynamicobjectcountchange
     */
    OnAvailableDynamicObjectCountChange(sender, hnsComplianceDeadlineTime, availableDynamicObjectCountChange) {
        result := ComCall(3, this, "ptr", sender, "int64", hnsComplianceDeadlineTime, "uint", availableDynamicObjectCountChange, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpatialAudioObjectRenderStreamNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnAvailableDynamicObjectCountChange := CallbackCreate(GetMethod(implObj, "OnAvailableDynamicObjectCountChange"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnAvailableDynamicObjectCountChange)
    }
}
