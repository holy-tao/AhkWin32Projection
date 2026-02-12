#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IContentPrefetchTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentPrefetchTrigger
     * @type {Guid}
     */
    static IID => Guid("{710627ee-04fa-440b-80c0-173202199e5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WaitInterval"]

    /**
     * @type {TimeSpan} 
     */
    WaitInterval {
        get => this.get_WaitInterval()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_WaitInterval() {
        waitInterval := TimeSpan()
        result := ComCall(6, this, "ptr", waitInterval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return waitInterval
    }
}
