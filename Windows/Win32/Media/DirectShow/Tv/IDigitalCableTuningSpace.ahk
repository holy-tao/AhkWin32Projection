#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IATSCTuningSpace.ahk" { IATSCTuningSpace }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IDigitalCableTuningSpace interface is implemented on the DigitalTuningSpace object and provides methods for working with tuning spaces that have a digital cable network type.
 * @remarks
 * To set minimum and maximum values for the virtual channel number, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ianalogtvtuningspace-put_minchannel">IAnalogTVTuningSpace::put_MinChannel</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ianalogtvtuningspace-put_maxchannel">IAnalogTVTuningSpace::put_MaxChannel</a> methods. (This interface inherits <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ianalogtvtuningspace">IAnalogTVTuningSpace</a> through <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-iatsctuningspace">IATSCTuningSpace</a>.)
 *       
 * 
 * To set minimum and maximum values for the minor channel number, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-iatsctuningspace-put_minminorchannel">IATSCTuningSpace::put_MinMinorChannel</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-iatsctuningspace-put_maxminorchannel">IATSCTuningSpace::put_MaxMinorChannel</a> methods.
 *       
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDigitalCableTuningSpace)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-idigitalcabletuningspace
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDigitalCableTuningSpace extends IATSCTuningSpace {
    /**
     * The interface identifier for IDigitalCableTuningSpace
     * @type {Guid}
     */
    static IID := Guid("{013f9f9c-b449-4ec7-a6d2-9d4f2fc70ae5}")

    /**
     * The class identifier for DigitalCableTuningSpace
     * @type {Guid}
     */
    static CLSID := Guid("{d9bb4cee-b87a-47f1-ac92-b08d9c7813fc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDigitalCableTuningSpace interfaces
    */
    struct Vtbl extends IATSCTuningSpace.Vtbl {
        get_MinMajorChannel : IntPtr
        put_MinMajorChannel : IntPtr
        get_MaxMajorChannel : IntPtr
        put_MaxMajorChannel : IntPtr
        get_MinSourceID     : IntPtr
        put_MinSourceID     : IntPtr
        get_MaxSourceID     : IntPtr
        put_MaxSourceID     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDigitalCableTuningSpace.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    MinMajorChannel {
        get => this.get_MinMajorChannel()
        set => this.put_MinMajorChannel(value)
    }

    /**
     * @type {Integer} 
     */
    MaxMajorChannel {
        get => this.get_MaxMajorChannel()
        set => this.put_MaxMajorChannel(value)
    }

    /**
     * @type {Integer} 
     */
    MinSourceID {
        get => this.get_MinSourceID()
        set => this.put_MinSourceID(value)
    }

    /**
     * @type {Integer} 
     */
    MaxSourceID {
        get => this.get_MaxSourceID()
        set => this.put_MaxSourceID(value)
    }

    /**
     * The get_MinMajorChannel method retrieves the lowest major channel number for this tuning space.
     * @returns {Integer} Receives the lowest major channel number.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idigitalcabletuningspace-get_minmajorchannel
     */
    get_MinMajorChannel() {
        result := ComCall(42, this, "int*", &MinMajorChannelVal := 0, "HRESULT")
        return MinMajorChannelVal
    }

    /**
     * The put_MinMajorChannel method sets the lowest major channel number for this tuning space.
     * @param {Integer} NewMinMajorChannelVal Specifies the lowest major channel number.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idigitalcabletuningspace-put_minmajorchannel
     */
    put_MinMajorChannel(NewMinMajorChannelVal) {
        result := ComCall(43, this, "int", NewMinMajorChannelVal, "HRESULT")
        return result
    }

    /**
     * The get_MaxMajorChannel method retrieves the highest major channel number for this tuning space.
     * @returns {Integer} Receives the highest major channel number.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idigitalcabletuningspace-get_maxmajorchannel
     */
    get_MaxMajorChannel() {
        result := ComCall(44, this, "int*", &MaxMajorChannelVal := 0, "HRESULT")
        return MaxMajorChannelVal
    }

    /**
     * The put_MaxMajorChannel method sets the highest major channel number for this tuning space.
     * @param {Integer} NewMaxMajorChannelVal Specifies the highest major channel number.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idigitalcabletuningspace-put_maxmajorchannel
     */
    put_MaxMajorChannel(NewMaxMajorChannelVal) {
        result := ComCall(45, this, "int", NewMaxMajorChannelVal, "HRESULT")
        return result
    }

    /**
     * The get_MinSourceID method retrieves the lowest source identifier for this tuning space.
     * @returns {Integer} Receives the lowest source identifier.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idigitalcabletuningspace-get_minsourceid
     */
    get_MinSourceID() {
        result := ComCall(46, this, "int*", &MinSourceIDVal := 0, "HRESULT")
        return MinSourceIDVal
    }

    /**
     * The put_MinSourceID method sets the lowest source identifier for this tuning space.
     * @param {Integer} NewMinSourceIDVal Specifies the lowest source identifier.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idigitalcabletuningspace-put_minsourceid
     */
    put_MinSourceID(NewMinSourceIDVal) {
        result := ComCall(47, this, "int", NewMinSourceIDVal, "HRESULT")
        return result
    }

    /**
     * The get_MaxSourceID method retrieves the highest source identifier for this tuning space.
     * @returns {Integer} Receives the highest source identifier.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idigitalcabletuningspace-get_maxsourceid
     */
    get_MaxSourceID() {
        result := ComCall(48, this, "int*", &MaxSourceIDVal := 0, "HRESULT")
        return MaxSourceIDVal
    }

    /**
     * The put_MaxSourceID method sets the highest source identifier for this tuning space.
     * @param {Integer} NewMaxSourceIDVal Specifies the highest source identifier.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-idigitalcabletuningspace-put_maxsourceid
     */
    put_MaxSourceID(NewMaxSourceIDVal) {
        result := ComCall(49, this, "int", NewMaxSourceIDVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDigitalCableTuningSpace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MinMajorChannel := CallbackCreate(GetMethod(implObj, "get_MinMajorChannel"), flags, 2)
        this.vtbl.put_MinMajorChannel := CallbackCreate(GetMethod(implObj, "put_MinMajorChannel"), flags, 2)
        this.vtbl.get_MaxMajorChannel := CallbackCreate(GetMethod(implObj, "get_MaxMajorChannel"), flags, 2)
        this.vtbl.put_MaxMajorChannel := CallbackCreate(GetMethod(implObj, "put_MaxMajorChannel"), flags, 2)
        this.vtbl.get_MinSourceID := CallbackCreate(GetMethod(implObj, "get_MinSourceID"), flags, 2)
        this.vtbl.put_MinSourceID := CallbackCreate(GetMethod(implObj, "put_MinSourceID"), flags, 2)
        this.vtbl.get_MaxSourceID := CallbackCreate(GetMethod(implObj, "get_MaxSourceID"), flags, 2)
        this.vtbl.put_MaxSourceID := CallbackCreate(GetMethod(implObj, "put_MaxSourceID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MinMajorChannel)
        CallbackFree(this.vtbl.put_MinMajorChannel)
        CallbackFree(this.vtbl.get_MaxMajorChannel)
        CallbackFree(this.vtbl.put_MaxMajorChannel)
        CallbackFree(this.vtbl.get_MinSourceID)
        CallbackFree(this.vtbl.put_MinSourceID)
        CallbackFree(this.vtbl.get_MaxSourceID)
        CallbackFree(this.vtbl.put_MaxSourceID)
    }
}
