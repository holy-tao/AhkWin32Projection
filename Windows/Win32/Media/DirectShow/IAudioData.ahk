#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Audio\WAVEFORMATEX.ahk
#Include .\IMemoryData.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//austream/nn-austream-iaudiodata
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAudioData extends IMemoryData{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioData
     * @type {Guid}
     */
    static IID => Guid("{54c719c0-af60-11d0-8212-00c04fc32c45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFormat", "SetFormat"]

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetFormat method retrieves the current data format.
     * @returns {WAVEFORMATEX} Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure that contains the current data format.
     * @see https://docs.microsoft.com/windows/win32/api//austream/nf-austream-iaudiodata-getformat
     */
    GetFormat() {
        pWaveFormatCurrent := WAVEFORMATEX()
        result := ComCall(6, this, "ptr", pWaveFormatCurrent, "HRESULT")
        return pWaveFormatCurrent
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The SetFormat method sets the current data format.
     * @param {Pointer<WAVEFORMATEX>} lpWaveFormat Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure that will contain the current data format.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value, which can include the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//austream/nf-austream-iaudiodata-setformat
     */
    SetFormat(lpWaveFormat) {
        result := ComCall(7, this, "ptr", lpWaveFormat, "HRESULT")
        return result
    }
}
