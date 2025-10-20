#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IXpsRasterizerNotificationCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsRasterizerNotificationCallback
     * @type {Guid}
     */
    static IID => Guid("{9ab8fd0d-cb94-49c2-9cb0-97ec1d5469d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Continue"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Continue() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
