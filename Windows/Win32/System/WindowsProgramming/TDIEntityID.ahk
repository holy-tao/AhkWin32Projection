#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TDIENTITY_ENTITY_TYPE.ahk" { TDIENTITY_ENTITY_TYPE }

/**
 * Contains a part of the TDIObjectID structure to represent information about TDI drivers retrieved using the IOCTL_TCP_QUERY_INFORMATION_EX control code.
 * @see https://learn.microsoft.com/windows/win32/api/tdiinfo/ns-tdiinfo-tdientityid
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct TDIEntityID {
    #StructPack 4

    tei_entity : TDIENTITY_ENTITY_TYPE

    /**
     * An opaque value that can uniquely identify an entity, if a specific one is being addressed.
     */
    tei_instance : UInt32

}
