#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION structure is used by the QueryActCtxW function.
 * @remarks
 * 
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
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-activation_context_assembly_detailed_information
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION extends Win32Struct
{
    static sizeof => 104

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
     * Length of the encoded assembly identity in bytes.
     * @type {Integer}
     */
    ulEncodedAssemblyIdentityLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * This value always a constant.
     * @type {Integer}
     */
    ulManifestPathType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Length of the assembly manifest path in bytes.
     * @type {Integer}
     */
    ulManifestPathLength {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The last time the manifest was written. This is in the form of a 
     * <b>FILETIME</b> data structure.
     * @type {Integer}
     */
    liManifestLastWriteTime {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * This value always a constant.
     * @type {Integer}
     */
    ulPolicyPathType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Length of the publisher policy path in bytes.
     * @type {Integer}
     */
    ulPolicyPathLength {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The last time the policy was written. This is in the form of a 
     * <b>FILETIME</b> data structure.
     * @type {Integer}
     */
    liPolicyLastWriteTime {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * Metadata satellite roster index.
     * @type {Integer}
     */
    ulMetadataSatelliteRosterIndex {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Major version of the assembly queried by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryactctxw">QueryActCtxW</a>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SbsCs/assembly-versions">Assembly Versions</a>.
     * @type {Integer}
     */
    ulManifestVersionMajor {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Minor version of the assembly queried by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-queryactctxw">QueryActCtxW</a>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SbsCs/assembly-versions">Assembly Versions</a>.
     * @type {Integer}
     */
    ulManifestVersionMinor {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Major version of any policy, if one exists.
     * @type {Integer}
     */
    ulPolicyVersionMajor {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Minor version of any policy, if one exists.
     * @type {Integer}
     */
    ulPolicyVersionMinor {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Length of the assembly directory name in bytes.
     * @type {Integer}
     */
    ulAssemblyDirectoryNameLength {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Pointer to a null-terminated string that contains a textually-encoded format of the assembly's identity.
     * @type {PWSTR}
     */
    lpAssemblyEncodedAssemblyIdentity {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Pointer to a null-terminated string that indicates the original path to this assembly's manifest.
     * @type {PWSTR}
     */
    lpAssemblyManifestPath {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Pointer to a null-terminated string that indicates the path of whatever policy assembly was used to determine that this version of the assembly should be loaded. If this member is null, no policy was used to decide to load this version.
     * @type {PWSTR}
     */
    lpAssemblyPolicyPath {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Pointer to a null-terminated string that indicates the folder from which this assembly was loaded.
     * @type {PWSTR}
     */
    lpAssemblyDirectoryName {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * 
     * @type {Integer}
     */
    ulFileCount {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }
}
