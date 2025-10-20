#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITridentTouchInputSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITridentTouchInputSite
     * @type {Guid}
     */
    static IID => Guid("{30510849-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetManipulationMode", "ZoomToPoint"]

    /**
     * 
     * @param {Integer} msTouchAction 
     * @returns {HRESULT} 
     */
    SetManipulationMode(msTouchAction) {
        result := ComCall(3, this, "int", msTouchAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     */
    ZoomToPoint(x, y) {
        result := ComCall(4, this, "int", x, "int", y, "HRESULT")
        return result
    }
}
