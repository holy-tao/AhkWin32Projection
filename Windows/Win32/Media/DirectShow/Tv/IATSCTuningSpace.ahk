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
     * 
     * @param {Pointer<Int32>} MinMinorChannelVal 
     * @returns {HRESULT} 
     */
    get_MinMinorChannel(MinMinorChannelVal) {
        result := ComCall(34, this, "int*", MinMinorChannelVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewMinMinorChannelVal 
     * @returns {HRESULT} 
     */
    put_MinMinorChannel(NewMinMinorChannelVal) {
        result := ComCall(35, this, "int", NewMinMinorChannelVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} MaxMinorChannelVal 
     * @returns {HRESULT} 
     */
    get_MaxMinorChannel(MaxMinorChannelVal) {
        result := ComCall(36, this, "int*", MaxMinorChannelVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewMaxMinorChannelVal 
     * @returns {HRESULT} 
     */
    put_MaxMinorChannel(NewMaxMinorChannelVal) {
        result := ComCall(37, this, "int", NewMaxMinorChannelVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} MinPhysicalChannelVal 
     * @returns {HRESULT} 
     */
    get_MinPhysicalChannel(MinPhysicalChannelVal) {
        result := ComCall(38, this, "int*", MinPhysicalChannelVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewMinPhysicalChannelVal 
     * @returns {HRESULT} 
     */
    put_MinPhysicalChannel(NewMinPhysicalChannelVal) {
        result := ComCall(39, this, "int", NewMinPhysicalChannelVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} MaxPhysicalChannelVal 
     * @returns {HRESULT} 
     */
    get_MaxPhysicalChannel(MaxPhysicalChannelVal) {
        result := ComCall(40, this, "int*", MaxPhysicalChannelVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewMaxPhysicalChannelVal 
     * @returns {HRESULT} 
     */
    put_MaxPhysicalChannel(NewMaxPhysicalChannelVal) {
        result := ComCall(41, this, "int", NewMaxPhysicalChannelVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
