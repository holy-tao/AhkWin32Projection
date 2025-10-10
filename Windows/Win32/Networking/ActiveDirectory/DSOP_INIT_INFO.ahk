#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DSOP_INIT_INFO structure contains data required to initialize an object picker dialog box. This structure is used with the IDsObjectPicker::Initialize method.
 * @see https://docs.microsoft.com/windows/win32/api//objsel/ns-objsel-dsop_init_info
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DSOP_INIT_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Contains the size, in bytes, of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the name of the target computer. The dialog box operates as if it is running on the target computer, using the target computer to determine the joined domain and enterprise. If this value is <b>NULL</b>, the target computer is the local computer.
     * @type {Pointer<Char>}
     */
    pwzTargetComputer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the number of elements in the <b>aDsScopeInfos</b> array.
     * @type {Integer}
     */
    cDsScopeInfos {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objsel/ns-objsel-dsop_scope_init_info">DSOP_SCOPE_INIT_INFO</a> structures that describe the scopes from which the user can select objects. This member cannot be <b>NULL</b> and the array must contain at least one element because the object picker cannot operate without at least one scope.
     * @type {Pointer<DSOP_SCOPE_INIT_INFO>}
     */
    aDsScopeInfos {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Flags that determine the object picker options. This member can be zero or a combination of one or more of the following flags.
     * @type {Integer}
     */
    flOptions {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Contains the number of elements in the <b>apwzAttributeNames</b> array. This member can be zero.
     * @type {Integer}
     */
    cAttributesToFetch {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Pointer to an array of null-terminated Unicode strings that contain the names of the attributes to retrieve for each selected object. If <b>cAttributesToFetch</b> is zero, this member is ignored.
     * @type {Pointer<Char>}
     */
    apwzAttributeNames {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 48
    }
}
