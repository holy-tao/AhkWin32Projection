#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LineDisplayStatisticsCategorySelector.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ILineDisplayStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILineDisplayStatics2
     * @type {Guid}
     */
    static IID => Guid("{600c3f1c-77ab-4968-a7de-c02ff169f2cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StatisticsCategorySelector"]

    /**
     * @type {LineDisplayStatisticsCategorySelector} 
     */
    StatisticsCategorySelector {
        get => this.get_StatisticsCategorySelector()
    }

    /**
     * 
     * @returns {LineDisplayStatisticsCategorySelector} 
     */
    get_StatisticsCategorySelector() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LineDisplayStatisticsCategorySelector(value)
    }
}
