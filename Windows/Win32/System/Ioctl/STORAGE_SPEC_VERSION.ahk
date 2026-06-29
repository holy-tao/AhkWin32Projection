#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Storage specification version.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_spec_version
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_SPEC_VERSION {
    #StructPack 4


    struct _MinorVersion {
        SubMinor : Int8

        Minor : Int8

        static __New() {
            DefineProp(this.Prototype, 'AsUshort', { type: UInt16, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    MinorVersion : STORAGE_SPEC_VERSION._MinorVersion

    MajorVersion : UInt16

    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
