#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PCLUSAPI_RESTORE_CLUSTER_DATABASE extends IUnknown {

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
     * @param {PWSTR} lpszPathName 
     * @param {BOOL} bForce 
     * @param {PWSTR} lpszQuorumDriveLetter 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpszPathName, bForce, lpszQuorumDriveLetter) {
        lpszPathName := lpszPathName is String ? StrPtr(lpszPathName) : lpszPathName
        lpszQuorumDriveLetter := lpszQuorumDriveLetter is String ? StrPtr(lpszQuorumDriveLetter) : lpszQuorumDriveLetter

        result := ComCall(3, this, "ptr", lpszPathName, "int", bForce, "ptr", lpszQuorumDriveLetter, "uint")
        return result
    }
}
