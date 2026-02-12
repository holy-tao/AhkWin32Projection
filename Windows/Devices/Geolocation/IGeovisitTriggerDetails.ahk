#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\Geovisit.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeovisitTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeovisitTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{ea770d9e-d1c9-454b-99b7-b2f8cdd2482f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadReports"]

    /**
     * 
     * @returns {IVectorView<Geovisit>} 
     */
    ReadReports() {
        result := ComCall(6, this, "ptr*", &values := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Geovisit, values)
    }
}
