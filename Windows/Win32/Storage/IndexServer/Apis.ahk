#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Storage.IndexServer
 * @version v4.0.30319
 */
class IndexServer {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static CI_VERSION_WDS30 => 258

    /**
     * @type {Integer (UInt32)}
     */
    static CI_VERSION_WDS40 => 265

    /**
     * @type {Integer (UInt32)}
     */
    static CI_VERSION_WIN70 => 1792

    /**
     * @type {String}
     */
    static CINULLCATALOG => "::_noindex_::"

    /**
     * @type {String}
     */
    static CIADMIN => "::_nodocstore_::"

    /**
     * @type {Integer (UInt32)}
     */
    static LIFF_LOAD_DEFINED_FILTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LIFF_IMPLEMENT_TEXT_FILTER_FALLBACK_POLICY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LIFF_FORCE_TEXT_FILTER_FALLBACK => 3

    /**
     * @type {String}
     */
    static CLSID_INDEX_SERVER_DSO => "{f9ae8980-7e52-11d0-8964-00c04fd611d7}"

    /**
     * @type {String}
     */
    static PSGUID_FILENAME => "{41cf5ae0-f75a-4806-bd87-59c7d9248eb9}"

    /**
     * @type {Integer (UInt32)}
     */
    static PID_FILENAME => 100

    /**
     * @type {String}
     */
    static DBPROPSET_FSCIFRMWRK_EXT => "{a9bd1526-6a80-11d0-8c9d-0020af1d740e}"

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_CI_CATALOG_NAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_CI_INCLUDE_SCOPES => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_CI_DEPTHS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_CI_SCOPE_FLAGS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_CI_EXCLUDE_SCOPES => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_CI_SECURITY_ID => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_CI_QUERY_TYPE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_CI_PROVIDER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CI_PROVIDER_MSSEARCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CI_PROVIDER_INDEXING_SERVICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CI_PROVIDER_ALL => 4294967295

    /**
     * @type {String}
     */
    static DBPROPSET_SESS_QUERYEXT => "{63623309-2d8b-4d17-b152-6e2956c26a70}"

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_DEFAULT_EQUALS_BEHAVIOR => 2

    /**
     * @type {String}
     */
    static DBPROPSET_QUERYEXT => "{a7ac77ed-f8d7-11ce-a798-0020f8008025}"

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_USECONTENTINDEX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_DEFERNONINDEXEDTRIMMING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_USEEXTENDEDDBTYPES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_IGNORENOISEONLYCLAUSES => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_GENERICOPTIONS_STRING => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_FIRSTROWS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_DEFERCATALOGVERIFICATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_CATALOGLISTID => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_GENERATEPARSETREE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_APPLICATION_NAME => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_FREETEXTANYTERM => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_FREETEXTUSESTEMMING => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_IGNORESBRI => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_DONOTCOMPUTEEXPENSIVEPROPS => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_ENABLEROWSETEVENTS => 16

    /**
     * @type {String}
     */
    static DBPROPSET_CIFRMWRKCORE_EXT => "{afafaca5-b5d1-11d0-8c62-00c04fc2db8d}"

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_MACHINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DBPROP_CLIENT_CLSID => 3

    /**
     * @type {String}
     */
    static DBPROPSET_MSIDXS_ROWSETEXT => "{aa6ee6b0-e828-11d0-b23e-00aa0047fc01}"

    /**
     * @type {Integer (UInt32)}
     */
    static MSIDXSPROP_ROWSETQUERYSTATUS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MSIDXSPROP_COMMAND_LOCALE_STRING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MSIDXSPROP_QUERY_RESTRICTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MSIDXSPROP_PARSE_TREE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MSIDXSPROP_MAX_RANK => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MSIDXSPROP_RESULTS_FOUND => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MSIDXSPROP_WHEREID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MSIDXSPROP_SERVER_VERSION => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MSIDXSPROP_SERVER_WINVER_MAJOR => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MSIDXSPROP_SERVER_WINVER_MINOR => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MSIDXSPROP_SERVER_NLSVERSION => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MSIDXSPROP_SERVER_NLSVER_DEFINED => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MSIDXSPROP_SAME_SORTORDER_USED => 14

    /**
     * @type {Integer (UInt32)}
     */
    static STAT_BUSY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STAT_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STAT_DONE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STAT_REFRESH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static STAT_PARTIAL_SCOPE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static STAT_NOISE_WORDS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static STAT_CONTENT_OUT_OF_DATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static STAT_REFRESH_INCOMPLETE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static STAT_CONTENT_QUERY_INCOMPLETE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static STAT_TIME_LIMIT_EXCEEDED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static STAT_SHARING_VIOLATION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static STAT_MISSING_RELDOC => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static STAT_MISSING_PROP_IN_RELDOC => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static STAT_RELDOC_ACCESS_DENIED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static STAT_COALESCE_COMP_ALL_NOISE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_SHALLOW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_DEEP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_PHYSICAL_PATH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static QUERY_VIRTUAL_PATH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_QUERY_WORKID => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_QUERY_UNFILTERED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_QUERY_VIRTUALPATH => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_QUERY_LASTSEENTIME => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CICAT_STOPPED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CICAT_READONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CICAT_WRITABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CICAT_NO_QUERY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CICAT_GET_STATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CICAT_ALL_OPENED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_SHADOW_MERGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_MASTER_MERGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_CONTENT_SCAN_REQUIRED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_ANNEALING_MERGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_SCANNING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_RECOVERING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_INDEX_MIGRATION_MERGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_LOW_MEMORY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_HIGH_IO => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_MASTER_MERGE_PAUSED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_READ_ONLY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_BATTERY_POWER => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_USER_ACTIVE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_STARTING => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_READING_USNS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_DELETION_MERGE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_LOW_DISK => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_HIGH_CPU => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CI_STATE_BATTERY_POLICY => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static GENERATE_METHOD_EXACT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GENERATE_METHOD_PREFIX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GENERATE_METHOD_INFLECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCOPE_FLAG_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static SCOPE_FLAG_INCLUDE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCOPE_FLAG_DEEP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCOPE_TYPE_MASK => 4294967040

    /**
     * @type {Integer (UInt32)}
     */
    static SCOPE_TYPE_WINPATH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SCOPE_TYPE_VPATH => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_QUERY_RANKVECTOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_QUERY_RANK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_QUERY_HITCOUNT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_QUERY_ALL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PROPID_STG_CONTENTS => 19

    /**
     * @type {Integer (UInt32)}
     */
    static VECTOR_RANK_MIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static VECTOR_RANK_MAX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VECTOR_RANK_INNER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VECTOR_RANK_DICE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static VECTOR_RANK_JACCARD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DBSETFUNC_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DBSETFUNC_ALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DBSETFUNC_DISTINCT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROXIMITY_UNIT_WORD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROXIMITY_UNIT_SENTENCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROXIMITY_UNIT_PARAGRAPH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROXIMITY_UNIT_CHAPTER => 3

    /**
     * @type {Integer (Int32)}
     */
    static NOT_AN_ERROR => 524288

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_END_OF_CHUNKS => -2147215616

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_NO_MORE_TEXT => -2147215615

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_NO_MORE_VALUES => -2147215614

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_ACCESS => -2147215613

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_W_MONIKER_CLIPPED => 268036

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_NO_TEXT => -2147215611

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_NO_VALUES => -2147215610

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_EMBEDDING_UNAVAILABLE => -2147215609

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_LINK_UNAVAILABLE => -2147215608

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_S_LAST_TEXT => 268041

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_S_LAST_VALUES => 268042

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_PASSWORD => -2147215605

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_E_UNKNOWNFORMAT => -2147215604
;@endregion Constants

;@region Methods
    /**
     * Retrieves IFilter from path name for object.
     * @param {PWSTR} pwcsPath A pointer to the full path of an object for which an <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface pointer is to be returned. The path can include a full filename or only the file name extension; for example, ".ext".
     * @param {Pointer<IUnknown>} pUnkOuter A pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the aggregate in which this storage object exists.
     * @param {Pointer<Void>} ppIUnk A pointer to a variable that receives the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface pointer.
     * @returns {HRESULT} This function can return one of these values.
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
     * The operation was completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was denied access to the filter file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function encountered an invalid handle, probably due to a low-memory situation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function received an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function did not have sufficient memory or other resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntquery/nf-ntquery-loadifilter
     * @since windows5.0
     */
    static LoadIFilter(pwcsPath, pUnkOuter, ppIUnk) {
        pwcsPath := pwcsPath is String ? StrPtr(pwcsPath) : pwcsPath

        result := DllCall("query.dll\LoadIFilter", "ptr", pwcsPath, "ptr", pUnkOuter, "ptr", ppIUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwcsPath 
     * @param {Integer} dwFlags 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppIUnk 
     * @returns {HRESULT} 
     */
    static LoadIFilterEx(pwcsPath, dwFlags, riid, ppIUnk) {
        pwcsPath := pwcsPath is String ? StrPtr(pwcsPath) : pwcsPath

        result := DllCall("query.dll\LoadIFilterEx", "ptr", pwcsPath, "uint", dwFlags, "ptr", riid, "ptr", ppIUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the IFilter interface pointer for the specified storage object. This is especially useful when filtering the contents of a document and processing embedded OLE objects that are accessible through their IStorage interfaces.
     * @param {Pointer<IStorage>} pStg A pointer to the <b>IStorage</b> interface to be used to access the file.
     * @param {Pointer<IUnknown>} pUnkOuter A pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the aggregate in which this storage object exists.
     * @param {Pointer<Void>} ppIUnk A pointer to an output variable that receives the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface pointer.
     * @returns {HRESULT} This function can return one of these values.
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
     * The operation was completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was denied access to the path of the storage object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function encountered an invalid handle, probably due to a low-memory situation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function received an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function did not have sufficient memory or other resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntquery/nf-ntquery-bindifilterfromstorage
     * @since windows5.0
     */
    static BindIFilterFromStorage(pStg, pUnkOuter, ppIUnk) {
        result := DllCall("query.dll\BindIFilterFromStorage", "ptr", pStg, "ptr", pUnkOuter, "ptr", ppIUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the IFilter interface pointer for the specified storage object. This is especially useful when filtering the contents of a document and processing embedded OLE objects accessible through their IStream interfaces.
     * @param {Pointer<IStream>} pStm A pointer to the <b>IStream</b> interface to be used to access the file.
     * @param {Pointer<IUnknown>} pUnkOuter A pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the aggregate in which this stream object exists.
     * @param {Pointer<Void>} ppIUnk A pointer to an output variable that receives the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface pointer.
     * @returns {HRESULT} This function can return one of these values.
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
     * The operation was completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was denied access to the path of the storage object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function encountered an invalid handle, probably due to a low-memory situation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function received an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function did not have sufficient memory or other resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unknown error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ntquery/nf-ntquery-bindifilterfromstream
     * @since windows5.0
     */
    static BindIFilterFromStream(pStm, pUnkOuter, ppIUnk) {
        result := DllCall("query.dll\BindIFilterFromStream", "ptr", pStm, "ptr", pUnkOuter, "ptr", ppIUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
