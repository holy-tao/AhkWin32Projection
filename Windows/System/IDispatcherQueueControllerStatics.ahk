#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\DispatcherQueueController.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IDispatcherQueueControllerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDispatcherQueueControllerStatics
     * @type {Guid}
     */
    static IID => Guid("{0a6c98e0-5198-49a2-a313-3f70d1f13c27}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateOnDedicatedThread"]

    /**
     * 
     * @returns {DispatcherQueueController} 
     */
    CreateOnDedicatedThread() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DispatcherQueueController(result_)
    }
}
