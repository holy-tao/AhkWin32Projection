#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A callback that is provided to the cache to help examine items within the cache.
 * @see https://learn.microsoft.com/windows/win32/api//content/filehc/nc-filehc-cache_read_callback
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CACHE_READ_CALLBACK extends IUnknown {

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
     * @param {Integer} cb 
     * @param {Pointer<Integer>} lpb 
     * @param {Pointer<Void>} lpvContext 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(cb, lpb, lpvContext) {
        lpbMarshal := lpb is VarRef ? "char*" : "ptr"
        lpvContextMarshal := lpvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", cb, lpbMarshal, lpb, lpvContextMarshal, lpvContext, "int")
        return result
    }
}
