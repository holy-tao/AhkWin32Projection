#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Passes configuration information to the media sinks that are used for streaming the content.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfstreamingsinkconfig
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFStreamingSinkConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFStreamingSinkConfig
     * @type {Guid}
     */
    static IID => Guid("{9db7aa41-3cc5-40d4-8509-555804ad34cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartStreaming"]

    /**
     * Called by the streaming media client before the Media Session starts streaming to specify the byte offset or the time offset.
     * @param {BOOL} fSeekOffsetIsByteOffset A Boolean value that specifies whether <i>qwSeekOffset</i> gives a byte offset of a time offset.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>qwSeekOffset</i> parameter specifies a byte offset.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>qwSeekOffset</i> parameter specifies the time position in 100-nanosecond units.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} qwSeekOffset A byte offset or a time offset, depending on the value passed in <i>fSeekOffsetIsByteOffset</i>.  Time offsets are specified in
     *     100-nanosecond units.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfstreamingsinkconfig-startstreaming
     */
    StartStreaming(fSeekOffsetIsByteOffset, qwSeekOffset) {
        result := ComCall(3, this, "int", fSeekOffsetIsByteOffset, "uint", qwSeekOffset, "HRESULT")
        return result
    }
}
