#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Extends the IRealTimeStylus interface.
 * @remarks
 * 
 * This interface only exists in the Windows Vista <a href="https://docs.microsoft.com/windows/desktop/tablet/realtimestylus-classes-and-interfaces">RealTimeStylus</a>. Flick notification is recevied via a <a href="https://docs.microsoft.com/windows/desktop/api/rtscom/nf-rtscom-istylusplugin-systemevent">IStylusPlugin::SystemEvent Method</a> plugin notification with event id equal to <b>ISG_Flick</b>. To obtain flick data look at the <b>SYSTEM_EVENT_DATA</b> struct: <i>xPos</i>/<i>yPos</i> contains the flick start location in Tablet coordinates, <i>wKey</i> contains the direction (a value where 90 is down, 180 is left, 270 is up), and <i>dwButtonState</i> contains the same data obtained from the <i>wParam</i> for the <a href="https://docs.microsoft.com/windows/desktop/tablet/wm-tablet-flick-message">WM_TABLET_FLICK Message</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//rtscom/nn-rtscom-irealtimestylus2
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IRealTimeStylus2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRealTimeStylus2
     * @type {Guid}
     */
    static IID => Guid("{b5f2a6cd-3179-4a3e-b9c4-bb5865962be2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FlicksEnabled", "put_FlicksEnabled"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus2-get_flicksenabled
     */
    get_FlicksEnabled() {
        result := ComCall(3, this, "int*", &pfEnable := 0, "HRESULT")
        return pfEnable
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rtscom/nf-rtscom-irealtimestylus2-put_flicksenabled
     */
    put_FlicksEnabled(fEnable) {
        result := ComCall(4, this, "int", fEnable, "HRESULT")
        return result
    }
}
