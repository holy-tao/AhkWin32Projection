#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Specifies the offset of a registration object type name.
 * @see https://learn.microsoft.com/windows/win32/api/authz/ns-authz-authz_registration_object_type_name_offset
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET {
    #StructPack 8

    /**
     * A pointer to a wide character string that represents the name of the object type.
     */
    szObjectTypeName : PWSTR

    /**
     * Offset of the object type name in an object types message DLL.
     */
    dwOffset : UInt32

}
