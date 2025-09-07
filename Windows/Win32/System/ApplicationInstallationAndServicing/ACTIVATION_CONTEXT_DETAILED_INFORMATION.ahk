#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
 * @version v4.0.30319
 */
class ACTIVATION_CONTEXT_DETAILED_INFORMATION extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * This value is always 0.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This value specifies the format of the returned information. On WindowsÂ XP and WindowsÂ Server 2003 this member is always 1.
     * @type {Integer}
     */
    ulFormatVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Number of assemblies in the activation context.
     * @type {Integer}
     */
    ulAssemblyCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the kind of path from which this assembly's manifest was loaded. 
     * 
     * This member is always one of the following constants:
     * @type {Integer}
     */
    ulRootManifestPathType {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Number of characters in the manifest path.
     * @type {Integer}
     */
    ulRootManifestPathChars {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the kind of path from which this assembly's application configuration manifest was loaded. 
     * 
     * This member is always one of the following constants:
     * @type {Integer}
     */
    ulRootConfigurationPathType {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Number of characters in any application configuration file path.
     * @type {Integer}
     */
    ulRootConfigurationPathChars {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the kind of path from which this application manifest was loaded. 
     * 
     * This member is always one of the following constants:
     * @type {Integer}
     */
    ulAppDirPathType {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Number of characters in the application directory.
     * @type {Integer}
     */
    ulAppDirPathChars {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Path of the application manifest.
     * @type {PWSTR}
     */
    lpRootManifestPath{
        get {
            if(!this.HasProp("__lpRootManifestPath"))
                this.__lpRootManifestPath := PWSTR(this.ptr + 40)
            return this.__lpRootManifestPath
        }
    }

    /**
     * Path of the configuration file.
     * @type {PWSTR}
     */
    lpRootConfigurationPath{
        get {
            if(!this.HasProp("__lpRootConfigurationPath"))
                this.__lpRootConfigurationPath := PWSTR(this.ptr + 48)
            return this.__lpRootConfigurationPath
        }
    }

    /**
     * Path of the application directory.
     * @type {PWSTR}
     */
    lpAppDirPath{
        get {
            if(!this.HasProp("__lpAppDirPath"))
                this.__lpAppDirPath := PWSTR(this.ptr + 56)
            return this.__lpAppDirPath
        }
    }
}
