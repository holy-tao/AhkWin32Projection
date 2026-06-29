#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAnalogTVTuningSpace.ahk" { IAnalogTVTuningSpace }

/**
 * The IATSCTuningSpace interface is implemented on ATSCTuningSpace objects, which represent any tuning space with an ATSC network type.
 * @remarks
 * If the minimum and maximum channels are set, and the user specifies a channel that is greater than the maximum, the tuner automatically wraps around to the minimum value.
 * 
 * To set the minimum and maximum major channel, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ianalogtvtuningspace-put_minchannel">IAnalogTVTuningSpace::put_MinChannel</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ianalogtvtuningspace-put_maxchannel">IAnalogTVTuningSpace::put_MaxChannel</a>.
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IATSCTuningSpace)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-iatsctuningspace
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IATSCTuningSpace extends IAnalogTVTuningSpace {
    /**
     * The interface identifier for IATSCTuningSpace
     * @type {Guid}
     */
    static IID := Guid("{0369b4e2-45b6-11d3-b650-00c04f79498e}")

    /**
     * The class identifier for ATSCTuningSpace
     * @type {Guid}
     */
    static CLSID := Guid("{a2e30750-6c3d-11d3-b653-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IATSCTuningSpace interfaces
    */
    struct Vtbl extends IAnalogTVTuningSpace.Vtbl {
        get_MinMinorChannel    : IntPtr
        put_MinMinorChannel    : IntPtr
        get_MaxMinorChannel    : IntPtr
        put_MaxMinorChannel    : IntPtr
        get_MinPhysicalChannel : IntPtr
        put_MinPhysicalChannel : IntPtr
        get_MaxPhysicalChannel : IntPtr
        put_MaxPhysicalChannel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IATSCTuningSpace.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    MinMinorChannel {
        get => this.get_MinMinorChannel()
        set => this.put_MinMinorChannel(value)
    }

    /**
     * @type {Integer} 
     */
    MaxMinorChannel {
        get => this.get_MaxMinorChannel()
        set => this.put_MaxMinorChannel(value)
    }

    /**
     * @type {Integer} 
     */
    MinPhysicalChannel {
        get => this.get_MinPhysicalChannel()
        set => this.put_MinPhysicalChannel(value)
    }

    /**
     * @type {Integer} 
     */
    MaxPhysicalChannel {
        get => this.get_MaxPhysicalChannel()
        set => this.put_MaxPhysicalChannel(value)
    }

    /**
     * The get_MinMinorChannel method gets the lowest minor channel number ever allowed for this tuning space.
     * @returns {Integer} Receives the lowest minor channel.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-get_minminorchannel
     */
    get_MinMinorChannel() {
        result := ComCall(34, this, "int*", &MinMinorChannelVal := 0, "HRESULT")
        return MinMinorChannelVal
    }

    /**
     * The put_MinMinorChannel method sets the lowest minor channel number ever allowed for this tuning space.
     * @remarks
     * This property must be set after calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-iatsctuningspace-put_maxminorchannel">put_MaxMinorChannel</a> to avoid the case where the minimum minor channel is greater than the maximum minor channel. Both properties default to -1 (not set).
     * @param {Integer} NewMinMinorChannelVal Variable of type <b>long</b> that specifies the lowest minor channel.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-put_minminorchannel
     */
    put_MinMinorChannel(NewMinMinorChannelVal) {
        result := ComCall(35, this, "int", NewMinMinorChannelVal, "HRESULT")
        return result
    }

    /**
     * The get_MaxMinorChannel method gets the highest minor channel number for this tuning space.
     * @returns {Integer} Receives the highest minor channel.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-get_maxminorchannel
     */
    get_MaxMinorChannel() {
        result := ComCall(36, this, "int*", &MaxMinorChannelVal := 0, "HRESULT")
        return MaxMinorChannelVal
    }

    /**
     * The put_MaxMinorChannel method gets the highest minor channel number for this tuning space.
     * @remarks
     * This property must be set before calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-iatsctuningspace-put_minminorchannel">put_MinMinorChannel</a> to avoid the case where the minimum minor channel is greater than the maximum minor channel. Both properties default to -1 (not set).
     * @param {Integer} NewMaxMinorChannelVal The highest minor channel.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-put_maxminorchannel
     */
    put_MaxMinorChannel(NewMaxMinorChannelVal) {
        result := ComCall(37, this, "int", NewMaxMinorChannelVal, "HRESULT")
        return result
    }

    /**
     * The get_MinPhysicalChannel method sets the lowest physical channel number for this tuning space.
     * @returns {Integer} Receives the lowest physical channel.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-get_minphysicalchannel
     */
    get_MinPhysicalChannel() {
        result := ComCall(38, this, "int*", &MinPhysicalChannelVal := 0, "HRESULT")
        return MinPhysicalChannelVal
    }

    /**
     * The put_MinPhysicalChannel method sets the lowest physical channel number for this tuning space.
     * @param {Integer} NewMinPhysicalChannelVal Variable of type <b>long</b> that specifies the lowest physical channel.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-put_minphysicalchannel
     */
    put_MinPhysicalChannel(NewMinPhysicalChannelVal) {
        result := ComCall(39, this, "int", NewMinPhysicalChannelVal, "HRESULT")
        return result
    }

    /**
     * The get_MaxPhysicalChannel method gets the highest physical channel number for this tuning space.
     * @returns {Integer} Receives the highest physical channel.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-get_maxphysicalchannel
     */
    get_MaxPhysicalChannel() {
        result := ComCall(40, this, "int*", &MaxPhysicalChannelVal := 0, "HRESULT")
        return MaxPhysicalChannelVal
    }

    /**
     * The put_MaxPhysicalChannel method sets the highest physical channel number for this tuning space.
     * @param {Integer} NewMaxPhysicalChannelVal Variable of type <b>long</b> that specifies the highest physical channel.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-put_maxphysicalchannel
     */
    put_MaxPhysicalChannel(NewMaxPhysicalChannelVal) {
        result := ComCall(41, this, "int", NewMaxPhysicalChannelVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IATSCTuningSpace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MinMinorChannel := CallbackCreate(GetMethod(implObj, "get_MinMinorChannel"), flags, 2)
        this.vtbl.put_MinMinorChannel := CallbackCreate(GetMethod(implObj, "put_MinMinorChannel"), flags, 2)
        this.vtbl.get_MaxMinorChannel := CallbackCreate(GetMethod(implObj, "get_MaxMinorChannel"), flags, 2)
        this.vtbl.put_MaxMinorChannel := CallbackCreate(GetMethod(implObj, "put_MaxMinorChannel"), flags, 2)
        this.vtbl.get_MinPhysicalChannel := CallbackCreate(GetMethod(implObj, "get_MinPhysicalChannel"), flags, 2)
        this.vtbl.put_MinPhysicalChannel := CallbackCreate(GetMethod(implObj, "put_MinPhysicalChannel"), flags, 2)
        this.vtbl.get_MaxPhysicalChannel := CallbackCreate(GetMethod(implObj, "get_MaxPhysicalChannel"), flags, 2)
        this.vtbl.put_MaxPhysicalChannel := CallbackCreate(GetMethod(implObj, "put_MaxPhysicalChannel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MinMinorChannel)
        CallbackFree(this.vtbl.put_MinMinorChannel)
        CallbackFree(this.vtbl.get_MaxMinorChannel)
        CallbackFree(this.vtbl.put_MaxMinorChannel)
        CallbackFree(this.vtbl.get_MinPhysicalChannel)
        CallbackFree(this.vtbl.put_MinPhysicalChannel)
        CallbackFree(this.vtbl.get_MaxPhysicalChannel)
        CallbackFree(this.vtbl.put_MaxPhysicalChannel)
    }
}
