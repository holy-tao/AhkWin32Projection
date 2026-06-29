#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CREATE_ASM_NAME_OBJ_FLAGS enumeration is used by the CreateAssemblyNameObject function.
 * @see https://learn.microsoft.com/windows/win32/api/winsxs/ne-winsxs-create_asm_name_obj_flags
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct CREATE_ASM_NAME_OBJ_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * If this flag is specified, the <i>szAssemblyName</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/winsxs/nf-winsxs-createassemblynameobject">CreateAssemblyNameObject</a> is a fully-specified side-by-side assembly name and is parsed to the individual properties.
     * @type {Integer (Int32)}
     */
    static CANOF_PARSE_DISPLAY_NAME => 1

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static CANOF_SET_DEFAULT_VALUES => 2
}
