#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Queries service-specific information from the Security Configuration file or analysis database.
 * @remarks
 * The Security Configuration tool set allocates buffers when <i>PFSCE_QUERY_INFO</i> is called. To free these buffers call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nc-scesvc-pfsce_free_info">PFSCE_FREE_INFO</a> after the returned information is no longer needed.
 * @see https://learn.microsoft.com/windows/win32/api//content/scesvc/nc-scesvc-pfsce_query_info
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 * @version v4.0.30319
 */
class PFSCE_QUERY_INFO extends IUnknown {

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
     * @param {Pointer<Void>} sceHandle 
     * @param {Integer} sceType 
     * @param {Pointer<Integer>} lpPrefix 
     * @param {BOOL} bExact 
     * @param {Pointer<Pointer<Void>>} ppvInfo 
     * @param {Pointer<Integer>} psceEnumHandle 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sceHandle, sceType, lpPrefix, bExact, ppvInfo, psceEnumHandle) {
        sceHandleMarshal := sceHandle is VarRef ? "ptr" : "ptr"
        lpPrefixMarshal := lpPrefix is VarRef ? "char*" : "ptr"
        ppvInfoMarshal := ppvInfo is VarRef ? "ptr*" : "ptr"
        psceEnumHandleMarshal := psceEnumHandle is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, sceHandleMarshal, sceHandle, "int", sceType, lpPrefixMarshal, lpPrefix, "int", bExact, ppvInfoMarshal, ppvInfo, psceEnumHandleMarshal, psceEnumHandle, "uint")
        return result
    }
}
