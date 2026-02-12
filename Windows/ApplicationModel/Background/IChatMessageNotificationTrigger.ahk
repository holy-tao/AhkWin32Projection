#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IChatMessageNotificationTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatMessageNotificationTrigger
     * @type {Guid}
     */
    static IID => Guid("{513b43bf-1d40-5c5d-78f5-c923fee3739e}")

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
