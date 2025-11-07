#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that allows the programmatic addition of an installed gadget to the user's desktop.
 * @remarks
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * An implementation of this interface is supplied in Windows as CLSID_DesktopGadget. Third parties do not provide a implementation.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Use this interface to run a gadget. A running gadget is displayed on the desktop. This action is often taken at the end of a gadget or application's installation.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-idesktopgadget
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDesktopGadget extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDesktopGadget
     * @type {Guid}
     */
    static IID => Guid("{c1646bc4-f298-4f91-a204-eb2dd1709d1a}")

    /**
     * The class identifier for DesktopGadget
     * @type {Guid}
     */
    static CLSID => Guid("{924ccc1b-6562-4c85-8657-d177925222b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RunGadget"]

    /**
     * 
     * @param {PWSTR} gadgetPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-idesktopgadget-rungadget
     */
    RunGadget(gadgetPath) {
        gadgetPath := gadgetPath is String ? StrPtr(gadgetPath) : gadgetPath

        result := ComCall(3, this, "ptr", gadgetPath, "HRESULT")
        return result
    }
}
