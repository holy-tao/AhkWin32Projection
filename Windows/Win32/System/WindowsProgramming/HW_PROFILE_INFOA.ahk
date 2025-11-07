#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a hardware profile.
 * @remarks
 * 
 * > [!NOTE]
 * > The winbase.h header defines HW_PROFILE_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ns-winbase-hw_profile_infoa
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 * @charset ANSI
 */
class HW_PROFILE_INFOA extends Win32Struct
{
    static sizeof => 124

    static packingSize => 4

    /**
     * The reported docking state of the computer. This member can be a combination of the following bit values. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DOCKINFO_DOCKED"></a><a id="dockinfo_docked"></a><dl>
     * <dt><b>DOCKINFO_DOCKED</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer is docked. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DOCKINFO_UNDOCKED"></a><a id="dockinfo_undocked"></a><dl>
     * <dt><b>DOCKINFO_UNDOCKED</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer is undocked. This flag is always set for desktop systems that cannot be undocked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DOCKINFO_USER_SUPPLIED"></a><a id="dockinfo_user_supplied"></a><dl>
     * <dt><b>DOCKINFO_USER_SUPPLIED</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getcurrenthwprofilea">GetCurrentHwProfile</a> retrieved the current docking state from information provided by the user in the <b>Hardware Profiles</b> page of the <b>System</b> control panel application. 
     * 
     * 
     * 
     * 
     * If there is no such value or the value is set to 0, this flag is set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DOCKINFO_USER_DOCKED"></a><a id="dockinfo_user_docked"></a><dl>
     * <dt><b>DOCKINFO_USER_DOCKED</b></dt>
     * <dt>0x5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer is docked, according to information provided by the user. This value is a combination of the DOCKINFO_USER_SUPPLIED and DOCKINFO_DOCKED flags.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DOCKINFO_USER_UNDOCKED"></a><a id="dockinfo_user_undocked"></a><dl>
     * <dt><b>DOCKINFO_USER_UNDOCKED</b></dt>
     * <dt>0x6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer is undocked, according to information provided by the user. This value is a combination of the DOCKINFO_USER_SUPPLIED and DOCKINFO_UNDOCKED flags.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwDockInfo {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The globally unique identifier (GUID) string for the current hardware profile. The string returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getcurrenthwprofilea">GetCurrentHwProfile</a> encloses the GUID in curly braces, {}; for example: 
     * 
     * 
     * 
     * 
     * {12340001-4980-1920-6788-123456789012}
     * 
     * You can use this string as a registry subkey under your application's configuration settings key in <b>HKEY_CURRENT_USER</b>. This enables you to store settings for each hardware profile.
     * @type {String}
     */
    szHwProfileGuid {
        get => StrGet(this.ptr + 4, 38, "UTF-8")
        set => StrPut(value, this.ptr + 4, 38, "UTF-8")
    }

    /**
     * The display name for the current hardware profile.
     * @type {String}
     */
    szHwProfileName {
        get => StrGet(this.ptr + 43, 79, "UTF-8")
        set => StrPut(value, this.ptr + 43, 79, "UTF-8")
    }
}
