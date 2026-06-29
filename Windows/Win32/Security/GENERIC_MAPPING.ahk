#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the mapping of generic access rights to specific and standard access rights for an object.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-generic_mapping
 * @namespace Windows.Win32.Security
 */
export default struct GENERIC_MAPPING {
    #StructPack 4

    /**
     * Specifies an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access mask</a> defining read access to an object.
     */
    GenericRead : UInt32

    /**
     * Specifies an access mask defining write access to an object.
     */
    GenericWrite : UInt32

    /**
     * Specifies an access mask defining execute access to an object.
     */
    GenericExecute : UInt32

    /**
     * Specifies an access mask defining all possible types of access to an object.
     */
    GenericAll : UInt32

}
