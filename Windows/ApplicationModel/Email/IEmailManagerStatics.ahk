#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{f5128654-55c5-4890-a824-216c2618ce7f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowComposeNewEmailAsync"]

    /**
     * 
     * @param {EmailMessage} message 
     * @returns {IAsyncAction} 
     */
    ShowComposeNewEmailAsync(message) {
        result := ComCall(6, this, "ptr", message, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncAction)
    }
}
