#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBDA_AutoDemodulate.ahk

/**
 * The IBDA_AutoDemodulateEx interface extends IBDA_AutoDemodulate.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_AutoDemodulateEx)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_autodemodulateex
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_AutoDemodulateEx extends IBDA_AutoDemodulate{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_AutoDemodulateEx
     * @type {Guid}
     */
    static IID => Guid("{34518d13-1182-48e6-b28f-b24987787326}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SupportedDeviceNodeTypes", "get_SupportedVideoFormats", "get_AuxInputCount"]

    /**
     * The get_SupportedDeviceNodeTypes method retrieves a list of the device node types that the demodulator supports.
     * @param {Integer} ulcDeviceNodeTypesMax Specifies the size of the <i>pguidDeviceNodeTypes</i> array.
     * @param {Pointer<Guid>} pguidDeviceNodeTypes Pointer to an array of GUIDs, or <b>NULL</b>.
     * @returns {Integer} If <i>pguidDeviceNodeTypes</i> is <b>NULL</b>, receives the number of device node types that the demodulator supports. If <i>pguidDeviceNodeTypes</i> is not <b>NULL</b>, receives the number of node types that were copied into the <i>pguidDeviceNodeTypes</i> array.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_autodemodulateex-get_supporteddevicenodetypes
     */
    get_SupportedDeviceNodeTypes(ulcDeviceNodeTypesMax, pguidDeviceNodeTypes) {
        result := ComCall(4, this, "uint", ulcDeviceNodeTypesMax, "uint*", &pulcDeviceNodeTypes := 0, "ptr", pguidDeviceNodeTypes, "HRESULT")
        return pulcDeviceNodeTypes
    }

    /**
     * The get_SupportedVideoFormats method retrieves the video formats that are supported by the demodulator.
     * @param {Pointer<Integer>} pulAMTunerModeType Pointer to a variable that receives a mask that indicates the frequency ranges that are supported by the BDA device filter. For a list of valid mask bits, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-amtunermodetype">AMTunerModeType Enumeration</a>.
     * @param {Pointer<Integer>} pulAnalogVideoStandard Pointer to a variable that receives a mask that indicates the analog television signal formats that are supported by the BDA device filter. For a list of valid mask bits, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-analogvideostandard">AnalogVideoStandard Enumeration</a>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_autodemodulateex-get_supportedvideoformats
     */
    get_SupportedVideoFormats(pulAMTunerModeType, pulAnalogVideoStandard) {
        pulAMTunerModeTypeMarshal := pulAMTunerModeType is VarRef ? "uint*" : "ptr"
        pulAnalogVideoStandardMarshal := pulAnalogVideoStandard is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pulAMTunerModeTypeMarshal, pulAMTunerModeType, pulAnalogVideoStandardMarshal, pulAnalogVideoStandard, "HRESULT")
        return result
    }

    /**
     * The get_AuxInputCount method retrieves a count of the number of auxiliary inputs on the demodulator.
     * @param {Pointer<Integer>} pulCompositeCount Pointer to a variable that receives a count of the number of composite-video input connectors on the device.
     * @param {Pointer<Integer>} pulSvideoCount Pointer to a variable that receives a count of the number of S-Video input connectors on the device.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_autodemodulateex-get_auxinputcount
     */
    get_AuxInputCount(pulCompositeCount, pulSvideoCount) {
        pulCompositeCountMarshal := pulCompositeCount is VarRef ? "uint*" : "ptr"
        pulSvideoCountMarshal := pulSvideoCount is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulCompositeCountMarshal, pulCompositeCount, pulSvideoCountMarshal, pulSvideoCount, "HRESULT")
        return result
    }
}
