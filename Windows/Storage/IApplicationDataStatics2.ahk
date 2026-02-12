#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\ApplicationData.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IApplicationDataStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationDataStatics2
     * @type {Guid}
     */
    static IID => Guid("{cd606211-cf49-40a4-a47c-c7f0dbba8107}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForUserAsync"]

    /**
     * 
     * @param {User} user_ 
     * @returns {IAsyncOperation<ApplicationData>} 
     */
    GetForUserAsync(user_) {
        result := ComCall(6, this, "ptr", user_, "ptr*", &getForUserOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ApplicationData, getForUserOperation)
    }
}
