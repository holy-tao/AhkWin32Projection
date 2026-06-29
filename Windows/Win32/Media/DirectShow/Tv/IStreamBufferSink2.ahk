#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IStreamBufferSink.ahk" { IStreamBufferSink }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IStreamBufferSink2 interface is exposed by the Stream Buffer Sink filter.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferSink2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/nn-sbe-istreambuffersink2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IStreamBufferSink2 extends IStreamBufferSink {
    /**
     * The interface identifier for IStreamBufferSink2
     * @type {Guid}
     */
    static IID := Guid("{db94a660-f4fb-4bfa-bcc6-fe159a4eea93}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStreamBufferSink2 interfaces
    */
    struct Vtbl extends IStreamBufferSink.Vtbl {
        UnlockProfile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStreamBufferSink2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The UnlockProfile method unlocks the Stream Buffer Sink filter's profile. After the profile is unlocked, you can change the name of the stub file.
     * @remarks
     * The filter graph must be stopped when you call this method. If the recording session has not been started, this method invalidates the recording. To re-create the recording, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-istreambuffersink-lockprofile">IStreamBufferSink::LockProfile</a> again. If the profile is not already locked, the <b>UnlockProfile</b> method has no effect and returns S_FALSE.
     * 
     * If the graph is running, stopping the graph automatically unlocks the profile without the need to call <b>UnlockProfile</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The profile is not currently locked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambuffersink2-unlockprofile
     */
    UnlockProfile() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStreamBufferSink2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UnlockProfile := CallbackCreate(GetMethod(implObj, "UnlockProfile"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UnlockProfile)
    }
}
