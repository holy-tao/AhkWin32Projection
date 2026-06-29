#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Graphics\Dxgi\Common\DXGI_MODE_ROTATION.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
class ISurfacePresenterFlip2 extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISurfacePresenterFlip2
     * @type {Guid}
     */
    static IID => Guid("{30510865-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRotation"]

    /**
     * 
     * @param {DXGI_MODE_ROTATION} dxgiRotation 
     * @returns {HRESULT} 
     */
    SetRotation(dxgiRotation) {
        result := ComCall(3, this, "int", dxgiRotation, "HRESULT")
        return result
    }
}
