#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPLibrarySharingServices interface provides methods to manage library sharing.To use this interface, you must create a remoted instance of the Windows Media Player control.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmplibrarysharingservices
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPLibrarySharingServices extends IUnknown{
    /**
     * The interface identifier for IWMPLibrarySharingServices
     * @type {Guid}
     */
    static IID => Guid("{82cba86b-9f04-474b-a365-d6dd1466e541}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvbShared 
     * @returns {HRESULT} 
     */
    isLibraryShared(pvbShared) {
        result := ComCall(3, this, "ptr", pvbShared, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvbEnabled 
     * @returns {HRESULT} 
     */
    isLibrarySharingEnabled(pvbEnabled) {
        result := ComCall(4, this, "ptr", pvbEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    showLibrarySharing() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
