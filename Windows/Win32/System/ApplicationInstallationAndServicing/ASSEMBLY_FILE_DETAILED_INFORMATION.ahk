#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ASSEMBLY_FILE_DETAILED_INFORMATION structure is used by the QueryActCtxW function.
 * @remarks
 * If 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryactctxw">QueryActCtxW</a> is called with the FileInformationInAssemblyOfAssemblyInActivationContext option, and the function succeeds, the information in the returned buffer is in form of the 
  * <b>ASSEMBLY_FILE_DETAILED_INFORMATION</b> structure. The following is an example of a structure used to hold detailed information about the activation context and a call from 
  * <b>QueryActCtxW</b>.
  * 
  * 
  * ```cpp
  * PASSEMBLY_FILE_DETAILED_INFORMATION pAssemblyInfo = NULL;
  * ACTIVATION_CONTEXT_QUERY_INDEX QueryIndex;
  * BOOL fSuccess = FALSE;
  * SIZE_T cbRequired;
  * HANDLE hActCtx = INVALID_HANDLE_VALUE;
  * BYTE bTemporaryBuffer[512];
  * PVOID pvDataBuffer = (PVOID)bTemporaryBuffer;
  * SIZE_T cbAvailable = sizeof(bTemporaryBuffer);
  * 
  * // Request the first file in the root assembly
  * QueryIndex.ulAssemblyIndex = 1;
  * QueryIndex.ulFileIndexInAssembly = 0;
  * 
  * if (GetCurrentActCtx(&hActCtx)) {
  * 
  *     // Attempt to use our stack-based buffer first - if that's not large
  *     // enough, allocate from the heap and try again.
  *     fSuccess = QueryActCtxW(
  *         0, 
  *         hActCtx, 
  *         (PVOID)&QueryIndex, 
  *         FileInformationInAssemblyOfAssemblyInActivationContext,
  *         pvDataBuffer,
  *         cbAvailable,
  *         &cbRequired);
  * 
  *     // Failed, because the buffer was too small.
  *     if (!fSuccess && (GetLastError() == ERROR_INSUFFICIENT_BUFFER)) {
  * 
  *         // Allocate what we need from the heap - fail if there isn't enough
  *         // memory to do so.        
  *         pvDataBuffer = HeapAlloc(GetProcessHeap(), 0, cbRequired);
  *         if (pvDataBuffer == NULL) {
  *             fSuccess = FALSE;
  *             goto DoneQuerying;
  *         }
  *         cbAvailable = cbRequired;
  * 
  *         // If this fails again, exit out.
  *         fSuccess = QueryActCtxW(
  *             0, 
  *             hActCtx,
  *             (PVOID)&QueryIndex,
  *             FileInformationInAssemblyOfAssemblyInActivationContext,
  *             pvDataBuffer,
  *             cbAvailable,
  *             &cbRequired);
  * 
  *     }
  * 
  *     if (fSuccess) {
  *         // Now that we've found the assembly info, cast our target buffer back to
  *         // the assembly info pointer.  Use pAssemblyInfo->lpFileName
  *         pAssemblyInfo = (PASSEMBLY_FILE_DETAILED_INFORMATION)pvDataBuffer;
  *     }
  * }
  * 
  * DoneQuerying:
  *     if (hActCtx != INVALID_HANDLE_VALUE)
  *         ReleaseActCtx(hActCtx);
  * 
  *     if (pvDataBuffer && (pvDataBuffer != bTemporaryBuffer)) {
  *         HeapFree(GetProcessHeap(), 0, pvDataBuffer);
  *         pvDataBuffer = 0;
  *     }
  * 
  * ```
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-assembly_file_detailed_information
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class ASSEMBLY_FILE_DETAILED_INFORMATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * This value is always 0.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Length in bytes of the file name pointed to by <b>lpFileName</b>. The count does not include the terminating null character.
     * @type {Integer}
     */
    ulFilenameLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Length in bytes of the path string pointed to by <b>lpFilePath</b> The count does not include the terminating null character.
     * @type {Integer}
     */
    ulPathLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Null-terminated string that specifies the name of the file.
     * @type {Pointer<Ptr>}
     */
    lpFileName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Null-terminated string that specifies the path to the file named in <b>lpFileName</b>.
     * @type {Pointer<Ptr>}
     */
    lpFilePath {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
