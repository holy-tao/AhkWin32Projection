#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDVBTuningSpace.ahk" { IDVBTuningSpace }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IDVBTuningSpace2 interface is implemented on the DVBTuningSpace object. It provides methods for working with tuning spaces with a network type of DVB.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDVBTuningSpace2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-idvbtuningspace2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDVBTuningSpace2 extends IDVBTuningSpace {
    /**
     * The interface identifier for IDVBTuningSpace2
     * @type {Guid}
     */
    static IID := Guid("{843188b4-ce62-43db-966b-8145a094e040}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDVBTuningSpace2 interfaces
    */
    struct Vtbl extends IDVBTuningSpace.Vtbl {
        get_NetworkID : IntPtr
        put_NetworkID : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDVBTuningSpace2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    NetworkID {
        get => this.get_NetworkID()
        set => this.put_NetworkID(value)
    }

    /**
     * The get_NetworkID method retrieves the Network ID of the DVB system.
     * @returns {Integer} Receive the network ID.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtuningspace2-get_networkid
     */
    get_NetworkID() {
        result := ComCall(28, this, "int*", &NetworkID := 0, "HRESULT")
        return NetworkID
    }

    /**
     * The put_NetworkID method sets the Network ID of the DVB system.
     * @param {Integer} NetworkID Specifies the <i>NetworkID</i> as a <b>long</b> integer.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idvbtuningspace2-put_networkid
     */
    put_NetworkID(NetworkID) {
        result := ComCall(29, this, "int", NetworkID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDVBTuningSpace2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_NetworkID := CallbackCreate(GetMethod(implObj, "get_NetworkID"), flags, 2)
        this.vtbl.put_NetworkID := CallbackCreate(GetMethod(implObj, "put_NetworkID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_NetworkID)
        CallbackFree(this.vtbl.put_NetworkID)
    }
}
