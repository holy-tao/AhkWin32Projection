#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DS3DVECTOR.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSDS3D_LISTENER_ORIENTATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {DS3DVECTOR}
     */
    Front{
        get {
            if(!this.HasProp("__Front"))
                this.__Front := DS3DVECTOR(0, this)
            return this.__Front
        }
    }

    /**
     * @type {DS3DVECTOR}
     */
    Top{
        get {
            if(!this.HasProp("__Top"))
                this.__Top := DS3DVECTOR(16, this)
            return this.__Top
        }
    }
}
