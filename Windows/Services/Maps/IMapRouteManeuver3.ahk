#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ManeuverWarning.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class IMapRouteManeuver3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapRouteManeuver3
     * @type {Guid}
     */
    static IID => Guid("{a6a138df-0483-4166-85be-b99336c11875}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Warnings"]

    /**
     * @type {IVectorView<ManeuverWarning>} 
     */
    Warnings {
        get => this.get_Warnings()
    }

    /**
     * 
     * @returns {IVectorView<ManeuverWarning>} 
     */
    get_Warnings() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ManeuverWarning, value)
    }
}
