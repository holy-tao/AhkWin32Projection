#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class INotificationTransportSync extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INotificationTransportSync
     * @type {Guid}
     */
    static IID => Guid("{79eb1402-0ab8-49c0-9e14-a1ae4ba93058}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CompleteDelivery", "Flush"]

    /**
     * 
     * @returns {HRESULT} 
     */
    CompleteDelivery() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Flush() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
