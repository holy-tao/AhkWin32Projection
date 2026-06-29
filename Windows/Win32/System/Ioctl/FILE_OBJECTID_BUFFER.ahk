#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains an object identifier and user-defined metadata associated with the object identifier.
 * @remarks
 * Object identifiers are used  to track  files and directories. They are invisible to most applications and should never be modified by applications. Modifying an object identifier can result in the loss of data from portions of a file, up to and including entire volumes of data.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_objectid_buffer
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_OBJECTID_BUFFER {
    #StructPack 1

    /**
     * The identifier that uniquely identifies the file or directory within the volume on which it resides.
     */
    ObjectId : Int8[16]

    BirthVolumeId : Int8[16]

    BirthObjectId : Int8[16]

    DomainId : Int8[16]

    static __New() {
        DefineProp(this.Prototype, 'ExtendedInfo', { type: Int8[48], offset: 16 })
        this.DeleteProp("__New")
    }
}
