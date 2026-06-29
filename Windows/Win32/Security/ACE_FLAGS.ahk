#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security
 */
export default struct ACE_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static CONTAINER_INHERIT_ACE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FAILED_ACCESS_ACE_FLAG => 128

    /**
     * @type {Integer (UInt32)}
     */
    static INHERIT_ONLY_ACE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INHERITED_ACE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NO_PROPAGATE_INHERIT_ACE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OBJECT_INHERIT_ACE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUCCESSFUL_ACCESS_ACE_FLAG => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SUB_CONTAINERS_AND_OBJECTS_INHERIT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SUB_CONTAINERS_ONLY_INHERIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUB_OBJECTS_ONLY_INHERIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INHERIT_NO_PROPAGATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INHERIT_ONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NO_INHERITANCE => 0
}
