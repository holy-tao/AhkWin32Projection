#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information that defines a color profile.
 * @see https://learn.microsoft.com/windows/win32/api/icm/ns-icm-profile
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct PROFILE {
    #StructPack 8

    dwType : UInt32

    /**
     * The contents of this member is indicated by the **dwTYPE** member. It will either be a pointer to a null-terminated string containing the file name of the device profile, or it will be a pointer to a buffer in memory containing the device profile data.
     */
    pProfileData : IntPtr

    /**
     * The size in bytes of the data buffer pointed to by the **pProfileData** member.
     */
    cbDataSize : UInt32

}
