#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ITileUpdater2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITileUpdater2
     * @type {Guid}
     */
    static IID => Guid("{a2266e12-15ee-43ed-83f5-65b352bb1a84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableNotificationQueueForSquare150x150", "EnableNotificationQueueForWide310x150", "EnableNotificationQueueForSquare310x310"]

    /**
     * 
     * @param {Boolean} enable 
     * @returns {HRESULT} 
     */
    EnableNotificationQueueForSquare150x150(enable) {
        result := ComCall(6, this, "int", enable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} enable 
     * @returns {HRESULT} 
     */
    EnableNotificationQueueForWide310x150(enable) {
        result := ComCall(7, this, "int", enable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} enable 
     * @returns {HRESULT} 
     */
    EnableNotificationQueueForSquare310x310(enable) {
        result := ComCall(8, this, "int", enable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
