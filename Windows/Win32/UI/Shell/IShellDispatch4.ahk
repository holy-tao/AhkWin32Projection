#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IShellDispatch3.ahk

/**
 * Extends the IShellDispatch3 object.
 * @remarks
 * The **IShellDispatch4** object has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * For a discussion of Windows services, see the [Services](../services/services.md) documentation.
 * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch4
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellDispatch4 extends IShellDispatch3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellDispatch4
     * @type {Guid}
     */
    static IID => Guid("{efd84b2d-4bcf-4298-be25-eb542a59fbda}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 40

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WindowsSecurity", "ToggleDesktop", "ExplorerPolicy", "GetSetting"]

    /**
     * IShellDispatch4.WindowsSecurity method - Displays the Windows Security dialog box.
     * @remarks
     * This method displays the dialog box shown after pressing CTRL+ALT+DELETE or using the security option on the **Start** menu.
     * 
     * > [!Note]  
     * > This method can be used only when connected by a terminal session to Microsoft Terminal Server.
     * @returns {HRESULT} This method has no parameters.
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch4-windowssecurity
     */
    WindowsSecurity() {
        result := ComCall(40, this, "HRESULT")
        return result
    }

    /**
     * IShellDispatch4.ToggleDesktop method - Displays or hides the desktop.
     * @remarks
     * This method has the same effect as the **Show Desktop** button on the taskbar. It either hides all open windows to show the desktop or it hides the desktop by showing all open windows. The **ToggleDesktop** method does not display a user interface, it just invokes the toggle action.
     * @returns {HRESULT} This method has no parameters.
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch4-toggledesktop
     */
    ToggleDesktop() {
        result := ComCall(41, this, "HRESULT")
        return result
    }

    /**
     * IShellDispatch4.ExplorerPolicy method - Gets the value for a specified Windows Internet Explorer policy.
     * @remarks
     * Network Administrators can control and manage the computing environment of their users by setting policies.
     * 
     * The specified value name must be within the **HKEY\_CURRENT\_USER**\\**Software**\\**Microsoft**\\**Windows**\\**CurrentVersion**\\**Policies**\\**Explorer** subkey. If the value name does not exist then the method returns **null**.
     * @param {BSTR} bstrPolicyName Type: **[**BSTR**](/previous-versions/windows/desktop/automat/bstr)**
     * 
     * A **String** that specifies the name of the policy.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch4-explorerpolicy
     */
    ExplorerPolicy(bstrPolicyName) {
        bstrPolicyName := bstrPolicyName is String ? BSTR.Alloc(bstrPolicyName).Value : bstrPolicyName

        pValue := VARIANT()
        result := ComCall(42, this, "ptr", bstrPolicyName, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * IShellDispatch4.GetSetting method - Retrieves a global Shell setting.
     * @param {Integer} lSetting Type: **long**
     * 
     * A value that specifies the current Shell setting to retrieve. Only one setting can be retrieved in each call. The following values are recognized by this method.
     * 
     * 
     * <span id="SSF_AUTOCHECKSELECT"></span><span id="ssf_autocheckselect"></span>
     * 
     * <span id="SSF_AUTOCHECKSELECT"></span><span id="ssf_autocheckselect"></span>**SSF\_AUTOCHECKSELECT** (0x00800000)
     * 
     * 
     * 
     * **Windows Vista and later**. The state of the **Use check boxes to select items** option. This option is enabled automatically when the system has a pen input device configured.
     * 
     * 
     * <span id="SSF_DESKTOPHTML"></span><span id="ssf_desktophtml"></span>
     * 
     * <span id="SSF_DESKTOPHTML"></span><span id="ssf_desktophtml"></span>**SSF\_DESKTOPHTML** (0x00000200)
     * 
     * 
     * 
     * Not used.
     * 
     * 
     * <span id="SSF_DONTPRETTYPATH"></span><span id="ssf_dontprettypath"></span>
     * 
     * <span id="SSF_DONTPRETTYPATH"></span><span id="ssf_dontprettypath"></span>**SSF\_DONTPRETTYPATH** (0x00000800)
     * 
     * 
     * 
     * The state of the **Allow all uppercase names** option. As of Windows Vista, this folder option is no longer available.
     * 
     * 
     * <span id="SSF_DOUBLECLICKINWEBVIEW"></span><span id="ssf_doubleclickinwebview"></span>
     * 
     * <span id="SSF_DOUBLECLICKINWEBVIEW"></span><span id="ssf_doubleclickinwebview"></span>**SSF\_DOUBLECLICKINWEBVIEW** (0x00000080)
     * 
     * 
     * 
     * The state of the **Double-click to open an item (single-click to select)** option.
     * 
     * 
     * <span id="SSF_FILTER"></span><span id="ssf_filter"></span>
     * 
     * <span id="SSF_FILTER"></span><span id="ssf_filter"></span>**SSF\_FILTER** (0x00010000)
     * 
     * 
     * 
     * Not used.
     * 
     * 
     * <span id="SSF_HIDDENFILEEXTS"></span><span id="ssf_hiddenfileexts"></span>
     * 
     * <span id="SSF_HIDDENFILEEXTS"></span><span id="ssf_hiddenfileexts"></span>**SSF\_HIDDENFILEEXTS** (0x00000004)
     * 
     * 
     * 
     * Not used.
     * 
     * 
     * <span id="SSF_HIDEICONS"></span><span id="ssf_hideicons"></span>
     * 
     * <span id="SSF_HIDEICONS"></span><span id="ssf_hideicons"></span>**SSF\_HIDEICONS** (0x00004000)
     * 
     * 
     * 
     * The state of icon display in the Windows Explorer list view. If this option is active, no icons are displayed in the list view.
     * 
     * 
     * <span id="SSF_ICONSONLY"></span><span id="ssf_iconsonly"></span>
     * 
     * <span id="SSF_ICONSONLY"></span><span id="ssf_iconsonly"></span>**SSF\_ICONSONLY** (0x01000000)
     * 
     * 
     * 
     * **Windows Vista and later**. The state of display name display in the Windows Explorer list view. If this option is active, icons are displayed in the list view, but display names are not.
     * 
     * 
     * <span id="SSF_MAPNETDRVBUTTON"></span><span id="ssf_mapnetdrvbutton"></span>
     * 
     * <span id="SSF_MAPNETDRVBUTTON"></span><span id="ssf_mapnetdrvbutton"></span>**SSF\_MAPNETDRVBUTTON** (0x00001000)
     * 
     * 
     * 
     * The state of the **Show map network drive button in toolbar** option. As of Windows Vista, this option is no longer available.
     * 
     * 
     * <span id="SSF_NOCONFIRMRECYCLE"></span><span id="ssf_noconfirmrecycle"></span>
     * 
     * <span id="SSF_NOCONFIRMRECYCLE"></span><span id="ssf_noconfirmrecycle"></span>**SSF\_NOCONFIRMRECYCLE** (0x00008000)
     * 
     * 
     * 
     * The state of the Recycle Bin's **Display delete confirmation dialog** option.
     * 
     * 
     * <span id="SSF_NONETCRAWLING"></span><span id="ssf_nonetcrawling"></span>
     * 
     * <span id="SSF_NONETCRAWLING"></span><span id="ssf_nonetcrawling"></span>**SSF\_NONETCRAWLING** (0x00100000)
     * 
     * 
     * 
     * The state of the **Automatically search for network folders and printers** option. As of Windows Vista, this option is no longer available.
     * 
     * 
     * <span id="SSF_SEPPROCESS"></span><span id="ssf_sepprocess"></span>
     * 
     * <span id="SSF_SEPPROCESS"></span><span id="ssf_sepprocess"></span>**SSF\_SEPPROCESS** (0x00080000)
     * 
     * 
     * 
     * The state of the **Launch folder windows in a separate process** option.
     * 
     * 
     * <span id="SSF_SERVERADMINUI"></span><span id="ssf_serveradminui"></span>
     * 
     * <span id="SSF_SERVERADMINUI"></span><span id="ssf_serveradminui"></span>**SSF\_SERVERADMINUI** (0x00000004)
     * 
     * 
     * 
     * Not used.
     * 
     * 
     * <span id="SSF_SHOWALLOBJECTS"></span><span id="ssf_showallobjects"></span>
     * 
     * <span id="SSF_SHOWALLOBJECTS"></span><span id="ssf_showallobjects"></span>**SSF\_SHOWALLOBJECTS** (0x00000001)
     * 
     * 
     * 
     * The state of the **Hidden files and folders** option.
     * 
     * 
     * <span id="SSF_SHOWATTRIBCOL"></span><span id="ssf_showattribcol"></span>
     * 
     * <span id="SSF_SHOWATTRIBCOL"></span><span id="ssf_showattribcol"></span>**SSF\_SHOWATTRIBCOL** (0x00000100)
     * 
     * 
     * 
     * The state of the **Show File Attributes in Detail View** option. As of Windows Vista, this option is no longer available.
     * 
     * 
     * <span id="SSF_SHOWCOMPCOLOR"></span><span id="ssf_showcompcolor"></span>
     * 
     * <span id="SSF_SHOWCOMPCOLOR"></span><span id="ssf_showcompcolor"></span>**SSF\_SHOWCOMPCOLOR** (0x00000008)
     * 
     * 
     * 
     * The state of the **Show encrypted or compressed NTFS files in color** option.
     * 
     * 
     * <span id="SSF_SHOWEXTENSIONS"></span><span id="ssf_showextensions"></span>
     * 
     * <span id="SSF_SHOWEXTENSIONS"></span><span id="ssf_showextensions"></span>**SSF\_SHOWEXTENSIONS** (0x00000002)
     * 
     * 
     * 
     * The state of the **Hide extensions for known file types** option.
     * 
     * 
     * <span id="SSF_SHOWINFOTIP"></span><span id="ssf_showinfotip"></span>
     * 
     * <span id="SSF_SHOWINFOTIP"></span><span id="ssf_showinfotip"></span>**SSF\_SHOWINFOTIP** (0x00002000)
     * 
     * 
     * 
     * The state of the **Show pop-up description for folder and desktop items** option.
     * 
     * 
     * <span id="SSF_SHOWSTARTPAGE"></span><span id="ssf_showstartpage"></span>
     * 
     * <span id="SSF_SHOWSTARTPAGE"></span><span id="ssf_showstartpage"></span>**SSF\_SHOWSTARTPAGE** (0x00400000)
     * 
     * 
     * 
     * Not used.
     * 
     * 
     * <span id="SSF_SHOWSUPERHIDDEN"></span><span id="ssf_showsuperhidden"></span>
     * 
     * <span id="SSF_SHOWSUPERHIDDEN"></span><span id="ssf_showsuperhidden"></span>**SSF\_SHOWSUPERHIDDEN** (0x00040000)
     * 
     * 
     * 
     * The state of the **Hide protected operating system files** option.
     * 
     * 
     * <span id="SSF_SHOWSYSFILES"></span><span id="ssf_showsysfiles"></span>
     * 
     * <span id="SSF_SHOWSYSFILES"></span><span id="ssf_showsysfiles"></span>**SSF\_SHOWSYSFILES** (0x00000020)
     * 
     * 
     * 
     * The state of the **Hidden files and folders** option. In Windows Vista and later, this is equivalent to SSF\_SHOWALLOBJECTS. In versions of Windows before Windows Vista, this value referred to the state of the **Do not show hidden files and folders** option.
     * 
     * 
     * <span id="SSF_SHOWTYPEOVERLAY"></span><span id="ssf_showtypeoverlay"></span>
     * 
     * <span id="SSF_SHOWTYPEOVERLAY"></span><span id="ssf_showtypeoverlay"></span>**SSF\_SHOWTYPEOVERLAY** (0x02000000)
     * 
     * 
     * 
     * **Windows Vista and later**. The state of the **Display file icon on thumbnails** option. If this option is active, a file type overlay is applied when a file supplies a thumbnail representation.
     * 
     * 
     * <span id="SSF_SORTCOLUMNS"></span><span id="ssf_sortcolumns"></span>
     * 
     * <span id="SSF_SORTCOLUMNS"></span><span id="ssf_sortcolumns"></span>**SSF\_SORTCOLUMNS** (0x00000010)
     * 
     * 
     * 
     * Not used.
     * 
     * 
     * <span id="SSF_STARTPANELON"></span><span id="ssf_startpanelon"></span>
     * 
     * <span id="SSF_STARTPANELON"></span><span id="ssf_startpanelon"></span>**SSF\_STARTPANELON** (0x00200000)
     * 
     * 
     * 
     * The state of the Windows XP display option, which selects between the Windows XP style and the classic style. As of Windows Vista, this option is no longer available.
     * 
     * 
     * <span id="SSF_WEBVIEW"></span><span id="ssf_webview"></span>
     * 
     * <span id="SSF_WEBVIEW"></span><span id="ssf_webview"></span>**SSF\_WEBVIEW** (0x00020000)
     * 
     * 
     * 
     * The state of the **Display as a web view option**. As of Windows Vista, this option is no longer available.
     * 
     * 
     * <span id="SSF_WIN95CLASSIC"></span><span id="ssf_win95classic"></span>
     * 
     * <span id="SSF_WIN95CLASSIC"></span><span id="ssf_win95classic"></span>**SSF\_WIN95CLASSIC** (0x00000400)
     * 
     * 
     * 
     * The state of the **Classic Style** option. As of Windows Vista, this option is no longer available.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch4-getsetting
     */
    GetSetting(lSetting) {
        result := ComCall(43, this, "int", lSetting, "short*", &pResult := 0, "HRESULT")
        return pResult
    }
}
