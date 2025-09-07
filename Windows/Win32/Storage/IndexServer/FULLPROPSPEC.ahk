#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Com\StructuredStorage\PROPSPEC.ahk

/**
 * Specifies a property set and a property within the property set.
 * @see https://learn.microsoft.com/windows/win32/api/filter/ns-filter-fullpropspec
 * @namespace Windows.Win32.Storage.IndexServer
 * @version v4.0.30319
 */
class FULLPROPSPEC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The globally unique identifier (GUID) that identifies the property set.
     * @type {Pointer<Guid>}
     */
    guidPropSet {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propspec">PROPSPEC</a> structure that specifies a property either by its property identifier (propid) or by the associated string name (<b>lpwstr</b>).
     * @type {PROPSPEC}
     */
    psProperty{
        get {
            if(!this.HasProp("__psProperty"))
                this.__psProperty := PROPSPEC(this.ptr + 8)
            return this.__psProperty
        }
    }
}
