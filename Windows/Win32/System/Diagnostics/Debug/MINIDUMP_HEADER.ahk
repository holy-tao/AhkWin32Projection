#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains header information for the minidump file.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_header
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_HEADER {
    #StructPack 8

    /**
     * The signature. Set this member to MINIDUMP_SIGNATURE.
     */
    Signature : UInt32

    /**
     * The version of the minidump format. The low-order word is MINIDUMP_VERSION. The high-order word is an internal value that is implementation specific.
     */
    Version : UInt32

    /**
     * The number of streams in the minidump directory.
     */
    NumberOfStreams : UInt32

    /**
     * The base RVA of the minidump directory. The directory is an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_directory">MINIDUMP_DIRECTORY</a> structures.
     */
    StreamDirectoryRva : UInt32

    /**
     * The checksum for the minidump file. This member can be zero.
     */
    CheckSum : UInt32

    Reserved : UInt32

    /**
     * One or more values from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-minidump_type">MINIDUMP_TYPE</a> enumeration type.
     */
    Flags : Int64

    static __New() {
        DefineProp(this.Prototype, 'TimeDateStamp', { type: UInt32, offset: 20 })
        this.DeleteProp("__New")
    }
}
