#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class EventPipeProviderCallback extends IUnknown {

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
     * @param {Pointer<Integer>} source_id 
     * @param {Integer} is_enabled 
     * @param {Integer} level 
     * @param {Integer} match_any_keywords 
     * @param {Integer} match_all_keywords 
     * @param {Pointer<COR_PRF_FILTER_DATA>} filter_data 
     * @param {Pointer<Void>} callback_data 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(source_id, is_enabled, level, match_any_keywords, match_all_keywords, filter_data, callback_data) {
        source_idMarshal := source_id is VarRef ? "char*" : "ptr"
        callback_dataMarshal := callback_data is VarRef ? "ptr" : "ptr"

        ComCall(3, this, source_idMarshal, source_id, "uint", is_enabled, "char", level, "uint", match_any_keywords, "uint", match_all_keywords, "ptr", filter_data, callback_dataMarshal, callback_data)
    }
}
