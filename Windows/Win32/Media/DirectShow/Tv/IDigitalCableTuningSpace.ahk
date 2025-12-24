#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IATSCTuningSpace.ahk

/**
 * The IDigitalCableTuningSpace interface is implemented on the DigitalTuningSpace object and provides methods for working with tuning spaces that have a digital cable network type.
 * @remarks
 * 
 * To set minimum and maximum values for the virtual channel number, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ianalogtvtuningspace-put_minchannel">IAnalogTVTuningSpace::put_MinChannel</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ianalogtvtuningspace-put_maxchannel">IAnalogTVTuningSpace::put_MaxChannel</a> methods. (This interface inherits <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ianalogtvtuningspace">IAnalogTVTuningSpace</a> through <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-iatsctuningspace">IATSCTuningSpace</a>.)
 *       
 * 
 * To set minimum and maximum values for the minor channel number, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-iatsctuningspace-put_minminorchannel">IATSCTuningSpace::put_MinMinorChannel</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-iatsctuningspace-put_maxminorchannel">IATSCTuningSpace::put_MaxMinorChannel</a> methods.
 *       
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDigitalCableTuningSpace)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-idigitalcabletuningspace
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDigitalCableTuningSpace extends IATSCTuningSpace{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDigitalCableTuningSpace
     * @type {Guid}
     */
    static IID => Guid("{013f9f9c-b449-4ec7-a6d2-9d4f2fc70ae5}")

    /**
     * The class identifier for DigitalCableTuningSpace
     * @type {Guid}
     */
    static CLSID => Guid("{d9bb4cee-b87a-47f1-ac92-b08d9c7813fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 42

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MinMajorChannel", "put_MinMajorChannel", "get_MaxMajorChannel", "put_MaxMajorChannel", "get_MinSourceID", "put_MinSourceID", "get_MaxSourceID", "put_MaxSourceID"]

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
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idigitalcabletuningspace-get_minmajorchannel
     */
    get_MinMajorChannel() {
        result := ComCall(42, this, "int*", &MinMajorChannelVal := 0, "HRESULT")
        return MinMajorChannelVal
    }

    /**
     * The put_MinMajorChannel method sets the lowest major channel number for this tuning space.
     * @param {Integer} NewMinMajorChannelVal Specifies the lowest major channel number.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idigitalcabletuningspace-put_minmajorchannel
     */
    put_MinMajorChannel(NewMinMajorChannelVal) {
        result := ComCall(43, this, "int", NewMinMajorChannelVal, "HRESULT")
        return result
    }

    /**
     * The get_MaxMajorChannel method retrieves the highest major channel number for this tuning space.
     * @returns {Integer} Receives the highest major channel number.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idigitalcabletuningspace-get_maxmajorchannel
     */
    get_MaxMajorChannel() {
        result := ComCall(44, this, "int*", &MaxMajorChannelVal := 0, "HRESULT")
        return MaxMajorChannelVal
    }

    /**
     * The put_MaxMajorChannel method sets the highest major channel number for this tuning space.
     * @param {Integer} NewMaxMajorChannelVal Specifies the highest major channel number.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idigitalcabletuningspace-put_maxmajorchannel
     */
    put_MaxMajorChannel(NewMaxMajorChannelVal) {
        result := ComCall(45, this, "int", NewMaxMajorChannelVal, "HRESULT")
        return result
    }

    /**
     * The get_MinSourceID method retrieves the lowest source identifier for this tuning space.
     * @returns {Integer} Receives the lowest source identifier.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idigitalcabletuningspace-get_minsourceid
     */
    get_MinSourceID() {
        result := ComCall(46, this, "int*", &MinSourceIDVal := 0, "HRESULT")
        return MinSourceIDVal
    }

    /**
     * The put_MinSourceID method sets the lowest source identifier for this tuning space.
     * @param {Integer} NewMinSourceIDVal Specifies the lowest source identifier.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idigitalcabletuningspace-put_minsourceid
     */
    put_MinSourceID(NewMinSourceIDVal) {
        result := ComCall(47, this, "int", NewMinSourceIDVal, "HRESULT")
        return result
    }

    /**
     * The get_MaxSourceID method retrieves the highest source identifier for this tuning space.
     * @returns {Integer} Receives the highest source identifier.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idigitalcabletuningspace-get_maxsourceid
     */
    get_MaxSourceID() {
        result := ComCall(48, this, "int*", &MaxSourceIDVal := 0, "HRESULT")
        return MaxSourceIDVal
    }

    /**
     * The put_MaxSourceID method sets the highest source identifier for this tuning space.
     * @param {Integer} NewMaxSourceIDVal Specifies the highest source identifier.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idigitalcabletuningspace-put_maxsourceid
     */
    put_MaxSourceID(NewMaxSourceIDVal) {
        result := ComCall(49, this, "int", NewMaxSourceIDVal, "HRESULT")
        return result
    }
}
