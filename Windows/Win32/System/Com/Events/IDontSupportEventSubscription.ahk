#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IDontSupportEventSubscription extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDontSupportEventSubscription
     * @type {Guid}
     */
    static IID => Guid("{784121f1-62a6-4b89-855f-d65f296de83a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
