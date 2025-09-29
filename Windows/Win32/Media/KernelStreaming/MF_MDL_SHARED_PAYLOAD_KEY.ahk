#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class MF_MDL_SHARED_PAYLOAD_KEY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _combined extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Integer}
         */
        pHandle {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        fHandle {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        uPayload {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    /**
     * @type {_combined}
     */
    combined{
        get {
            if(!this.HasProp("__combined"))
                this.__combined := %this.__Class%._combined(this.ptr + 0)
            return this.__combined
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    GMDLHandle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
