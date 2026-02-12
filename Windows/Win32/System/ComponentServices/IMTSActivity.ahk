#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Submits batch work through the activity created by the MTSCreateActivity function.
 * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nn-comsvcs-imtsactivity
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IMTSActivity extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMTSActivity
     * @type {Guid}
     */
    static IID => Guid("{51372af0-cae7-11cf-be81-00aa00a2fa25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SynchronousCall", "AsyncCall", "Reserved1", "BindToCurrentThread", "UnbindFromThread"]

    /**
     * Performs the user-defined work synchronously. (IMTSActivity.SynchronousCall)
     * @remarks
     * The batch work that is run using this method runs in the context and thread apartment of the activity that was created by the call to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-mtscreateactivity">MTSCreateActivity</a>.
     * @param {IMTSCall} pCall A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-imtscall">IMTSCall</a> interface that is used to implement the batch work.
     * @returns {HRESULT} This method always returns the <b>HRESULT</b> returned by the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-imtscall-oncall">OnCall</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-imtscall">IMTSCall</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-imtsactivity-synchronouscall
     */
    SynchronousCall(pCall) {
        result := ComCall(3, this, "ptr", pCall, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Performs the user-defined work asynchronously. (IMTSActivity.AsyncCall)
     * @remarks
     * The batch work that is run using this method runs in the context and thread apartment of the activity that was created by the call to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-mtscreateactivity">MTSCreateActivity</a>.
     * 
     * 
     * A return value of S_OK indicates that the batch work was accepted by the activity to run asynchronously. However, it does not necessarily mean that the batch work successfully completed.
     * @param {IMTSCall} pCall A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-imtscall">IMTSCall</a> interface that is used to implement the batch work.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-imtsactivity-asynccall
     */
    AsyncCall(pCall) {
        result := ComCall(4, this, "ptr", pCall, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved1() {
        ComCall(5, this)
    }

    /**
     * Binds the batch work that is submitted using IMTSActivity::AsyncCall or IMTSActivity::SynchronousCall to the current single-threaded apartment (STA).
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-imtsactivity-bindtocurrentthread
     */
    BindToCurrentThread() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Unbinds the batch work that is submitted using IMTSActivity::AsyncCall or IMTSActivity::SynchronousCall from the thread on which it is running.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-imtsactivity-unbindfromthread
     */
    UnbindFromThread() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
