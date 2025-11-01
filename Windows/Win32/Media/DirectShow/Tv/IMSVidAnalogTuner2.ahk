#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidAnalogTuner.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later. The IMSVidAnalogTuner2 interface represents an analog-only tuner card that does not support the Broadcast Driver Architecture (BDA).
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidAnalogTuner2)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidanalogtuner2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidAnalogTuner2 extends IMSVidAnalogTuner{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidAnalogTuner2
     * @type {Guid}
     */
    static IID => Guid("{37647bf7-3dde-4cc8-a4dc-0d534d3d0037}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 31

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TVFormats", "get_TunerModes", "get_NumAuxInputs"]

    /**
     * 
     * @param {Pointer<Integer>} Formats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner2-get_tvformats
     */
    get_TVFormats(Formats) {
        FormatsMarshal := Formats is VarRef ? "int*" : "ptr"

        result := ComCall(31, this, FormatsMarshal, Formats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Modes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner2-get_tunermodes
     */
    get_TunerModes(Modes) {
        ModesMarshal := Modes is VarRef ? "int*" : "ptr"

        result := ComCall(32, this, ModesMarshal, Modes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Inputs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner2-get_numauxinputs
     */
    get_NumAuxInputs(Inputs) {
        InputsMarshal := Inputs is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, InputsMarshal, Inputs, "HRESULT")
        return result
    }
}
