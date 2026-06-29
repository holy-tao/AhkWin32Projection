#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAMVideoAccelerator.ahk" { IAMVideoAccelerator }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\WindowsMediaFormat\IWMPlayerTimestampHook.ahk" { IWMPlayerTimestampHook }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IWMCodecVideoAccelerator extends IUnknown {
    /**
     * The interface identifier for IWMCodecVideoAccelerator
     * @type {Guid}
     */
    static IID := Guid("{990641b0-739f-4e94-a808-9888da8f75af}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMCodecVideoAccelerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NegotiateConnection : IntPtr
        SetPlayerNotify     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMCodecVideoAccelerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IAMVideoAccelerator} pIAMVA 
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType 
     * @returns {HRESULT} 
     */
    NegotiateConnection(pIAMVA, pMediaType) {
        result := ComCall(3, this, "ptr", pIAMVA, AM_MEDIA_TYPE.Ptr, pMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPlayerTimestampHook} pHook 
     * @returns {HRESULT} 
     */
    SetPlayerNotify(pHook) {
        result := ComCall(4, this, "ptr", pHook, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMCodecVideoAccelerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NegotiateConnection := CallbackCreate(GetMethod(implObj, "NegotiateConnection"), flags, 3)
        this.vtbl.SetPlayerNotify := CallbackCreate(GetMethod(implObj, "SetPlayerNotify"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NegotiateConnection)
        CallbackFree(this.vtbl.SetPlayerNotify)
    }
}
