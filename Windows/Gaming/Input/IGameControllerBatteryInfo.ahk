#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Devices\Power\BatteryReport.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Interface that allows game controller (or headset) classes to query for information about the current battery state, regardless of their actual type (gamepad, racing wheel, flight stick, and so on).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.igamecontrollerbatteryinfo
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class IGameControllerBatteryInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameControllerBatteryInfo
     * @type {Guid}
     */
    static IID => Guid("{dcecc681-3963-4da6-955d-553f3b6f6161}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryGetBatteryReport"]

    /**
     * Gets information about the game controller's current battery state.
     * @returns {BatteryReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.igamecontrollerbatteryinfo.trygetbatteryreport
     */
    TryGetBatteryReport() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BatteryReport(value)
    }
}
