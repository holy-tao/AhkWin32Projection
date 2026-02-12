#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\System\DispatcherQueue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionObject3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionObject3
     * @type {Guid}
     */
    static IID => Guid("{4bc27925-dacd-4cf2-98b1-986b76e7ebe6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DispatcherQueue"]

    /**
     * @type {DispatcherQueue} 
     */
    DispatcherQueue {
        get => this.get_DispatcherQueue()
    }

    /**
     * 
     * @returns {DispatcherQueue} 
     */
    get_DispatcherQueue() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DispatcherQueue(value)
    }
}
