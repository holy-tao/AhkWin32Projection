#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the package version information.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ns-appmodel-package_version
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct PACKAGE_VERSION {
    #StructPack 4

    Version : Int64

    static __New() {
        DefineProp(this.Prototype, 'Revision', { type: UInt16, offset: 0 })
        DefineProp(this.Prototype, 'Build', { type: UInt16, offset: 2 })
        DefineProp(this.Prototype, 'Minor', { type: UInt16, offset: 4 })
        DefineProp(this.Prototype, 'Major', { type: UInt16, offset: 6 })
        this.DeleteProp("__New")
    }
}
