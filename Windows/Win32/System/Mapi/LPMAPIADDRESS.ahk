#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Mapi
 * @version v4.0.30319
 */
class LPMAPIADDRESS extends IUnknown {

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
     * @param {PSTR} lpszCaption 
     * @param {Integer} nEditFields 
     * @param {PSTR} lpszLabels 
     * @param {Integer} nRecips 
     * @param {Pointer<MapiRecipDesc>} lpRecips 
     * @param {Integer} flFlags 
     * @param {Integer} ulReserved 
     * @param {Pointer<Integer>} lpnNewRecips 
     * @param {Pointer<Pointer<MapiRecipDesc>>} lppNewRecips 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lhSession, ulUIParam, lpszCaption, nEditFields, lpszLabels, nRecips, lpRecips, flFlags, ulReserved, lpnNewRecips, lppNewRecips) {
        lpszCaption := lpszCaption is String ? StrPtr(lpszCaption) : lpszCaption
        lpszLabels := lpszLabels is String ? StrPtr(lpszLabels) : lpszLabels

        lpnNewRecipsMarshal := lpnNewRecips is VarRef ? "uint*" : "ptr"
        lppNewRecipsMarshal := lppNewRecips is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", lhSession, "ptr", ulUIParam, "ptr", lpszCaption, "uint", nEditFields, "ptr", lpszLabels, "uint", nRecips, "ptr", lpRecips, "uint", flFlags, "uint", ulReserved, lpnNewRecipsMarshal, lpnNewRecips, lppNewRecipsMarshal, lppNewRecips, "uint")
        return result
    }
}
