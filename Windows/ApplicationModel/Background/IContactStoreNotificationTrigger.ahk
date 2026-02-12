#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IContactStoreNotificationTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactStoreNotificationTrigger
     * @type {Guid}
     */
    static IID => Guid("{c833419b-4705-4571-9a16-06b997bf9c96}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
