#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\Apis.ahk
#Include ..\..\..\..\Win32Handle.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-instance
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_INSTANCE extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => [0]

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    Free(){
        Jet.JetTerm(this.Value)
        this.Value := 0
    }
}
