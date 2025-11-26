#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Provides a mechanism to execute a function inside a specific COM+ object context.
 * @remarks
 * 
 *  An instance of this interface for the current context can be obtained using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetobjectcontext">CoGetObjectContext</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ctxtcall/nn-ctxtcall-icontextcallback
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IContextCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContextCallback
     * @type {Guid}
     */
    static IID => Guid("{000001da-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ContextCallback"]

    /**
     * Enters the object context, executes the specified function, and returns.
     * @param {Pointer<PFNCONTEXTCALL>} pfnCallback The function to be called inside the object context.
     * @param {Pointer<ComCallData>} pParam The data to be passed to the function when it is called in the context.
     * @param {Pointer<Guid>} riid The IID of the call that is being simulated. See Remarks for more information.
     * @param {Integer} iMethod The method number of the call that is being simulated. See Remarks for more information.
     * @param {IUnknown} pUnk This parameter is reserved and must be <b>NULL</b>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL. If none of these failures occur, the return value of this function is the <b>HRESULT</b> value returned by the <i>pfnCallback</i> function.
     * @see https://docs.microsoft.com/windows/win32/api//ctxtcall/nf-ctxtcall-icontextcallback-contextcallback
     */
    ContextCallback(pfnCallback, pParam, riid, iMethod, pUnk) {
        result := ComCall(3, this, "ptr", pfnCallback, "ptr", pParam, "ptr", riid, "int", iMethod, "ptr", pUnk, "HRESULT")
        return result
    }
}
