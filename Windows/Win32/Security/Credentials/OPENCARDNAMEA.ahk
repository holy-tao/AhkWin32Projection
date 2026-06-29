#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains the information that the GetOpenCardName function uses to initialize a smart card Select Card dialog box. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The winscard.h header defines OPENCARDNAME as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winscard/ns-winscard-opencardnamea
 * @namespace Windows.Win32.Security.Credentials
 * @charset ANSI
 */
export default struct OPENCARDNAMEA {
    #StructPack 8

    /**
     * Specifies the length, in bytes, of the structure. This member must not be <b>NULL</b>.
     */
    dwStructSize : UInt32

    /**
     * The window that owns the dialog box. This member can be any valid window handle, or it can be <b>NULL</b> for desktop default.
     */
    hwndOwner : HWND

    /**
     * The context used for communication with the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card</a> <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager</a>. Call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardestablishcontext">SCardEstablishContext</a> to set the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">resource manager context</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardreleasecontext">SCardReleaseContext</a> to release it. This member must not be <b>NULL</b>.
     */
    hSCardContext : IntPtr

    /**
     * A pointer to a buffer that contains null-terminated group name strings. The last string in the buffer must be terminated by two null characters. Each string is the name of a group of cards that is to be included in the search. If <b>lpstrGroupNames</b> is <b>NULL</b>, the default group (<a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">Scard$DefaultReaders</a>) is searched.
     */
    lpstrGroupNames : PSTR

    /**
     * The maximum number of bytes (ANSI version) or characters (<a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> version) in the <b>lpstrGroupNames</b> string.
     */
    nMaxGroupNames : UInt32

    /**
     * A pointer to a buffer that contains null-terminated card name strings. The last string in the buffer must be terminated by two null characters. Each string is the name of a card that is to be located.
     */
    lpstrCardNames : PSTR

    /**
     * The maximum number of bytes (ANSI version) or characters (<a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> version) in the <b>lpstrCardNames</b> string.
     */
    nMaxCardNames : UInt32

    /**
     * Reserved for future use. Set to <b>NULL</b>. An array of GUIDs that identify the interfaces required.
     */
    rgguidInterfaces : Guid.Ptr

    /**
     * Reserved for futures use. Set to <b>NULL</b>. The number of interfaces in the <b>rgguidInterfaces</b> array.
     */
    cguidInterfaces : UInt32

    /**
     * If the card is located, the <b>lpstrRdr</b> buffer contains the name of the reader that contains the located card. The buffer should be at least 256 characters long.
     */
    lpstrRdr : PSTR

    /**
     * The size, in bytes (ANSI version) or characters (<a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> version), of the buffer pointed to by <b>lpstrRdr</b>. If the buffer is too small to contain the reader information, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-getopencardnamea">GetOpenCardName</a> returns SCARD_E_NO_MEMORY and the required size of the buffer pointed to by <b>lpstrRdr</b>.
     */
    nMaxRdr : UInt32

    /**
     * If the card is located, the <b>lpstrCard</b> buffer contains the name of the located card. The buffer should be at least 256 characters long.
     */
    lpstrCard : PSTR

    /**
     * The size, in bytes (ANSI version) or characters (<a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> version), of the buffer pointed to by <b>lpstrCard</b>. If the buffer is too small to contain the card information, <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-getopencardnamea">GetOpenCardName</a> returns SCARD_E_NO_MEMORY and the required size of the buffer in <b>nMaxCard</b>.
     */
    nMaxCard : UInt32

    /**
     * A pointer to a string to be placed in the title bar of the dialog box. If this member is <b>NULL</b>, the system uses the default title "Select Card:".
     */
    lpstrTitle : PSTR

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
     */
    dwFlags : UInt32

    /**
     * A void pointer to user data. This pointer is passed back to the caller on the Connect, Check, and Disconnect routines.
     */
    pvUserData : IntPtr

    /**
     * If <b>lpfnConnect</b> is not <b>NULL</b>, the <b>dwShareMode</b> and <b>dwPreferredProtocols</b> members are ignored.
     * 
     * If <b>lpfnConnect</b> is <b>NULL</b> and <b>dwShareMode</b> is nonzero, then an internal call is made to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardconnecta">SCardConnect</a> that uses <b>dwShareMode</b> and <b>dwPreferredProtocols</b> as the <i>dwShareMode</i> and <i>dwPreferredProtocols</i> parameters. If the connect succeeds, <b>hCardHandle</b> is set to the handle returned by <b>hSCardConnect</b>. 
     * 
     * If <b>lpfnConnect</b> is <b>NULL</b> and <b>dwShareMode</b> is zero, the dialog box returns <b>hCardHandle</b> as <b>NULL</b>.
     */
    dwShareMode : UInt32

    /**
     * Used for internal connection as described in <b>dwShareMode</b>.
     */
    dwPreferredProtocols : UInt32

    /**
     * Returns the actual protocol in use when the dialog box makes a connection to a card.
     */
    dwActiveProtocol : UInt32

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
     */
    lpfnConnect : IntPtr

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
     */
    lpfnCheck : IntPtr

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
     */
    lpfnDisconnect : IntPtr

    /**
     * A handle of the connected card (either through an internal dialog box connect or an <b>lpfnConnect</b> callback).
     */
    hCardHandle : IntPtr

}
