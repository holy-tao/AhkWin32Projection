#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains method parameter flags.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/ne-wbemcli-wbem_change_flag_type
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_CHANGE_FLAG_TYPE{

    /**
     * The class is created if it does not exist, or overwritten if it exists already.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_CREATE_OR_UPDATE => 0

    /**
     * The class is overwritten if it exists already, but will not be created if it does not exist.The class must exist for the call to be successful.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_UPDATE_ONLY => 1

    /**
     * This flag is used for creation only. The call fails if the class already exists.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_CREATE_ONLY => 2

    /**
     * This flag allows a class to be updated if there are no derived classes and there are no instances for that class. It also allows updates in all cases if the change is just to nonimportant qualifiers (for example, the <b>Description</b> qualifier). This is the default behavior for this call and is used for compatibility with previous versions of Windows Management. If the class has instances or changes are to important qualifiers, the update fails.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_UPDATE_COMPATIBLE => 0

    /**
     * This flag allows updates of classes even if there are child classes as long as the change does not cause any conflicts with child classes. An example of an update this flag would allow would be to add a new property to the base class that was not previously mentioned in any of the child classes. If the class has instances, the update fails.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_UPDATE_SAFE_MODE => 32

    /**
     * This flag forces updates of classes when conflicting child classes exist. An example of an update this flag would force would be if a class qualifier were defined in a child class, and the base class tried to add the same qualifier which conflicted with the existing one. In force mode, this conflict would be resolved by deleting the conflicting qualifier in the child class.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_UPDATE_FORCE_MODE => 64

    /**
     * A mask value that can be used to simplify testing for the other flag values.
     * @type {Integer (Int32)}
     */
    static WBEM_MASK_UPDATE_MODE => 96

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_ADVISORY => 65536
}
