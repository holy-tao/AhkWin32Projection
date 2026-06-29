#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SENSORPROFILEID.ahk" { SENSORPROFILEID }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFMediaType.ahk" { IMFMediaType }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Describes a media foundation sensor profile.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfsensorprofile
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSensorProfile extends IUnknown {
    /**
     * The interface identifier for IMFSensorProfile
     * @type {Guid}
     */
    static IID := Guid("{22f765d1-8dab-4107-846d-56baf72215e7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSensorProfile interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProfileId         : IntPtr
        AddProfileFilter     : IntPtr
        IsMediaTypeSupported : IntPtr
        AddBlockedControl    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSensorProfile.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the sensor profile ID.
     * @returns {SENSORPROFILEID} Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/mfidl/ns-mfidl-sensorprofileid">SENSORPROFILEID</a> containing the profile ID.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprofile-getprofileid
     */
    GetProfileId() {
        pId := SENSORPROFILEID()
        result := ComCall(3, this, SENSORPROFILEID.Ptr, pId, "HRESULT")
        return pId
    }

    /**
     * Adds a profile filter to the specified media stream.
     * @param {Integer} StreamId The ID of the stream to add to.
     * @param {PWSTR} wzFilterSetString The filter to add.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprofile-addprofilefilter
     */
    AddProfileFilter(StreamId, wzFilterSetString) {
        wzFilterSetString := wzFilterSetString is String ? StrPtr(wzFilterSetString) : wzFilterSetString

        result := ComCall(4, this, "uint", StreamId, "ptr", wzFilterSetString, "HRESULT")
        return result
    }

    /**
     * Determines if a media stream supports the specified media type.
     * @param {Integer} StreamId The ID of the stream to check.
     * @param {IMFMediaType} pMediaType Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> describing the media type to check.
     * @returns {BOOL} Returns <b>true</b> if the media type is supported; otherwise, <b>false</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprofile-ismediatypesupported
     */
    IsMediaTypeSupported(StreamId, pMediaType) {
        result := ComCall(5, this, "uint", StreamId, "ptr", pMediaType, BOOL.Ptr, &pfSupported := 0, "HRESULT")
        return pfSupported
    }

    /**
     * Adds the specified blocked control .
     * @param {PWSTR} wzBlockedControl The blocked control to add.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprofile-addblockedcontrol
     */
    AddBlockedControl(wzBlockedControl) {
        wzBlockedControl := wzBlockedControl is String ? StrPtr(wzBlockedControl) : wzBlockedControl

        result := ComCall(6, this, "ptr", wzBlockedControl, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFSensorProfile.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProfileId := CallbackCreate(GetMethod(implObj, "GetProfileId"), flags, 2)
        this.vtbl.AddProfileFilter := CallbackCreate(GetMethod(implObj, "AddProfileFilter"), flags, 3)
        this.vtbl.IsMediaTypeSupported := CallbackCreate(GetMethod(implObj, "IsMediaTypeSupported"), flags, 4)
        this.vtbl.AddBlockedControl := CallbackCreate(GetMethod(implObj, "AddBlockedControl"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProfileId)
        CallbackFree(this.vtbl.AddProfileFilter)
        CallbackFree(this.vtbl.IsMediaTypeSupported)
        CallbackFree(this.vtbl.AddBlockedControl)
    }
}
