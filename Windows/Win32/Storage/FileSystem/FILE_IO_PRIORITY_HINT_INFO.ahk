#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRIORITY_HINT.ahk" { PRIORITY_HINT }

/**
 * Specifies the priority hint for a file I/O operation.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-setfileinformationbyhandle">SetFileInformationByHandle</a> function 
 *     can be used with this structure to associate a priority hint with I/O operations on a file-handle basis. In 
 *     addition to the idle priority (very low), this function allows normal priority and low priority. Whether these 
 *     priorities are supported and honored by the underlying drivers depends on their implementation (which is why they 
 *     are called hints). For more information, see the 
 *     <a href="https://www.microsoft.com/whdc/driver/priorityio.mspx">I/O Prioritization in Windows Vista</a> 
 *     white paper on the Windows Hardware Developer Central (WHDC) website.
 * 
 * This structure must be aligned on a <b>LONGLONG</b> (8-byte) boundary.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_io_priority_hint_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_IO_PRIORITY_HINT_INFO {
    #StructPack 4

    /**
     * The priority hint. This member is a value from the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ne-winbase-priority_hint">PRIORITY_HINT</a> enumeration.
     */
    PriorityHint : PRIORITY_HINT

}
