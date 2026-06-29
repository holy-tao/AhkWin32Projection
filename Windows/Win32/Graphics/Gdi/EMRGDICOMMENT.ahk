#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRGDICOMMENT structure contains application-specific data.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrgdicomment
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRGDICOMMENT {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Size of data buffer, in bytes.
     */
    cbData : UInt32

    /**
     * Application-specific data.
     */
    Data : Int8[1]

}
