#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Lists qualifier flavors.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_flavor_type
 * @namespace Windows.Win32.System.Wmi
 */
class WBEM_FLAVOR_TYPE extends Win32Enum {

    /**
     * The qualifier is not propagated to instances or derived classes.
     * Native name: WBEM_FLAVOR_DONT_PROPAGATE
     * @type {Integer (Int32)}
     */
    static DONT_PROPAGATE => 0

    /**
     * The qualifier is propagated to instances.
     * Native name: WBEM_FLAVOR_FLAG_PROPAGATE_TO_INSTANCE
     * @type {Integer (Int32)}
     */
    static FLAG_PROPAGATE_TO_INSTANCE => 1

    /**
     * The qualifier is propagated to derived classes. This flavor is only appropriate for qualifiers defined for a class and cannot be attached to a qualifier describing a class instance.
     * Native name: WBEM_FLAVOR_FLAG_PROPAGATE_TO_DERIVED_CLASS
     * @type {Integer (Int32)}
     */
    static FLAG_PROPAGATE_TO_DERIVED_CLASS => 2

    /**
     * Native name: WBEM_FLAVOR_MASK_PROPAGATION
     * @type {Integer (Int32)}
     */
    static MASK_PROPAGATION => 15

    /**
     * When propagated to a derived class or instance, the value of the qualifier can be overridden. Setting EnableOverride is optional because being able to override the qualifier value is the default functionality for propagated qualifiers.
     * Native name: WBEM_FLAVOR_OVERRIDABLE
     * @type {Integer (Int32)}
     */
    static OVERRIDABLE => 0

    /**
     * The qualifier cannot be overridden in a derived class or instance. Note that being able to override a propagated qualifier is the default.
     * Native name: WBEM_FLAVOR_NOT_OVERRIDABLE
     * @type {Integer (Int32)}
     */
    static NOT_OVERRIDABLE => 16

    /**
     * Native name: WBEM_FLAVOR_MASK_PERMISSIONS
     * @type {Integer (Int32)}
     */
    static MASK_PERMISSIONS => 16

    /**
     * For a class: the property belongs to the derived-most class.
     * 
     * For an instance: the property is modified at the instance level (that is, either a value was supplied or a qualifier was added/modified).
     * Native name: WBEM_FLAVOR_ORIGIN_LOCAL
     * @type {Integer (Int32)}
     */
    static ORIGIN_LOCAL => 0

    /**
     * For a class: The property was inherited from the parent class.
     * 
     * For an instance: The property, while inherited from the parent class, has not been modified at the instance level.
     * Native name: WBEM_FLAVOR_ORIGIN_PROPAGATED
     * @type {Integer (Int32)}
     */
    static ORIGIN_PROPAGATED => 32

    /**
     * The property is a standard system property.
     * Native name: WBEM_FLAVOR_ORIGIN_SYSTEM
     * @type {Integer (Int32)}
     */
    static ORIGIN_SYSTEM => 64

    /**
     * Native name: WBEM_FLAVOR_MASK_ORIGIN
     * @type {Integer (Int32)}
     */
    static MASK_ORIGIN => 96

    /**
     * Native name: WBEM_FLAVOR_NOT_AMENDED
     * @type {Integer (Int32)}
     */
    static NOT_AMENDED => 0

    /**
     * The qualifier is not required in the basic class definition and can be moved to the amendment to be localized.
     * Native name: WBEM_FLAVOR_AMENDED
     * @type {Integer (Int32)}
     */
    static AMENDED => 128

    /**
     * Native name: WBEM_FLAVOR_MASK_AMENDED
     * @type {Integer (Int32)}
     */
    static MASK_AMENDED => 128
}
