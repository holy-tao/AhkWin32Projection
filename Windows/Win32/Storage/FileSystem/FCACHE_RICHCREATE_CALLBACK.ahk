#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A callback function that is used to create items in the cache. (FCACHE_RICHCREATE_CALLBACK)
 * @see https://learn.microsoft.com/windows/win32/api//content/filehc/nc-filehc-fcache_richcreate_callback
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FCACHE_RICHCREATE_CALLBACK extends IUnknown {

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
     * @param {PSTR} lpstrName 
     * @param {Pointer<Void>} lpvData 
     * @param {Pointer<Integer>} cbFileSize 
     * @param {Pointer<Integer>} cbFileSizeHigh 
     * @param {Pointer<BOOL>} pfDidWeScanIt 
     * @param {Pointer<BOOL>} pfIsStuffed 
     * @param {Pointer<BOOL>} pfStoredWithDots 
     * @param {Pointer<BOOL>} pfStoredWithTerminatingDot 
     * @returns {HANDLE} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpstrName, lpvData, cbFileSize, cbFileSizeHigh, pfDidWeScanIt, pfIsStuffed, pfStoredWithDots, pfStoredWithTerminatingDot) {
        lpstrName := lpstrName is String ? StrPtr(lpstrName) : lpstrName

        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"
        cbFileSizeMarshal := cbFileSize is VarRef ? "uint*" : "ptr"
        cbFileSizeHighMarshal := cbFileSizeHigh is VarRef ? "uint*" : "ptr"
        pfDidWeScanItMarshal := pfDidWeScanIt is VarRef ? "int*" : "ptr"
        pfIsStuffedMarshal := pfIsStuffed is VarRef ? "int*" : "ptr"
        pfStoredWithDotsMarshal := pfStoredWithDots is VarRef ? "int*" : "ptr"
        pfStoredWithTerminatingDotMarshal := pfStoredWithTerminatingDot is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", lpstrName, lpvDataMarshal, lpvData, cbFileSizeMarshal, cbFileSize, cbFileSizeHighMarshal, cbFileSizeHigh, pfDidWeScanItMarshal, pfDidWeScanIt, pfIsStuffedMarshal, pfIsStuffed, pfStoredWithDotsMarshal, pfStoredWithDots, pfStoredWithTerminatingDotMarshal, pfStoredWithTerminatingDot, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }
}
