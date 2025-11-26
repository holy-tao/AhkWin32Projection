#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IAudioProcessingObjectConfiguration interface is used to configure the APO. This interface uses its methods to lock and unlock the APO for processing.
 * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nn-audioenginebaseapo-iaudioprocessingobjectconfiguration
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioProcessingObjectConfiguration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioProcessingObjectConfiguration
     * @type {Guid}
     */
    static IID => Guid("{0e5ed805-aba6-49c3-8f9a-2b8c889c4fa8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LockForProcess", "UnlockForProcess"]

    /**
     * The LockForProcess method is used to verify that the APO is locked and ready to process data.
     * @param {Integer} u32NumInputConnections Number of input connections that are attached to this APO.
     * @param {Pointer<Pointer<APO_CONNECTION_DESCRIPTOR>>} ppInputConnections Connection descriptor for each input connection that is attached to this APO.
     * @param {Integer} u32NumOutputConnections Number of output connections that are attached to this APO.
     * @param {Pointer<Pointer<APO_CONNECTION_DESCRIPTOR>>} ppOutputConnections Connection descriptor for each output connection that is attached to this APO.
     * @returns {HRESULT} The <code>LockForProcess</code> method returns a value of S_OK if the call is completed successfully. At this stage, the APO is locked and is ready to process data.
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
     * Invalid pointer was passed to function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>APOERR_INVALID_CONNECITON_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid connection format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>APOERR_NUM_CONNECTIONS_INVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Number of input or output connections not valid on this APO.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>APOERR_APO_LOCKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * APO is already locked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other HRESULTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * These failures will be tracked by the audio engine.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobjectconfiguration-lockforprocess
     */
    LockForProcess(u32NumInputConnections, ppInputConnections, u32NumOutputConnections, ppOutputConnections) {
        ppInputConnectionsMarshal := ppInputConnections is VarRef ? "ptr*" : "ptr"
        ppOutputConnectionsMarshal := ppOutputConnections is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "uint", u32NumInputConnections, ppInputConnectionsMarshal, ppInputConnections, "uint", u32NumOutputConnections, ppOutputConnectionsMarshal, ppOutputConnections, "HRESULT")
        return result
    }

    /**
     * The UnlockForProcess method releases the lock that was imposed on the APO by the LockForProcess method.
     * @returns {HRESULT} The <code>UnlockForProcess</code> method returns a value of S_OK if the call completed successfully. If the APO was already unlocked when the call was made, the method returns a value of APOERR_ALREADY_UNLOCKED.
     * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobjectconfiguration-unlockforprocess
     */
    UnlockForProcess() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
