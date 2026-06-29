#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ITuneRequest.ahk" { ITuneRequest }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Implements methods that support channel requests using a string identifier.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IChannelIDTuneRequest)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ichannelidtunerequest
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IChannelIDTuneRequest extends ITuneRequest {
    /**
     * The interface identifier for IChannelIDTuneRequest
     * @type {Guid}
     */
    static IID := Guid("{156eff60-86f4-4e28-89fc-109799fd57ee}")

    /**
     * The class identifier for ChannelIDTuneRequest
     * @type {Guid}
     */
    static CLSID := Guid("{3a9428a7-31a4-45e9-9efb-e055bf7bb3db}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IChannelIDTuneRequest interfaces
    */
    struct Vtbl extends ITuneRequest.Vtbl {
        get_ChannelID : IntPtr
        put_ChannelID : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IChannelIDTuneRequest.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ChannelID {
        get => this.get_ChannelID()
        set => this.put_ChannelID(value)
    }

    /**
     * Provider-defined channel identifier in string format.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ichannelidtunerequest-get_channelid
     */
    get_ChannelID() {
        ChannelID := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, ChannelID, "HRESULT")
        return ChannelID
    }

    /**
     * Provider-defined channel identifier in string format.
     * @param {BSTR} ChannelID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ichannelidtunerequest-put_channelid
     */
    put_ChannelID(ChannelID) {
        ChannelID := ChannelID is String ? BSTR.Alloc(ChannelID).Value : ChannelID

        result := ComCall(13, this, BSTR, ChannelID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IChannelIDTuneRequest.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ChannelID := CallbackCreate(GetMethod(implObj, "get_ChannelID"), flags, 2)
        this.vtbl.put_ChannelID := CallbackCreate(GetMethod(implObj, "put_ChannelID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ChannelID)
        CallbackFree(this.vtbl.put_ChannelID)
    }
}
