#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ICommunicationBlockingAppSetAsActiveTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommunicationBlockingAppSetAsActiveTrigger
     * @type {Guid}
     */
    static IID => Guid("{fb91f28a-16a5-486d-974c-7835a8477be2}")

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
