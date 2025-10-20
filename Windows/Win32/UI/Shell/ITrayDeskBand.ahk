#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that show, hide, and query deskbands.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-itraydeskband
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITrayDeskBand extends IUnknown{
    /**
     * The interface identifier for ITrayDeskBand
     * @type {Guid}
     */
    static IID => Guid("{6d67e846-5b9c-4db8-9cbc-dde12f4254f1}")

    /**
     * The class identifier for TrayDeskBand
     * @type {Guid}
     */
    static CLSID => Guid("{e6442437-6c68-4f52-94dd-2cfed267efb9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     */
    ShowDeskBand(clsid) {
        result := ComCall(3, this, "ptr", clsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     */
    HideDeskBand(clsid) {
        result := ComCall(4, this, "ptr", clsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     */
    IsDeskBandShown(clsid) {
        result := ComCall(5, this, "ptr", clsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeskBandRegistrationChanged() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
