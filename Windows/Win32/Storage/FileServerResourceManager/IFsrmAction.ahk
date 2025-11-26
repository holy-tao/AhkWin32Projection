#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The base class for all FSRM action interfaces.
 * @remarks
 * 
 * The FSRM server starts the action in response to quota or file screen event (for example, a directory size 
 *     exceeds a directory quota threshold or detection of a restricted file).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmaction
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmAction extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmAction
     * @type {Guid}
     */
    static IID => Guid("{6cd6408a-ae60-463b-9ef1-e117534d69dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_ActionType", "get_RunLimitInterval", "put_RunLimitInterval", "Delete"]

    /**
     * @type {Guid} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Integer} 
     */
    ActionType {
        get => this.get_ActionType()
    }

    /**
     * @type {Integer} 
     */
    RunLimitInterval {
        get => this.get_RunLimitInterval()
        set => this.put_RunLimitInterval(value)
    }

    /**
     * Retrieves the identifier of the action.
     * @returns {Guid} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmaction-get_id
     */
    get_Id() {
        id := Guid()
        result := ComCall(7, this, "ptr", id, "HRESULT")
        return id
    }

    /**
     * Retrieves the action's type.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmaction-get_actiontype
     */
    get_ActionType() {
        result := ComCall(8, this, "int*", &actionType := 0, "HRESULT")
        return actionType
    }

    /**
     * Retrieves or sets the interval that must expire before the action is run again.
     * @remarks
     * 
     * This property specifies the interval that should occur before the action is run again. For example, if the 
     *     interval has expired since the action last ran, the server will run the action again in response to an event; 
     *     otherwise, the server cannot run the action again.
     * 
     * You can specify the interval as follows.
     * 
     * <table>
     * <tr>
     * <th>Interval</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * –1
     * 
     * </td>
     * <td>
     * Use the global run-time limit. For a description, see the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmsetting-setactionrunlimitinterval">IFsrmSetting::SetActionRunLimitInterval</a> 
     *        method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * Run the action for each quota or file screen event.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * &gt;0
     * 
     * </td>
     * <td>
     * If an event occurs during this interval, do not run the action again. The interval timer starts when the 
     *        action begins. When the interval expires, the timer is reset.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmaction-get_runlimitinterval
     */
    get_RunLimitInterval() {
        result := ComCall(9, this, "int*", &minutes := 0, "HRESULT")
        return minutes
    }

    /**
     * Retrieves or sets the interval that must expire before the action is run again.
     * @remarks
     * 
     * This property specifies the interval that should occur before the action is run again. For example, if the 
     *     interval has expired since the action last ran, the server will run the action again in response to an event; 
     *     otherwise, the server cannot run the action again.
     * 
     * You can specify the interval as follows.
     * 
     * <table>
     * <tr>
     * <th>Interval</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * –1
     * 
     * </td>
     * <td>
     * Use the global run-time limit. For a description, see the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmsetting-setactionrunlimitinterval">IFsrmSetting::SetActionRunLimitInterval</a> 
     *        method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 0
     * 
     * </td>
     * <td>
     * Run the action for each quota or file screen event.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * &gt;0
     * 
     * </td>
     * <td>
     * If an event occurs during this interval, do not run the action again. The interval timer starts when the 
     *        action begins. When the interval expires, the timer is reset.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @param {Integer} minutes 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmaction-put_runlimitinterval
     */
    put_RunLimitInterval(minutes) {
        result := ComCall(10, this, "int", minutes, "HRESULT")
        return result
    }

    /**
     * Removes the action from the quota or file screen's list of actions.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrm/nf-fsrm-ifsrmaction-delete
     */
    Delete() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
