#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the results for each of the token bindings that TokenBindingVerifyMessage verified.
 * @see https://docs.microsoft.com/windows/win32/api//tokenbinding/ns-tokenbinding-tokenbinding_result_list
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TOKENBINDING_RESULT_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of elements in the array that  the <b>resultData</b> member contains.
     * @type {Integer}
     */
    resultCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of results, one for each of the token bindings that <a href="https://docs.microsoft.com/windows/desktop/api/tokenbinding/nf-tokenbinding-tokenbindingverifymessage">TokenBindingVerifyMessage</a>   verified.
     * @type {Pointer<TOKENBINDING_RESULT_DATA>}
     */
    resultData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
