#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\EDataFlow.ahk" { EDataFlow }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMMEndpoint interface represents an audio endpoint device.
 * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nn-mmdeviceapi-immendpoint
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IMMEndpoint extends IUnknown {
    /**
     * The interface identifier for IMMEndpoint
     * @type {Guid}
     */
    static IID := Guid("{1be09788-6894-4089-8586-9a2a6c265ac5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMMEndpoint interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDataFlow : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMMEndpoint.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetDataFlow method indicates whether the audio endpoint device is a rendering device or a capture device.
     * @returns {EDataFlow} Pointer to a variable into which the method writes the data-flow direction of the endpoint device. The direction is indicated by one of the following <a href="https://docs.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-edataflow">EDataFlow</a> enumeration constants:
     * 
     * <ul>
     *  <li>eRender</li>
     *  <li>eCapture</li>
     * </ul>
     * 
     * The data-flow direction for a rendering device is eRender. The data-flow direction for a capture device is eCapture.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immendpoint-getdataflow
     */
    GetDataFlow() {
        result := ComCall(3, this, "int*", &pDataFlow := 0, "HRESULT")
        return pDataFlow
    }

    Query(iid) {
        if (IMMEndpoint.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDataFlow := CallbackCreate(GetMethod(implObj, "GetDataFlow"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDataFlow)
    }
}
