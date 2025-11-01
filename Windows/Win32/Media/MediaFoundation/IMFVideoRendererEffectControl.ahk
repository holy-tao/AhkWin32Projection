#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoRendererEffectControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFVideoRendererEffectControl
     * @type {Guid}
     */
    static IID => Guid("{604d33d7-cf23-41d5-8224-5bbbb1a87475}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnAppServiceConnectionEstablished"]

    /**
     * 
     * @param {IUnknown} pAppServiceConnection 
     * @returns {HRESULT} 
     */
    OnAppServiceConnectionEstablished(pAppServiceConnection) {
        result := ComCall(3, this, "ptr", pAppServiceConnection, "HRESULT")
        return result
    }
}
