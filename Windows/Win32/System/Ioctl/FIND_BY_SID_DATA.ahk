#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import "..\..\Security\SID_IDENTIFIER_AUTHORITY.ahk" { SID_IDENTIFIER_AUTHORITY }

/**
 * Contains data for the FSCTL_FIND_FILES_BY_SID control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-find_by_sid_data
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FIND_BY_SID_DATA {
    #StructPack 4

    /**
     * Indicates whether to restart the search. This member should be 1 on first call, so the search will start 
     *       from the root. For subsequent calls, this member should be zero so the search will resume at the point where it 
     *       stopped.
     */
    Restart : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that specifies the desired creator 
     *       owner.
     */
    Sid : SID

}
