#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk
#Include ..\..\KernelStreaming\KSM_NODE.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSM_BDA_DRM_SETDRM extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {KSM_NODE}
     */
    NodeMethod {
        get {
            if(!this.HasProp("__NodeMethod"))
                this.__NodeMethod := KSM_NODE(0, this)
            return this.__NodeMethod
        }
    }

    /**
     * @type {Guid}
     */
    NewDRMuuid {
        get {
            if(!this.HasProp("__NewDRMuuid"))
                this.__NewDRMuuid := Guid(32, this)
            return this.__NewDRMuuid
        }
    }
}
