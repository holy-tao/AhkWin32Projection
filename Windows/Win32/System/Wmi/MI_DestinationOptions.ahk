#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_DestinationOptionsFT.ahk" { MI_DestinationOptionsFT }

/**
 * Represents a set of destination options. Destination options are a set of configurations that define the way an operation communicates with the server.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_destinationoptions
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_DestinationOptions {
    #StructPack 8

    /**
     * Used internally and must not be changed. Should be set to 0.
     */
    reserved1 : Int64

    /**
     * Used internally and must not be changed. Should be set to 0.
     */
    reserved2 : IntPtr

    /**
     * This member is used internally, and it must not be changed.
     */
    ft : MI_DestinationOptionsFT.Ptr

}
