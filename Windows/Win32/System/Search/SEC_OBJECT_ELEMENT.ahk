#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Storage\IndexServer\DBID.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
class SEC_OBJECT_ELEMENT extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Guid}
     */
    guidObjectType {
        get {
            if(!this.HasProp("__guidObjectType"))
                this.__guidObjectType := Guid(0, this)
            return this.__guidObjectType
        }
    }

    /**
     * @type {DBID}
     */
    ObjectID {
        get {
            if(!this.HasProp("__ObjectID"))
                this.__ObjectID := DBID(16, this)
            return this.__ObjectID
        }
    }
}
