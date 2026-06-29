#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION structure is used by the QueryActCtxW function.
 * @remarks
 * If 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryactctxw">QueryActCtxW</a> is called with the AssemblyDetailedInformationInActivationContext option, and the function succeeds, the information in the returned buffer is in the form of the 
 * <b>ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION</b> structure.
 * 
 * 
 * ```cpp
 * PACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION pAssemblyInfo = NULL;
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
 *         pAssemblyInfo = (PACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION)pvDataBuffer;
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
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-activation_context_assembly_detailed_information
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION {
    #StructPack 8

    /**
     * This value is always 0.
     */
    ulFlags : UInt32

    /**
     * Length of the encoded assembly identity in bytes.
     */
    ulEncodedAssemblyIdentityLength : UInt32

    /**
     * This value always a constant.
     */
    ulManifestPathType : UInt32

    /**
     * Length of the assembly manifest path in bytes.
     */
    ulManifestPathLength : UInt32

    /**
     * The last time the manifest was written. This is in the form of a 
     * <b>FILETIME</b> data structure.
     */
    liManifestLastWriteTime : Int64

    /**
     * This value always a constant.
     */
    ulPolicyPathType : UInt32

    /**
     * Length of the publisher policy path in bytes.
     */
    ulPolicyPathLength : UInt32

    /**
     * The last time the policy was written. This is in the form of a 
     * <b>FILETIME</b> data structure.
     */
    liPolicyLastWriteTime : Int64

    /**
     * Metadata satellite roster index.
     */
    ulMetadataSatelliteRosterIndex : UInt32

    /**
     * Major version of the assembly queried by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryactctxw">QueryActCtxW</a>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SbsCs/assembly-versions">Assembly Versions</a>.
     */
    ulManifestVersionMajor : UInt32

    /**
     * Minor version of the assembly queried by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryactctxw">QueryActCtxW</a>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SbsCs/assembly-versions">Assembly Versions</a>.
     */
    ulManifestVersionMinor : UInt32

    /**
     * Major version of any policy, if one exists.
     */
    ulPolicyVersionMajor : UInt32

    /**
     * Minor version of any policy, if one exists.
     */
    ulPolicyVersionMinor : UInt32

    /**
     * Length of the assembly directory name in bytes.
     */
    ulAssemblyDirectoryNameLength : UInt32

    /**
     * Pointer to a null-terminated string that contains a textually-encoded format of the assembly's identity.
     */
    lpAssemblyEncodedAssemblyIdentity : PWSTR

    /**
     * Pointer to a null-terminated string that indicates the original path to this assembly's manifest.
     */
    lpAssemblyManifestPath : PWSTR

    /**
     * Pointer to a null-terminated string that indicates the path of whatever policy assembly was used to determine that this version of the assembly should be loaded. If this member is null, no policy was used to decide to load this version.
     */
    lpAssemblyPolicyPath : PWSTR

    /**
     * Pointer to a null-terminated string that indicates the folder from which this assembly was loaded.
     */
    lpAssemblyDirectoryName : PWSTR

    ulFileCount : UInt32

}
