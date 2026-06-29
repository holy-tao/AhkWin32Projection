#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFSample.ahk" { IMFSample }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Describes the IMFMediaStreamSourceSampleRequest interface and provides its members, methods, remarks, and requirements.
 * @remarks
 * The **IMFMediaStreamSourceSampleRequest** interface inherits from the [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface. **IMFMediaStreamSourceSampleRequest** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * **MFMediaStreamSourceSampleRequest** is implemented by the [**Windows.Media.Core.MediaStreamSourceSampleRequest**](/uwp/api/Windows.Media.Core.MediaStreamSourceSampleRequest) runtime class.
 * @see https://learn.microsoft.com/windows/win32/medfound/imfmediastreamsourcesamplerequest
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaStreamSourceSampleRequest extends IUnknown {
    /**
     * The interface identifier for IMFMediaStreamSourceSampleRequest
     * @type {Guid}
     */
    static IID := Guid("{380b9af9-a85b-4e78-a2af-ea5ce645c6b4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaStreamSourceSampleRequest interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetSample : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaStreamSourceSampleRequest.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the sample for the media stream source.
     * @param {IMFSample} value The sample for the media stream source.
     * @returns {HRESULT} If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/medfound/imfmediastreamsourcesamplerequest-setsample
     */
    SetSample(value) {
        result := ComCall(3, this, "ptr", value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaStreamSourceSampleRequest.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSample := CallbackCreate(GetMethod(implObj, "SetSample"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSample)
    }
}
