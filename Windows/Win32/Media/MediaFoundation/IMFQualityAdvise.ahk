#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables the quality manager to adjust the audio or video quality of a component in the pipeline.
 * @remarks
 * 
 * The quality manager typically obtains this interface when the quality manager's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfqualitymanager-notifytopology">IMFQualityManager::NotifyTopology</a> method is called.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfqualityadvise
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFQualityAdvise extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFQualityAdvise
     * @type {Guid}
     */
    static IID => Guid("{ec15e2e9-e36b-4f7c-8758-77d452ef4ce7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDropMode", "SetQualityLevel", "GetDropMode", "GetQualityLevel", "DropTime"]

    /**
     * Sets the drop mode. In drop mode, a component drops samples, more or less aggressively depending on the level of the drop mode.
     * @param {Integer} eDropMode Requested drop mode, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_quality_drop_mode">MF_QUALITY_DROP_MODE</a> enumeration.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NO_MORE_DROP_MODES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The component does not support the specified mode or any higher modes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfqualityadvise-setdropmode
     */
    SetDropMode(eDropMode) {
        result := ComCall(3, this, "int", eDropMode, "HRESULT")
        return result
    }

    /**
     * Sets the quality level. The quality level determines how the component consumes or produces samples.
     * @param {Integer} eQualityLevel Requested quality level, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_quality_level">MF_QUALITY_LEVEL</a> enumeration.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NO_MORE_QUALITY_LEVELS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The component does not support the specified quality level or any levels below it.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfqualityadvise-setqualitylevel
     */
    SetQualityLevel(eQualityLevel) {
        result := ComCall(4, this, "int", eQualityLevel, "HRESULT")
        return result
    }

    /**
     * Retrieves the current drop mode.
     * @returns {Integer} Receives the drop mode, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_quality_drop_mode">MF_QUALITY_DROP_MODE</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfqualityadvise-getdropmode
     */
    GetDropMode() {
        result := ComCall(5, this, "int*", &peDropMode := 0, "HRESULT")
        return peDropMode
    }

    /**
     * Retrieves the current quality level.
     * @returns {Integer} Receives the quality level, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_quality_level">MF_QUALITY_LEVEL</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfqualityadvise-getqualitylevel
     */
    GetQualityLevel() {
        result := ComCall(6, this, "int*", &peQualityLevel := 0, "HRESULT")
        return peQualityLevel
    }

    /**
     * Drops samples over a specified interval of time.
     * @param {Integer} hnsAmountToDrop Amount of time to drop, in 100-nanosecond units. This value is always absolute. If the method is called multiple times, do not add the times from previous calls.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_DROPTIME_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object does not support this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfqualityadvise-droptime
     */
    DropTime(hnsAmountToDrop) {
        result := ComCall(7, this, "int64", hnsAmountToDrop, "HRESULT")
        return result
    }
}
