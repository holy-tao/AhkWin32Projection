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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner2-get_tvformats
     */
    get_TVFormats() {
        result := ComCall(31, this, "int*", &Formats := 0, "HRESULT")
        return Formats
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner2-get_tunermodes
     */
    get_TunerModes() {
        result := ComCall(32, this, "int*", &Modes := 0, "HRESULT")
        return Modes
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidanalogtuner2-get_numauxinputs
     */
    get_NumAuxInputs() {
        result := ComCall(33, this, "int*", &Inputs := 0, "HRESULT")
        return Inputs
    }
}
