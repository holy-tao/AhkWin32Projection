#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Com\CY.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\Variant\VARIANT.ahk

/**
 * The MMC_SNAPIN_PROPERTY structure is introduced in MMC 2.0.
 * @see https://learn.microsoft.com/windows/win32/api/mmcobj/ns-mmcobj-mmc_snapin_property
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_SNAPIN_PROPERTY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Name of the property.
     * @type {Pointer<Char>}
     */
    pszPropName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The property's value; if the property is being changed, this is the new value.
     * @type {VARIANT}
     */
    varValue{
        get {
            if(!this.HasProp("__varValue"))
                this.__varValue := VARIANT(this.ptr + 8)
            return this.__varValue
        }
    }

    /**
     * The action taking place on the property, as defined in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmcobj/ne-mmcobj-mmc_property_action">MMC_PROPERTY_ACTION</a>.
     * @type {Integer}
     */
    eAction {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
