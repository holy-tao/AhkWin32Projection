#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBackgroundWorkCostStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundWorkCostStatics
     * @type {Guid}
     */
    static IID => Guid("{c740a662-c310-4b82-b3e3-3bcfb9e4c77d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentBackgroundWorkCost"]

    /**
     * @type {Integer} 
     */
    CurrentBackgroundWorkCost {
        get => this.get_CurrentBackgroundWorkCost()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentBackgroundWorkCost() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
