#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDigitalLocator.ahk" { IDigitalLocator }

/**
 * The IATSCLocator interface is implemented on the ATSCLocator object and contains methods that enable the network provider to determine the physical channel and transport stream ID of an ATSC transmission.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IATSCLocator)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-iatsclocator
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IATSCLocator extends IDigitalLocator {
    /**
     * The interface identifier for IATSCLocator
     * @type {Guid}
     */
    static IID := Guid("{bf8d986f-8c2b-4131-94d7-4d3d9fcc21ef}")

    /**
     * The class identifier for ATSCLocator
     * @type {Guid}
     */
    static CLSID := Guid("{8872ff1b-98fa-4d7a-8d93-c9f1055f85bb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IATSCLocator interfaces
    */
    struct Vtbl extends IDigitalLocator.Vtbl {
        get_PhysicalChannel : IntPtr
        put_PhysicalChannel : IntPtr
        get_TSID            : IntPtr
        put_TSID            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IATSCLocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    PhysicalChannel {
        get => this.get_PhysicalChannel()
        set => this.put_PhysicalChannel(value)
    }

    /**
     * @type {Integer} 
     */
    TSID {
        get => this.get_TSID()
        set => this.put_TSID(value)
    }

    /**
     * The get_PhysicalChannel method retrieves the physical channel.
     * @remarks
     * This is a required property. A tuner cannot locate an ATSC transmission source without it.
     * @returns {Integer} Receives the physical channel.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsclocator-get_physicalchannel
     */
    get_PhysicalChannel() {
        result := ComCall(22, this, "int*", &PhysicalChannel := 0, "HRESULT")
        return PhysicalChannel
    }

    /**
     * The put_PhysicalChannel method sets the physical channel.
     * @remarks
     * This is a required property. A tuner cannot locate an ATSC transmission source without it.
     * @param {Integer} PhysicalChannel The physical channel.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsclocator-put_physicalchannel
     */
    put_PhysicalChannel(PhysicalChannel) {
        result := ComCall(23, this, "int", PhysicalChannel, "HRESULT")
        return result
    }

    /**
     * The get_TSID method retrieves the transport stream ID.
     * @remarks
     * This property is not required for tuning. It will be set by the BDA Transport Information Filter (TIF) when the signal is acquired. This property is not used by the application but may be used by one or more of the receiver filters. For example, a TIF may use this to determine whether the transport stream has changed from what was originally tuned and generate events that cause re-acquisition of the requested program.
     * @returns {Integer} Receives the transport stream ID.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsclocator-get_tsid
     */
    get_TSID() {
        result := ComCall(24, this, "int*", &TSID := 0, "HRESULT")
        return TSID
    }

    /**
     * The put_TSID method sets the transport stream ID.
     * @remarks
     * This property is optional.
     * @param {Integer} TSID The transport stream ID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsclocator-put_tsid
     */
    put_TSID(TSID) {
        result := ComCall(25, this, "int", TSID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IATSCLocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PhysicalChannel := CallbackCreate(GetMethod(implObj, "get_PhysicalChannel"), flags, 2)
        this.vtbl.put_PhysicalChannel := CallbackCreate(GetMethod(implObj, "put_PhysicalChannel"), flags, 2)
        this.vtbl.get_TSID := CallbackCreate(GetMethod(implObj, "get_TSID"), flags, 2)
        this.vtbl.put_TSID := CallbackCreate(GetMethod(implObj, "put_TSID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PhysicalChannel)
        CallbackFree(this.vtbl.put_PhysicalChannel)
        CallbackFree(this.vtbl.get_TSID)
        CallbackFree(this.vtbl.put_TSID)
    }
}
