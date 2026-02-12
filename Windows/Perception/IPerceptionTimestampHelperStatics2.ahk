#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\PerceptionTimestamp.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception
 * @version WindowsRuntime 1.4
 */
class IPerceptionTimestampHelperStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionTimestampHelperStatics2
     * @type {Guid}
     */
    static IID => Guid("{73d1a7fe-3fb9-4571-87d4-3c920a5e86eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromSystemRelativeTargetTime"]

    /**
     * 
     * @param {TimeSpan} targetTime 
     * @returns {PerceptionTimestamp} 
     */
    FromSystemRelativeTargetTime(targetTime) {
        result := ComCall(6, this, "ptr", targetTime, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionTimestamp(value)
    }
}
