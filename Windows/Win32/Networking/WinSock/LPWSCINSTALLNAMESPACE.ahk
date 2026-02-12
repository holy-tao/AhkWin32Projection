#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPWSCINSTALLNAMESPACE extends IUnknown {

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
     * @param {PWSTR} lpszIdentifier 
     * @param {PWSTR} lpszPathName 
     * @param {Integer} dwNameSpace 
     * @param {Integer} dwVersion 
     * @param {Pointer<Guid>} lpProviderId 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpszIdentifier, lpszPathName, dwNameSpace, dwVersion, lpProviderId) {
        lpszIdentifier := lpszIdentifier is String ? StrPtr(lpszIdentifier) : lpszIdentifier
        lpszPathName := lpszPathName is String ? StrPtr(lpszPathName) : lpszPathName

        result := ComCall(3, this, "ptr", lpszIdentifier, "ptr", lpszPathName, "uint", dwNameSpace, "uint", dwVersion, "ptr", lpProviderId, "int")
        return result
    }
}
