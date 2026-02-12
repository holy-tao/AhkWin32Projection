#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\DispatcherQueue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IDispatcherQueueStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDispatcherQueueStatics
     * @type {Guid}
     */
    static IID => Guid("{a96d83d7-9371-4517-9245-d0824ac12c74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForCurrentThread"]

    /**
     * 
     * @returns {DispatcherQueue} 
     */
    GetForCurrentThread() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DispatcherQueue(result_)
    }
}
