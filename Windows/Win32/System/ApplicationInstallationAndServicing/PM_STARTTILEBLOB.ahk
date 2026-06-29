#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\TILE_TEMPLATE_TYPE.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PM_STARTTILE_TYPE.ahk
#Include .\PM_INVOCATIONINFO.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_STARTTILEBLOB extends Win32Struct {
    static sizeof => 216

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    ProductID {
        get {
            if(!this.HasProp("__ProductID"))
                this.__ProductID := Guid(4, this)
            return this.__ProductID
        }
    }

    /**
     * @type {BSTR}
     */
    TileID {
        get {
            if(!this.HasProp("__TileID"))
                this.__TileID := BSTR(24, this)
            return this.__TileID
        }
    }

    /**
     * @type {TILE_TEMPLATE_TYPE}
     */
    TemplateType {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Array<Integer>}
     */
    HubPosition {
        get {
            if(!this.HasProp("__HubPositionProxyArray"))
                this.__HubPositionProxyArray := Win32FixedArray(this.ptr + 36, 32, Primitive, "uint")
            return this.__HubPositionProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    HubVisibilityBitmask {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * @type {BOOL}
     */
    IsDefault {
        get => NumGet(this, 168, "int")
        set => NumPut("int", value, this, 168)
    }

    /**
     * @type {PM_STARTTILE_TYPE}
     */
    TileType {
        get => NumGet(this, 172, "int")
        set => NumPut("int", value, this, 172)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pbPropBlob {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    cbPropBlob {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {BOOL}
     */
    IsRestoring {
        get => NumGet(this, 188, "int")
        set => NumPut("int", value, this, 188)
    }

    /**
     * @type {BOOL}
     */
    IsModern {
        get => NumGet(this, 192, "int")
        set => NumPut("int", value, this, 192)
    }

    /**
     * @type {PM_INVOCATIONINFO}
     */
    InvocationInfo {
        get {
            if(!this.HasProp("__InvocationInfo"))
                this.__InvocationInfo := PM_INVOCATIONINFO(200, this)
            return this.__InvocationInfo
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 216
    }
}
