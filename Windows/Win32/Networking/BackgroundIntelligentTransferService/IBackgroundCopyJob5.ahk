#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\BITS_JOB_PROPERTY_ID.ahk" { BITS_JOB_PROPERTY_ID }
#Import ".\BITS_JOB_PROPERTY_VALUE.ahk" { BITS_JOB_PROPERTY_VALUE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IBackgroundCopyJob4.ahk" { IBackgroundCopyJob4 }

/**
 * Use this interface to query or set several optional behaviors of a job.
 * @see https://learn.microsoft.com/windows/win32/api/bits5_0/nn-bits5_0-ibackgroundcopyjob5
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IBackgroundCopyJob5 extends IBackgroundCopyJob4 {
    /**
     * The interface identifier for IBackgroundCopyJob5
     * @type {Guid}
     */
    static IID := Guid("{e847030c-bbba-4657-af6d-484aa42bf1fe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBackgroundCopyJob5 interfaces
    */
    struct Vtbl extends IBackgroundCopyJob4.Vtbl {
        SetProperty : IntPtr
        GetProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBackgroundCopyJob5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * A generic method for setting BITS job properties.
     * @param {BITS_JOB_PROPERTY_ID} PropertyId The ID of the property that is being set specified as a <a href="https://docs.microsoft.com/windows/desktop/api/bits5_0/ne-bits5_0-bits_job_property_id">BITS_JOB_PROPERTY_ID</a> enum value.
     * @param {BITS_JOB_PROPERTY_VALUE} _PropertyValue The value of the property that is being set. In order to hold a value whose type is appropriate to the property, this value is specified via the <a href="https://docs.microsoft.com/windows/desktop/api/bits5_0/ns-bits5_0-bits_job_property_value">BITS_JOB_PROPERTY_VALUE</a> union that is composed of all the known property types.
     * @returns {HRESULT} The method returns the following return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bits5_0/nf-bits5_0-ibackgroundcopyjob5-setproperty
     */
    SetProperty(PropertyId, _PropertyValue) {
        result := ComCall(53, this, BITS_JOB_PROPERTY_ID, PropertyId, BITS_JOB_PROPERTY_VALUE, _PropertyValue, "HRESULT")
        return result
    }

    /**
     * A generic method for getting BITS job properties.
     * @param {BITS_JOB_PROPERTY_ID} PropertyId The ID of the property that is being obtained specified as a <a href="https://docs.microsoft.com/windows/desktop/api/bits5_0/ne-bits5_0-bits_job_property_id">BITS_JOB_PROPERTY_ID</a> enum value.
     * @returns {BITS_JOB_PROPERTY_VALUE} The property value returned as a BITS_JOB_PROPERTY_VALUE union.
     * @see https://learn.microsoft.com/windows/win32/api/bits5_0/nf-bits5_0-ibackgroundcopyjob5-getproperty
     */
    GetProperty(PropertyId) {
        _PropertyValue := BITS_JOB_PROPERTY_VALUE()
        result := ComCall(54, this, BITS_JOB_PROPERTY_ID, PropertyId, BITS_JOB_PROPERTY_VALUE.Ptr, _PropertyValue, "HRESULT")
        return _PropertyValue
    }

    Query(iid) {
        if (IBackgroundCopyJob5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 3)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetProperty)
        CallbackFree(this.vtbl.GetProperty)
    }
}
