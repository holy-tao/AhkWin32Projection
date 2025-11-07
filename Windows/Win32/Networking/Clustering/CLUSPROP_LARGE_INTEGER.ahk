#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUSPROP_SYNTAX.ahk
#Include .\CLUSPROP_VALUE.ahk

/**
 * Describes a signed large integer.
 * @remarks
 * 
 * Use caution when referencing large integer values in <b>DWORD</b>-aligned structures such 
 *      as value lists, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/property-lists">property lists</a>, and 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/parameter-blocks">parameter blocks</a>. For Windows Server for Itanium-based 
 *      systems, a naturally-aligned large integer value always begins on an address ending in 0h or 8h. 
 *      <b>DWORD</b>-alignment can cause large values to begin on unaligned boundaries (addresses 
 *      ending in 4h or Ch), which will cause an alignment fault when the data is read or written. You can avoid 
 *      alignment faults by separately copying the high and low <b>DWORD</b>s of large values into 
 *      local variables, which are guaranteed to be naturally aligned.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clusprop_large_integer
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSPROP_LARGE_INTEGER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {CLUSPROP_VALUE}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := CLUSPROP_VALUE(0, this)
            return this.__Base
        }
    }

    /**
     * Signed large integer value.
     * @type {Integer}
     */
    li {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }
}
