#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class ICurrentTimeChangeRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICurrentTimeChangeRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{99711324-edc7-4bf5-91f6-3c8627db59e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Time"]

    /**
     * @type {TimeSpan} 
     */
    Time {
        get => this.get_Time()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Time() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
