#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMTimecodeDisplay interface controls an external SMPTE/MIDI timecode display device.DirectShow currently does not provide any filters that implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamtimecodedisplay
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMTimecodeDisplay extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMTimecodeDisplay
     * @type {Guid}
     */
    static IID => Guid("{9b496ce2-811b-11cf-8c77-00aa006b6814}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTCDisplayEnable", "SetTCDisplayEnable", "GetTCDisplay", "SetTCDisplay"]

    /**
     * The GetTCDisplayEnable method determines whether an external device's timecode character generator output is enabled or disabled.
     * @returns {Integer} Pointer to a value indicating whether timecode character generator output is enabled. OATRUE indicates enabled; OAFALSE indicates disabled.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtimecodedisplay-gettcdisplayenable
     */
    GetTCDisplayEnable() {
        result := ComCall(3, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * The SetTCDisplayEnable method enables or disables an external device's timecode character output generator.
     * @param {Integer} State Value specifying whether to enable or disable the timecode character output generator. Specify OATRUE to enable or OAFALSE to disable.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtimecodedisplay-settcdisplayenable
     */
    SetTCDisplayEnable(State) {
        result := ComCall(4, this, "int", State, "HRESULT")
        return result
    }

    /**
     * The GetTCDisplay method retrieves current settings of the timecode character generator output.
     * @param {Integer} Param Timecode display characteristic. Specify one of the following items you want to get settings for.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_TCD_BORDER</td>
     * <td>White border for black characters, black border for white characters.</td>
     * </tr>
     * <tr>
     * <td>ED_TCD_INTENSITY</td>
     * <td>Intensity (brightness) of characters.</td>
     * </tr>
     * <tr>
     * <td>ED_TCD_INVERT</td>
     * <td>Black characters on white background or white characters on black background.</td>
     * </tr>
     * <tr>
     * <td>ED_TCD_POSITION</td>
     * <td>Position of characters.</td>
     * </tr>
     * <tr>
     * <td>ED_TCD_SIZE</td>
     * <td>Size of characters.</td>
     * </tr>
     * <tr>
     * <td>ED_TCD_SOURCE</td>
     * <td>Source of display's data.</td>
     * </tr>
     * <tr>
     * <td>ED_TCD_TRANSPARENCY</td>
     * <td>Transparency of characters.</td>
     * </tr>
     * </table>
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtimecodedisplay-gettcdisplay
     */
    GetTCDisplay(Param) {
        result := ComCall(5, this, "int", Param, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The SetTCDisplay method sets the timecode character generator output characteristics.
     * @param {Integer} Param Timecode display characteristic. Specify one of the following properties you want to set properties for.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_TCD_BORDER</td>
     * <td>White border for black characters, black border for white characters</td>
     * </tr>
     * <tr>
     * <td>ED_TCD_INTENSITY</td>
     * <td>Intensity (brightness) of characters</td>
     * </tr>
     * <tr>
     * <td>ED_TCD_INVERT</td>
     * <td>Black characters on white background or white characters on black background</td>
     * </tr>
     * <tr>
     * <td>ED_TCD_POSITION</td>
     * <td>Position of characters</td>
     * </tr>
     * <tr>
     * <td>ED_TCD_SIZE</td>
     * <td>Size of characters</td>
     * </tr>
     * <tr>
     * <td>ED_TCD_SOURCE</td>
     * <td>Source of the display's data</td>
     * </tr>
     * <tr>
     * <td>ED_TCD_TRANSPARENCY</td>
     * <td>Transparency of characters</td>
     * </tr>
     * </table>
     * @param {Integer} Value Setting of the parameter specified in <i>Param</i>. Must be one of the following:
     * 
     * If ED_TCD_SOURCE specified in <i>Param</i>, set one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_TCG</td>
     * <td>Timecode generator</td>
     * </tr>
     * <tr>
     * <td>ED_TCR</td>
     * <td>Timecode reader</td>
     * </tr>
     * </table>
     *  
     * 
     * If ED_TCD_SIZE is specified in <i>Param</i>, set one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_LARGE</td>
     * <td>Large</td>
     * </tr>
     * <tr>
     * <td>ED_MED</td>
     * <td>Medium</td>
     * </tr>
     * <tr>
     * <td>ED_SMALL</td>
     * <td>Small</td>
     * </tr>
     * </table>
     *  
     * 
     * If ED_TCD_POSITION specified in <i>Param</i>, set one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_BOTTOM</td>
     * <td>Bottom</td>
     * </tr>
     * <tr>
     * <td>ED_MIDDLE</td>
     * <td>Middle</td>
     * </tr>
     * <tr>
     * <td>ED_TOP</td>
     * <td>Top</td>
     * </tr>
     * </table>
     *  
     * 
     * in combination with one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_CENTER</td>
     * <td>Center</td>
     * </tr>
     * <tr>
     * <td>ED_LEFT</td>
     * <td>Left</td>
     * </tr>
     * <tr>
     * <td>ED_RIGHT</td>
     * <td>Right</td>
     * </tr>
     * </table>
     *  
     * 
     * If ED_TCD_INTENSITY is specified in <i>Param</i>, set one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_HIGH</td>
     * <td>High</td>
     * </tr>
     * <tr>
     * <td>ED_LOW</td>
     * <td>Low</td>
     * </tr>
     * </table>
     *  
     * 
     * If ED_TCD_TRANSPARENCY is specified in <i>Param</i>, set a value from 0 to 4, 0 being completely opaque, 4 being as dark as possible.
     * 
     * If ED_TCD_INVERT is specified in <i>Param</i>, set one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>OAFALSE</td>
     * <td>Black on white</td>
     * </tr>
     * <tr>
     * <td>OATRUE</td>
     * <td>White on black</td>
     * </tr>
     * </table>
     *  
     * 
     * If ED_TCD_BORDER is specified in <i>Param</i>, set one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>OAFALSE</td>
     * <td>Black characters for white border</td>
     * </tr>
     * <tr>
     * <td>OATRUE</td>
     * <td>White border for black characters</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamtimecodedisplay-settcdisplay
     */
    SetTCDisplay(Param, Value) {
        result := ComCall(6, this, "int", Param, "int", Value, "HRESULT")
        return result
    }
}
