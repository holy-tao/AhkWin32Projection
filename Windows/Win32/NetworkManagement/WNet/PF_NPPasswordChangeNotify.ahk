#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 */
class PF_NPPasswordChangeNotify extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {PWSTR} lpAuthentInfoType 
     * @param {Pointer<Void>} lpAuthentInfo 
     * @param {PWSTR} lpPreviousAuthentInfoType 
     * @param {Pointer<Void>} lpPreviousAuthentInfo 
     * @param {PWSTR} lpStationName 
     * @param {Pointer<Void>} StationHandle 
     * @param {Integer} dwChangeInfo 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpAuthentInfoType, lpAuthentInfo, lpPreviousAuthentInfoType, lpPreviousAuthentInfo, lpStationName, StationHandle, dwChangeInfo) {
        lpAuthentInfoType := lpAuthentInfoType is String ? StrPtr(lpAuthentInfoType) : lpAuthentInfoType
        lpPreviousAuthentInfoType := lpPreviousAuthentInfoType is String ? StrPtr(lpPreviousAuthentInfoType) : lpPreviousAuthentInfoType
        lpStationName := lpStationName is String ? StrPtr(lpStationName) : lpStationName

        lpAuthentInfoMarshal := lpAuthentInfo is VarRef ? "ptr" : "ptr"
        lpPreviousAuthentInfoMarshal := lpPreviousAuthentInfo is VarRef ? "ptr" : "ptr"
        StationHandleMarshal := StationHandle is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", lpAuthentInfoType, lpAuthentInfoMarshal, lpAuthentInfo, "ptr", lpPreviousAuthentInfoType, lpPreviousAuthentInfoMarshal, lpPreviousAuthentInfo, "ptr", lpStationName, StationHandleMarshal, StationHandle, "uint", dwChangeInfo, "uint")
        return result
    }
}
