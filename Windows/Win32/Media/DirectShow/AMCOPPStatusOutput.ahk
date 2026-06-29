#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The AMCOPPStatusOutput structure contains the result of a Certified Output Protection Protocol (COPP) status request.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-amcoppstatusoutput
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AMCOPPStatusOutput {
    #StructPack 4

    /**
     * Message Authentication Code (MAC) of the status data. The driver will use AES-based one-key CBC MAC (OMAC) to calculate this value.
     */
    macKDI : Guid

    /**
     * Size of the valid data in the <b>COPPStatus</b> member.
     */
    cbSizeData : UInt32

    /**
     * Buffer that contains the result of the status request.
     */
    COPPStatus : Int8[4076]

}
