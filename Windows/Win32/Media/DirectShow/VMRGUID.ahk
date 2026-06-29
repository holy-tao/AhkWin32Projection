#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The VMRGUID structure is a member of the VMRMONITORINFO structure and is used to identify a monitor on the system (VMR-7 only).
 * @remarks
 * In DirectX 9.0 and later, the monitor is identified by an integer index, not by a GUID.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-vmrguid
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMRGUID {
    #StructPack 8

    /**
     * Pointer to the GUID member of the structure. <b>pGUID</b> is <b>NULL</b> if the monitor is the default DirectDraw device.
     */
    pGUID : Guid.Ptr

    /**
     * Specifies the GUID for the monitor.
     */
    GUID : Guid

}
