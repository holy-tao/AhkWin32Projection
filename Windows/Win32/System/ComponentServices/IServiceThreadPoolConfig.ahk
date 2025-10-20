#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Configures the thread pool of the activity object that is returned by calling CoCreateActivity.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iservicethreadpoolconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IServiceThreadPoolConfig extends IUnknown{
    /**
     * The interface identifier for IServiceThreadPoolConfig
     * @type {Guid}
     */
    static IID => Guid("{186d89bc-f277-4bcc-80d5-4df7b836ef4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} threadPool 
     * @returns {HRESULT} 
     */
    SelectThreadPool(threadPool) {
        result := ComCall(3, this, "int", threadPool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} binding 
     * @returns {HRESULT} 
     */
    SetBindingInfo(binding) {
        result := ComCall(4, this, "int", binding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
