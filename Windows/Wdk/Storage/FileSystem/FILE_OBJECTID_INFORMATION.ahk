#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_OBJECTID_INFORMATION {
    #StructPack 8

    FileReference : Int64

    ObjectId : Int8[16]

    BirthVolumeId : Int8[16]

    BirthObjectId : Int8[16]

    DomainId : Int8[16]

    static __New() {
        DefineProp(this.Prototype, 'ExtendedInfo', { type: Int8[48], offset: 24 })
        this.DeleteProp("__New")
    }
}
