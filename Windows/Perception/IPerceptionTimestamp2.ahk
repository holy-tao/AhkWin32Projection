#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\TimeSpan.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception
 * @version WindowsRuntime 1.4
 */
class IPerceptionTimestamp2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionTimestamp2
     * @type {Guid}
     */
    static IID => Guid("{e354b7ed-2bd1-41b7-9ed0-74a15c354537}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SystemRelativeTargetTime"]

    /**
     * @type {TimeSpan} 
     */
    SystemRelativeTargetTime {
        get => this.get_SystemRelativeTargetTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SystemRelativeTargetTime() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
