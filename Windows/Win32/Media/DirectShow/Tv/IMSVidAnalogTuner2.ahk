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
     * @type {Integer} 
     */
    TVFormats {
        get => this.get_TVFormats()
    }

    /**
     * @type {Integer} 
     */
    TunerModes {
        get => this.get_TunerModes()
    }

    /**
     * @type {Integer} 
     */
    NumAuxInputs {
        get => this.get_NumAuxInputs()
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Pointer to a variable that receives the formats flag. Possible values are the sum of one or more of the values in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0x00000000</td>
     * <td>Digital sensor</td>
     * </tr>
     * <tr>
     * <td>0x00000001</td>
     * <td>NTSC (M) standard, 7.5 IRE black</td>
     * </tr>
     * <tr>
     * <td>0x00000002</td>
     * <td>NTSC (M) standard, 0 IRE black (Japan)</td>
     * </tr>
     * <tr>
     * <td>0x00000004</td>
     * <td>NTSC-433</td>
     * </tr>
     * <tr>
     * <td>0x00000010</td>
     * <td>PAL-B standard</td>
     * </tr>
     * <tr>
     * <td>0x00000020</td>
     * <td>PAL (D) standard</td>
     * </tr>
     * <tr>
     * <td>0x00000080</td>
     * <td>PAL (H) standard</td>
     * </tr>
     * <tr>
     * <td>0x00000100</td>
     * <td>PAL (I) standard</td>
     * </tr>
     * <tr>
     * <td>0x00000200</td>
     * <td>PAL (M) standard</td>
     * </tr>
     * <tr>
     * <td>0x00000400</td>
     * <td>PAL (N) standard</td>
     * </tr>
     * <tr>
     * <td>0x00000800</td>
     * <td>PAL-60 standard</td>
     * </tr>
     * <tr>
     * <td>0x00001000</td>
     * <td>SECAM (B) standard</td>
     * </tr>
     * <tr>
     * <td>0x00002000</td>
     * <td>SECAM (D) standard</td>
     * </tr>
     * <tr>
     * <td>0x00004000</td>
     * <td>SECAM (G) standard</td>
     * </tr>
     * <tr>
     * <td>0x00008000</td>
     * <td>SECAM (H) standard</td>
     * </tr>
     * <tr>
     * <td>0x00010000</td>
     * <td>SECAM (K) standard</td>
     * </tr>
     * <tr>
     * <td>0x00020000</td>
     * <td>SECAM (K1) standard</td>
     * </tr>
     * <tr>
     * <td>0x00040000</td>
     * <td>SECAM (L) standard</td>
     * </tr>
     * <tr>
     * <td>0x00080000</td>
     * <td>SECAM (L1) standard</td>
     * </tr>
     * <tr>
     * <td>0x00100000</td>
     * <td>Combination (N) PAL standard (Argentina)</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidanalogtuner2-get_tvformats
     */
    get_TVFormats() {
        result := ComCall(31, this, "int*", &Formats := 0, "HRESULT")
        return Formats
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Pointer to a variable that receives the modes flag. Possible values are the sum of one or more of the values in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0x0000</td>
     * <td>Default tuner mode.</td>
     * </tr>
     * <tr>
     * <td>0x0001</td>
     * <td>TV tuner mode.</td>
     * </tr>
     * <tr>
     * <td>0x0002</td>
     * <td>FM radio tuner mode.</td>
     * </tr>
     * <tr>
     * <td>0x0004</td>
     * <td>AM radio tuner mode.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidanalogtuner2-get_tunermodes
     */
    get_TunerModes() {
        result := ComCall(32, this, "int*", &Modes := 0, "HRESULT")
        return Modes
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @returns {Integer} Pointer to a variable that receives the number of auxiliary inputs.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidanalogtuner2-get_numauxinputs
     */
    get_NumAuxInputs() {
        result := ComCall(33, this, "int*", &Inputs := 0, "HRESULT")
        return Inputs
    }
}
