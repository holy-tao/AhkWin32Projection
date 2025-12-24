#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDataCollector.ahk

/**
 * Collects computer settings at the time of collection.
 * @remarks
 * 
 * The following example shows the XML that you can use to initialize this object if you call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorcollection-createdatacollectorfromxml">CreateDataCollectorFromXml</a> to create it. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_xml">IDataCollector::Xml</a> property also returns this XML.
 * 
 * 
 * ```xml
 * <ConfigurationDataCollector>
 *     <FileMaxCount/>  
 *     <FileMaxRecursiveDepth/>  
 *     <FileMaxTotalSize/>  
 *     <File/>  <!-- Specify this element for each file -->
 *     <ManagementQuery/>  <!-- Specify this element for each WMI query -->
 *     <QueryNetworkAdapters/>
 *     <RegistryKey/>  <!-- Specify this element for each registry key -->
 *     <RegistryMaxRecursiveDepth/>
 *     <SystemStateFile/>  
 * </ConfigurationDataCollector>
 * ```
 * 
 * 
 * Note that the example does not show the property elements inherited from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a> that you also need to specify.
 * 
 * When you specify the XML to create the collector, you can specify only the elements for the properties that you want to set. If you do not specify a property, PLA provides a default value. When you retrieve the XML for the collector, the XML provides all elements, including those from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nn-pla-idatacollector">IDataCollector</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//pla/nn-pla-iconfigurationdatacollector
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class IConfigurationDataCollector extends IDataCollector{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConfigurationDataCollector
     * @type {Guid}
     */
    static IID => Guid("{03837514-098b-11d8-9414-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FileMaxCount", "put_FileMaxCount", "get_FileMaxRecursiveDepth", "put_FileMaxRecursiveDepth", "get_FileMaxTotalSize", "put_FileMaxTotalSize", "get_Files", "put_Files", "get_ManagementQueries", "put_ManagementQueries", "get_QueryNetworkAdapters", "put_QueryNetworkAdapters", "get_RegistryKeys", "put_RegistryKeys", "get_RegistryMaxRecursiveDepth", "put_RegistryMaxRecursiveDepth", "get_SystemStateFile", "put_SystemStateFile"]

    /**
     * @type {Integer} 
     */
    FileMaxCount {
        get => this.get_FileMaxCount()
        set => this.put_FileMaxCount(value)
    }

    /**
     * @type {Integer} 
     */
    FileMaxRecursiveDepth {
        get => this.get_FileMaxRecursiveDepth()
        set => this.put_FileMaxRecursiveDepth(value)
    }

    /**
     * @type {Integer} 
     */
    FileMaxTotalSize {
        get => this.get_FileMaxTotalSize()
        set => this.put_FileMaxTotalSize(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    Files {
        get => this.get_Files()
        set => this.put_Files(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    ManagementQueries {
        get => this.get_ManagementQueries()
        set => this.put_ManagementQueries(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    QueryNetworkAdapters {
        get => this.get_QueryNetworkAdapters()
        set => this.put_QueryNetworkAdapters(value)
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    RegistryKeys {
        get => this.get_RegistryKeys()
        set => this.put_RegistryKeys(value)
    }

    /**
     * @type {Integer} 
     */
    RegistryMaxRecursiveDepth {
        get => this.get_RegistryMaxRecursiveDepth()
        set => this.put_RegistryMaxRecursiveDepth(value)
    }

    /**
     * @type {BSTR} 
     */
    SystemStateFile {
        get => this.get_SystemStateFile()
        set => this.put_SystemStateFile(value)
    }

    /**
     * Retrieves or sets the maximum number of files to collect.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-iconfigurationdatacollector-get_filemaxcount
     */
    get_FileMaxCount() {
        result := ComCall(32, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Retrieves or sets the maximum number of files to collect.
     * @param {Integer} count 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-iconfigurationdatacollector-put_filemaxcount
     */
    put_FileMaxCount(count) {
        result := ComCall(33, this, "uint", count, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the maximum number of subfolders from which to recursively collect files.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-iconfigurationdatacollector-get_filemaxrecursivedepth
     */
    get_FileMaxRecursiveDepth() {
        result := ComCall(34, this, "uint*", &depth := 0, "HRESULT")
        return depth
    }

    /**
     * Retrieves or sets the maximum number of subfolders from which to recursively collect files.
     * @param {Integer} depth 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-iconfigurationdatacollector-put_filemaxrecursivedepth
     */
    put_FileMaxRecursiveDepth(depth) {
        result := ComCall(35, this, "uint", depth, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the maximum total file size of all files combined that you can collect.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-iconfigurationdatacollector-get_filemaxtotalsize
     */
    get_FileMaxTotalSize() {
        result := ComCall(36, this, "uint*", &size := 0, "HRESULT")
        return size
    }

    /**
     * Retrieves or sets the maximum total file size of all files combined that you can collect.
     * @param {Integer} size 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-iconfigurationdatacollector-put_filemaxtotalsize
     */
    put_FileMaxTotalSize(size) {
        result := ComCall(37, this, "uint", size, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the files to collect.
     * @remarks
     * 
     * You can  use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-iconfigurationdatacollector-get_filemaxcount">IConfigurationDataCollector::FileMaxCount</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-iconfigurationdatacollector-get_filemaxrecursivedepth">IConfigurationDataCollector::FileMaxRecursiveDepth</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-iconfigurationdatacollector-get_filemaxtotalsize">IConfigurationDataCollector::FileMaxTotalSize</a> properties to limit the number of files that PLA collects.
     * 
     * PLA copies the files to the location specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_latestoutputlocation">IDataCollectorSet::LatestOutputLocation</a> property. If more than one file has the same name, PLA leaves the first file name intact and appends _n (where n is a one-based serial number) to all subsequent files with the same name. You can use the XML report to determine the origin of each file.
     * 
     * The property performs a depth-first search using the  <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstfilea">FindFirstFile</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findnextfilea">FindNextFile</a> functions. For example, assuming the following directory structure:
     * 
     * <pre class="syntax" xml:space="preserve"><code>MyDir
     *     Subdir1
     *         Subdir1.1
     *             a.txt
     *             b.txt
     *         Subdir1.2
     *             c.txt
     *         g.txt  (folder in Subdir1)
     *         h.txt  (folder in Subdir1)
     *     Subdir 2
     *         subdir2.1
     *             y.txt
     *             z.txt
     *             subdir2.1.1
     *                 m.txt
     *     q.txt  (folder in MyDir)
     *     s.txt  (folder in MyDir)
     * </code></pre>
     * PLA would collect the files in the following order (assuming that no limits were reached):
     * 
     * <pre class="syntax" xml:space="preserve"><code>q.txt
     * s.txt
     * g.txt
     * h.txt
     * a.txt
     * b.txt
     * c.txt
     * y.txt
     * z.txt
     * m.txt
     * </code></pre>
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-iconfigurationdatacollector-get_files
     */
    get_Files() {
        result := ComCall(38, this, "ptr*", &Files := 0, "HRESULT")
        return Files
    }

    /**
     * Retrieves or sets the files to collect.
     * @remarks
     * 
     * You can  use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-iconfigurationdatacollector-get_filemaxcount">IConfigurationDataCollector::FileMaxCount</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-iconfigurationdatacollector-get_filemaxrecursivedepth">IConfigurationDataCollector::FileMaxRecursiveDepth</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-iconfigurationdatacollector-get_filemaxtotalsize">IConfigurationDataCollector::FileMaxTotalSize</a> properties to limit the number of files that PLA collects.
     * 
     * PLA copies the files to the location specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_latestoutputlocation">IDataCollectorSet::LatestOutputLocation</a> property. If more than one file has the same name, PLA leaves the first file name intact and appends _n (where n is a one-based serial number) to all subsequent files with the same name. You can use the XML report to determine the origin of each file.
     * 
     * The property performs a depth-first search using the  <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstfilea">FindFirstFile</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findnextfilea">FindNextFile</a> functions. For example, assuming the following directory structure:
     * 
     * <pre class="syntax" xml:space="preserve"><code>MyDir
     *     Subdir1
     *         Subdir1.1
     *             a.txt
     *             b.txt
     *         Subdir1.2
     *             c.txt
     *         g.txt  (folder in Subdir1)
     *         h.txt  (folder in Subdir1)
     *     Subdir 2
     *         subdir2.1
     *             y.txt
     *             z.txt
     *             subdir2.1.1
     *                 m.txt
     *     q.txt  (folder in MyDir)
     *     s.txt  (folder in MyDir)
     * </code></pre>
     * PLA would collect the files in the following order (assuming that no limits were reached):
     * 
     * <pre class="syntax" xml:space="preserve"><code>q.txt
     * s.txt
     * g.txt
     * h.txt
     * a.txt
     * b.txt
     * c.txt
     * y.txt
     * z.txt
     * m.txt
     * </code></pre>
     * 
     * 
     * @param {Pointer<SAFEARRAY>} Files 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-iconfigurationdatacollector-put_files
     */
    put_Files(Files) {
        result := ComCall(39, this, "ptr", Files, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets Windows Management Instrumentation (WMI) queries to run.
     * @remarks
     * 
     * For details on writing WMI queries, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/wql-sql-for-wmi">WQL (SQL for WMI)</a>.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-iconfigurationdatacollector-get_managementqueries
     */
    get_ManagementQueries() {
        result := ComCall(40, this, "ptr*", &Queries := 0, "HRESULT")
        return Queries
    }

    /**
     * Retrieves or sets Windows Management Instrumentation (WMI) queries to run.
     * @remarks
     * 
     * For details on writing WMI queries, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/wql-sql-for-wmi">WQL (SQL for WMI)</a>.
     * 
     * 
     * @param {Pointer<SAFEARRAY>} Queries 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-iconfigurationdatacollector-put_managementqueries
     */
    put_ManagementQueries(Queries) {
        result := ComCall(41, this, "ptr", Queries, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a value that indicates whether the installed network adapters are queried for their offloading capabilities and other configuration information.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-iconfigurationdatacollector-get_querynetworkadapters
     */
    get_QueryNetworkAdapters() {
        result := ComCall(42, this, "short*", &network := 0, "HRESULT")
        return network
    }

    /**
     * Retrieves or sets a value that indicates whether the installed network adapters are queried for their offloading capabilities and other configuration information.
     * @param {VARIANT_BOOL} network 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-iconfigurationdatacollector-put_querynetworkadapters
     */
    put_QueryNetworkAdapters(network) {
        result := ComCall(43, this, "short", network, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a list of registry keys to collect.
     * @remarks
     * 
     * You can collect registry data from the following registry hives:
     * 
     * <ul>
     * <li><b>HKEY_CLASSES_ROOT</b></li>
     * <li><b>HKEY_CURRENT_CONFIG</b></li>
     * <li><b>HKEY_CURRENT_USER</b></li>
     * <li><b>HKEY_LOCAL_MACHINE</b></li>
     * <li><b>HKEY_USERS</b></li>
     * </ul>
     * To collect a registry value, specify the full path to the value name, for example, <b>\HKEY_LOCAL_MACHINE\MyKey\MyValue</b>.
     * 
     * To collect all the values under a registry key, specify the full path to the registry key, for example, <b>\HKEY_LOCAL_MACHINE\MyKey\</b>.
     * 
     * To collect all the values under a registry key and its subkeys, use two backslashes for the last path delimiter, for example, <b>\\computername\HKEY_LOCAL_MACHINE\MyKey\\</b>. PLA recursively collects the registry data down to the level specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-iconfigurationdatacollector-get_registrymaxrecursivedepth">IConfigurationDataCollector::RegistryMaxRecursiveDepth</a> property.
     * 
     * To collect registry information from a remote computer, include the computer name at the beginning of the registry path, for example, <b>\\computername\HKEY_LOCAL_MACHINE\MyKey\MyValue</b>.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-iconfigurationdatacollector-get_registrykeys
     */
    get_RegistryKeys() {
        result := ComCall(44, this, "ptr*", &query := 0, "HRESULT")
        return query
    }

    /**
     * Retrieves or sets a list of registry keys to collect.
     * @remarks
     * 
     * You can collect registry data from the following registry hives:
     * 
     * <ul>
     * <li><b>HKEY_CLASSES_ROOT</b></li>
     * <li><b>HKEY_CURRENT_CONFIG</b></li>
     * <li><b>HKEY_CURRENT_USER</b></li>
     * <li><b>HKEY_LOCAL_MACHINE</b></li>
     * <li><b>HKEY_USERS</b></li>
     * </ul>
     * To collect a registry value, specify the full path to the value name, for example, <b>\HKEY_LOCAL_MACHINE\MyKey\MyValue</b>.
     * 
     * To collect all the values under a registry key, specify the full path to the registry key, for example, <b>\HKEY_LOCAL_MACHINE\MyKey\</b>.
     * 
     * To collect all the values under a registry key and its subkeys, use two backslashes for the last path delimiter, for example, <b>\\computername\HKEY_LOCAL_MACHINE\MyKey\\</b>. PLA recursively collects the registry data down to the level specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-iconfigurationdatacollector-get_registrymaxrecursivedepth">IConfigurationDataCollector::RegistryMaxRecursiveDepth</a> property.
     * 
     * To collect registry information from a remote computer, include the computer name at the beginning of the registry path, for example, <b>\\computername\HKEY_LOCAL_MACHINE\MyKey\MyValue</b>.
     * 
     * 
     * @param {Pointer<SAFEARRAY>} query 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-iconfigurationdatacollector-put_registrykeys
     */
    put_RegistryKeys(query) {
        result := ComCall(45, this, "ptr", query, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the maximum number of subkeys from which to recursively collect registry values.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-iconfigurationdatacollector-get_registrymaxrecursivedepth
     */
    get_RegistryMaxRecursiveDepth() {
        result := ComCall(46, this, "uint*", &depth := 0, "HRESULT")
        return depth
    }

    /**
     * Retrieves or sets the maximum number of subkeys from which to recursively collect registry values.
     * @param {Integer} depth 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-iconfigurationdatacollector-put_registrymaxrecursivedepth
     */
    put_RegistryMaxRecursiveDepth(depth) {
        result := ComCall(47, this, "uint", depth, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets the name of the file that contains the saved system state.
     * @remarks
     * 
     * Do not include the path in the file name; the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_rootpath">IDataCollectorSet::RootPath</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_subdirectory">IDataCollectorSet::Subdirectory</a> properties determine the path to the file.
     * 
     * If you do not specify the name of the file, the system state is not retrieved.
     * 
     * The state information is a snapshot of the Circular Kernel Context Logger. The context logger provides a snapshot of the current state of the computer. The file contains kernel events. You can use the TraceRpt.exe tool to decode the events.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-iconfigurationdatacollector-get_systemstatefile
     */
    get_SystemStateFile() {
        FileName := BSTR()
        result := ComCall(48, this, "ptr", FileName, "HRESULT")
        return FileName
    }

    /**
     * Retrieves or sets the name of the file that contains the saved system state.
     * @remarks
     * 
     * Do not include the path in the file name; the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_rootpath">IDataCollectorSet::RootPath</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_subdirectory">IDataCollectorSet::Subdirectory</a> properties determine the path to the file.
     * 
     * If you do not specify the name of the file, the system state is not retrieved.
     * 
     * The state information is a snapshot of the Circular Kernel Context Logger. The context logger provides a snapshot of the current state of the computer. The file contains kernel events. You can use the TraceRpt.exe tool to decode the events.
     * 
     * 
     * @param {BSTR} FileName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//pla/nf-pla-iconfigurationdatacollector-put_systemstatefile
     */
    put_SystemStateFile(FileName) {
        FileName := FileName is String ? BSTR.Alloc(FileName).Value : FileName

        result := ComCall(49, this, "ptr", FileName, "HRESULT")
        return result
    }
}
