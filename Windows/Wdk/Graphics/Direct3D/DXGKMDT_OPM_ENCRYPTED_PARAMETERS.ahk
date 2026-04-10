#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMDT_OPM_ENCRYPTED_PARAMETERS extends Win32Struct {
    static sizeof => 256

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    abEncryptedParameters {
        get {
            if(!this.HasProp("__abEncryptedParametersProxyArray"))
                this.__abEncryptedParametersProxyArray := Win32FixedArray(this.ptr + 0, 256, Primitive, "char")
            return this.__abEncryptedParametersProxyArray
        }
    }
}
