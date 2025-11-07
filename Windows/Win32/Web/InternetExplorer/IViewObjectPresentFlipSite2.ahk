#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IViewObjectPresentFlipSite2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IViewObjectPresentFlipSite2
     * @type {Guid}
     */
    static IID => Guid("{aad0cbf1-e7fd-4f12-8902-c78132a8e01d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRotationForCurrentOutput"]

    /**
     * 
     * @returns {Integer} 
     */
    GetRotationForCurrentOutput() {
        result := ComCall(3, this, "int*", &pDxgiRotation := 0, "HRESULT")
        return pDxgiRotation
    }
}
