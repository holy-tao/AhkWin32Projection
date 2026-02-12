#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBackgroundExecutionManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundExecutionManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{469b24ef-9bbb-4e18-999a-fd6512931be9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAccessKindAsync"]

    /**
     * 
     * @param {Integer} requestedAccess 
     * @param {HSTRING} reason 
     * @returns {IAsyncOperation<Boolean>} 
     */
    RequestAccessKindAsync(requestedAccess, reason) {
        if(reason is String) {
            pin := HSTRING.Create(reason)
            reason := pin.Value
        }
        reason := reason is Win32Handle ? NumGet(reason, "ptr") : reason

        result := ComCall(6, this, "int", requestedAccess, "ptr", reason, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
