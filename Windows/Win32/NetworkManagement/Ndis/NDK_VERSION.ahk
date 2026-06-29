#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NDK_VERSION structure specifies major and minor versions in the NDK interface.
 * @remarks
 * This structure is used to specify NDK version numbers in several NDK structures and functions.
 * 
 * To specify version 1.1 (for Windows Server 2012), set both the <b>Major</b> and <b>Minor</b> members to 1.
 * 
 * To specify version 1.2 (for Windows Server 2012 R2), set the <b>Major</b> member to 1 and the <b>Minor</b> member to 2.
 * @see https://learn.microsoft.com/windows/win32/api/ndkinfo/ns-ndkinfo-ndk_version
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDK_VERSION {
    #StructPack 2

    /**
     * The NDK major version number.
     */
    Major : UInt16

    /**
     * The NDK minor version number.
     */
    Minor : UInt16

}
