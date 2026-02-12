#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IRcsEndUserMessageAvailableTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRcsEndUserMessageAvailableTrigger
     * @type {Guid}
     */
    static IID => Guid("{986d0d6a-b2f6-467f-a978-a44091c11a66}")

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
