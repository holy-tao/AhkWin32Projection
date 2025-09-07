#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies flags for the generic parental levels defined in the DVD specification.
 * @remarks
 * <b>DVD_PARENTAL_LEVEL_8</b> is the most restrictive level and <b>DVD_PARENTAL_LEVEL_1</b> is the least restrictive. The way in which the levels are interpreted or used varies from country/region to country/region. In the United States and Canada, the levels correspond to the Motion Picture Association of America (MPAA) rating levels as shown in the following table.
  * 
  * <table>
  * <tr>
  * <th>Parental level
  *             </th>
  * <th>Meaning
  *             </th>
  * </tr>
  * <tr>
  * <td>1</td>
  * <td>The rating is G, General.</td>
  * </tr>
  * <tr>
  * <td>3</td>
  * <td>The rating is PG, Parental Guidance Suggested.</td>
  * </tr>
  * <tr>
  * <td>4</td>
  * <td>The rating is PG-13, Parental Guidance Suggested, not recommended for those under 13.</td>
  * </tr>
  * <tr>
  * <td>6</td>
  * <td>The rating is R, Restricted.</td>
  * </tr>
  * <tr>
  * <td>7</td>
  * <td>The rating is NC-17.</td>
  * </tr>
  * </table>
  *  
  * 
  * This enumeration is used in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-gettitleparentallevels">IDvdInfo2::GetTitleParentalLevels</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_parental_level
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_PARENTAL_LEVEL{

    /**
     * Parental level 8.
     * @type {Integer (Int32)}
     */
    static DVD_PARENTAL_LEVEL_8 => 32768

    /**
     * Parental level 7.
     * @type {Integer (Int32)}
     */
    static DVD_PARENTAL_LEVEL_7 => 16384

    /**
     * Parental level 6.
     * @type {Integer (Int32)}
     */
    static DVD_PARENTAL_LEVEL_6 => 8192

    /**
     * Parental level 5.
     * @type {Integer (Int32)}
     */
    static DVD_PARENTAL_LEVEL_5 => 4096

    /**
     * Parental level 4.
     * @type {Integer (Int32)}
     */
    static DVD_PARENTAL_LEVEL_4 => 2048

    /**
     * Parental level 3.
     * @type {Integer (Int32)}
     */
    static DVD_PARENTAL_LEVEL_3 => 1024

    /**
     * Parental level 2.
     * @type {Integer (Int32)}
     */
    static DVD_PARENTAL_LEVEL_2 => 512

    /**
     * Parental level 1.
     * @type {Integer (Int32)}
     */
    static DVD_PARENTAL_LEVEL_1 => 256
}
