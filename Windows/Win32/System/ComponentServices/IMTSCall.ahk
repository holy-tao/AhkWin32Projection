#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Implements the batch work that is submitted through the activity created by the MTSCreateActivity function.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-imtscall
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IMTSCall extends IUnknown{
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
     * 
     * @returns {HRESULT} 
     */
    OnCall() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
