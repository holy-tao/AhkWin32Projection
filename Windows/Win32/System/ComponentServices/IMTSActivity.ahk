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
     * 
     * @param {Pointer<IMTSCall>} pCall 
     * @returns {HRESULT} 
     */
    SynchronousCall(pCall) {
        result := ComCall(3, this, "ptr", pCall, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMTSCall>} pCall 
     * @returns {HRESULT} 
     */
    AsyncCall(pCall) {
        result := ComCall(4, this, "ptr", pCall, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reserved1() {
        ComCall(5, this)
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BindToCurrentThread() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnbindFromThread() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
