#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EventArgsType.ahk
#Include .\UiaChangeInfo.ahk

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
class UiaChangesEventArgs extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {EventArgsType}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    EventId {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    EventIdCount {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Pointer<UiaChangeInfo>}
     */
    pUiaChanges {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
