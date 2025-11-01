#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPNodeRealEstateHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPNodeRealEstateHost
     * @type {Guid}
     */
    static IID => Guid("{1491087d-2c6b-44c8-b019-b3c929d2ada9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnDesiredSizeChange", "OnFullScreenTransition"]

    /**
     * 
     * @param {Pointer<SIZE>} pSize 
     * @returns {HRESULT} 
     */
    OnDesiredSizeChange(pSize) {
        result := ComCall(3, this, "ptr", pSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fFullScreen 
     * @returns {HRESULT} 
     */
    OnFullScreenTransition(fFullScreen) {
        result := ComCall(4, this, "int", fFullScreen, "HRESULT")
        return result
    }
}
