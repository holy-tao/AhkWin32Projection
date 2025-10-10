#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used by the QISearch function to describe a single interface.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  Prior to Windows Vista, <b>QITAB</b> was not declared in a public header file. To use it in those cases, you must use define it yourself as it is given here. Under Windows Vista, <b>QITAB</b> is included in Shlwapi.h and this is not necessary.</div>
  * <div> </div>
  * To mark the end of a <b>QITAB</b> table, set the <b>piid</b> member to <b>NULL</b> and the <b>dwOffset</b> member to 0. See the <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-qisearch">QISearch</a> function for an example of how to use this structure.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shlwapi/ns-shlwapi-qitab
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class QITAB extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>const IID*</b>
     * 
     * A pointer to the IID of the interface represented by this structure.
     * @type {Pointer<Guid>}
     */
    piid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * The offset, in bytes, from the base of the object to the start of the interface.
     * @type {Integer}
     */
    dwOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
