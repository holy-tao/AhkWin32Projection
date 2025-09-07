#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Storage\IndexServer\DBID.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class SEC_OBJECT_ELEMENT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 2

    /**
     * @type {Pointer<Guid>}
     */
    guidObjectType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {DBID}
     */
    ObjectID{
        get {
            if(!this.HasProp("__ObjectID"))
                this.__ObjectID := DBID(this.ptr + 8)
            return this.__ObjectID
        }
    }
}
