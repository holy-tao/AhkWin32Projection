#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TOKENBINDING_RESULT_DATA.ahk" { TOKENBINDING_RESULT_DATA }

/**
 * Contains the results for each of the token bindings that TokenBindingVerifyMessage verified.
 * @see https://learn.microsoft.com/windows/win32/api/tokenbinding/ns-tokenbinding-tokenbinding_result_list
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TOKENBINDING_RESULT_LIST {
    #StructPack 8

    /**
     * The number of elements in the array that  the <b>resultData</b> member contains.
     */
    resultCount : UInt32

    /**
     * An array of results, one for each of the token bindings that <a href="https://docs.microsoft.com/windows/desktop/api/tokenbinding/nf-tokenbinding-tokenbindingverifymessage">TokenBindingVerifyMessage</a>   verified.
     */
    resultData : TOKENBINDING_RESULT_DATA.Ptr

}
