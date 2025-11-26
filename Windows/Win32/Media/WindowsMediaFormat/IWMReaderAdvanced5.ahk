#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMReaderAdvanced4.ahk

/**
 * The IWMReaderAdvanced5 interface enables you to associate a player-hook callback interface with the reader object.An IWMReaderAdvanced5 interface exists for every reader object.
 * @remarks
 * 
 * A player-hook callback can be assigned in the reader object to enable per-sample processing when using DirectX Video Acceleration.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreaderadvanced5
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderAdvanced5 extends IWMReaderAdvanced4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMReaderAdvanced5
     * @type {Guid}
     */
    static IID => Guid("{24c44db0-55d1-49ae-a5cc-f13815e36363}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 49

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPlayerHook"]

    /**
     * The SetPlayerHook method assigns a player-hook callback to the reader. The reader calls the callback method before sending each sample to the graphics processor for decompression.
     * @param {Integer} dwOutputNum The output number to which the player-hook callback applies.
     * @param {IWMPlayerHook} pHook Pointer to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmplayerhook">IWMPlayerHook</a> interface that will be used in association with the specified output.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderadvanced5-setplayerhook
     */
    SetPlayerHook(dwOutputNum, pHook) {
        result := ComCall(49, this, "uint", dwOutputNum, "ptr", pHook, "HRESULT")
        return result
    }
}
