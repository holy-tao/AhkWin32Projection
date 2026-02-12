#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IAppointmentStoreNotificationTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppointmentStoreNotificationTrigger
     * @type {Guid}
     */
    static IID => Guid("{64d4040c-c201-42ad-aa2a-e21ba3425b6d}")

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
