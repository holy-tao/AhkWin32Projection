#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls the speed of the video decoder.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-iwmvideodecoderhurryup
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMVideoDecoderHurryup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMVideoDecoderHurryup
     * @type {Guid}
     */
    static IID => Guid("{352bb3bd-2d4d-4323-9e71-dcdcfbd53ca6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetHurryup", "GetHurryup"]

    /**
     * Sets the speed mode of the video decoder.
     * @param {Integer} lHurryup The speed mode of the video decoder.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1 (default)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder will determine the decoding speed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder will decode in real time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1 to 4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder will decode faster than real time. The higher the value, the faster the decoding.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmvideodecoderhurryup-sethurryup
     */
    SetHurryup(lHurryup) {
        result := ComCall(3, this, "int", lHurryup, "HRESULT")
        return result
    }

    /**
     * Retrieves the current speed mode of the video decoder.
     * @param {Pointer<Integer>} plHurryup Address of a variable that receives the decoder speed mode.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1 (default)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder will determine the decoding speed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder will decode in real time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1 to 4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decoder will decode faster than real time.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-iwmvideodecoderhurryup-gethurryup
     */
    GetHurryup(plHurryup) {
        plHurryupMarshal := plHurryup is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, plHurryupMarshal, plHurryup, "HRESULT")
        return result
    }
}
