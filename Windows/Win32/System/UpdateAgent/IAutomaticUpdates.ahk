#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAutomaticUpdatesSettings.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains the functionality of Automatic Updates.
 * @remarks
 * 
 * You can create an instance of this interface by using the AutomaticUpdates coclass. Use the Microsoft.Update.AutoUpdate program identifier to create the object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iautomaticupdates
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IAutomaticUpdates extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomaticUpdates
     * @type {Guid}
     */
    static IID => Guid("{673425bf-c082-4c7c-bdfd-569464b8e0ce}")

    /**
     * The class identifier for AutomaticUpdates
     * @type {Guid}
     */
    static CLSID => Guid("{bfe18e9c-6d87-4450-b37c-e02f0b373803}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DetectNow", "Pause", "Resume", "ShowSettingsDialog", "get_Settings", "get_ServiceEnabled", "EnableService"]

    /**
     * @type {IAutomaticUpdatesSettings} 
     */
    Settings {
        get => this.get_Settings()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ServiceEnabled {
        get => this.get_ServiceEnabled()
    }

    /**
     * Begins the Automatic Updates detection task if Automatic Updates is enabled. If any updates are detected, the installation behavior is determined by the NotificationLevel property of the IAutomaticUpdatesSettings interface.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code. 
     * 
     * This method can also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_AU_NOSERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Automatic Updates is not enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_AU_PAUSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Automatic Updates is paused.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_LEGACYSERVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You cannot search for updates if the following conditions are true:
     * 
     * <ul>
     * <li>The <a href="/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-get_serverselection">ServerSelection</a> property of the <a href="/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface is set to <a href="/windows/desktop/api/wuapicommon/ne-wuapicommon-serverselection">ssManagedServer</a> or <a href="/windows/desktop/api/wuapicommon/ne-wuapicommon-serverselection">ssDefault</a>.</li>
     * <li>The managed server on a computer is a Microsoft Software Update Services (SUS) version 1.0 server.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdates-detectnow
     */
    DetectNow() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Pauses automatic updates.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * 
     * This method can also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This  method cannot be called from a remote computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer could not access the update site.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_AU_NOSERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Automatic Updates is not enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_AU_PAUSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Automatic Updates is paused.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_LEGACYSERVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You cannot search for updates if the following conditions are true:
     * 
     * <ul>
     * <li>The <a href="/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-get_serverselection">ServerSelection</a> property of the <a href="/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface is set to <a href="/windows/desktop/api/wuapicommon/ne-wuapicommon-serverselection">ssManagedServer</a> or <a href="/windows/desktop/api/wuapicommon/ne-wuapicommon-serverselection">ssDefault</a>.</li>
     * <li>The managed server on a computer is a Microsoft Software Update Services (SUS) 1.0 server.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdates-pause
     */
    Pause() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Restarts automatic updating if automatic updating is paused.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code. 
     * 
     * This method can also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This  method cannot be called from a remote computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer could not access the update site.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_AU_NOSERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Automatic Updates is not enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_AU_PAUSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Automatic Updates is paused.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_LEGACYSERVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You cannot search for updates if the following conditions are true:
     * 
     * <ul>
     * <li>The <a href="/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-get_serverselection">ServerSelection</a> property of the <a href="/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface is set to <a href="/windows/desktop/api/wuapicommon/ne-wuapicommon-serverselection">ssManagedServer</a> or <a href="/windows/desktop/api/wuapicommon/ne-wuapicommon-serverselection">ssDefault</a>.</li>
     * <li>The managed server on a computer is a Microsoft Software Update Services (SUS) 1.0 server.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdates-resume
     */
    Resume() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Displays a dialog box that contains settings for Automatic Updates.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code. 
     * 
     * This method can also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This  method cannot be called from a remote computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_AU_NOSERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Automatic Updates is not enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_AU_PAUSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Automatic Updates is paused.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_LEGACYSERVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You cannot search for updates if the following conditions are true:
     * 
     * <ul>
     * <li>The <a href="/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-get_serverselection">ServerSelection</a> property of the <a href="/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface is set to <a href="/windows/desktop/api/wuapicommon/ne-wuapicommon-serverselection">ssManagedServer</a> or <a href="/windows/desktop/api/wuapicommon/ne-wuapicommon-serverselection">ssDefault</a>.</li>
     * <li>The managed server on a computer is a Microsoft Software Update Services (SUS) 1.0 server.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdates-showsettingsdialog
     */
    ShowSettingsDialog() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Gets the configuration settings for Automatic Updates.
     * @remarks
     * 
     * The returned interface can be used to change the current settings and to read the current settings.
     * 
     * 
     * @returns {IAutomaticUpdatesSettings} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdates-get_settings
     */
    get_Settings() {
        result := ComCall(11, this, "ptr*", &retval := 0, "HRESULT")
        return IAutomaticUpdatesSettings(retval)
    }

    /**
     * Gets a Boolean value that indicates whether all the components that Automatic Updates requires are available.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdates-get_serviceenabled
     */
    get_ServiceEnabled() {
        result := ComCall(12, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Enables all the components that Automatic Updates requires.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code. 
     * 
     * This method can also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This  method cannot be called from a remote computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_AU_NOSERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Automatic Updates is not enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_AU_PAUSED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Automatic Updates is paused.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_LEGACYSERVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You cannot search for updates if the following conditions are true:
     * 
     * <ul>
     * <li>The <a href="/windows/desktop/api/wuapi/nf-wuapi-iupdatesearcher-get_serverselection">ServerSelection</a>  property of the <a href="/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface is set to <a href="/windows/desktop/api/wuapicommon/ne-wuapicommon-serverselection">ssManagedServer</a> or <a href="/windows/desktop/api/wuapicommon/ne-wuapicommon-serverselection">ssDefault</a>.</li>
     * <li>The managed server on a computer is a Microsoft Software Update Services (SUS) 1.0 server.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdates-enableservice
     */
    EnableService() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}
