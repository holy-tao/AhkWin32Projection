#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The AMCOPPCommand structure contains a Certified Output Protection Protocol (COPP) command.
 * @remarks
 * The following COPP commands are defined.
 * 
 * <table>
 * <tr>
 * <th><b>GUID</b></th>
 * <th>Description
 *             </th>
 * </tr>
 * <tr>
 * <td>DXVA_COPPSetProtectionLevel</td>
 * <td>Sets a specified protection type to a specified protection level.</td>
 * </tr>
 * </table>
 *  
 * 
 * For more information, see the Windows DDK documentation.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-amcoppcommand
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AMCOPPCommand {
    #StructPack 4

    /**
     * Message Authentication Code (MAC) of the command data. Use AES-based one-key CBC MAC (OMAC) to calculate this value.
     */
    macKDI : Guid

    /**
     * GUID that specifies the command.
     */
    guidCommandID : Guid

    /**
     * Sequence number. The application must keep a running count of the COPP commands issued. For each command, increment the sequence number by one.
     */
    dwSequence : UInt32

    /**
     * Number of bytes of valid data in the <b>CommandData</b> member.
     */
    cbSizeData : UInt32

    /**
     * Data for the command. The meaning of the data depends on the command.
     */
    CommandData : Int8[4056]

}
