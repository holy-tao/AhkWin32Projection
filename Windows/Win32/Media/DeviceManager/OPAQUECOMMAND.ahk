#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The OPAQUECOMMAND structure contains data for commands that are passed through Windows Media Device Manager to a device but are not intended to be acted upon by Windows Media Device Manager.
 * @see https://learn.microsoft.com/windows/win32/WMDM/opaquecommand
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct OPAQUECOMMAND {
    #StructPack 8

    guidCommand : Guid

    /**
     * Length of the data to which *pData* points, in bytes.
     */
    dwDataLen : UInt32

    /**
     * Data required to execute the command, and/or data returned by the command.
     * 
     * 
     * **abMAC\[20\]**
     * 
     * This message authentication code (MAC) should include the **guidCommand** member, the data to which *pdwDataLen* points, and the data to which *pData* points, if any. If *pData* is **NULL**, it must not be included in the MAC. WMDM\_MAC\_LENGTH is defined as 20.
     */
    pData : IntPtr

    abMAC : Int8[20]

}
