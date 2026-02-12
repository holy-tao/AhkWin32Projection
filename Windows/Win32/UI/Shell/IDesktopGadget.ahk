#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that allows the programmatic addition of an installed gadget to the user's desktop.
 * @remarks
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * An implementation of this interface is supplied in Windows as CLSID_DesktopGadget. Third parties do not provide a implementation.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Use this interface to run a gadget. A running gadget is displayed on the desktop. This action is often taken at the end of a gadget or application's installation.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl/nn-shobjidl-idesktopgadget
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
     * Adds an installed gadget to the desktop.
     * @remarks
     * "Running" a gadget here means that the gadget is added to the desktop.
     * 
     * <b>RunGadget</b> can only be called on a gadget that has already been installed to the system. It cannot be called on a gadget that is already running—only one instance of a gadget can be run at any given time through this method.
     * 
     * Because gadget installation has no UI of its own, this method is often run as the last step in the installation process or as part of the first launch of an application that the gadget is associated with. Installation of the gadget to %ProgramFiles%\Windows Sidebar\Shared Gadgets requires administrative privileges. Therefore it is recommended that the installation of the gadget be performed as part of a Microsoft Installer (MSI) installation.
     * 
     * <div class="alert"><b>Important</b>  Applications should not call <b>RunGadget</b> without first asking the user for permission. If the choice is given to the user as a check box, that check box should be unselected by default.</div>
     * <div> </div>
     * The gadget is added to the desktop at a position determined by the system. The caller cannot specify location.
     * 
     * Per-user applications should install their gadgets per-user. Per-machine applications should install their gadgets per-machine. This ensures a unified experience to the user.
     * @param {PWSTR} gadgetPath Type: <b>LPCWSTR</b>
     * 
     * Pointer to the full (absolute) path of a .gadget folder. A gadget that is not packaged with Windows can only be run from one of the two following locations. Installation of the gadget in any other location will cause this method to fail with an access denied error.
     * 
     *                     
     * 
     * <div class="alert"><b>Note</b>  This path should not contain environment variables; the fully expanded path must be provided. <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">ExpandEnvironmentStrings</a> can be used to expand the path to the form required in this parameter.</div>
     * <div> </div>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCHED_E_ALREADY_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The gadget is already running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred involving the path of the gadget folder pointed to by <i>gadgetPath</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl/nf-shobjidl-idesktopgadget-rungadget
     */
    RunGadget(gadgetPath) {
        gadgetPath := gadgetPath is String ? StrPtr(gadgetPath) : gadgetPath

        result := ComCall(3, this, "ptr", gadgetPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
