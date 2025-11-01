#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 * @version v4.0.30319
 */
class NetShell {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static NETSH_ERROR_BASE => 15000

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_ENTRIES => 15000

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SYNTAX => 15001

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROTOCOL_NOT_IN_TRANSPORT => 15002

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_CHANGE => 15003

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CMD_NOT_FOUND => 15004

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ENTRY_PT_NOT_FOUND => 15005

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DLL_LOAD_FAILED => 15006

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INIT_DISPLAY => 15007

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TAG_ALREADY_PRESENT => 15008

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_OPTION_TAG => 15009

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_TAG => 15010

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MISSING_OPTION => 15011

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSPORT_NOT_PRESENT => 15012

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHOW_USAGE => 15013

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_OPTION_VALUE => 15014

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OKAY => 15015

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONTINUE_IN_PARENT_CONTEXT => 15016

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SUPPRESS_OUTPUT => 15017

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HELPER_ALREADY_REGISTERED => 15018

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONTEXT_ALREADY_REGISTERED => 15019

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PARSING_FAILURE => 15020

    /**
     * @type {Integer (UInt32)}
     */
    static NETSH_ERROR_END => 15019

    /**
     * @type {String}
     */
    static NS_GET_EVENT_IDS_FN_NAME => "GetEventIds"

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_NAME_LEN => 48

    /**
     * @type {Integer (UInt32)}
     */
    static NETSH_VERSION_50 => 20480

    /**
     * @type {String}
     */
    static NETSH_ARG_DELIMITER => "="

    /**
     * @type {String}
     */
    static NETSH_CMD_DELIMITER => " "

    /**
     * @type {Integer (UInt32)}
     */
    static NETSH_MAX_TOKEN_LENGTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NETSH_MAX_CMD_TOKEN_LENGTH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DEFAULT_CONTEXT_PRIORITY => 100

    /**
     * @type {String}
     */
    static GET_RESOURCE_STRING_FN_NAME => "GetResourceString"
;@endregion Constants

;@region Methods
    /**
     * Searches a table of legal values to find a value that matches a specific token.
     * @param {HANDLE} hModule Reserved. Set to null.
     * @param {PWSTR} pwcArg A token to match. The <i>pwcArg</i> parameter is usually an entry in the <i>ppwcArguments</i> array passed into the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nc-netsh-fn_handle_cmd">FN_HANDLE_CMD</a> function exposed by the helper (the command function).
     * @param {Integer} dwNumArg The number of entries in the <i>pEnumTable</i> array.
     * @param {Pointer<TOKEN_VALUE>} pEnumTable An array of token:value pairs.
     * @param {Pointer<Integer>} pdwValue Upon success, the <i>pdwValue</i> parameter is filled with the value associated with the token in the <i>pEnumTable</i> array.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netsh/nf-netsh-matchenumtag
     * @since windows5.1.2600
     */
    static MatchEnumTag(hModule, pwcArg, dwNumArg, pEnumTable, pdwValue) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule
        pwcArg := pwcArg is String ? StrPtr(pwcArg) : pwcArg

        pdwValueMarshal := pdwValue is VarRef ? "uint*" : "ptr"

        result := DllCall("NETSH.dll\MatchEnumTag", "ptr", hModule, "ptr", pwcArg, "uint", dwNumArg, "ptr", pEnumTable, pdwValueMarshal, pdwValue, "uint")
        return result
    }

    /**
     * Determines whether a user-entered string matches a specific string.
     * @param {PWSTR} pwszUserToken A string entered by the user.
     * @param {PWSTR} pwszCmdToken A string against which to check for a match.
     * @returns {BOOL} Returns <b>TRUE</b> if there is a match, <b>FALSE</b> if not.
     * @see https://docs.microsoft.com/windows/win32/api//netsh/nf-netsh-matchtoken
     * @since windows5.1.2600
     */
    static MatchToken(pwszUserToken, pwszCmdToken) {
        pwszUserToken := pwszUserToken is String ? StrPtr(pwszUserToken) : pwszUserToken
        pwszCmdToken := pwszCmdToken is String ? StrPtr(pwszCmdToken) : pwszCmdToken

        result := DllCall("NETSH.dll\MatchToken", "ptr", pwszUserToken, "ptr", pwszCmdToken, "int")
        return result
    }

    /**
     * Parses an argument string and verifies that all required tags are present.
     * @param {HANDLE} hModule Reserved. Set to null.
     * @param {Pointer<PWSTR>} ppwcArguments The arguments passed to 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nc-netsh-fn_handle_cmd">FN_HANDLE_CMD</a> (the command function) as its <i>ppwcArguments</i> parameter.
     * @param {Integer} dwCurrentIndex A value that specifies the first argument to process, such that <i>ppwcArguments</i>[<i>dwCurrentIndex</i>] is the first.
     * @param {Integer} dwArgCount The argument count passed as the <i>dwArgCount</i> parameter.
     * @param {Pointer<TAG_TYPE>} pttTags An array of tags of type 
     * <b>TAG_TYPE</b>.
     * @param {Integer} dwTagCount A number of entries in the <i>pttTags</i> array.
     * @param {Integer} dwMinArgs The minimum number of arguments required for this command.
     * @param {Integer} dwMaxArgs The maximum number of arguments allowed for this command.
     * @param {Pointer<Integer>} pdwTagType An array of <b>DWORD</b>s, with at least enough space for a number of entries equal to <i>dwArgCount</i> - <i>dwCurrentIndex</i>. Each <b>DWORD</b> contains the array index number in the <i>pttTags</i> array to which the array index number in the <i>ppwcArguments</i> array is matched. For example, if <i>ppwcArguments</i>[0] is matched to <i>pttTags</i>[2], <i>pdwTagType</i>[0] is 2.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid syntax.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TAG_ALREADY_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The tag is already present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid parameter was entered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_OPTION_TAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid option tag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to carry out the command.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//netsh/nf-netsh-preprocesscommand
     * @since windows5.1.2600
     */
    static PreprocessCommand(hModule, ppwcArguments, dwCurrentIndex, dwArgCount, pttTags, dwTagCount, dwMinArgs, dwMaxArgs, pdwTagType) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule

        pdwTagTypeMarshal := pdwTagType is VarRef ? "uint*" : "ptr"

        result := DllCall("NETSH.dll\PreprocessCommand", "ptr", hModule, "ptr", ppwcArguments, "uint", dwCurrentIndex, "uint", dwArgCount, "ptr", pttTags, "uint", dwTagCount, "uint", dwMinArgs, "uint", dwMaxArgs, pdwTagTypeMarshal, pdwTagType, "uint")
        return result
    }

    /**
     * Displays a system or application error message to the NetShell console.
     * @param {HANDLE} hModule A handle to the module from which the string should be loaded, or null for system error messages.
     * @param {Integer} dwErrId The identifier of the message to print.
     * @returns {Integer} Returns the number of characters printed. Returns zero upon failure.
     * @see https://docs.microsoft.com/windows/win32/api//netsh/nf-netsh-printerror
     * @since windows5.1.2600
     */
    static PrintError(hModule, dwErrId) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule

        result := DllCall("NETSH.dll\PrintError", "ptr", hModule, "uint", dwErrId, "CDecl uint")
        return result
    }

    /**
     * Displays localized output to the NetShell console.
     * @param {HANDLE} hModule A handle to the module from which the string should be loaded.
     * @param {Integer} dwMsgId The identifier  of the message to print.
     * @returns {Integer} Returns the number of characters printed. Returns zero upon failure.
     * @see https://docs.microsoft.com/windows/win32/api//netsh/nf-netsh-printmessagefrommodule
     * @since windows5.1.2600
     */
    static PrintMessageFromModule(hModule, dwMsgId) {
        hModule := hModule is Win32Handle ? NumGet(hModule, "ptr") : hModule

        result := DllCall("NETSH.dll\PrintMessageFromModule", "ptr", hModule, "uint", dwMsgId, "CDecl uint")
        return result
    }

    /**
     * Displays output to the NetShell console.
     * @param {PWSTR} pwszFormat A string to be output to the NetShell console.
     * @returns {Integer} Returns the number of characters printed. Returns zero upon failure.
     * @see https://docs.microsoft.com/windows/win32/api//netsh/nf-netsh-printmessage
     * @since windows5.1.2600
     */
    static PrintMessage(pwszFormat) {
        pwszFormat := pwszFormat is String ? StrPtr(pwszFormat) : pwszFormat

        result := DllCall("NETSH.dll\PrintMessage", "ptr", pwszFormat, "CDecl uint")
        return result
    }

    /**
     * Registers a helper context with NetShell.
     * @remarks
     * 
     * For top-level helpers, the 
     * <b>RegisterContext</b> parameter passed during the course of its initialization function is a pointer to the 
     * <b>RegisterContext</b> function. The pointer should be cast to type <b>NS_REGISTER_CONTEXT</b> before use.
     * 
     * 
     * @param {Pointer<NS_CONTEXT_ATTRIBUTES>} pChildContext Attributes of the context to register.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netsh/nf-netsh-registercontext
     * @since windows5.1.2600
     */
    static RegisterContext(pChildContext) {
        result := DllCall("NETSH.dll\RegisterContext", "ptr", pChildContext, "uint")
        return result
    }

    /**
     * Is called from within a helper's exposed InitHelperDll function, and registers the helper with the NetShell context.
     * @param {Pointer<Guid>} pguidParentContext A pointer to GUID of another helper under which the helper should be installed. If null, the helper is installed as a top-level helper.
     * @param {Pointer<NS_HELPER_ATTRIBUTES>} pfnRegisterSubContext Attributes of the helper.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netsh/nf-netsh-registerhelper
     * @since windows5.1.2600
     */
    static RegisterHelper(pguidParentContext, pfnRegisterSubContext) {
        result := DllCall("NETSH.dll\RegisterHelper", "ptr", pguidParentContext, "ptr", pfnRegisterSubContext, "uint")
        return result
    }

;@endregion Methods
}
