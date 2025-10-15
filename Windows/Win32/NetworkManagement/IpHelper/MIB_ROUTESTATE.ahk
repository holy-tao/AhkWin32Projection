#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_ROUTESTATE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    bRoutesSetToStack{
        get {
            if(!this.HasProp("__bRoutesSetToStack"))
                this.__bRoutesSetToStack := BOOL(this.ptr + 0)
            return this.__bRoutesSetToStack
        }
    }
}
