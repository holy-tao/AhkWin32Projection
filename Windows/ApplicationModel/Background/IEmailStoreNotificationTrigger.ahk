#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IEmailStoreNotificationTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailStoreNotificationTrigger
     * @type {Guid}
     */
    static IID => Guid("{986d06da-47eb-4268-a4f2-f3f77188388a}")

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
