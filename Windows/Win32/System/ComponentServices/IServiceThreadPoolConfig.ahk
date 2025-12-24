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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SelectThreadPool", "SetBindingInfo"]

    /**
     * Selects the thread pool in which the work submitted through the activity is to run.
     * @param {Integer} threadPool A value from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_threadpool">CSC_ThreadPool</a> enumeration.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iservicethreadpoolconfig-selectthreadpool
     */
    SelectThreadPool(threadPool) {
        result := ComCall(3, this, "int", threadPool, "HRESULT")
        return result
    }

    /**
     * Binds all work submitted by the activity to a single single-threaded apartment.
     * @param {Integer} binding A value from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_binding">CSC_Binding</a> enumeration.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iservicethreadpoolconfig-setbindinginfo
     */
    SetBindingInfo(binding) {
        result := ComCall(4, this, "int", binding, "HRESULT")
        return result
    }
}
