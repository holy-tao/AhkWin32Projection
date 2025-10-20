#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCDispatchEventNotification extends IDispatch{
    /**
     * The interface identifier for IRTCDispatchEventNotification
     * @type {Guid}
     */
    static IID => Guid("{176ddfbe-fec0-4d55-bc87-84cff1ef7f91}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7
}
