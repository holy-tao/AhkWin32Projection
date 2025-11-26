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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-get_minminorchannel
     */
    get_MinMinorChannel() {
        result := ComCall(34, this, "int*", &MinMinorChannelVal := 0, "HRESULT")
        return MinMinorChannelVal
    }

    /**
     * 
     * @param {Integer} NewMinMinorChannelVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-put_minminorchannel
     */
    put_MinMinorChannel(NewMinMinorChannelVal) {
        result := ComCall(35, this, "int", NewMinMinorChannelVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-get_maxminorchannel
     */
    get_MaxMinorChannel() {
        result := ComCall(36, this, "int*", &MaxMinorChannelVal := 0, "HRESULT")
        return MaxMinorChannelVal
    }

    /**
     * 
     * @param {Integer} NewMaxMinorChannelVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-put_maxminorchannel
     */
    put_MaxMinorChannel(NewMaxMinorChannelVal) {
        result := ComCall(37, this, "int", NewMaxMinorChannelVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-get_minphysicalchannel
     */
    get_MinPhysicalChannel() {
        result := ComCall(38, this, "int*", &MinPhysicalChannelVal := 0, "HRESULT")
        return MinPhysicalChannelVal
    }

    /**
     * 
     * @param {Integer} NewMinPhysicalChannelVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-put_minphysicalchannel
     */
    put_MinPhysicalChannel(NewMinPhysicalChannelVal) {
        result := ComCall(39, this, "int", NewMinPhysicalChannelVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-get_maxphysicalchannel
     */
    get_MaxPhysicalChannel() {
        result := ComCall(40, this, "int*", &MaxPhysicalChannelVal := 0, "HRESULT")
        return MaxPhysicalChannelVal
    }

    /**
     * 
     * @param {Integer} NewMaxPhysicalChannelVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-put_maxphysicalchannel
     */
    put_MaxPhysicalChannel(NewMaxPhysicalChannelVal) {
        result := ComCall(41, this, "int", NewMaxPhysicalChannelVal, "HRESULT")
        return result
    }
}
