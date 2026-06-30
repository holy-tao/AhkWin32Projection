#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies the FMTID/PID identifier that programmatically identifies a property. Replaces SHCOLUMNID.
 * @remarks
 * As of Windows Vista, the <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a> structure is simply an alias for <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>, as shown in this declaration from Shobjidl.h.
 * 
 *                 
 * 
 * 
 * ```cpp
 * typedef PROPERTYKEY SHCOLUMNID;
 * ```
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a> can be considered a legacy structure with <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> being the new, preferred form. <b>PROPERTYKEY</b> has a broader purpose than <b>SHCOLUMNID</b>, and the new name is more descriptive of its uses.
 * @see https://learn.microsoft.com/windows/win32/api/wtypes/ns-wtypes-propertykey
 * @namespace Windows.Win32.Foundation
 */
class PROPERTYKEY extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * Type: <b>GUID</b>
     * 
     * A unique GUID for the property.
     * @type {Guid}
     */
    fmtid {
        get {
            if(!this.HasProp("__fmtid"))
                this.__fmtid := Guid(0, this)
            return this.__fmtid
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A property identifier (PID). This parameter is not used as in <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a>. It is recommended that you set this value to PID_FIRST_USABLE. Any value greater than or equal to 2 is acceptable.
     * 
     * <div class="alert"><b>Note</b>  Values of 0 and 1 are reserved and should not be used.</div>
     * <div> </div>
     * @type {Integer}
     */
    pid {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
