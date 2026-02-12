#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Learn more about: JET_CALLBACK delegate
 * @see https://learn.microsoft.com/windows/win32/ktop-src/extensible-storage-engine/jet-callback-delegate
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_CALLBACK extends IUnknown {

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
     * @param {JET_SESID} sesid 
     * @param {Integer} dbid_ 
     * @param {JET_TABLEID} tableid 
     * @param {Integer} cbtyp 
     * @param {Pointer<Void>} pvArg1 
     * @param {Pointer<Void>} pvArg2 
     * @param {Pointer<Void>} pvContext 
     * @param {JET_API_PTR} ulUnused 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sesid, dbid_, tableid, cbtyp, pvArg1, pvArg2, pvContext, ulUnused) {
        sesid := sesid is Win32Handle ? NumGet(sesid, "ptr") : sesid
        tableid := tableid is Win32Handle ? NumGet(tableid, "ptr") : tableid
        ulUnused := ulUnused is Win32Handle ? NumGet(ulUnused, "ptr") : ulUnused

        pvArg1Marshal := pvArg1 is VarRef ? "ptr" : "ptr"
        pvArg2Marshal := pvArg2 is VarRef ? "ptr" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", sesid, "uint", dbid_, "ptr", tableid, "uint", cbtyp, pvArg1Marshal, pvArg1, pvArg2Marshal, pvArg2, pvContextMarshal, pvContext, "ptr", ulUnused, "int")
        return result
    }
}
