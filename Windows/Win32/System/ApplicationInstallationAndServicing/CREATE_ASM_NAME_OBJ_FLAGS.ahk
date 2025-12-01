#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CREATE_ASM_NAME_OBJ_FLAGS enumeration is used by the CreateAssemblyNameObject function.
 * @see https://learn.microsoft.com/windows/win32/api/winsxs/ne-winsxs-create_asm_name_obj_flags
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class CREATE_ASM_NAME_OBJ_FLAGS extends Win32Enum{

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
