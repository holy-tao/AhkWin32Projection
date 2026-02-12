#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Callback function that gets called for each data source in response to a call to WofEnumEntries.
 * @see https://learn.microsoft.com/windows/win32/api//content/wofapi/nc-wofapi-wofenumentryproc
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class WofEnumEntryProc extends IUnknown {

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
     * @param {Pointer<Void>} EntryInfo 
     * @param {Pointer<Void>} UserData_ 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(EntryInfo, UserData_) {
        EntryInfoMarshal := EntryInfo is VarRef ? "ptr" : "ptr"
        UserData_Marshal := UserData_ is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, EntryInfoMarshal, EntryInfo, UserData_Marshal, UserData_, "int")
        return result
    }
}
