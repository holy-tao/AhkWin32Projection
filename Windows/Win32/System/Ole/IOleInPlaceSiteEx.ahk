#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOleInPlaceSite.ahk

/**
 * Provides an additional set of activation and deactivation notification methods that enable an object to avoid unnecessary flashing on the screen when the object is activated and deactivated.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ioleinplacesiteex
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleInPlaceSiteEx extends IOleInPlaceSite{
    /**
     * The interface identifier for IOleInPlaceSiteEx
     * @type {Guid}
     */
    static IID => Guid("{9c2cad80-3424-11cf-b670-00aa004cd6d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * 
     * @param {Pointer<BOOL>} pfNoRedraw 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    OnInPlaceActivateEx(pfNoRedraw, dwFlags) {
        result := ComCall(15, this, "ptr", pfNoRedraw, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fNoRedraw 
     * @returns {HRESULT} 
     */
    OnInPlaceDeactivateEx(fNoRedraw) {
        result := ComCall(16, this, "int", fNoRedraw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RequestUIActivate() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
