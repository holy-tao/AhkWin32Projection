#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IZoomEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IZoomEvents
     * @type {Guid}
     */
    static IID => Guid("{41b68150-904c-4e17-a0ba-a438182e359d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnZoomPercentChanged"]

    /**
     * 
     * @param {Integer} ulZoomPercent 
     * @returns {HRESULT} 
     */
    OnZoomPercentChanged(ulZoomPercent) {
        result := ComCall(3, this, "uint", ulZoomPercent, "HRESULT")
        return result
    }
}
