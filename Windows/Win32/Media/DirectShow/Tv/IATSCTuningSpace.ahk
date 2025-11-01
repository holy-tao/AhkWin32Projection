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
     * 
     * @param {Pointer<Integer>} MinMinorChannelVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-get_minminorchannel
     */
    get_MinMinorChannel(MinMinorChannelVal) {
        MinMinorChannelValMarshal := MinMinorChannelVal is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, MinMinorChannelValMarshal, MinMinorChannelVal, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} MaxMinorChannelVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-get_maxminorchannel
     */
    get_MaxMinorChannel(MaxMinorChannelVal) {
        MaxMinorChannelValMarshal := MaxMinorChannelVal is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, MaxMinorChannelValMarshal, MaxMinorChannelVal, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} MinPhysicalChannelVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-get_minphysicalchannel
     */
    get_MinPhysicalChannel(MinPhysicalChannelVal) {
        MinPhysicalChannelValMarshal := MinPhysicalChannelVal is VarRef ? "int*" : "ptr"

        result := ComCall(38, this, MinPhysicalChannelValMarshal, MinPhysicalChannelVal, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} MaxPhysicalChannelVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iatsctuningspace-get_maxphysicalchannel
     */
    get_MaxPhysicalChannel(MaxPhysicalChannelVal) {
        MaxPhysicalChannelValMarshal := MaxPhysicalChannelVal is VarRef ? "int*" : "ptr"

        result := ComCall(40, this, MaxPhysicalChannelValMarshal, MaxPhysicalChannelVal, "HRESULT")
        return result
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
