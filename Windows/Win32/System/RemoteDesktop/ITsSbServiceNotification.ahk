#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that Remote Desktop Connection Broker (RD Connection Broker) uses to notify plug-ins of state changes that occur in the RD Connection Broker itself.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbservicenotification
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbServiceNotification extends IUnknown{
    /**
     * The interface identifier for ITsSbServiceNotification
     * @type {Guid}
     */
    static IID => Guid("{86cb68ae-86e0-4f57-8a64-bb7406bc5550}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyServiceFailure() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyServiceSuccess() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
