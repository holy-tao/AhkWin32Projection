#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\KSJACK_SINK_INFORMATION.ahk" { KSJACK_SINK_INFORMATION }

/**
 * The IKsJackSinkInformation interface provides access to jack sink information if the jack is supported by the hardware.
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-iksjacksinkinformation
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsJackSinkInformation extends IUnknown {
    /**
     * The interface identifier for IKsJackSinkInformation
     * @type {Guid}
     */
    static IID := Guid("{d9bd72ed-290f-4581-9ff3-61027a8fe532}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsJackSinkInformation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetJackSinkInformation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsJackSinkInformation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetJackSinkInformation method retrieves the sink information for the specified jack.
     * @returns {KSJACK_SINK_INFORMATION} Pointer to a caller-allocated buffer that receives the sink information of the jack in a <a href="https://docs.microsoft.com/windows/win32/api/devicetopology/ns-devicetopology-ksjack_sink_information">KSJACK_SINK_INFORMATION</a> structure. The buffer size must be at least <c>sizeof(KSJACK_SINK_INFORMATION)</c>.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iksjacksinkinformation-getjacksinkinformation
     */
    GetJackSinkInformation() {
        pJackSinkInformation := KSJACK_SINK_INFORMATION()
        result := ComCall(3, this, KSJACK_SINK_INFORMATION.Ptr, pJackSinkInformation, "HRESULT")
        return pJackSinkInformation
    }

    Query(iid) {
        if (IKsJackSinkInformation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetJackSinkInformation := CallbackCreate(GetMethod(implObj, "GetJackSinkInformation"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetJackSinkInformation)
    }
}
