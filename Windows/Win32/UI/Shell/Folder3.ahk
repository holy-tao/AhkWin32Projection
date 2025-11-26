#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\Folder2.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class Folder3 extends Folder2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Folder3
     * @type {Guid}
     */
    static IID => Guid("{a7ae5f64-c4d7-4d7f-9307-4d24ee54b841}")

    /**
     * The class identifier for Folder3
     * @type {Guid}
     */
    static CLSID => Guid("{a7ae5f64-c4d7-4d7f-9307-4d24ee54b841}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ShowWebViewBarricade", "put_ShowWebViewBarricade"]

    /**
     * @type {VARIANT_BOOL} 
     */
    ShowWebViewBarricade {
        get => this.get_ShowWebViewBarricade()
        set => this.put_ShowWebViewBarricade(value)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ShowWebViewBarricade() {
        result := ComCall(22, this, "short*", &pbShowWebViewBarricade := 0, "HRESULT")
        return pbShowWebViewBarricade
    }

    /**
     * 
     * @param {VARIANT_BOOL} bShowWebViewBarricade 
     * @returns {HRESULT} 
     */
    put_ShowWebViewBarricade(bShowWebViewBarricade) {
        result := ComCall(23, this, "short", bShowWebViewBarricade, "HRESULT")
        return result
    }
}
