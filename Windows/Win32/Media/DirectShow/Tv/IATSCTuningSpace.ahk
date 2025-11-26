#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAnalogTVTuningSpace.ahk

/**
 * The IATSCTuningSpace interface is implemented on ATSCTuningSpace objects, which represent any tuning space with an ATSC network type.
 * @remarks
 * 
 * If the minimum and maximum channels are set, and the user specifies a channel that is greater than the maximum, the tuner automatically wraps around to the minimum value.
 * 
 * To set the minimum and maximum major channel, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ianalogtvtuningspace-put_minchannel">IAnalogTVTuningSpace::put_MinChannel</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ianalogtvtuningspace-put_maxchannel">IAnalogTVTuningSpace::put_MaxChannel</a>.
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IATSCTuningSpace)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iatsctuningspace
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IATSCTuningSpace extends IAnalogTVTuningSpace{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IATSCTuningSpace
     * @type {Guid}
     */
    static IID => Guid("{0369b4e2-45b6-11d3-b650-00c04f79498e}")

    /**
     * The class identifier for ATSCTuningSpace
     * @type {Guid}
     */
    static CLSID => Guid("{a2e30750-6c3d-11d3-b653-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 34

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MinMinorChannel", "put_MinMinorChannel", "get_MaxMinorChannel", "put_MaxMinorChannel", "get_MinPhysicalChannel", "put_MinPhysicalChannel", "get_MaxPhysicalChannel", "put_MaxPhysicalChannel"]

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
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iatsctuningspace-get_minminorchannel
     */
    get_MinMinorChannel() {
        result := ComCall(34, this, "int*", &MinMinorChannelVal := 0, "HRESULT")
        return MinMinorChannelVal
    }

    /**
     * The put_MinMinorChannel method sets the lowest minor channel number ever allowed for this tuning space.
     * @param {Integer} NewMinMinorChannelVal Variable of type <b>long</b> that specifies the lowest minor channel.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iatsctuningspace-put_minminorchannel
     */
    put_MinMinorChannel(NewMinMinorChannelVal) {
        result := ComCall(35, this, "int", NewMinMinorChannelVal, "HRESULT")
        return result
    }

    /**
     * The get_MaxMinorChannel method gets the highest minor channel number for this tuning space.
     * @returns {Integer} Receives the highest minor channel.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iatsctuningspace-get_maxminorchannel
     */
    get_MaxMinorChannel() {
        result := ComCall(36, this, "int*", &MaxMinorChannelVal := 0, "HRESULT")
        return MaxMinorChannelVal
    }

    /**
     * The put_MaxMinorChannel method gets the highest minor channel number for this tuning space.
     * @param {Integer} NewMaxMinorChannelVal The highest minor channel.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iatsctuningspace-put_maxminorchannel
     */
    put_MaxMinorChannel(NewMaxMinorChannelVal) {
        result := ComCall(37, this, "int", NewMaxMinorChannelVal, "HRESULT")
        return result
    }

    /**
     * The get_MinPhysicalChannel method sets the lowest physical channel number for this tuning space.
     * @returns {Integer} Receives the lowest physical channel.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iatsctuningspace-get_minphysicalchannel
     */
    get_MinPhysicalChannel() {
        result := ComCall(38, this, "int*", &MinPhysicalChannelVal := 0, "HRESULT")
        return MinPhysicalChannelVal
    }

    /**
     * The put_MinPhysicalChannel method sets the lowest physical channel number for this tuning space.
     * @param {Integer} NewMinPhysicalChannelVal Variable of type <b>long</b> that specifies the lowest physical channel.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iatsctuningspace-put_minphysicalchannel
     */
    put_MinPhysicalChannel(NewMinPhysicalChannelVal) {
        result := ComCall(39, this, "int", NewMinPhysicalChannelVal, "HRESULT")
        return result
    }

    /**
     * The get_MaxPhysicalChannel method gets the highest physical channel number for this tuning space.
     * @returns {Integer} Receives the highest physical channel.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iatsctuningspace-get_maxphysicalchannel
     */
    get_MaxPhysicalChannel() {
        result := ComCall(40, this, "int*", &MaxPhysicalChannelVal := 0, "HRESULT")
        return MaxPhysicalChannelVal
    }

    /**
     * The put_MaxPhysicalChannel method sets the highest physical channel number for this tuning space.
     * @param {Integer} NewMaxPhysicalChannelVal Variable of type <b>long</b> that specifies the highest physical channel.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iatsctuningspace-put_maxphysicalchannel
     */
    put_MaxPhysicalChannel(NewMaxPhysicalChannelVal) {
        result := ComCall(41, this, "int", NewMaxPhysicalChannelVal, "HRESULT")
        return result
    }
}
