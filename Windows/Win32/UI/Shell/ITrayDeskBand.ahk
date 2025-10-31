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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowDeskBand", "HideDeskBand", "IsDeskBandShown", "DeskBandRegistrationChanged"]

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-itraydeskband-showdeskband
     */
    ShowDeskBand(clsid) {
        result := ComCall(3, this, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-itraydeskband-hidedeskband
     */
    HideDeskBand(clsid) {
        result := ComCall(4, this, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-itraydeskband-isdeskbandshown
     */
    IsDeskBandShown(clsid) {
        result := ComCall(5, this, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-itraydeskband-deskbandregistrationchanged
     */
    DeskBandRegistrationChanged() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
