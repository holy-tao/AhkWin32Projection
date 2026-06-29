#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MFRR_COMPONENT_HASH_INFO.ahk" { MFRR_COMPONENT_HASH_INFO }

/**
 * Contains information about one or more revoked components.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mfrr_components
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFRR_COMPONENTS {
    #StructPack 8

    /**
     * Revocation information version.
     */
    dwRRInfoVersion : UInt32

    /**
     * Number of elements in the <b>pRRComponents</b> array.
     */
    dwRRComponents : UInt32

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mfrr_component_hash_info">MFRR_COMPONENT_HASH_INFO</a> structures.
     */
    pRRComponents : MFRR_COMPONENT_HASH_INFO.Ptr

}
