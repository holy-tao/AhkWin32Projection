#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an error for the IMofCompiler interface.
 * @remarks
 * 
  * The   <i>ObjectNum</i>, <i>FirstLine</i>, and <i>LastLine</i> parameters only contain values for errors that relate to a particular class or instance in the file.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/ns-wbemcli-wbem_compile_status_info
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_COMPILE_STATUS_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * TBD
     * @type {Integer}
     */
    lPhaseError {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The actual error code.
     * @type {HRESULT}
     */
    hRes {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Object that is at fault.
     * @type {Integer}
     */
    ObjectNum {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * First line number of the object.
     * @type {Integer}
     */
    FirstLine {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Last line number of the object.
     * @type {Integer}
     */
    LastLine {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    dwOutFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
