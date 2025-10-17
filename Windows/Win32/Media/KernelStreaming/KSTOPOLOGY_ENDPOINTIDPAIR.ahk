#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSTOPOLOGY_ENDPOINTID.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSTOPOLOGY_ENDPOINTIDPAIR extends Win32Struct
{
    static sizeof => 1056

    static packingSize => 8

    /**
     * @type {KSTOPOLOGY_ENDPOINTID}
     */
    RenderEndpoint{
        get {
            if(!this.HasProp("__RenderEndpoint"))
                this.__RenderEndpoint := KSTOPOLOGY_ENDPOINTID(0, this)
            return this.__RenderEndpoint
        }
    }

    /**
     * @type {KSTOPOLOGY_ENDPOINTID}
     */
    CaptureEndpoint{
        get {
            if(!this.HasProp("__CaptureEndpoint"))
                this.__CaptureEndpoint := KSTOPOLOGY_ENDPOINTID(528, this)
            return this.__CaptureEndpoint
        }
    }
}
