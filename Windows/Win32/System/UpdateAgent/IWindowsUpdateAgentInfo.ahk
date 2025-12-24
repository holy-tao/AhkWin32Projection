#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Retrieves information about the version of Windows Update Agent (WUA).
 * @remarks
 * 
 * The <b>IWindowsUpdateAgentInfo</b> interface  may require  you to update WUA. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/updating-the-windows-update-agent">Updating Windows Update Agent</a>.
 * 
 * You can create an instance of this interface by using the WindowsUpdateAgentInfo coclass. Use the Microsoft.Update.AgentInfo program identifier to create the object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iwindowsupdateagentinfo
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IWindowsUpdateAgentInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsUpdateAgentInfo
     * @type {Guid}
     */
    static IID => Guid("{85713fa1-7796-4fa2-be3b-e2d6124dd373}")

    /**
     * The class identifier for WindowsUpdateAgentInfo
     * @type {Guid}
     */
    static CLSID => Guid("{c2e88c2f-6f5b-4aaa-894b-55c847ad3a2d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInfo"]

    /**
     * Retrieves version information about Windows Update Agent (WUA).
     * @param {VARIANT} varInfoIdentifier A literal string value that specifies  the type of information  that  the <i>retval</i> parameter returns. The following table lists the current possible string values.
     * 
     * <table>
     * <tr>
     * <td><b>ApiMajorVersion</b></td>
     * <td>Retrieves the current major version of WUA.</td>
     * </tr>
     * <tr>
     * <td><b>ApiMinorVersion</b></td>
     * <td>Retrieves the current minor version of WUA.</td>
     * </tr>
     * <tr>
     * <td><b>ProductVersionString</b></td>
     * <td>Retrieves  the file version of the Wuapi.dll file in string format.</td>
     * </tr>
     * </table>
     * @returns {VARIANT} <ul>
     * <li>Returns the major version of the WUA API as a <b>LONG</b> value  within the  <b>VARIANT</b> variable if the value of the <i>varInfoIdentifier</i> parameter is <b>ApiMajorVersion</b>.</li>
     * <li>Returns the minor version of the WUA API as a <b>LONG</b> value within the  <b>VARIANT</b> variable if the value of <i>varInfoIdentifier</i> is <b>ApiMinorVersion</b>.</li>
     * <li>Returns the file version of the Wuapi.dll file  as a <b>BSTR</b> value within the  <b>VARIANT</b> variable if the value of <i>varInfoIdentifier</i> is <b>ProductVersionString</b>.</li>
     * </ul>
     * <div class="alert"><b>Note</b>  The format of a returned string is as follows:  "<i>&lt;Windows-major-version&gt;</i>.<i>&lt;Windows-minor-version&gt;</i>.<i>&lt;build&gt;</i>.<i>&lt;update&gt;</i>".</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwindowsupdateagentinfo-getinfo
     */
    GetInfo(varInfoIdentifier) {
        retval := VARIANT()
        result := ComCall(7, this, "ptr", varInfoIdentifier, "ptr", retval, "HRESULT")
        return retval
    }
}
