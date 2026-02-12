#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class EXT_ANALYZER extends IUnknown {

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
     * @param {IDebugClient} Client 
     * @param {Pointer} BucketSuffix 
     * @param {Integer} cbBucketSuffix 
     * @param {Pointer} DebugText 
     * @param {Integer} cbDebugText 
     * @param {Pointer<Integer>} Flags 
     * @param {IDebugFailureAnalysis} pAnalysis 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Client, BucketSuffix, cbBucketSuffix, DebugText, cbDebugText, Flags, pAnalysis) {
        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", Client, "ptr", BucketSuffix, "uint", cbBucketSuffix, "ptr", DebugText, "uint", cbDebugText, FlagsMarshal, Flags, "ptr", pAnalysis, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
