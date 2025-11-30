#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Members of the RND_ADVERTISING_SCOPE enumeration specify how widely a conference announcement is distributed. Values correspond to the advertising scope property on the ITDirectoryObjectConference interface.
 * @remarks
 * 
 * Mapping between scope string value, enum value, and 
 * <a href="https://docs.microsoft.com/windows/win32/tapi/t-tapgloss">time to live</a> (TTL) based on SDP Internet draft.
 * 
 * <table>
 * <tr>
 * <th>Scope string value</th>
 * <th>RND_ADVERTISING_SCOPE</th>
 * <th>TTL</th>
 * </tr>
 * <tr>
 * <td>Local</td>
 * <td>AS_LOCAL</td>
 * <td>1</td>
 * </tr>
 * <tr>
 * <td>Site</td>
 * <td>AS_SITE</td>
 * <td>15</td>
 * </tr>
 * <tr>
 * <td>Region</td>
 * <td>AS_REGION</td>
 * <td>63</td>
 * </tr>
 * <tr>
 * <td>World</td>
 * <td>AS_WORLD</td>
 * <td>127</td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//rend/ne-rend-rnd_advertising_scope
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class RND_ADVERTISING_SCOPE extends Win32Enum{

    /**
     * Advertising scope is local.
     * @type {Integer (Int32)}
     */
    static RAS_LOCAL => 1

    /**
     * Advertising scope is site.
     * @type {Integer (Int32)}
     */
    static RAS_SITE => 2

    /**
     * Advertising scope is country or region.
     * @type {Integer (Int32)}
     */
    static RAS_REGION => 3

    /**
     * Advertising scope is the world.
     * @type {Integer (Int32)}
     */
    static RAS_WORLD => 4
}
