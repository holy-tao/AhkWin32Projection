#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_TransportStreamSelector extends IUnknown {
    /**
     * The interface identifier for IBDA_TransportStreamSelector
     * @type {Guid}
     */
    static IID := Guid("{1dcfafe9-b45e-41b3-bb2a-561eb129ae98}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_TransportStreamSelector interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetTSID          : IntPtr
        GetTSInformation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_TransportStreamSelector.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} usTSID 
     * @returns {HRESULT} 
     */
    SetTSID(usTSID) {
        result := ComCall(3, this, "ushort", usTSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulTSInformationBufferLen 
     * @returns {Integer} 
     */
    GetTSInformation(pulTSInformationBufferLen) {
        pulTSInformationBufferLenMarshal := pulTSInformationBufferLen is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulTSInformationBufferLenMarshal, pulTSInformationBufferLen, "char*", &pbTSInformationBuffer := 0, "HRESULT")
        return pbTSInformationBuffer
    }

    Query(iid) {
        if (IBDA_TransportStreamSelector.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetTSID := CallbackCreate(GetMethod(implObj, "SetTSID"), flags, 2)
        this.vtbl.GetTSInformation := CallbackCreate(GetMethod(implObj, "GetTSInformation"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetTSID)
        CallbackFree(this.vtbl.GetTSInformation)
    }
}
