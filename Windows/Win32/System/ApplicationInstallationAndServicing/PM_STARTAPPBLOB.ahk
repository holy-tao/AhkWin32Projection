#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PM_APPLICATION_STATE.ahk
#Include .\PM_APPLICATION_INSTALL_TYPE.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_STARTAPPBLOB extends Win32Struct {
    static sizeof => 80

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
    AppTitle {
        get {
            if(!this.HasProp("__AppTitle"))
                this.__AppTitle := BSTR(24, this)
            return this.__AppTitle
        }
    }

    /**
     * @type {BSTR}
     */
    IconPath {
        get {
            if(!this.HasProp("__IconPath"))
                this.__IconPath := BSTR(32, this)
            return this.__IconPath
        }
    }

    /**
     * @type {BOOL}
     */
    IsUninstallable {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {PM_APPLICATION_INSTALL_TYPE}
     */
    AppInstallType {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {Guid}
     */
    InstanceID {
        get {
            if(!this.HasProp("__InstanceID"))
                this.__InstanceID := Guid(48, this)
            return this.__InstanceID
        }
    }

    /**
     * @type {PM_APPLICATION_STATE}
     */
    State {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * @type {BOOL}
     */
    IsModern {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * @type {BOOL}
     */
    IsModernLightUp {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    LightUpSupportMask {
        get => NumGet(this, 76, "ushort")
        set => NumPut("ushort", value, this, 76)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 80
    }
}
