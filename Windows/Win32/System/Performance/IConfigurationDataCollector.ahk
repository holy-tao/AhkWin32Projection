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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iconfigurationdatacollector-get_filemaxcount
     */
    get_FileMaxCount() {
        result := ComCall(32, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @param {Integer} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iconfigurationdatacollector-put_filemaxcount
     */
    put_FileMaxCount(count) {
        result := ComCall(33, this, "uint", count, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iconfigurationdatacollector-get_filemaxrecursivedepth
     */
    get_FileMaxRecursiveDepth() {
        result := ComCall(34, this, "uint*", &depth := 0, "HRESULT")
        return depth
    }

    /**
     * 
     * @param {Integer} depth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iconfigurationdatacollector-put_filemaxrecursivedepth
     */
    put_FileMaxRecursiveDepth(depth) {
        result := ComCall(35, this, "uint", depth, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iconfigurationdatacollector-get_filemaxtotalsize
     */
    get_FileMaxTotalSize() {
        result := ComCall(36, this, "uint*", &size := 0, "HRESULT")
        return size
    }

    /**
     * 
     * @param {Integer} size 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iconfigurationdatacollector-put_filemaxtotalsize
     */
    put_FileMaxTotalSize(size) {
        result := ComCall(37, this, "uint", size, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iconfigurationdatacollector-get_files
     */
    get_Files() {
        result := ComCall(38, this, "ptr*", &Files := 0, "HRESULT")
        return Files
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} Files 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iconfigurationdatacollector-put_files
     */
    put_Files(Files) {
        result := ComCall(39, this, "ptr", Files, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iconfigurationdatacollector-get_managementqueries
     */
    get_ManagementQueries() {
        result := ComCall(40, this, "ptr*", &Queries := 0, "HRESULT")
        return Queries
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} Queries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iconfigurationdatacollector-put_managementqueries
     */
    put_ManagementQueries(Queries) {
        result := ComCall(41, this, "ptr", Queries, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iconfigurationdatacollector-get_querynetworkadapters
     */
    get_QueryNetworkAdapters() {
        result := ComCall(42, this, "short*", &network := 0, "HRESULT")
        return network
    }

    /**
     * 
     * @param {VARIANT_BOOL} network 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iconfigurationdatacollector-put_querynetworkadapters
     */
    put_QueryNetworkAdapters(network) {
        result := ComCall(43, this, "short", network, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iconfigurationdatacollector-get_registrykeys
     */
    get_RegistryKeys() {
        result := ComCall(44, this, "ptr*", &query := 0, "HRESULT")
        return query
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} query 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iconfigurationdatacollector-put_registrykeys
     */
    put_RegistryKeys(query) {
        result := ComCall(45, this, "ptr", query, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iconfigurationdatacollector-get_registrymaxrecursivedepth
     */
    get_RegistryMaxRecursiveDepth() {
        result := ComCall(46, this, "uint*", &depth := 0, "HRESULT")
        return depth
    }

    /**
     * 
     * @param {Integer} depth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iconfigurationdatacollector-put_registrymaxrecursivedepth
     */
    put_RegistryMaxRecursiveDepth(depth) {
        result := ComCall(47, this, "uint", depth, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iconfigurationdatacollector-get_systemstatefile
     */
    get_SystemStateFile() {
        FileName := BSTR()
        result := ComCall(48, this, "ptr", FileName, "HRESULT")
        return FileName
    }

    /**
     * 
     * @param {BSTR} FileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pla/nf-pla-iconfigurationdatacollector-put_systemstatefile
     */
    put_SystemStateFile(FileName) {
        FileName := FileName is String ? BSTR.Alloc(FileName).Value : FileName

        result := ComCall(49, this, "ptr", FileName, "HRESULT")
        return result
    }
}
