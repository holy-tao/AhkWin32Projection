#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITnef.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LPOPENTNEFSTREAM extends IUnknown {

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
     * @param {Pointer<Void>} lpvSupport 
     * @param {IStream} lpStream 
     * @param {Pointer<Integer>} lpszStreamName 
     * @param {Integer} ulFlags 
     * @param {IMessage} lpMessage 
     * @param {Integer} wKeyVal 
     * @returns {ITnef} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpvSupport, lpStream, lpszStreamName, ulFlags, lpMessage, wKeyVal) {
        lpvSupportMarshal := lpvSupport is VarRef ? "ptr" : "ptr"
        lpszStreamNameMarshal := lpszStreamName is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, lpvSupportMarshal, lpvSupport, "ptr", lpStream, lpszStreamNameMarshal, lpszStreamName, "uint", ulFlags, "ptr", lpMessage, "ushort", wKeyVal, "ptr*", &lppTNEF := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITnef(lppTNEF)
    }
}
