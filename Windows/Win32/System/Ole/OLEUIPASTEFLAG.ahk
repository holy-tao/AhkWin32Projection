#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the user options that are available to the user when pasting this format, and within which group or list of choices (Paste, Paste Link, etc.).
 * @see https://docs.microsoft.com/windows/win32/api//oledlg/ne-oledlg-oleuipasteflag
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLEUIPASTEFLAG{

    /**
     * If the container does not specify this flag for the entry in the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/ns-oledlg-oleuipasteentrya">OLEUIPASTEENTRY</a> array passed as input to <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuipastespeciala">OleUIPasteSpecial</a>, the DisplayAsIcon button will be unchecked and disabled when the user selects the format that corresponds to the entry.
     * @type {Integer (Int32)}
     */
    static OLEUIPASTE_ENABLEICON => 2048

    /**
     * The entry in the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/ns-oledlg-oleuipasteentrya">OLEUIPASTEENTRY</a> array is valid for pasting only.
     * @type {Integer (Int32)}
     */
    static OLEUIPASTE_PASTEONLY => 0

    /**
     * The entry in the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/ns-oledlg-oleuipasteentrya">OLEUIPASTEENTRY</a> array is valid for pasting. It may also be valid for linking if any of the following linking flags are specified. If it is valid for linking, then the following flags indicate which link types are acceptable by OR'ing together the appropriate OLEUIPASTE_LINKTYPE<i>n</i> values. These values correspond as follows to the array of link types passed to <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuipastespeciala">OleUIPasteSpecial</a> in the <b>arrLinkTypes</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/ns-oledlg-oleuipastespeciala">OLEUIPASTESPECIAL</a> structure:
 * 
 * <ul>
 * <li>OLEUIPASTE_LINKTYPE1=arrLinkTypes[0]</li>
 * <li>OLEUIPASTE_LINKTYPE2=arrLinkTypes[1]</li>
 * <li>OLEUIPASTE_LINKTYPE3=arrLinkTypes[2]</li>
 * <li>OLEUIPASTE_LINKTYPE4=arrLinkTypes[3]</li>
 * <li>OLEUIPASTE_LINKTYPE5=arrLinkTypes[4]</li>
 * <li>OLEUIPASTE_LINKTYPE6=arrLinkTypes[5]</li>
 * <li>OLEUIPASTE_LINKTYPE7=arrLinkTypes[6]</li>
 * <li>OLEUIPASTE_LINKTYPE8=arrLinkTypes[7]</li>
 * </ul>
 * The <b>arrLinkTypes</b> array is an array of registered clipboard formats for linking. A maximum of 8 link types is allowed.
     * @type {Integer (Int32)}
     */
    static OLEUIPASTE_PASTE => 512

    /**
     * Any link type.
     * @type {Integer (Int32)}
     */
    static OLEUIPASTE_LINKANYTYPE => 1024

    /**
     * Link type 1.
     * @type {Integer (Int32)}
     */
    static OLEUIPASTE_LINKTYPE1 => 1

    /**
     * Link type 2.
     * @type {Integer (Int32)}
     */
    static OLEUIPASTE_LINKTYPE2 => 2

    /**
     * Link type 3.
     * @type {Integer (Int32)}
     */
    static OLEUIPASTE_LINKTYPE3 => 4

    /**
     * Link type 4.
     * @type {Integer (Int32)}
     */
    static OLEUIPASTE_LINKTYPE4 => 8

    /**
     * Link type 5.
     * @type {Integer (Int32)}
     */
    static OLEUIPASTE_LINKTYPE5 => 16

    /**
     * Link type 6.
     * @type {Integer (Int32)}
     */
    static OLEUIPASTE_LINKTYPE6 => 32

    /**
     * Link type 7.
     * @type {Integer (Int32)}
     */
    static OLEUIPASTE_LINKTYPE7 => 64

    /**
     * Link type 8.
     * @type {Integer (Int32)}
     */
    static OLEUIPASTE_LINKTYPE8 => 128
}
