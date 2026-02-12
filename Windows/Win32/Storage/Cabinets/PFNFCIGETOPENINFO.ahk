#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Cabinets
 * @version v4.0.30319
 */
class PFNFCIGETOPENINFO extends IUnknown {

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
     * @param {PSTR} pszName 
     * @param {Pointer<Integer>} pdate 
     * @param {Pointer<Integer>} ptime 
     * @param {Pointer<Integer>} pattribs 
     * @param {Pointer<Integer>} err 
     * @param {Pointer<Void>} pv 
     * @returns {Pointer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pszName, pdate, ptime, pattribs, err, pv) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pdateMarshal := pdate is VarRef ? "ushort*" : "ptr"
        ptimeMarshal := ptime is VarRef ? "ushort*" : "ptr"
        pattribsMarshal := pattribs is VarRef ? "ushort*" : "ptr"
        errMarshal := err is VarRef ? "int*" : "ptr"
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pszName, pdateMarshal, pdate, ptimeMarshal, ptime, pattribsMarshal, pattribs, errMarshal, err, pvMarshal, pv, "ptr")
        return result
    }
}
