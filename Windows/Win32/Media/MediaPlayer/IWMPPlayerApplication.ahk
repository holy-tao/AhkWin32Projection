#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPPlayerApplication interface provides methods for switching between a remoted Windows Media Player control and the full mode of the Player. These methods can only be used with C++ programs that embed the control in remote mode.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpplayerapplication
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPlayerApplication extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPPlayerApplication
     * @type {Guid}
     */
    static IID => Guid("{40897764-ceab-47be-ad4a-8e28537f9bbf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["switchToPlayerApplication", "switchToControl", "get_playerDocked", "get_hasDisplay"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayerapplication-switchtoplayerapplication
     */
    switchToPlayerApplication() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayerapplication-switchtocontrol
     */
    switchToControl() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbPlayerDocked 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayerapplication-get_playerdocked
     */
    get_playerDocked(pbPlayerDocked) {
        pbPlayerDockedMarshal := pbPlayerDocked is VarRef ? "short*" : "ptr"

        result := ComCall(9, this, pbPlayerDockedMarshal, pbPlayerDocked, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbHasDisplay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayerapplication-get_hasdisplay
     */
    get_hasDisplay(pbHasDisplay) {
        pbHasDisplayMarshal := pbHasDisplay is VarRef ? "short*" : "ptr"

        result := ComCall(10, this, pbHasDisplayMarshal, pbHasDisplay, "HRESULT")
        return result
    }
}
