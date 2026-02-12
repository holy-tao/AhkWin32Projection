#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Implements the batch work that is submitted through the activity created by the MTSCreateActivity function.
 * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nn-comsvcs-imtscall
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IMTSCall extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMTSCall
     * @type {Guid}
     */
    static IID => Guid("{51372aef-cae7-11cf-be81-00aa00a2fa25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnCall"]

    /**
     * Triggers the execution of the batch work implemented in this method. (IMTSCall.OnCall)
     * @remarks
     * The batch work that is run in this method runs in the context and thread apartment of the activity that was created by the call to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-mtscreateactivity">MTSCreateActivity</a>. The batch work in this method is run using a call to either <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-imtsactivity-synchronouscall">IMTSActivity::SynchronousCall</a> or <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-imtsactivity-asynccall">IMTSActivity::AsyncCall</a>, using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-imtsactivity">IMTSActivity</a> pointer that was returned from the call to <b>MTSCreateActivity</b>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-imtscall-oncall
     */
    OnCall() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
