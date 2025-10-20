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
     * 
     * @returns {HRESULT} 
     */
    switchToPlayerApplication() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    switchToControl() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbPlayerDocked 
     * @returns {HRESULT} 
     */
    get_playerDocked(pbPlayerDocked) {
        result := ComCall(9, this, "ptr", pbPlayerDocked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbHasDisplay 
     * @returns {HRESULT} 
     */
    get_hasDisplay(pbHasDisplay) {
        result := ComCall(10, this, "ptr", pbHasDisplay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
