#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DisplayManagerResultWithState.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayManager2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayManager2
     * @type {Guid}
     */
    static IID => Guid("{e001ec1e-7eb1-597f-9a30-14d3fe3714cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryReadCurrentStateForModeQuery"]

    /**
     * 
     * @returns {DisplayManagerResultWithState} 
     */
    TryReadCurrentStateForModeQuery() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayManagerResultWithState(result_)
    }
}
