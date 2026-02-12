#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreQueueItem2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreQueueItem2
     * @type {Guid}
     */
    static IID => Guid("{69491ca8-1ad4-447c-ad8c-a95035f64d82}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CancelInstallAsync", "PauseInstallAsync", "ResumeInstallAsync"]

    /**
     * 
     * @returns {IAsyncAction} 
     */
    CancelInstallAsync() {
        result := ComCall(6, this, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    PauseInstallAsync() {
        result := ComCall(7, this, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ResumeInstallAsync() {
        result := ComCall(8, this, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }
}
