#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005. The ITunerCap interface provides information about the capabilities of a BDA device filter that represents a TV tuner.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ITunerCap)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-itunercap
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ITunerCap extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITunerCap
     * @type {Guid}
     */
    static IID => Guid("{e60dfa45-8d56-4e65-a8ab-d6be9412c249}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SupportedNetworkTypes", "get_SupportedVideoFormats", "get_AuxInputCount"]

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @param {Integer} ulcNetworkTypesMax The maximum number of network-type GUIDs that the <i>pguidNetworkTypes</i> buffer can hold.
     * @param {Pointer<Guid>} pguidNetworkTypes Receives an array of network-type GUIDs. For the list of valid network-type GUIDs, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/default-tuning-spaces">Default Tuning Spaces</a>.
     * @returns {Integer} Receives a count of the number of network-type GUIDs actually written to the <i>pguidNetworkTypes</i> buffer.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-itunercap-get_supportednetworktypes
     */
    get_SupportedNetworkTypes(ulcNetworkTypesMax, pguidNetworkTypes) {
        result := ComCall(3, this, "uint", ulcNetworkTypesMax, "uint*", &pulcNetworkTypes := 0, "ptr", pguidNetworkTypes, "HRESULT")
        return pulcNetworkTypes
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @param {Pointer<Integer>} pulAMTunerModeType Receives a bitmask that indicates the frequency ranges that are supported by the BDA device filter. For a list of valid mask bits, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-amtunermodetype">AMTunerModeType Enumeration</a>.
     * @param {Pointer<Integer>} pulAnalogVideoStandard Receives a bitmask that indicates the analog television signal formats that are supported by the BDA device filter. For a list of valid mask bits, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-analogvideostandard">AnalogVideoStandard Enumeration</a>.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-itunercap-get_supportedvideoformats
     */
    get_SupportedVideoFormats(pulAMTunerModeType, pulAnalogVideoStandard) {
        pulAMTunerModeTypeMarshal := pulAMTunerModeType is VarRef ? "uint*" : "ptr"
        pulAnalogVideoStandardMarshal := pulAnalogVideoStandard is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulAMTunerModeTypeMarshal, pulAMTunerModeType, pulAnalogVideoStandardMarshal, pulAnalogVideoStandard, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @param {Pointer<Integer>} pulCompositeCount Receives a count of the number of composite-video input connectors on the device.
     * @param {Pointer<Integer>} pulSvideoCount Receives a count of the number of S-video input connectors on the device.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-itunercap-get_auxinputcount
     */
    get_AuxInputCount(pulCompositeCount, pulSvideoCount) {
        pulCompositeCountMarshal := pulCompositeCount is VarRef ? "uint*" : "ptr"
        pulSvideoCountMarshal := pulSvideoCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pulCompositeCountMarshal, pulCompositeCount, pulSvideoCountMarshal, pulSvideoCount, "HRESULT")
        return result
    }
}
