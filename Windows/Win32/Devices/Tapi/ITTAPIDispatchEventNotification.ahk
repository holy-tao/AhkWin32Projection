#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITTAPIDispatchEventNotification extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITTAPIDispatchEventNotification
     * @type {Guid}
     */
    static IID => Guid("{9f34325b-7e62-11d2-9457-00c04f8ec888}")

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
