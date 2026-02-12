#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\ApplicationModel\Background\IBackgroundTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IBackgroundTransferCompletionGroup extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTransferCompletionGroup
     * @type {Guid}
     */
    static IID => Guid("{2d930225-986b-574d-7950-0add47f5d706}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Trigger", "get_IsEnabled", "Enable"]

    /**
     * @type {IBackgroundTrigger} 
     */
    Trigger {
        get => this.get_Trigger()
    }

    /**
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * 
     * @returns {IBackgroundTrigger} 
     */
    get_Trigger() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBackgroundTrigger(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Enables monitoring on a particular drive.
     * @remarks
     * The **Enable** method does not wait for monitoring to be enabled completely before it returns, because this could take a while. Instead, it returns immediately after starting the System Restore service and filter driver.
     * 
     * To enable System Restore on a non-system drive, you must first enable System Restore on the system drive.
     * 
     * This method fails in safe mode.
     * @returns {HRESULT} If the method succeeds, the return value is S\_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/sr/enable-systemrestore
     */
    Enable() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
