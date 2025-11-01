#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCDispatchEventNotification extends IDispatch{

    static sizeof => A_PtrSize
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

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
