#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Submits batch work through the activity created by the MTSCreateActivity function.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-imtsactivity
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
     * 
     * @param {IMTSCall} pCall 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsactivity-synchronouscall
     */
    SynchronousCall(pCall) {
        result := ComCall(3, this, "ptr", pCall, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMTSCall} pCall 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsactivity-asynccall
     */
    AsyncCall(pCall) {
        result := ComCall(4, this, "ptr", pCall, "HRESULT")
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsactivity-bindtocurrentthread
     */
    BindToCurrentThread() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsactivity-unbindfromthread
     */
    UnbindFromThread() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
