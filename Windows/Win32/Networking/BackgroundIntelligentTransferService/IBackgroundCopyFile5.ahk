#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IBackgroundCopyFile4.ahk" { IBackgroundCopyFile4 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\BITS_FILE_PROPERTY_ID.ahk" { BITS_FILE_PROPERTY_ID }
#Import ".\BITS_FILE_PROPERTY_VALUE.ahk" { BITS_FILE_PROPERTY_VALUE }

/**
 * Use this interface to get or set generic properties of BITS file transfers.
 * @see https://learn.microsoft.com/windows/win32/api/bits5_0/nn-bits5_0-ibackgroundcopyfile5
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct IBackgroundCopyFile5 extends IBackgroundCopyFile4 {
    /**
     * The interface identifier for IBackgroundCopyFile5
     * @type {Guid}
     */
    static IID := Guid("{85c1657f-dafc-40e8-8834-df18ea25717e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBackgroundCopyFile5 interfaces
    */
    struct Vtbl extends IBackgroundCopyFile4.Vtbl {
        SetProperty : IntPtr
        GetProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBackgroundCopyFile5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets a generic property of a BITS file transfer.
     * @param {BITS_FILE_PROPERTY_ID} PropertyId Specifies the property to be set.
     * @param {BITS_FILE_PROPERTY_VALUE} _PropertyValue A pointer to a union that specifies the value to be set. The union member appropriate for the property ID is used.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bits5_0/nf-bits5_0-ibackgroundcopyfile5-setproperty
     */
    SetProperty(PropertyId, _PropertyValue) {
        result := ComCall(13, this, BITS_FILE_PROPERTY_ID, PropertyId, BITS_FILE_PROPERTY_VALUE, _PropertyValue, "HRESULT")
        return result
    }

    /**
     * Gets a generic property of a BITS file transfer.
     * @param {BITS_FILE_PROPERTY_ID} PropertyId Specifies the file property whose value is to be retrieved.
     * @returns {BITS_FILE_PROPERTY_VALUE} The property value, returned as a pointer to a BITS_FILE_PROPERTY_VALUE union. Use the union field appropriate for the property ID value passed in.
     * @see https://learn.microsoft.com/windows/win32/api/bits5_0/nf-bits5_0-ibackgroundcopyfile5-getproperty
     */
    GetProperty(PropertyId) {
        _PropertyValue := BITS_FILE_PROPERTY_VALUE()
        result := ComCall(14, this, BITS_FILE_PROPERTY_ID, PropertyId, BITS_FILE_PROPERTY_VALUE.Ptr, _PropertyValue, "HRESULT")
        return _PropertyValue
    }

    Query(iid) {
        if (IBackgroundCopyFile5.IID.Equals(iid)) {
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
