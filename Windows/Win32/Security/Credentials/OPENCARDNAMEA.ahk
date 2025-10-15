#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Contains the information that the GetOpenCardName function uses to initialize a smart card Select Card dialog box.
 * @remarks
 * 
  * > [!NOTE]
  * > The winscard.h header defines OPENCARDNAME as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winscard/ns-winscard-opencardnamea
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 * @charset ANSI
 */
class OPENCARDNAMEA extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * Specifies the length, in bytes, of the structure. This member must not be <b>NULL</b>.
     * @type {Integer}
     */
    dwStructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The window that owns the dialog box. This member can be any valid window handle, or it can be <b>NULL</b> for desktop default.
     * @type {HWND}
     */
    hwndOwner{
        get {
            if(!this.HasProp("__hwndOwner"))
                this.__hwndOwner := HWND(this.ptr + 8)
            return this.__hwndOwner
        }
    }

    /**
     * The context used for communication with the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card</a> <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager</a>. Call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a> to set the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardreleasecontext">SCardReleaseContext</a> to release it. This member must not be <b>NULL</b>.
     * @type {Pointer}
     */
    hSCardContext {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a buffer that contains null-terminated group name strings. The last string in the buffer must be terminated by two null characters. Each string is the name of a group of cards that is to be included in the search. If <b>lpstrGroupNames</b> is <b>NULL</b>, the default group (<a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">Scard$DefaultReaders</a>) is searched.
     * @type {PSTR}
     */
    lpstrGroupNames{
        get {
            if(!this.HasProp("__lpstrGroupNames"))
                this.__lpstrGroupNames := PSTR(this.ptr + 24)
            return this.__lpstrGroupNames
        }
    }

    /**
     * The maximum number of bytes (ANSI version) or characters (<a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> version) in the <b>lpstrGroupNames</b> string.
     * @type {Integer}
     */
    nMaxGroupNames {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A pointer to a buffer that contains null-terminated card name strings. The last string in the buffer must be terminated by two null characters. Each string is the name of a card that is to be located.
     * @type {PSTR}
     */
    lpstrCardNames{
        get {
            if(!this.HasProp("__lpstrCardNames"))
                this.__lpstrCardNames := PSTR(this.ptr + 40)
            return this.__lpstrCardNames
        }
    }

    /**
     * The maximum number of bytes (ANSI version) or characters (<a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> version) in the <b>lpstrCardNames</b> string.
     * @type {Integer}
     */
    nMaxCardNames {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Reserved for future use. Set to <b>NULL</b>. An array of GUIDs that identify the interfaces required.
     * @type {Pointer<Guid>}
     */
    rgguidInterfaces {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Reserved for futures use. Set to <b>NULL</b>. The number of interfaces in the <b>rgguidInterfaces</b> array.
     * @type {Integer}
     */
    cguidInterfaces {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * If the card is located, the <b>lpstrRdr</b> buffer contains the name of the reader that contains the located card. The buffer should be at least 256 characters long.
     * @type {PSTR}
     */
    lpstrRdr{
        get {
            if(!this.HasProp("__lpstrRdr"))
                this.__lpstrRdr := PSTR(this.ptr + 72)
            return this.__lpstrRdr
        }
    }

    /**
     * The size, in bytes (ANSI version) or characters (<a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> version), of the buffer pointed to by <b>lpstrRdr</b>. If the buffer is too small to contain the reader information, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-getopencardnamea">GetOpenCardName</a> returns SCARD_E_NO_MEMORY and the required size of the buffer pointed to by <b>lpstrRdr</b>.
     * @type {Integer}
     */
    nMaxRdr {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * If the card is located, the <b>lpstrCard</b> buffer contains the name of the located card. The buffer should be at least 256 characters long.
     * @type {PSTR}
     */
    lpstrCard{
        get {
            if(!this.HasProp("__lpstrCard"))
                this.__lpstrCard := PSTR(this.ptr + 88)
            return this.__lpstrCard
        }
    }

    /**
     * The size, in bytes (ANSI version) or characters (<a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> version), of the buffer pointed to by <b>lpstrCard</b>. If the buffer is too small to contain the card information, <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-getopencardnamea">GetOpenCardName</a> returns SCARD_E_NO_MEMORY and the required size of the buffer in <b>nMaxCard</b>.
     * @type {Integer}
     */
    nMaxCard {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * A pointer to a string to be placed in the title bar of the dialog box. If this member is <b>NULL</b>, the system uses the default title "Select Card:".
     * @type {PSTR}
     */
    lpstrTitle{
        get {
            if(!this.HasProp("__lpstrTitle"))
                this.__lpstrTitle := PSTR(this.ptr + 104)
            return this.__lpstrTitle
        }
    }

    /**
     * A set of bit flags you can use to initialize the dialog box. When the dialog box returns, it sets these flags to indicate the input of the user. This member can be a combination of the following flags.
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
     * Displays the dialog box only if the card being searched for by the calling application is not located and available for use in a reader. This allows the card to be found, connected (either through the internal dialog box mechanism or the user callback functions), and returned to the calling application.
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
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * A void pointer to user data. This pointer is passed back to the caller on the Connect, Check, and Disconnect routines.
     * @type {Pointer<Void>}
     */
    pvUserData {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * If <b>lpfnConnect</b> is not <b>NULL</b>, the <b>dwShareMode</b> and <b>dwPreferredProtocols</b> members are ignored.
     * 
     * If <b>lpfnConnect</b> is <b>NULL</b> and <b>dwShareMode</b> is nonzero, then an internal call is made to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardconnecta">SCardConnect</a> that uses <b>dwShareMode</b> and <b>dwPreferredProtocols</b> as the <i>dwShareMode</i> and <i>dwPreferredProtocols</i> parameters. If the connect succeeds, <b>hCardHandle</b> is set to the handle returned by <b>hSCardConnect</b>. 
     * 
     * If <b>lpfnConnect</b> is <b>NULL</b> and <b>dwShareMode</b> is zero, the dialog box returns <b>hCardHandle</b> as <b>NULL</b>.
     * @type {Integer}
     */
    dwShareMode {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Used for internal connection as described in <b>dwShareMode</b>.
     * @type {Integer}
     */
    dwPreferredProtocols {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * Returns the actual protocol in use when the dialog box makes a connection to a card.
     * @type {Integer}
     */
    dwActiveProtocol {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * A pointer to the card connect routine of the caller. If the caller needs to perform additional processing to connect to the card, this function pointer is set to the connect function for the user. If the connect function is successful, the card is left connected and initialized, and the card handle is returned. 
     * 
     * 
     * 
     * 
     * The prototype for the connect routine is as follows.
     * 
     * 
     * ```cpp
     * Connect(
     *   hSCardContext, // the card context passed in the parameter block
     *   szReader,      // the name of the reader
     *   mszCards,      // multiple string that contains the 
     *                  //    possible card names in the reader
     *   pvUserData     // pointer to user data passed in parameter block
     * );
     * 
     * ```
     * @type {Pointer<LPOCNCONNPROCA>}
     */
    lpfnConnect {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * A pointer to the card verify routine of the caller. If no special card verification is required, this pointer is <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * If the card is rejected by the verify routine, <b>FALSE</b> is returned and the card is disconnected, as indicated by <b>lpfnDisconnect</b>.
     * 
     * If the card is accepted by the verify routine, <b>TRUE</b> is returned. When the user accepts the card, all other cards currently connected will be disconnected, as indicated by <b>lpfnDisconnect</b>, and this card will be returned as the located card. The located card will remain connected.
     * 
     * The prototype for the check routine is as follows.
     * 
     * 
     * ```cpp
     * Check(
     *   hSCardContext, // the card context passed in the parameter block
     *   hCard,         // card handle
     *   pvUserData     // pointer to user data passed in the parameter block
     * );
     * 
     * ```
     * @type {Pointer<LPOCNCHKPROC>}
     */
    lpfnCheck {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * A pointer to the card disconnect routine of the caller. 
     * 
     * 
     * 
     * 
     * The prototype for the disconnect routine is as follows.
     * 
     * 
     * ```cpp
     * Disconnect(
     *   hSCardContext, // the card context passed in the parameter block
     *   hCard,         // card handle
     *   pvUserData     // pointer to user data passed in the parameter block
     * );
     * 
     * ```
     * 
     * 
     * <div class="alert"><b>Note</b>  When using <b>lpfnConnect</b>, <b>lpfnCheck</b>, and <b>lpfnDisconnect</b>, all three callback procedures should be present. Using these callbacks allows further verification that the calling application has found the appropriate card. This is the best way to ensure the appropriate card is selected.</div>
     * <div> </div>
     * @type {Pointer<LPOCNDSCPROC>}
     */
    lpfnDisconnect {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * A handle of the connected card (either through an internal dialog box connect or an <b>lpfnConnect</b> callback).
     * @type {Pointer}
     */
    hCardHandle {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }
}
