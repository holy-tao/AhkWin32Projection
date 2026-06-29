#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The ACTIVATION_CONTEXT_DETAILED_INFORMATION structure is used by the QueryActCtxW function.
 * @remarks
 * If 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryactctxw">QueryActCtxW</a> is called with the ActivationContextDetailedInformation option, and the function succeeds, the information in the returned buffer is in the form of the 
 * <b>ACTIVATION_CONTEXT_DETAILED_INFORMATION</b> structure. The following is an example of a structure used to hold detailed information about the activation context and a call from 
 * <b>QueryActCtxW</b>.
 * 
 * 
 * ```cpp
 * PACTIVATION_CONTEXT_DETAILED_INFORMATION pAssemblyInfo = NULL;
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
 *         AssemblyDetailedInformationInActivationContext,
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
 *             AssemblyDetailedInformationInActivationContext,
 *             pvDataBuffer,
 *             cbAvailable,
 *             &cbRequired);
 * 
 *     }
 * 
 *     if (fSuccess) {
 *         // Now that we've found the assembly info, cast our target buffer back to
 *         // the assembly info pointer.  Use pAssemblyInfo->lpFileName
 *         pAssemblyInfo = (PACTIVATION_CONTEXT_DETAILED_INFORMATION)pvDataBuffer;
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
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-activation_context_detailed_information
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct ACTIVATION_CONTEXT_DETAILED_INFORMATION {
    #StructPack 8

    /**
     * This value is always 0.
     */
    dwFlags : UInt32

    /**
     * This value specifies the format of the returned information. On WindowsÂ XP and WindowsÂ Server 2003 this member is always 1.
     */
    ulFormatVersion : UInt32

    /**
     * Number of assemblies in the activation context.
     */
    ulAssemblyCount : UInt32

    /**
     * Specifies the kind of path from which this assembly's manifest was loaded. 
     * 
     * This member is always one of the following constants:
     */
    ulRootManifestPathType : UInt32

    /**
     * Number of characters in the manifest path.
     */
    ulRootManifestPathChars : UInt32

    /**
     * Specifies the kind of path from which this assembly's application configuration manifest was loaded. 
     * 
     * This member is always one of the following constants:
     */
    ulRootConfigurationPathType : UInt32

    /**
     * Number of characters in any application configuration file path.
     */
    ulRootConfigurationPathChars : UInt32

    /**
     * Specifies the kind of path from which this application manifest was loaded. 
     * 
     * This member is always one of the following constants:
     */
    ulAppDirPathType : UInt32

    /**
     * Number of characters in the application directory.
     */
    ulAppDirPathChars : UInt32

    /**
     * Path of the application manifest.
     */
    lpRootManifestPath : PWSTR

    /**
     * Path of the configuration file.
     */
    lpRootConfigurationPath : PWSTR

    /**
     * Path of the application directory.
     */
    lpAppDirPath : PWSTR

}
