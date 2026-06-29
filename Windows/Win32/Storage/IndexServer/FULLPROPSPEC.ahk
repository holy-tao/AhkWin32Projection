#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPSPEC.ahk
#Include ..\..\System\Com\StructuredStorage\PROPSPEC_KIND.ahk

/**
 * Specifies a property set and a property within the property set.
 * @see https://learn.microsoft.com/windows/win32/api/filter/ns-filter-fullpropspec
 * @namespace Windows.Win32.Storage.IndexServer
 */
class FULLPROPSPEC extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * The globally unique identifier (GUID) that identifies the property set.
     * @type {Guid}
     */
    guidPropSet {
        get {
            if(!this.HasProp("__guidPropSet"))
                this.__guidPropSet := Guid(0, this)
            return this.__guidPropSet
        }
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propspec">PROPSPEC</a> structure that specifies a property either by its property identifier (propid) or by the associated string name (<b>lpwstr</b>).
     * @type {PROPSPEC}
     */
    psProperty {
        get {
            if(!this.HasProp("__psProperty"))
                this.__psProperty := PROPSPEC(16, this)
            return this.__psProperty
        }
    }
}
