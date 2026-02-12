#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Mapi
 * @version v4.0.30319
 */
class LPMAPIFINDNEXT extends IUnknown {

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
     * @param {Pointer} lhSession 
     * @param {Pointer} ulUIParam 
     * @param {PSTR} lpszMessageType 
     * @param {PSTR} lpszSeedMessageID 
     * @param {Integer} flFlags 
     * @param {Integer} ulReserved 
     * @param {PSTR} lpszMessageID 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lhSession, ulUIParam, lpszMessageType, lpszSeedMessageID, flFlags, ulReserved, lpszMessageID) {
        lpszMessageType := lpszMessageType is String ? StrPtr(lpszMessageType) : lpszMessageType
        lpszSeedMessageID := lpszSeedMessageID is String ? StrPtr(lpszSeedMessageID) : lpszSeedMessageID
        lpszMessageID := lpszMessageID is String ? StrPtr(lpszMessageID) : lpszMessageID

        result := ComCall(3, this, "ptr", lhSession, "ptr", ulUIParam, "ptr", lpszMessageType, "ptr", lpszSeedMessageID, "uint", flFlags, "uint", ulReserved, "ptr", lpszMessageID, "uint")
        return result
    }
}
