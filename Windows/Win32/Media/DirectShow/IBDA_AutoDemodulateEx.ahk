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
     * 
     * @param {Integer} ulcDeviceNodeTypesMax 
     * @param {Pointer<Integer>} pulcDeviceNodeTypes 
     * @param {Pointer<Guid>} pguidDeviceNodeTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_autodemodulateex-get_supporteddevicenodetypes
     */
    get_SupportedDeviceNodeTypes(ulcDeviceNodeTypesMax, pulcDeviceNodeTypes, pguidDeviceNodeTypes) {
        pulcDeviceNodeTypesMarshal := pulcDeviceNodeTypes is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", ulcDeviceNodeTypesMax, pulcDeviceNodeTypesMarshal, pulcDeviceNodeTypes, "ptr", pguidDeviceNodeTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulAMTunerModeType 
     * @param {Pointer<Integer>} pulAnalogVideoStandard 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_autodemodulateex-get_supportedvideoformats
     */
    get_SupportedVideoFormats(pulAMTunerModeType, pulAnalogVideoStandard) {
        pulAMTunerModeTypeMarshal := pulAMTunerModeType is VarRef ? "uint*" : "ptr"
        pulAnalogVideoStandardMarshal := pulAnalogVideoStandard is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pulAMTunerModeTypeMarshal, pulAMTunerModeType, pulAnalogVideoStandardMarshal, pulAnalogVideoStandard, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulCompositeCount 
     * @param {Pointer<Integer>} pulSvideoCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_autodemodulateex-get_auxinputcount
     */
    get_AuxInputCount(pulCompositeCount, pulSvideoCount) {
        pulCompositeCountMarshal := pulCompositeCount is VarRef ? "uint*" : "ptr"
        pulSvideoCountMarshal := pulSvideoCount is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulCompositeCountMarshal, pulCompositeCount, pulSvideoCountMarshal, pulSvideoCount, "HRESULT")
        return result
    }
}
