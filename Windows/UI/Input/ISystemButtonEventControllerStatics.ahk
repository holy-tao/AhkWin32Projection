#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SystemButtonEventController.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class ISystemButtonEventControllerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemButtonEventControllerStatics
     * @type {Guid}
     */
    static IID => Guid("{632fb07b-20bd-5e15-af4a-00dbf2064ffa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateForDispatcherQueue"]

    /**
     * 
     * @param {DispatcherQueue} queue 
     * @returns {SystemButtonEventController} 
     */
    CreateForDispatcherQueue(queue) {
        result := ComCall(6, this, "ptr", queue, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemButtonEventController(result_)
    }
}
