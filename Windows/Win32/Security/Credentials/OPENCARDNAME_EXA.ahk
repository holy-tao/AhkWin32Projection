#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\UI\WindowsAndMessaging\HICON.ahk

/**
 * The OPENCARDNAME_EX structure contains the information that the SCardUIDlgSelectCard function uses to initialize a smart card Select Card dialog box. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The winscard.h header defines OPENCARDNAME_EX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winscard/ns-winscard-opencardname_exa
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 * @charset ANSI
 */
class OPENCARDNAME_EXA extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * The length, in bytes, of the structure. The value of this member must not be <b>NULL</b>.
     * @type {Integer}
     */
    dwStructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The context used for communication with the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card</a> <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager</a>. Call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a> to set the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardreleasecontext">SCardReleaseContext</a> to release it. The value of this member must not be <b>NULL</b>.
     * @type {Pointer}
     */
    hSCardContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The window that owns the dialog box. This member can be any valid window handle, or it can be <b>NULL</b> for the desktop default.
     * @type {HWND}
     */
    hwndOwner{
        get {
            if(!this.HasProp("__hwndOwner"))
                this.__hwndOwner := HWND(16, this)
            return this.__hwndOwner
        }
    }

    /**
     * A set of bit flags that you can use to initialize the dialog box. When the dialog box returns, it sets these flags to indicate the user's input. This member can be one of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SC_DLG_MINIMAL_UI"></a><a id="sc_dlg_minimal_ui"></a><dl>
     * <dt><b>SC_DLG_MINIMAL_UI</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display the dialog box only if the card being searched for by the calling application is not located and available for use in a reader. This allows the card to be found, connected (either through the internal dialog box mechanism or the user callback functions), and returned to the calling application.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SC_DLG_NO_UI"></a><a id="sc_dlg_no_ui"></a><dl>
     * <dt><b>SC_DLG_NO_UI</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Force no display of the <b>Select Card</b> <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user interface</a> (UI), regardless of search outcome.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SC_DLG_FORCE_UI"></a><a id="sc_dlg_force_ui"></a><dl>
     * <dt><b>SC_DLG_FORCE_UI</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Force display of the <b>Select Card</b> UI, regardless of the search outcome.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A pointer to a string to be placed in the title bar of the dialog box. If this member is <b>NULL</b>, the system uses the default title "Select Card:".
     * @type {PSTR}
     */
    lpstrTitle {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to a string to be displayed to the user as a prompt to insert the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card</a>. If this member is <b>NULL</b>, the system uses the default text "Please insert a smart card".
     * @type {PSTR}
     */
    lpstrSearchDesc {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A handle to an icon (32 x 32 pixels). You can specify a vendor-specific icon to display in the dialog box. If this value is <b>NULL</b>, a generic, smart card reader–loaded icon is displayed.
     * @type {HICON}
     */
    hIcon{
        get {
            if(!this.HasProp("__hIcon"))
                this.__hIcon := HICON(48, this)
            return this.__hIcon
        }
    }

    /**
     * A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/ns-winscard-opencard_search_criteriaa">OPENCARD_SEARCH_CRITERIA</a> structure to be used, or <b>NULL</b>, if one is not used.
     * @type {Pointer<OPENCARD_SEARCH_CRITERIAA>}
     */
    pOpenCardSearchCriteria {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to the caller's card connect routine. If the caller needs to perform additional processing to connect to the card, this function pointer is set to the user's connect function. If the connect function is successful, the card is left connected and initialized, and the card handle is returned. 
     * 
     * 
     * 
     * 
     * The prototype for the connect routine is as follows.
     * 
     * 
     * ```cpp
     * Connect(
     *   hSCardContext,  // the card context passed in the parameter block
     *   szReader,       // the name of the reader
     *   mszCards,       // multiple string that contains the possible 
     *                   //  card names in the reader
     *   pvUserData      // pointer to user data passed in parameter block
     * );
     * 
     * ```
     * @type {Pointer<LPOCNCONNPROCA>}
     */
    lpfnConnect {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A void pointer to user data. This pointer is passed back to the caller on the Connect routine.
     * @type {Pointer<Void>}
     */
    pvUserData {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * If <b>lpfnConnect</b> is not <b>NULL</b>, the <b>dwShareMode</b> and <b>dwPreferredProtocols</b> members are ignored. If <b>lpfnConnect</b> is <b>NULL</b> and <b>dwShareMode</b> is nonzero, an internal call is made to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardconnecta">SCardConnect</a> that uses <b>dwShareMode</b> and <b>dwPreferredProtocols</b> as the <i>dwShareMode</i> and <i>dwPreferredProtocols</i> parameters. If the connect succeeds, <b>hCardHandle</b> is set to the handle returned by <b>SCardConnect</b>. If <b>lpfnConnect</b> is <b>NULL</b> and <b>dwShareMode</b> is zero, <b>hCardHandle</b> is set to <b>NULL</b>.
     * @type {Integer}
     */
    dwShareMode {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Used for internal connection as described in <b>dwShareMode</b>.
     * @type {Integer}
     */
    dwPreferredProtocols {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * If the card is located, the <b>lpstrRdr</b> buffer contains the name of the reader that contains the located card. The buffer should be at least 256 characters long.
     * @type {PSTR}
     */
    lpstrRdr {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Size, in bytes (ANSI version) or characters (<a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> version), of the buffer pointed to by <b>lpstrRdr</b>. If the buffer is too small to contain the reader information, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scarduidlgselectcarda">SCardUIDlgSelectCard</a> returns SCARD_E_NO_MEMORY and the required size of the buffer pointed to by <b>lpstrRdr</b>.
     * @type {Integer}
     */
    nMaxRdr {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * If the card is located, the <i>lpstrCard</i> buffer contains the name of the located card. The buffer should be at least 256 characters long.
     * @type {PSTR}
     */
    lpstrCard {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Size, in bytes (ANSI version) or characters (<a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> version), of the buffer pointed to by <i>lpstrCard</i>. If the buffer is too small to contain the card information, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scarduidlgselectcarda">SCardUIDlgSelectCard</a> returns SCARD_E_NO_MEMORY and the required size of the buffer in <b>nMaxCard</b>.
     * @type {Integer}
     */
    nMaxCard {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * The actual protocol in use when the dialog box makes a connection to a card.
     * @type {Integer}
     */
    dwActiveProtocol {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * A handle of the connected card (either through an internal dialog box connect or an <b>lpfnConnect</b> callback).
     * @type {Pointer}
     */
    hCardHandle {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }
}
