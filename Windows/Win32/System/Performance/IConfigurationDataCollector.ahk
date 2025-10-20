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
     * 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    get_FileMaxCount(count) {
        result := ComCall(32, this, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} count 
     * @returns {HRESULT} 
     */
    put_FileMaxCount(count) {
        result := ComCall(33, this, "uint", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} depth 
     * @returns {HRESULT} 
     */
    get_FileMaxRecursiveDepth(depth) {
        result := ComCall(34, this, "uint*", depth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} depth 
     * @returns {HRESULT} 
     */
    put_FileMaxRecursiveDepth(depth) {
        result := ComCall(35, this, "uint", depth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} size 
     * @returns {HRESULT} 
     */
    get_FileMaxTotalSize(size) {
        result := ComCall(36, this, "uint*", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} size 
     * @returns {HRESULT} 
     */
    put_FileMaxTotalSize(size) {
        result := ComCall(37, this, "uint", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} Files 
     * @returns {HRESULT} 
     */
    get_Files(Files) {
        result := ComCall(38, this, "ptr", Files, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} Files 
     * @returns {HRESULT} 
     */
    put_Files(Files) {
        result := ComCall(39, this, "ptr", Files, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} Queries 
     * @returns {HRESULT} 
     */
    get_ManagementQueries(Queries) {
        result := ComCall(40, this, "ptr", Queries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} Queries 
     * @returns {HRESULT} 
     */
    put_ManagementQueries(Queries) {
        result := ComCall(41, this, "ptr", Queries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} network 
     * @returns {HRESULT} 
     */
    get_QueryNetworkAdapters(network) {
        result := ComCall(42, this, "ptr", network, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} network 
     * @returns {HRESULT} 
     */
    put_QueryNetworkAdapters(network) {
        result := ComCall(43, this, "short", network, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} query 
     * @returns {HRESULT} 
     */
    get_RegistryKeys(query) {
        result := ComCall(44, this, "ptr", query, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} query 
     * @returns {HRESULT} 
     */
    put_RegistryKeys(query) {
        result := ComCall(45, this, "ptr", query, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} depth 
     * @returns {HRESULT} 
     */
    get_RegistryMaxRecursiveDepth(depth) {
        result := ComCall(46, this, "uint*", depth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} depth 
     * @returns {HRESULT} 
     */
    put_RegistryMaxRecursiveDepth(depth) {
        result := ComCall(47, this, "uint", depth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} FileName 
     * @returns {HRESULT} 
     */
    get_SystemStateFile(FileName) {
        result := ComCall(48, this, "ptr", FileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} FileName 
     * @returns {HRESULT} 
     */
    put_SystemStateFile(FileName) {
        FileName := FileName is String ? BSTR.Alloc(FileName).Value : FileName

        result := ComCall(49, this, "ptr", FileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
