#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }

/**
 * The LSA_OBJECT_ATTRIBUTES structure is used with the LsaOpenPolicy function to specify the attributes of the connection to the Policy object.
 * @remarks
 * The <b>LSA_OBJECT_ATTRIBUTES</b> structure is defined in the LsaLookup.h header file.
 * 
 * <b>Windows Server 2008 with SP2 and earlier, Windows Vista with SP2 and earlier, Windows Server 2003, Windows XP/2000:  </b>The <b>LSA_OBJECT_ATTRIBUTES</b> structure is defined in the NTSecAPI.h header file.
 * @see https://learn.microsoft.com/windows/win32/api/lsalookup/ns-lsalookup-lsa_object_attributes
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_OBJECT_ATTRIBUTES {
    #StructPack 8

    /**
     * Specifies the size, in bytes, of the <b>LSA_OBJECT_ATTRIBUTES</b> structure.
     */
    Length : UInt32

    /**
     * Should be <b>NULL</b>.
     */
    RootDirectory : HANDLE

    /**
     * Should be <b>NULL</b>.
     */
    ObjectName : LSA_UNICODE_STRING.Ptr

    /**
     * Should be zero.
     */
    Attributes : UInt32

    /**
     * Should be <b>NULL</b>.
     */
    SecurityDescriptor : IntPtr

    /**
     * Should be <b>NULL</b>.
     */
    SecurityQualityOfService : IntPtr

}
