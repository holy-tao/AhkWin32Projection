#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WFDSVC_CONNECTION_CAPABILITY extends Win32Struct
{
    static sizeof => 3

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    bNew{
        get {
            if(!this.HasProp("__bNew"))
                this.__bNew := BOOLEAN(this.ptr + 0)
            return this.__bNew
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bClient{
        get {
            if(!this.HasProp("__bClient"))
                this.__bClient := BOOLEAN(this.ptr + 1)
            return this.__bClient
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bGO{
        get {
            if(!this.HasProp("__bGO"))
                this.__bGO := BOOLEAN(this.ptr + 2)
            return this.__bGO
        }
    }
}
