#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumBitsPeerCacheRecords.ahk
#Include .\IBitsPeerCacheRecord.ahk
#Include .\IEnumBitsPeers.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use IBitsPeerCacheAdministration to manage the pool of peers from which you can download content.
 * @remarks
 * 
 *  You should never have to manage the peer cache; BITS manages the cache for you.
 * 
 * You must have administrator privileges to modify the cache.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nn-bits3_0-ibitspeercacheadministration
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBitsPeerCacheAdministration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitsPeerCacheAdministration
     * @type {Guid}
     */
    static IID => Guid("{659cdead-489e-11d9-a9cd-000d56965251}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMaximumCacheSize", "SetMaximumCacheSize", "GetMaximumContentAge", "SetMaximumContentAge", "GetConfigurationFlags", "SetConfigurationFlags", "EnumRecords", "GetRecord", "ClearRecords", "DeleteRecord", "DeleteUrl", "EnumPeers", "ClearPeers", "DiscoverPeers"]

    /**
     * Gets the maximum size of the cache.
     * @returns {Integer} Maximum size of the cache, as a percentage of available hard disk drive space.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacheadministration-getmaximumcachesize
     */
    GetMaximumCacheSize() {
        result := ComCall(3, this, "uint*", &pBytes := 0, "HRESULT")
        return pBytes
    }

    /**
     * Specifies the maximum size of the cache.
     * @param {Integer} Bytes Maximum size of the cache, as a percentage of available hard disk drive space.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The configuration preference has been saved successfully, but the preference will not be used because a configured Group Policy setting overrides the preference.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacheadministration-setmaximumcachesize
     */
    SetMaximumCacheSize(Bytes) {
        result := ComCall(4, this, "uint", Bytes, "HRESULT")
        return result
    }

    /**
     * Gets the age by when files are removed from the cache.
     * @returns {Integer} Age, in seconds. If the last time that the file was accessed is older than this age, BITS removes the file from the cache.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacheadministration-getmaximumcontentage
     */
    GetMaximumContentAge() {
        result := ComCall(5, this, "uint*", &pSeconds := 0, "HRESULT")
        return pSeconds
    }

    /**
     * Specifies when files are removed from the cache based on age.
     * @param {Integer} Seconds Age, in seconds. If the last time that the file was accessed is older than this age, BITS removes the file from the cache. The age is reset each time the file is accessed. The maximum value is 10,368,000 seconds (120 days) and the minimum value is 86,400 seconds (1 day). The default is 7,776,000 seconds (90 days).
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The configuration preference has been saved successfully, but the preference will not be used because a configured Group Policy setting overrides the preference.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacheadministration-setmaximumcontentage
     */
    SetMaximumContentAge(Seconds) {
        result := ComCall(6, this, "uint", Seconds, "int")
        return result
    }

    /**
     * Gets the configuration flags that determine if the computer serves content to peers and can download content from peers.
     * @returns {Integer} Flags that determine if the computer serves content to peers and can download content from peers. The following flags can be set:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_ENABLE_PEERCACHING_CLIENT"></a><a id="bg_enable_peercaching_client"></a><dl>
     * <dt><b>BG_ENABLE_PEERCACHING_CLIENT</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer can download content from peers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_ENABLE_PEERCACHING_SERVER"></a><a id="bg_enable_peercaching_server"></a><dl>
     * <dt><b>BG_ENABLE_PEERCACHING_SERVER</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer can serve content to peers.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacheadministration-getconfigurationflags
     */
    GetConfigurationFlags() {
        result := ComCall(7, this, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * Sets the configuration flags that determine if the computer can serve content to peers and can download content from peers.
     * @param {Integer} Flags Flags that determine if the computer can serve content to peers and can download content from peers. The following flags can be set:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_ENABLE_PEERCACHING_CLIENT"></a><a id="bg_enable_peercaching_client"></a><dl>
     * <dt><b>BG_ENABLE_PEERCACHING_CLIENT</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer can download content from peers.
     * 
     * BITS will not download files from a peer unless both the client computer and the job permit BITS to download files from a peer. To permits the job to download files from a peer, call the <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibackgroundcopyjob4-setpeercachingflags">IBackgroundCopyJob4::SetPeerCachingFlags</a> method and set the BG_JOB_ENABLE_PEERCACHING_CLIENT flag.
     * 
     * Note that changing this value can affect all jobs on the computer. If one of the following conditions exists, BITS will stop the download and reschedule the job to begin transferring from either a peer or the origin server, depending on the value for the job and the cache:<ul>
     * <li>This value for the cache is <b>TRUE</b> and the value for the job toggles between <b>TRUE</b> and <b>FALSE</b>.</li>
     * <li>This value for the job property is <b>TRUE</b> and the value for the cache toggles between <b>TRUE</b> and <b>FALSE</b>.</li>
     * </ul>The download will then resume from where it left off before BITS stopped the job.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BG_ENABLE_PEERCACHING_SERVER"></a><a id="bg_enable_peercaching_server"></a><dl>
     * <dt><b>BG_ENABLE_PEERCACHING_SERVER</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer can serve content to peers.
     * 
     * BITS will not cache the files and serve them to peers unless both the client computer and job permit BITS to cache and serve files. To permit the job to cache files for a job, call the <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibackgroundcopyjob4-setpeercachingflags">IBackgroundCopyJob4::SetPeerCachingFlags</a> method and set the BG_JOB_ENABLE_PEERCACHING_SERVER flag.
     * 
     * </td>
     * </tr>
     * </table>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_S_OVERRIDDEN_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The configuration preference has been saved successfully, but the preference will not be used because a configured Group Policy setting overrides the preference. 
     * 
     * The method returns this value if the value set is different from the group policy value. If the values are the same, the method returns S_OK.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacheadministration-setconfigurationflags
     */
    SetConfigurationFlags(Flags) {
        result := ComCall(8, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Gets an IEnumBitsPeerCacheRecords interface pointer that you use to enumerate the records in the cache. The enumeration is a snapshot of the records in the cache.
     * @returns {IEnumBitsPeerCacheRecords} An <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nn-bits3_0-ienumbitspeercacherecords">IEnumBitsPeerCacheRecords</a> interface pointer that you use to enumerate the records in the cache. Release <i>ppEnum</i> when done.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacheadministration-enumrecords
     */
    EnumRecords() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumBitsPeerCacheRecords(ppEnum)
    }

    /**
     * Gets a record from the cache.
     * @param {Pointer<Guid>} id Identifier of the record to get from the cache. The <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibitspeercacherecord-getid">IBitsPeerCacheRecord::GetId</a> method returns the identifier.
     * @returns {IBitsPeerCacheRecord} An <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nn-bits3_0-ibitspeercacherecord">IBitsPeerCacheRecord</a> interface of the cache record. Release <i>ppRecord</i> when done.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacheadministration-getrecord
     */
    GetRecord(id) {
        result := ComCall(10, this, "ptr", id, "ptr*", &ppRecord := 0, "HRESULT")
        return IBitsPeerCacheRecord(ppRecord)
    }

    /**
     * Removes all the records and files from the cache.
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
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacheadministration-clearrecords
     */
    ClearRecords() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Deletes a record and file from the cache. This method uses the record's identifier to identify the record to delete.
     * @param {Pointer<Guid>} id Identifier of the record to delete from the cache. The <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nf-bits3_0-ibitspeercacherecord-getid">IBitsPeerCacheRecord::GetId</a> method returns the identifier.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_BUSYCACHERECORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache record is in use and cannot be changed or deleted.  Try again after a few seconds.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacheadministration-deleterecord
     */
    DeleteRecord(id) {
        result := ComCall(12, this, "ptr", id, "HRESULT")
        return result
    }

    /**
     * Deletes all cache records and the file from the cache for the given URL.
     * @param {PWSTR} url Null-terminated string that contains the URL of the file whose cache records and file you want to delete from the cache.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BG_E_BUSYCACHERECORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache record is in use and cannot be changed or deleted.  Try again after a few seconds.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacheadministration-deleteurl
     */
    DeleteUrl(url) {
        url := url is String ? StrPtr(url) : url

        result := ComCall(13, this, "ptr", url, "HRESULT")
        return result
    }

    /**
     * Gets an IEnumBitsPeers interface pointer that you use to enumerate the peers that can serve content. The enumeration is a snapshot of the records in the cache.
     * @returns {IEnumBitsPeers} An <a href="https://docs.microsoft.com/windows/desktop/api/bits3_0/nn-bits3_0-ienumbitspeers">IEnumBitsPeers</a> interface pointer that you use to enumerate the peers that can serve content. Release <i>ppEnum</i> when done.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacheadministration-enumpeers
     */
    EnumPeers() {
        result := ComCall(14, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumBitsPeers(ppEnum)
    }

    /**
     * Removes all peers from the list of peers that can serve content.
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
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacheadministration-clearpeers
     */
    ClearPeers() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Generates a list of peers that can serve content.
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
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeercacheadministration-discoverpeers
     */
    DiscoverPeers() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}
