#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyJob3.ahk

/**
 * Use this interface to enable peer caching, restrict download time, and inspect user token characteristics.
 * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nn-bits3_0-ibackgroundcopyjob4
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyJob4 extends IBackgroundCopyJob3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyJob4
     * @type {Guid}
     */
    static IID => Guid("{659cdeae-489e-11d9-a9cd-000d56965251}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 47

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPeerCachingFlags", "GetPeerCachingFlags", "GetOwnerIntegrityLevel", "GetOwnerElevationState", "SetMaximumDownloadTime", "GetMaximumDownloadTime"]

    /**
     * Sets flags that determine if the files of the job can be cached and served to peers and if the job can download content from peers.
     * @param {Integer} Flags Flags that determine if the files of the job can be cached and served to peers and if the job can download content from peers. The following flags can be set:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_JOB_ENABLE_PEERCACHING_CLIENT"></a><a id="bg_job_enable_peercaching_client"></a><dl>
     * <dt><b>BG_JOB_ENABLE_PEERCACHING_CLIENT</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The job can download content from peers.
     * 
     * The job will not download from a peer unless both the client computer and the job allow Background Intelligent Transfer Service (BITS) to download files from a peer. To enable the client computer to download files from a peer, set the <a href="https://docs.microsoft.com/windows/desktop/Bits/group-policies">EnablePeerCaching</a> group policy or call the <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibitspeercacheadministration-setconfigurationflags">IBitsPeerCacheAdministration::SetConfigurationFlags</a> method and set the BG_ENABLE_PEERCACHING_CLIENT flag.
     * 
     * If one of the following conditions exists, BITS will stop the download and reschedule the job to begin transferring from either a peer or the origin server, depending on the value for the job and the cache:<ul>
     * <li>This value for the cache is <b>TRUE</b> and the value for the job toggles between <b>TRUE</b> and <b>FALSE</b>.</li>
     * <li>This value for the job property is <b>TRUE</b> and the value for the cache toggles between <b>TRUE</b> and <b>FALSE</b>.</li>
     * </ul>The download will then resume from where it left off before BITS stopped the job.<b>BITS 4.0:  </b>This flag is deprecated.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_JOB_ENABLE_PEERCACHING_SERVER"></a><a id="bg_job_enable_peercaching_server"></a><dl>
     * <dt><b>BG_JOB_ENABLE_PEERCACHING_SERVER</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The files of the job can be cached and served to peers.
     * 
     * BITS will not cache the files and serve them to peers unless both the client computer and job allow BITS to cache and serve the files. To allow BITS to cache and serve the files on the client computer, set the <a href="https://docs.microsoft.com/windows/desktop/Bits/group-policies">EnablePeerCaching</a> group policy or call the <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibitspeercacheadministration-setconfigurationflags">IBitsPeerCacheAdministration::SetConfigurationFlags</a> method and set the BG_ENABLE_PEERCACHING_SERVER flag.<b>BITS 4.0:  </b>This flag is deprecated.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_JOB_DISABLE_BRANCH_CACHE"></a><a id="bg_job_disable_branch_cache"></a><dl>
     * <dt><b>BG_JOB_DISABLE_BRANCH_CACHE</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * BITS will not use Windows BranchCache for transfer jobs. This setting does not affect the use of Windows BranchCache by applications other than BITS. 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The method returns the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibackgroundcopyjob4-setpeercachingflags
     */
    SetPeerCachingFlags(Flags) {
        result := ComCall(47, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Retrieves flags that determine if the files of the job can be cached and served to peers and if BITS can download content for the job from peers.
     * @returns {Integer} Flags that determine if the files of the job can be cached and served to peers and if BITS can download content for the job from peers. The following flags can be set:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_JOB_ENABLE_PEERCACHING_CLIENT"></a><a id="bg_job_enable_peercaching_client"></a><dl>
     * <dt><b>BG_JOB_ENABLE_PEERCACHING_CLIENT</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The job can download content from peers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_JOB_ENABLE_PEERCACHING_SERVER"></a><a id="bg_job_enable_peercaching_server"></a><dl>
     * <dt><b>BG_JOB_ENABLE_PEERCACHING_SERVER</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The files of the job can be cached and served to peers.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibackgroundcopyjob4-getpeercachingflags
     */
    GetPeerCachingFlags() {
        result := ComCall(48, this, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * Gets the integrity level of the token of the owner that created or took ownership of the job.
     * @returns {Integer} Integrity level of the token of the owner that created or took ownership of the job.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibackgroundcopyjob4-getownerintegritylevel
     */
    GetOwnerIntegrityLevel() {
        result := ComCall(49, this, "uint*", &pLevel := 0, "HRESULT")
        return pLevel
    }

    /**
     * Gets a value that determines if the token of the owner was elevated at the time they created or took ownership of the job.
     * @returns {BOOL} Is <b>TRUE</b> if the token of the owner was elevated at the time they created or took ownership of the job; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibackgroundcopyjob4-getownerelevationstate
     */
    GetOwnerElevationState() {
        result := ComCall(50, this, "int*", &pElevated := 0, "HRESULT")
        return pElevated
    }

    /**
     * Sets the maximum time that BITS will spend transferring the files in the job.
     * @param {Integer} Timeout Maximum time, in seconds, that BITS will spend transferring the files in the job. The default is 7,776,000 seconds (90 days).
     * @returns {HRESULT} The method returns the following return values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibackgroundcopyjob4-setmaximumdownloadtime
     */
    SetMaximumDownloadTime(Timeout) {
        result := ComCall(51, this, "uint", Timeout, "HRESULT")
        return result
    }

    /**
     * Retrieves the maximum time that BITS will spend transferring the files in the job.
     * @returns {Integer} Maximum time, in seconds, that BITS will spend transferring the files in the job.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibackgroundcopyjob4-getmaximumdownloadtime
     */
    GetMaximumDownloadTime() {
        result := ComCall(52, this, "uint*", &pTimeout := 0, "HRESULT")
        return pTimeout
    }
}
