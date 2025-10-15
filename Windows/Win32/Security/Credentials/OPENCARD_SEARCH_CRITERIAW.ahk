#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The OPENCARD_SEARCH_CRITERIA structure is used by the SCardUIDlgSelectCard function in order to recognize cards that meet the requirements set forth by the caller. You can, however, call SCardUIDlgSelectCard without using this structure.
 * @remarks
 * 
  * > [!NOTE]
  * > The winscard.h header defines OPENCARD_SEARCH_CRITERIA as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winscard/ns-winscard-opencard_search_criteriaw
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 * @charset Unicode
 */
class OPENCARD_SEARCH_CRITERIAW extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * The length, in bytes, of the structure. Must not be <b>NULL</b>.
     * @type {Integer}
     */
    dwStructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a buffer containing null-terminated group name strings. The last string in the buffer must be terminated by two null characters. Each string is the name of a group of cards that is to be included in the search. If <b>lpstrGroupNames</b> is <b>NULL</b>, the default group (<a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">Scard$DefaultReaders</a>) is searched.
     * @type {PWSTR}
     */
    lpstrGroupNames{
        get {
            if(!this.HasProp("__lpstrGroupNames"))
                this.__lpstrGroupNames := PWSTR(this.ptr + 8)
            return this.__lpstrGroupNames
        }
    }

    /**
     * The maximum number of bytes (ANSI version) or characters (<a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> version) in the <b>lpstrGroupNames</b> string.
     * @type {Integer}
     */
    nMaxGroupNames {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Reserved for future use. An array of GUIDs that identifies the interfaces required. Set this member to <b>NULL</b>.
     * @type {Pointer<Guid>}
     */
    rgguidInterfaces {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Reserved for future use. The number of interfaces in the <b>rgguidInterfaces</b> array. Set this member to <b>NULL</b>.
     * @type {Integer}
     */
    cguidInterfaces {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A pointer to a buffer that contains null-terminated card name strings. The last string in the buffer must be terminated by two null characters. Each string is the name of a card that is to be located.
     * @type {PWSTR}
     */
    lpstrCardNames{
        get {
            if(!this.HasProp("__lpstrCardNames"))
                this.__lpstrCardNames := PWSTR(this.ptr + 40)
            return this.__lpstrCardNames
        }
    }

    /**
     * The maximum number of bytes (ANSI version) or characters (Unicode version) in the <b>lpstrGroupNames</b> string.
     * @type {Integer}
     */
    nMaxCardNames {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A pointer to the caller's card verify routine. If no special card verification is required, this pointer is <b>NULL</b>. If the card is rejected by the verify routine, <b>FALSE</b> is returned, and the card will be disconnected. If the card is accepted by the verify routine, <b>TRUE</b> is returned. 
     * 
     * 
     * 
     * 
     * The prototype for the check routine is as follows.
     * 
     * 
     * ```cpp
     * Boolean Check(
     *   hSCardContext, // the card context passed in the parameter block
     *   hCard,         // card handle
     *   pvUserData     // pointer to user data passed in the parameter block
     * );
     * 
     * ```
     * @type {Pointer<LPOCNCHKPROC>}
     */
    lpfnCheck {
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
     *   hSCardContext, // the card context passed in the parameter block
     *   szReader,      // the name of the reader
     *   mszCards,      // multiple string that contains
     *                  //    the possible card names in the reader
     *   pvUserData     // pointer to user data passed in parameter block
     * );
     * 
     * ```
     * @type {Pointer<LPOCNCONNPROCW>}
     */
    lpfnConnect {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A pointer to the caller's card disconnect routine. 
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
     * <div class="alert"><b>Note</b>  When you use <b>lpfnConnect</b>, <b>lpfnCheck</b>, and <b>lpfnDisconnect</b>, all three callback procedures should be present. Using these callbacks allows further verification that the calling application has found the appropriate card. This is the best way to ensure the appropriate card is selected. However, when using a value that is not <b>NULL</b> for <b>lpfnCheck</b>, either both <b>lpfnConnect</b> and <b>lpfnDisconnect</b> must not be <b>NULL</b> (and <b>pvUserData</b> should also be provided), or <b>dwShareMode</b> and <b>dwPreferredProtocols</b> must both be set.</div>
     * <div> </div>
     * @type {Pointer<LPOCNDSCPROC>}
     */
    lpfnDisconnect {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Void pointer to user data. This pointer is passed back to the caller on the Connect, Check, and Disconnect routines.
     * @type {Pointer<Void>}
     */
    pvUserData {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * If <b>lpfnConnect</b> is not <b>NULL</b>, the <b>dwShareMode</b> and <b>dwPreferredProtocols</b> members are ignored. If <b>lpfnConnect</b> is <b>NULL</b> and <b>dwShareMode</b> is nonzero, an internal call is made to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winscard/nf-winscard-scardconnecta">SCardConnect</a> that uses <b>dwShareMode</b> and <b>dwPreferredProtocols</b> as the parameter.
     * @type {Integer}
     */
    dwShareMode {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Used for internal connection as described in <b>dwShareMode</b>.
     * @type {Integer}
     */
    dwPreferredProtocols {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }
}
