#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the tape in the tape drive. It is used by the SetTapeParametersfunction.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-tape_set_media_parameters
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TAPE_SET_MEDIA_PARAMETERS {
    #StructPack 4

    /**
     * Number of bytes per block. Maximum and minimum block sizes can be obtained by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-gettapeparameters">GetTapeParameters</a> function.
     */
    BlockSize : UInt32

}
