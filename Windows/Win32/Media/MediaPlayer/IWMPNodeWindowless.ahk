#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPWindowMessageSink.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPNodeWindowless extends IWMPWindowMessageSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPNodeWindowless
     * @type {Guid}
     */
    static IID => Guid("{9b9199ad-780c-4eda-b816-261eba5d1575}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnDraw"]

    /**
     * 
     * @param {Pointer} hdc 
     * @param {Pointer<RECT>} prcDraw 
     * @returns {HRESULT} 
     */
    OnDraw(hdc, prcDraw) {
        result := ComCall(4, this, "ptr", hdc, "ptr", prcDraw, "HRESULT")
        return result
    }
}
