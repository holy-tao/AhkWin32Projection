#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Mapi
 * @version v4.0.30319
 */
class LPMAPILOGON extends IUnknown {

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
     * @param {Pointer} ulUIParam 
     * @param {PSTR} lpszProfileName 
     * @param {PSTR} lpszPassword 
     * @param {Integer} flFlags 
     * @param {Integer} ulReserved 
     * @param {Pointer<Pointer>} lplhSession 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ulUIParam, lpszProfileName, lpszPassword, flFlags, ulReserved, lplhSession) {
        lpszProfileName := lpszProfileName is String ? StrPtr(lpszProfileName) : lpszProfileName
        lpszPassword := lpszPassword is String ? StrPtr(lpszPassword) : lpszPassword

        lplhSessionMarshal := lplhSession is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", ulUIParam, "ptr", lpszProfileName, "ptr", lpszPassword, "uint", flFlags, "uint", ulReserved, lplhSessionMarshal, lplhSession, "uint")
        return result
    }
}
