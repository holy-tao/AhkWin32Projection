#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a change to the registration of a synchronization provider or a synchronization provider configuration UI. The changes are reported as registration events.
 * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nn-syncregistration-isyncregistrationchange
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncRegistrationChange extends IUnknown{
    /**
     * The interface identifier for ISyncRegistrationChange
     * @type {Guid}
     */
    static IID => Guid("{eea0d9ae-6b29-43b4-9e70-e3ae33bb2c3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} psreEvent 
     * @returns {HRESULT} 
     */
    GetEvent(psreEvent) {
        result := ComCall(3, this, "int*", psreEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @returns {HRESULT} 
     */
    GetInstanceId(pguidInstanceId) {
        result := ComCall(4, this, "ptr", pguidInstanceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
