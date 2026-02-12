#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IIsolatedWindowsEnvironmentUserInfo2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsolatedWindowsEnvironmentUserInfo2
     * @type {Guid}
     */
    static IID => Guid("{b0bdd5dd-91d7-481e-94f2-2a5a6bdf9383}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryWaitForSignInWithProgressAsync"]

    /**
     * 
     * @returns {IAsyncOperationWithProgress<Boolean, Integer>} 
     */
    TryWaitForSignInWithProgressAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetBoolean(), (ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}
