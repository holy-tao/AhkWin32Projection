#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DSOP_SCOPE_INIT_INFO.ahk" { DSOP_SCOPE_INIT_INFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The DSOP_INIT_INFO structure contains data required to initialize an object picker dialog box. This structure is used with the IDsObjectPicker::Initialize method.
 * @see https://learn.microsoft.com/windows/win32/api/objsel/ns-objsel-dsop_init_info
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DSOP_INIT_INFO {
    #StructPack 8

    /**
     * Contains the size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Pointer to a null-terminated Unicode string that contains the name of the target computer. The dialog box operates as if it is running on the target computer, using the target computer to determine the joined domain and enterprise. If this value is <b>NULL</b>, the target computer is the local computer.
     */
    pwzTargetComputer : PWSTR

    /**
     * Specifies the number of elements in the <b>aDsScopeInfos</b> array.
     */
    cDsScopeInfos : UInt32

    /**
     * Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objsel/ns-objsel-dsop_scope_init_info">DSOP_SCOPE_INIT_INFO</a> structures that describe the scopes from which the user can select objects. This member cannot be <b>NULL</b> and the array must contain at least one element because the object picker cannot operate without at least one scope.
     */
    aDsScopeInfos : DSOP_SCOPE_INIT_INFO.Ptr

    /**
     * Flags that determine the object picker options. This member can be zero or a combination of one or more of the following flags.
     */
    flOptions : UInt32

    /**
     * Contains the number of elements in the <b>apwzAttributeNames</b> array. This member can be zero.
     */
    cAttributesToFetch : UInt32

    /**
     * Pointer to an array of null-terminated Unicode strings that contain the names of the attributes to retrieve for each selected object. If <b>cAttributesToFetch</b> is zero, this member is ignored.
     */
    apwzAttributeNames : PWSTR.Ptr

}
