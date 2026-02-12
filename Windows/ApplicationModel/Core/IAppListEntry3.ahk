#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class IAppListEntry3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppListEntry3
     * @type {Guid}
     */
    static IID => Guid("{6099f28d-fc32-470a-bc69-4b061a76ef2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LaunchForUserAsync"]

    /**
     * 
     * @param {User} user_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    LaunchForUserAsync(user_) {
        result := ComCall(6, this, "ptr", user_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
