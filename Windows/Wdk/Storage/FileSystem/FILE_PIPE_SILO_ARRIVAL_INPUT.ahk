#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_PIPE_SILO_ARRIVAL_INPUT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    JobHandle{
        get {
            if(!this.HasProp("__JobHandle"))
                this.__JobHandle := HANDLE(0, this)
            return this.__JobHandle
        }
    }
}
