#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class P2P {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static NS_PNRPNAME => 38

    /**
     * @type {Integer (UInt32)}
     */
    static NS_PNRPCLOUD => 39

    /**
     * @type {Integer (UInt32)}
     */
    static PNRPINFO_HINT => 1

    /**
     * @type {Guid}
     */
    static NS_PROVIDER_PNRPNAME => Guid("{03fe89cd-766d-4976-b9c1-bb9bc42c7b4d}")

    /**
     * @type {Guid}
     */
    static NS_PROVIDER_PNRPCLOUD => Guid("{03fe89ce-766d-4976-b9c1-bb9bc42c7b4d}")

    /**
     * @type {Guid}
     */
    static SVCID_PNRPCLOUD => Guid("{c2239ce6-00c0-4fbf-bad6-18139385a49a}")

    /**
     * @type {Guid}
     */
    static SVCID_PNRPNAME_V1 => Guid("{c2239ce5-00c0-4fbf-bad6-18139385a49a}")

    /**
     * @type {Guid}
     */
    static SVCID_PNRPNAME_V2 => Guid("{c2239ce7-00c0-4fbf-bad6-18139385a49a}")

    /**
     * @type {Integer (UInt32)}
     */
    static PNRP_MAX_ENDPOINT_ADDRESSES => 10

    /**
     * @type {String}
     */
    static WSZ_SCOPE_GLOBAL => "GLOBAL"

    /**
     * @type {String}
     */
    static WSZ_SCOPE_SITELOCAL => "SITELOCAL"

    /**
     * @type {String}
     */
    static WSZ_SCOPE_LINKLOCAL => "LINKLOCAL"

    /**
     * @type {Integer (UInt32)}
     */
    static PNRP_MAX_EXTENDED_PAYLOAD_BYTES => 4096

    /**
     * @type {String}
     */
    static PEER_PNRP_ALL_LINK_CLOUDS => "PEER_PNRP_ALL_LINKS"

    /**
     * @type {Integer (UInt32)}
     */
    static WSA_PNRP_ERROR_BASE => 11500

    /**
     * @type {Integer (UInt32)}
     */
    static WSA_PNRP_CLOUD_NOT_FOUND => 11501

    /**
     * @type {Integer (UInt32)}
     */
    static WSA_PNRP_CLOUD_DISABLED => 11502

    /**
     * @type {Integer (UInt32)}
     */
    static WSA_PNRP_INVALID_IDENTITY => 11503

    /**
     * @type {Integer (UInt32)}
     */
    static WSA_PNRP_TOO_MUCH_LOAD => 11504

    /**
     * @type {Integer (UInt32)}
     */
    static WSA_PNRP_CLOUD_IS_SEARCH_ONLY => 11505

    /**
     * @type {Integer (UInt32)}
     */
    static WSA_PNRP_CLIENT_INVALID_COMPARTMENT_ID => 11506

    /**
     * @type {Integer (UInt32)}
     */
    static WSA_PNRP_DUPLICATE_PEER_NAME => 11508

    /**
     * @type {Integer (UInt32)}
     */
    static WSA_PNRP_CLOUD_IS_DEAD => 11509

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_CLOUD_NOT_FOUND => -2147013395

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_CLOUD_DISABLED => -2147013394

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_INVALID_IDENTITY => -2147013393

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_TOO_MUCH_LOAD => -2147013392

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_CLOUD_IS_SEARCH_ONLY => -2147013391

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_CLIENT_INVALID_COMPARTMENT_ID => -2147013390

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_DUPLICATE_PEER_NAME => -2147013388

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_CLOUD_IS_DEAD => -2147013387

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_NOT_FOUND => -2147023728

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_DISK_FULL => -2147024784

    /**
     * @type {Integer (Int32)}
     */
    static PEER_E_ALREADY_EXISTS => -2147024713

    /**
     * @type {Guid}
     */
    static PEER_GROUP_ROLE_ADMIN => Guid("{04387127-aa56-450a-8ce5-4f565c6790f4}")

    /**
     * @type {Guid}
     */
    static PEER_GROUP_ROLE_MEMBER => Guid("{f12dc4c7-0857-4ca0-93fc-b1bb19a3d8c2}")

    /**
     * @type {Guid}
     */
    static PEER_GROUP_ROLE_INVITING_MEMBER => Guid("{4370fd89-dc18-4cfb-8dbf-9853a8a9f905}")

    /**
     * @type {Guid}
     */
    static PEER_COLLAB_OBJECTID_USER_PICTURE => Guid("{dd15f41f-fc4e-4922-b035-4c06a754d01d}")

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DRT => 98

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_TIMEOUT => -2141057023

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_INVALID_KEY_SIZE => -2141057022

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_INVALID_CERT_CHAIN => -2141057020

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_INVALID_MESSAGE => -2141057019

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_NO_MORE => -2141057018

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_INVALID_MAX_ADDRESSES => -2141057017

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_SEARCH_IN_PROGRESS => -2141057016

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_INVALID_KEY => -2141057015

    /**
     * @type {Integer (Int32)}
     */
    static DRT_S_RETRY => 6426640

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_INVALID_MAX_ENDPOINTS => -2141057007

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_INVALID_SEARCH_RANGE => -2141057006

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_INVALID_PORT => -2141052928

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_INVALID_TRANSPORT_PROVIDER => -2141052927

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_INVALID_SECURITY_PROVIDER => -2141052926

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_STILL_IN_USE => -2141052925

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_INVALID_BOOTSTRAP_PROVIDER => -2141052924

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_INVALID_ADDRESS => -2141052923

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_INVALID_SCOPE => -2141052922

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_TRANSPORT_SHUTTING_DOWN => -2141052921

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_NO_ADDRESSES_AVAILABLE => -2141052920

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_DUPLICATE_KEY => -2141052919

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_TRANSPORTPROVIDER_IN_USE => -2141052918

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_TRANSPORTPROVIDER_NOT_ATTACHED => -2141052917

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_SECURITYPROVIDER_IN_USE => -2141052916

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_SECURITYPROVIDER_NOT_ATTACHED => -2141052915

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_BOOTSTRAPPROVIDER_IN_USE => -2141052914

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_BOOTSTRAPPROVIDER_NOT_ATTACHED => -2141052913

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_TRANSPORT_ALREADY_BOUND => -2141052671

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_TRANSPORT_NOT_BOUND => -2141052670

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_TRANSPORT_UNEXPECTED => -2141052669

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_TRANSPORT_INVALID_ARGUMENT => -2141052668

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_TRANSPORT_NO_DEST_ADDRESSES => -2141052667

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_TRANSPORT_EXECUTING_CALLBACK => -2141052666

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_TRANSPORT_ALREADY_EXISTS_FOR_SCOPE => -2141052665

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_INVALID_SETTINGS => -2141052664

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_INVALID_SEARCH_INFO => -2141052663

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_FAULTED => -2141052662

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_TRANSPORT_STILL_BOUND => -2141052661

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_INSUFFICIENT_BUFFER => -2141052660

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_INVALID_INSTANCE_PREFIX => -2141052659

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_INVALID_SECURITY_MODE => -2141052658

    /**
     * @type {Integer (Int32)}
     */
    static DRT_E_CAPABILITY_MISMATCH => -2141052657

    /**
     * @type {Integer (UInt32)}
     */
    static DRT_PAYLOAD_REVOKED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRT_MIN_ROUTING_ADDRESSES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRT_MAX_ROUTING_ADDRESSES => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DRT_MAX_PAYLOAD_SIZE => 5120

    /**
     * @type {Integer (UInt32)}
     */
    static DRT_MAX_INSTANCE_PREFIX_LEN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DRT_LINK_LOCAL_ISATAP_SCOPEID => 4294967295

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_PUBLICATION_OPTIONS_VERSION_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_PUBLICATION_OPTIONS_VERSION => 2

    /**
     * @type {Integer (Int32)}
     */
    static PEERDIST_PUBLICATION_OPTIONS_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PEERDIST_READ_TIMEOUT_LOCAL_CACHE_ONLY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PEERDIST_READ_TIMEOUT_DEFAULT => 4294967294
;@endregion Constants

;@region Methods
    /**
     * The PeerGraphStartup function indicates to the Peer Graphing Infrastructure what version of the Peer protocols the calling application requires.
     * @param {Integer} wVersionRequested Specify PEER_GRAPH_VERSION.
     * @param {Pointer<PEER_VERSION_DATA>} pVersionData Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_version_data">PEER_VERSION_DATA</a> structure that receives the 
     * version of the Peer Infrastructure installed on the local computer.
     * @returns {HRESULT} Returns S_OK if the operation succeeds; otherwise, the function returns one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to perform the specified operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_UNSUPPORTED_VERSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The version requested is not supported by the Peer Infrastructure .dll installed on the local computer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphstartup
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphStartup(wVersionRequested, pVersionData) {
        result := DllCall("P2PGRAPH.dll\PeerGraphStartup", "ushort", wVersionRequested, "ptr", pVersionData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphShutdown function cleans up any resources allocated by the call to PeerGraphStartup. There must be a call to PeerGraphShutdown for each call to PeerGraphStartup.
     * @remarks
     * When the last <b>PeerGraphShutdown</b> is called for a peer graph, all the opened peer graphs, outstanding enumeration handles, and  outstanding event registration handles are automatically released.
     * @returns {HRESULT} Returns S_OK if the operation succeeds; otherwise, the function returns the one of the standard error codes defined in WinError.h, or the function returns the following value:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer graph must be  initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphshutdown
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphShutdown() {
        result := DllCall("P2PGRAPH.dll\PeerGraphShutdown", "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphFreeData function frees resources that several of the Peer Graphing API functions return.
     * @remarks
     * The [PEER_RECORD](./ns-p2p-peer_record.md).
     * @param {Pointer<Void>} pvData Pointer to an item to free.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphfreedata
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphFreeData(pvData) {
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        DllCall("P2PGRAPH.dll\PeerGraphFreeData", pvDataMarshal, pvData)
    }

    /**
     * The PeerGraphGetItemCount function retrieves the number of items in an enumeration.
     * @remarks
     * Because some items can become invalid while an application is enumerating a set of items, the number of items returned from <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphgetnextitem">PeerGraphGetNextItem</a> can be less than the number of items  returned in <i>pCount</i>.  The value of  <i>pCount</i> indicates the number of items in an enumeration when the handle is created.  Due to the dynamic nature of the Peer Infrastructure, it is not guaranteed that the number of items retrieved by using <b>PeerGraphGetNextItem</b> is equal to <i>pCount</i>.
     * @param {Pointer<Void>} hPeerEnum Handle to a peer graph.
     * @returns {Integer} Receives a pointer to the number of records in an enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphgetitemcount
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphGetItemCount(hPeerEnum) {
        hPeerEnumMarshal := hPeerEnum is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphGetItemCount", hPeerEnumMarshal, hPeerEnum, "uint*", &pCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCount
    }

    /**
     * Obtains the next item or items in an enumeration created by a call to the following functions.
     * @remarks
     * Free  <i>ppvItems</i> by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphfreedata">PeerGraphFreeData</a> when the data is no longer required.
     * 
     * The application can request a range of items to obtain.   The function  returns <i>pCount</i> or fewer items.
     * @param {Pointer<Void>} hPeerEnum Handle to an enumeration.
     * @param {Pointer<Integer>} pCount Input specifies the number of items to obtain.
     * 
     * Output receives the actual number of items obtained.
     * 
     * <div class="alert"><b>Note</b>  If <i>pCount</i> is a zero (0) output, the end of the enumeration is reached.</div>
     * <div> </div>
     * @returns {Pointer<Pointer<Void>>} Receives an array of pointers to  the requested items.  The number  of pointers contained in an array is specified by the output value of  <i>pCount</i>.  The actual data returned depends on the type of enumeration. The  types of structures that are returned are the following:  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_connection_info">PEER_CONNECTION_INFO</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_node_info">PEER_NODE_INFO</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_record">PEER_RECORD</a>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphgetnextitem
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphGetNextItem(hPeerEnum, pCount) {
        hPeerEnumMarshal := hPeerEnum is VarRef ? "ptr" : "ptr"
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphGetNextItem", hPeerEnumMarshal, hPeerEnum, pCountMarshal, pCount, "ptr*", &pppvItems := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pppvItems
    }

    /**
     * The PeerGraphEndEnumeration function releases an enumeration handle, and frees the resources associated with an enumeration.
     * @param {Pointer<Void>} hPeerEnum Handle to an  enumeration to release. This handle is  returned by one of the following functions: <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphenumconnections">PeerGraphEnumConnections</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphenumnodes">PeerGraphEnumNodes</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphenumrecords">PeerGraphEnumRecords</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphsearchrecords">PeerGraphSearchRecords</a>.
     * @returns {HRESULT} If the function call succeeds, the return value is <b>S_OK</b>. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A graph must be  initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphendenumeration
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphEndEnumeration(hPeerEnum) {
        hPeerEnumMarshal := hPeerEnum is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphEndEnumeration", hPeerEnumMarshal, hPeerEnum, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphCreate function creates a new peer graph. An application can specify information about a peer graph, and the type of security that a peer graph uses. A handle to a peer graph is returned, but a network connection is not established.
     * @remarks
     * If you develop your own Security Service Provider (SSP), your application must not call the Peer Graphing API to access data in the peer graphing database, because that can cause a deadlock situation.  Instead, the application must use a cached copy of the information. The cached copy is not created by the Peer Graphing API. The application must provide a mechanism for caching this data.
     * 
     * After   <b>PeerGraphCreate</b> is called, the  application can subscribe to events before it calls <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphlisten">PeerGraphListen</a>.
     * @param {Pointer<PEER_GRAPH_PROPERTIES>} pGraphProperties All of the properties of a peer graph in the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_graph_properties">PEER_GRAPH_PROPERTIES</a> structure.
     * @param {PWSTR} pwzDatabaseName The name of a record database to associate with a peer graph when it is created. The record database name must be a valid file name. Do not include a path with the file name.  For a complete list of rules regarding file names, see  the Naming a File item in the list of  <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/graphing-reference-links">Graphing Reference_Links</a>.
     * @param {Pointer<PEER_SECURITY_INTERFACE>} pSecurityInterface The information about a security provider for a peer graph in the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_security_interface">PEER_SECURITY_INTERFACE</a> structure.
     * @returns {Pointer<Void>} Receives a handle to the peer graph that is created. When this handle is not required anymore, free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphclose">PeerGraphClose</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphcreate
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphCreate(pGraphProperties, pwzDatabaseName, pSecurityInterface) {
        pwzDatabaseName := pwzDatabaseName is String ? StrPtr(pwzDatabaseName) : pwzDatabaseName

        result := DllCall("P2PGRAPH.dll\PeerGraphCreate", "ptr", pGraphProperties, "ptr", pwzDatabaseName, "ptr", pSecurityInterface, "ptr*", &phGraph := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phGraph
    }

    /**
     * The PeerGraphOpen function opens a peer graph that is created previously by either the local node or a remote node. A handle to the peer graph is returned, but a network connection is not established.
     * @remarks
     * If you have developed your own SSP, your application must not call the PeerGraphing API to access data in the graphing database, because that can lead to a deadlock situation.  Instead, the application should look at a cached copy of the information.
     * 
     * After   <b>PeerGraphOpen</b> is called, an  application can subscribe to events or import a database, or both.
     * 
     * Until a peer graph is synchronized at least one time, many functions are not available (for example, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphlisten">PeerGraphListen</a> or any of the record management functions), and any calls made to these functions fail. A peer graph is  synchronized at least one time when one of the following occurs:
     * 
     * <ul>
     * <li>A call to <b>PeerGraphOpen</b> returns <b>S_OK</b>, which means that  an already synchronized database has been found.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphcreate">PeerGraphCreate</a>  function has been called.</li>
     * <li>The <b>PEER_GRAPH_EVENT_STATUS_CHANGED</b> event has been triggered, and  the PEER_GRAPH_STATUS_SYNCHRONIZED flag of the   <b>dwStatus</b> member has been set.</li>
     * </ul>
     * @param {PWSTR} pwzGraphId Specifies the ID of the peer graph to open. This identifier must be the same as the ID used in the call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphcreate">PeerGraphCreate</a>.
     * 
     * <div class="alert"><b>Note</b>  A peer who specifies an invalid (long)  graph ID  can open and connect successfully to a graph, but the peer cannot publish records to the graph, because the records cannot be validated.
     * </div>
     * <div> </div>
     * @param {PWSTR} pwzPeerId Specifies the unique ID of the peer opening the graph.
     * 
     * <div class="alert"><b>Note</b>  A peer who specifies an invalid (long)  graph ID  can open and connect successfully to a graph, but the peer cannot publish records to the graph, because the records cannot be validated.</div>
     * <div> </div>
     * @param {PWSTR} pwzDatabaseName Specifies the name of the database that is associated with this peer graph at the time the graph was  created or opened for the first time.
     * @param {Pointer<PEER_SECURITY_INTERFACE>} pSecurityInterface Specifies the security provider for a peer graph.  This parameter must specify the same value as  the <i>pSecurityInterface</i> specified in the original call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphcreate">PeerGraphCreate</a>.
     * @param {Integer} cRecordTypeSyncPrecedence Specifies the number of record types in the <i>pRecordTypeSyncPrecedence</i> parameter.
     * @param {Pointer<Guid>} pRecordTypeSyncPrecedence Points to an array of record types.  This array specifies the order  in which records of the specified record types are synchronized. The order can be zero (0) to N, where 0 is the first record type to be synchronized.  If a record type is not specified in the array, it is  synchronized in the default order after the types specified in the array are synchronized.
     * 
     * Specify <b>NULL</b> to use the default order. This parameter must be <b>NULL</b> if <i>cRecordTypeSyncPrecedence</i> is zero (0).
     * @returns {Pointer<Void>} Receives a handle to the peer graph that is opened. When this handle is not required or needed, free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphclose">PeerGraphClose</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphopen
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphOpen(pwzGraphId, pwzPeerId, pwzDatabaseName, pSecurityInterface, cRecordTypeSyncPrecedence, pRecordTypeSyncPrecedence) {
        pwzGraphId := pwzGraphId is String ? StrPtr(pwzGraphId) : pwzGraphId
        pwzPeerId := pwzPeerId is String ? StrPtr(pwzPeerId) : pwzPeerId
        pwzDatabaseName := pwzDatabaseName is String ? StrPtr(pwzDatabaseName) : pwzDatabaseName

        result := DllCall("P2PGRAPH.dll\PeerGraphOpen", "ptr", pwzGraphId, "ptr", pwzPeerId, "ptr", pwzDatabaseName, "ptr", pSecurityInterface, "uint", cRecordTypeSyncPrecedence, "ptr", pRecordTypeSyncPrecedence, "ptr*", &phGraph := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phGraph
    }

    /**
     * The PeerGraphListen function indicates that a peer graph should start listening for incoming connections.
     * @remarks
     * To be able to accept direct connections, a node must  subscribe to the  <b>PEER_GRAPH_EVENT_DIRECT_CONNECTION</b> event.  
     * 
     * Before this function can be called, the application must  call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphcreate">PeerGraphCreate</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphopen">PeerGraphOpen</a>. 
     * 
     * <div class="alert"><b>Note</b>  If this is the first time a peer graph is opened, all calls to <b>PeerGraphListen</b>  fail until the node  connects to and synchronizes with  the peer graph.</div>
     * <div> </div>
     * The application  can specify the same port ID for different peer graphs, if all the peer graphs are in the same process.
     * @param {Pointer<Void>} hGraph Specifies the peer graph to  listen  on.
     * @param {Integer} dwScope Specifies the IPv6 scope to listen on.  Valid values are identified in the following table. For more information about scope, see <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/graphing-reference-links">Link-Local and Site-Local Addresses</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEER_GRAPH_SCOPE_GLOBAL"></a><a id="peer_graph_scope_global"></a><dl>
     * <dt><b>PEER_GRAPH_SCOPE_GLOBAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Scope includes the Internet.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEER_GRAPH_SCOPE_SITELOCAL"></a><a id="peer_graph_scope_sitelocal"></a><dl>
     * <dt><b>PEER_GRAPH_SCOPE_SITELOCAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Scope is restricted to a site, for example, a corporation intranet.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEER_GRAPH_SCOPE_LINKLOCAL"></a><a id="peer_graph_scope_linklocal"></a><dl>
     * <dt><b>PEER_GRAPH_SCOPE_LINKLOCAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Scope is restricted to a local subnet.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwScopeId Specifies the IPv6 scope ID to listen on. Specify zero (0) to listen on all interfaces of the specified scope.
     * 
     * <div class="alert"><b>Note</b>  The scope ID zero (0) is  not allowed if <i>dwScope</i> is <b>PEER_GRAPH_SCOPE_SITELOCAL</b> or  <b>PEER_GRAPH_SCOPE_LINKLOCAL</b>.</div>
     * <div> </div>
     * @param {Integer} wPort Specifies the port  to listen on. Specify zero (0) to use a dynamic port. If zero (0) is specified, use <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphgetnodeinfo">PeerGraphGetNodeInfo</a> to retrieve data.
     * @returns {HRESULT} Returns <b>S_OK</b> if the operation succeeds. Otherwise, the function returns one of the  values identified in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
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
     * There is not enough memory to perform the specified operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_GRAPH_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graph has never been synchronized. An application cannot listen until the peer graph has been synchronized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the peer graph is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graph must be initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a>—before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphlisten
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphListen(hGraph, dwScope, dwScopeId, wPort) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphListen", hGraphMarshal, hGraph, "uint", dwScope, "uint", dwScopeId, "ushort", wPort, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphConnect function attempts to make a connection to a specified node in a peer graph.
     * @param {Pointer<Void>} hGraph Handle to a peer graph.
     * @param {PWSTR} pwzPeerId The unique ID of a peer to connect to at  <i>pAddress</i>. Specify <b>NULL</b> to connect to any peer listening at a specified address in the same peer graph.
     * @param {Pointer<PEER_ADDRESS>} pAddress Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_address">PEER_ADDRESS</a> structure that identifies a node to connect to.
     * @returns {Integer} Receives the pointer to an <b>ULONGLONG</b> that contains  the connection ID. This ID can be used with the direct communication functions.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphconnect
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphConnect(hGraph, pwzPeerId, pAddress) {
        pwzPeerId := pwzPeerId is String ? StrPtr(pwzPeerId) : pwzPeerId

        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphConnect", hGraphMarshal, hGraph, "ptr", pwzPeerId, "ptr", pAddress, "uint*", &pullConnectionId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pullConnectionId
    }

    /**
     * The PeerGraphClose function invalidates the peer graph handle returned by a call to either PeerGraphCreate or PeerGraphOpen, and closes all network connections for the specified peer graph.
     * @param {Pointer<Void>} hGraph Handle to the peer graph  to close.
     * @returns {HRESULT} If the function call succeeds, the return value is <b>S_OK</b>. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is not valid.
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
     * There is not enough memory to perform the specified operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the peer graph is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer graph must be initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphclose
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphClose(hGraph) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphClose", hGraphMarshal, hGraph, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphDelete function deletes the data associated with a specified peer graph.
     * @remarks
     * A peer graph must be closed by using <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphclose">PeerGraphClose</a> before it can be deleted.
     * 
     * If  a delete operation fails, a Windows file error code is returned.
     * @param {PWSTR} pwzGraphId The name of a peer graph to delete data for.  Specify the same ID used in calls to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphcreate">PeerGraphCreate</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphopen">PeerGraphOpen</a>.
     * @param {PWSTR} pwzPeerId The peer ID to delete  data for. Specify the same ID used in calls to  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphcreate">PeerGraphCreate</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphopen">PeerGraphOpen</a>.
     * @param {PWSTR} pwzDatabaseName The name of  a database associated with a peer graph. Specify the same ID used in calls to  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphcreate">PeerGraphCreate</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphopen">PeerGraphOpen</a>.
     * @returns {HRESULT} If the function call succeeds, the return value is <b>S_OK</b>. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access to a  graph is denied.
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
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A graph must be initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphdelete
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphDelete(pwzGraphId, pwzPeerId, pwzDatabaseName) {
        pwzGraphId := pwzGraphId is String ? StrPtr(pwzGraphId) : pwzGraphId
        pwzPeerId := pwzPeerId is String ? StrPtr(pwzPeerId) : pwzPeerId
        pwzDatabaseName := pwzDatabaseName is String ? StrPtr(pwzDatabaseName) : pwzDatabaseName

        result := DllCall("P2PGRAPH.dll\PeerGraphDelete", "ptr", pwzGraphId, "ptr", pwzPeerId, "ptr", pwzDatabaseName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphGetStatus function returns the current status of the peer graph.
     * @param {Pointer<Void>} hGraph Handle to the peer graph.
     * @returns {Integer} Receives the current status of the peer graph.  Returns one or more of the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_graph_status_flags">PEER_GRAPH_STATUS_FLAGS</a> values.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphgetstatus
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphGetStatus(hGraph) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphGetStatus", hGraphMarshal, hGraph, "uint*", &pdwStatus := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwStatus
    }

    /**
     * The PeerGraphGetProperties function retrieves the current peer graph properties.
     * @param {Pointer<Void>} hGraph Handle to a peer graph.
     * @returns {Pointer<PEER_GRAPH_PROPERTIES>} Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_graph_properties">PEER_GRAPH_PROPERTIES</a> structure.  When the structure is not needed, free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphfreedata">PeerGraphFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphgetproperties
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphGetProperties(hGraph) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphGetProperties", hGraphMarshal, hGraph, "ptr*", &ppGraphProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppGraphProperties
    }

    /**
     * The PeerGraphSetProperties function sets the peer graph properties.
     * @remarks
     * You can modify
     * the <b>pwzFriendlyName</b>,
     * <b>cPresenceMax</b>, <b>pwzComment</b> and
     * <b>ulPresenceLifetime</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_graph_properties">PEER_GRAPH_PROPERTIES</a> structure.
     * @param {Pointer<Void>} hGraph Handle to a graph.
     * @param {Pointer<PEER_GRAPH_PROPERTIES>} pGraphProperties Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_graph_properties">PEER_GRAPH_PROPERTIES</a> structure that specifies new values for   the graph properties  that an application can set.
     * 
     * An application can set only the following fields of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_graph_properties">PEER_GRAPH_PROPERTIES</a>:<ul>
     * <li><b>pwzFriendlyName</b></li>
     * <li><b>cPresenceMax</b></li>
     * <li><b>pwzComment</b></li>
     * <li><b>ulPresenceLifetime</b></li>
     * </ul>
     * <div class="alert"><b>Note</b>   If remaining fields are set, then they are ignored.</div>
     * <div> </div>
     * @returns {HRESULT} If the function call succeeds, the return value is <b>S_OK</b>. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot access a peer  graph.
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
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to a peer graph is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graph must be  initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphsetproperties
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphSetProperties(hGraph, pGraphProperties) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphSetProperties", hGraphMarshal, hGraph, "ptr", pGraphProperties, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphRegisterEvent function registers a peer's request to be notified of changes associated with a peer graph and event type.
     * @param {Pointer<Void>} hGraph Handle to the peer graph.
     * @param {HANDLE} hEvent Handle created by <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/graphing-reference-links">CreateEvent</a> that the application is signaled on  when an event is triggered.  When an application is signaled, it must call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphgeteventdata">PeerGraphGetEventData</a> to retrieve events until PEER_S_NO_EVENT_DATA returned.
     * @param {Integer} cEventRegistrations Specifies the number of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_graph_event_registration">PEER_GRAPH_EVENT_REGISTRATION</a> structures in <i>pEventRegistrations</i>.
     * @param {Pointer<PEER_GRAPH_EVENT_REGISTRATION>} pEventRegistrations Points to an array of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_graph_event_registration">PEER_GRAPH_EVENT_REGISTRATION</a> structures that specify what events the application requests notifications for.
     * @returns {Pointer<Void>} Receives a <b>HPEEREVENT</b> handle. This handle must be used when calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphunregisterevent">PeerGraphUnregisterEvent</a> to stop receiving  notifications.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphregisterevent
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphRegisterEvent(hGraph, hEvent, cEventRegistrations, pEventRegistrations) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphRegisterEvent", hGraphMarshal, hGraph, "ptr", hEvent, "uint", cEventRegistrations, "ptr", pEventRegistrations, "ptr*", &phPeerEvent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEvent
    }

    /**
     * The PeerGraphUnregisterEvent function requests that the application no longer be notified of changes associated with a peer graph and record type.
     * @remarks
     * The peer event handle passed to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphregisterevent">PeerGraphRegisterEvent</a> must be closed only after <b>PeerGraphUnregisterEvent</b> has been called.
     * @param {Pointer<Void>} hPeerEvent Peer event handle obtained from call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphregisterevent">PeerGraphRegisterEvent</a>.
     * @returns {HRESULT} If the function call succeeds, the return value is S_OK. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer graph must be  initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphunregisterevent
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphUnregisterEvent(hPeerEvent) {
        hPeerEventMarshal := hPeerEvent is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphUnregisterEvent", hPeerEventMarshal, hPeerEvent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphGetEventData function retrieves peer events. An application calls this function until the return value PEER_S_NO_EVENT_DATA is returned, which indicates that a call is successful, but that there are no more peer events to retrieve.
     * @remarks
     * Peer event data is returned in  a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_graph_event_data">PEER_GRAPH_EVENT_DATA</a> structure.  The type of data structure that <b>PEER_GRAPH_EVENT_DATA</b> points to depends  on which event is triggered.
     * @param {Pointer<Void>} hPeerEvent Peer event handle obtained by a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphregisterevent">PeerGraphRegisterEvent</a>.
     * @returns {Pointer<PEER_GRAPH_EVENT_DATA>} Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_graph_event_data">PEER_GRAPH_EVENT_DATA</a> structure that contains the data about an event notification.   When this structure is not needed, free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphfreedata">PeerGraphFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphgeteventdata
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphGetEventData(hPeerEvent) {
        hPeerEventMarshal := hPeerEvent is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphGetEventData", hPeerEventMarshal, hPeerEvent, "ptr*", &ppEventData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppEventData
    }

    /**
     * The PeerGraphGetRecord function retrieves a specific record based on the specified record ID. The returned record should be freed by calling PeerGraphFreeData.
     * @param {Pointer<Void>} hGraph Handle to the peer graph.
     * @param {Pointer<Guid>} pRecordId Pointer to record ID to retrieve.
     * @returns {Pointer<PEER_RECORD>} Receives the requested record. When this structure is no longer required, free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphfreedata">PeerGraphFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphgetrecord
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphGetRecord(hGraph, pRecordId) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphGetRecord", hGraphMarshal, hGraph, "ptr", pRecordId, "ptr*", &ppRecord := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppRecord
    }

    /**
     * The PeerGraphAddRecord function adds a new record to a peer graph. A record added with this function is sent to each node in a peer graph.
     * @remarks
     * The following members of the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_record">PEER_RECORD</a> structure must contain valid values:
     * 
     * <ul>
     * <li><b>dwSize</b>.</li>
     * <li><b>type</b>.</li>
     * <li><b>ftExpiration</b> - Must be later than the current graph time, and must be specified in peer time by using <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphuniversaltimetopeertime">PeerGraphUniversalTimeToPeerTime</a>.</li>
     * </ul>
     * The following members of the <b>PEER_RECORD</b> structure are optional. Set them to <b>NULL</b> if they are not used by your application:
     * 
     * <ul>
     * <li><b>data</b></li>
     * <li><b>pwzAttributes</b></li>
     * <li><b>securityData</b></li>
     * <li><b>dwVersion</b></li>
     * </ul>
     * If any of the following members are <b>NULL</b>, the Peer Graphing API performs the specified default behavior:
     * 
     * <ul>
     * <li><b>pwzCreatorId</b> - Uses the peer ID passed to either <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphcreate">PeerGraphCreate</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphopen">PeerGraphOpen</a>.</li>
     * <li><b>pwzModifiedById</b> - Uses the  <b>pwzCreatorId</b>.</li>
     * </ul>
     * The following members cannot be specified; any value used is overwritten by the Peer Graphing infrastructure:
     * 
     * <ul>
     * <li><b>id</b>.</li>
     * <li><b>ftCreation</b> - Uses peer time.</li>
     * <li><b>ftLastModified</b> - Uses peer time.</li>
     * </ul>
     * @param {Pointer<Void>} hGraph Handle to a peer graph.
     * @param {Pointer<PEER_RECORD>} pRecord Pointer to a record to add.
     * @param {Pointer<Guid>} pRecordId Specifies   the record ID that uniquely identifies a  record in a peer graph.
     * @returns {HRESULT} If the function call succeeds, the return value is <b>S_OK</b>. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot access a peer graph.
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
     * One of the parameters is not valid.
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
     * There is not enough memory to perform a specified operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_GRAPH_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A graph is not synchronized. Records cannot be added until the peer graph is synchronized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_GRAPH_SHUTTING_DOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphclose">PeerGraphClose</a> has been called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_ATTRIBUTES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified attributes do not match the schema.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to a peer graph is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_MAX_RECORD_SIZE_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The record exceeds the maximum size allowed by a peer graph.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graph must be initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a>—before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphaddrecord
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphAddRecord(hGraph, pRecord, pRecordId) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphAddRecord", hGraphMarshal, hGraph, "ptr", pRecord, "ptr", pRecordId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphUpdateRecord function updates a record in the peer graph and then floods the record to each node in the peer graph.
     * @remarks
     * The following members of the  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_record">PEER_RECORD</a> structure can be modified:
     * 
     * <ul>
     * <li><b>pwzAttributes</b></li>
     * <li><b>ftExpiration</b> - the expiration can only be increased</li>
     * <li><b>data</b></li>
     * <li><b>pwzLastModified</b> - filled in by default if no value is supplied</li>
     * </ul>
     * @param {Pointer<Void>} hGraph Handle to the peer graph.
     * @param {Pointer<PEER_RECORD>} pRecord Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_record">PEER_RECORD</a> structure that contains the  new data for the record.
     * @returns {HRESULT} If the function call succeeds, the return value is S_OK. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_GRAPH_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer graph has never been synchronized. Records cannot be updated until the graph has been synchronized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the peer graph is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer graph must be  initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_RECORD_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified record was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphupdaterecord
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphUpdateRecord(hGraph, pRecord) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphUpdateRecord", hGraphMarshal, hGraph, "ptr", pRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphDeleteRecord function marks a record as deleted within a peer graph. The record is not available on a local node to function calls, for example, calls to PeerGraphGetRecord and PeerGraphEnumRecords.
     * @param {Pointer<Void>} hGraph Handle to a peer graph.
     * @param {Pointer<Guid>} pRecordId Pointer to a record ID to delete.
     * @param {BOOL} fLocal Specify <b>TRUE</b> to remove a record from only  a local database without notifying the rest of  a peer graph about the change.  Specify FALSE to delete the record from an entire peer graph.
     * 
     * <div class="alert"><b>Note</b>   Specifying <b>TRUE</b> does not prevent  a record from being added again during the next graph synchronization with a neighbor. Specifying <b>TRUE</b> is only effective if PEER_SECURITY_INTERFACE is specified in a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphopen">PeerGraphOpen</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphcreate">PeerGraphCreate</a>, and only if  PEER_SECURITY_INTERFACE contains a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nc-p2p-pfnpeer_validate_record">PFNPEER_VALIDATE_RECORD</a> function that returns PEER_E_INVALID_RECORD when validating the record.</div>
     * <div> </div>
     * @returns {HRESULT} If the function call succeeds, the return value is <b>S_OK</b>. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot access a  peer graph.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_GRAPH_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer graph is not synchronized. Records cannot be deleted until the graph is synchronized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to a peer graph is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer graph must be initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_RECORD_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified record cannot be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphdeleterecord
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphDeleteRecord(hGraph, pRecordId, fLocal) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphDeleteRecord", hGraphMarshal, hGraph, "ptr", pRecordId, "int", fLocal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphEnumRecords function creates and returns an enumeration handle used to enumerate records of a specific type of record, user, or both. An enumeration provides a snapshot of records at the time an enumeration is performed.
     * @remarks
     * <ul>
     * <li>If both the <i>pRecordType</i> and <i>pwzPeerId</i> parameters are  <b>NULL</b>, all records are returned.</li>
     * </ul>
     * <ul>
     * <li>For simple enumeration tasks, use the <b>PeerGraphEnumRecords</b> function, because it is more efficient than the  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphsearchrecords">PeerGraphSearchRecords</a> function. For complex enumeration and filtering tasks such as heuristic searches of the database,  use the <b>PeerGraphSearchRecords</b> function. </li>
     * </ul>
     * <ul>
     * <li>When <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphgetnextitem">PeerGraphGetNextItem</a> is called with the handle that   <b>PeerGraphEnumRecords</b>  returns, <b>PeerGraphGetNextItem</b>  returns the data in the  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_record">PEER_RECORD</a> structure.</li>
     * </ul>
     * @param {Pointer<Void>} hGraph Handle to a peer graph.
     * @param {Pointer<Guid>} pRecordType Pointer to the type of record to enumerate. Specify <b>NULL</b> to enumerate   all record types.
     * @param {PWSTR} pwzPeerId Pointer to a string that identifies the creator that an application is requesting an enumeration for. Specify <b>NULL</b> to enumerate   all records.
     * @returns {Pointer<Void>} Receives a handle to an enumeration. Supply the handle to all calls to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphgetnextitem">PeerGraphGetNextItem</a>. When a handle is not needed, free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphendenumeration">PeerGraphEndEnumeration</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphenumrecords
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphEnumRecords(hGraph, pRecordType, pwzPeerId) {
        pwzPeerId := pwzPeerId is String ? StrPtr(pwzPeerId) : pwzPeerId

        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphEnumRecords", hGraphMarshal, hGraph, "ptr", pRecordType, "ptr", pwzPeerId, "ptr*", &phPeerEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEnum
    }

    /**
     * The PeerGraphSearchRecords function searches the peer graph for specific records.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphenumrecords">PeerGraphEnumRecords</a> function is more efficient than the  <b>PeerGraphSearchRecords</b> function.
     * 
     * When <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphgetnextitem">PeerGraphGetNextItem</a> is called with the handle returned by  <b>PeerGraphSearchRecords</b>, <b>PeerGraphGetNextItem</b>  returns the data in the  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_record">PEER_RECORD</a> structure.
     * @param {Pointer<Void>} hGraph Handle to the peer graph.
     * @param {PWSTR} pwzCriteria Pointer to an XML string that specifies the records to search for. For information on formulating an XML query string to search the peer graphing records, see <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/record-search-query-format">Record Search Query Format</a>.
     * @returns {Pointer<Void>} Handle to the enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphsearchrecords
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphSearchRecords(hGraph, pwzCriteria) {
        pwzCriteria := pwzCriteria is String ? StrPtr(pwzCriteria) : pwzCriteria

        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphSearchRecords", hGraphMarshal, hGraph, "ptr", pwzCriteria, "ptr*", &phPeerEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEnum
    }

    /**
     * The PeerGraphExportDatabase function exports a peer graph database into a file that you can move to a different computer. By using PeerGraphImportDatabase, a peer graph database can be imported to a different computer.
     * @remarks
     * If the export of a database fails because of file creation errors, a standard WinErr.h file error  is returned.
     * @param {Pointer<Void>} hGraph Handle to a peer graph.
     * @param {PWSTR} pwzFilePath Pointer to a string that contains the file path  to store exported data. If a data storage file  exists and contains  data when new data is exported to it, then the new data overwrites the old data.
     * @returns {HRESULT} If the function call succeeds, the return value is <b>S_OK</b>. Otherwise, it  returns either an error located in WinErr.h, or  one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One parameter is not valid.
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
     * There is not enough memory to perform a specified operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to a graph is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A graph must be  initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphexportdatabase
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphExportDatabase(hGraph, pwzFilePath) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphExportDatabase", hGraphMarshal, hGraph, "ptr", pwzFilePath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphImportDatabase function imports a file that contains the information from a peer graph database. This function can only be called if the application has not yet called the PeerGraphListen or PeerGraphConnect function.
     * @remarks
     * The <b>PeerGraphImportDatabase</b> function cannot be used to import a database from a different peer graph. <b>PeerGraphImportDatabase</b> must be called after <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphopen">PeerGraphOpen</a>, not after <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphcreate">PeerGraphCreate</a>.
     * 
     * The database being imported must have the same peer graph ID and peer ID.
     * @param {Pointer<Void>} hGraph Handle to the peer graph.
     * @param {PWSTR} pwzFilePath Pointer to a string that contains the path to the file in which the imported data is stored.
     * @returns {HRESULT} If the function call succeeds, the return value is S_OK. Otherwise, it  returns either one of the WinErr.h values or one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_GRAPH_IN_USE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graph is currently being used, and cannot be imported. Either <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphlisten">PeerGraphListen</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphconnect">PeerGraphConnect</a> has been called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_DATABASE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified database is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the peer graph is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graph must be  initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphimportdatabase
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphImportDatabase(hGraph, pwzFilePath) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphImportDatabase", hGraphMarshal, hGraph, "ptr", pwzFilePath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphValidateDeferredRecords function indicates to the Peer Graphing Infrastructure that it is time to resubmit any deferred records for the security module to validate.
     * @remarks
     * When a new record comes to the computer from its  neighbor in the peer graph, the Peer Graphing Infrastructure  attempts to validate the record by calling  the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nc-p2p-pfnpeer_validate_record">PFNPEER_VALIDATE_RECORD</a> callback, specified in the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_security_interface">PEER_SECURITY_INTERFACE</a> structure during a call to either <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphcreate">PeerGraphCreate</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphopen">PeerGraphOpen</a>.  If the security module does not  have all the information necessary to validate the record, it returns the  PEER_E_DEFERRED_VALIDATION error.  Once the security module obtains enough information, it must then validate the records using <b>PeerGraphValidateDeferredRecords</b>. When this function is called, the Peer Graphing Infrastructure calls <i>PFNPEER_VALIDATE_RECORD</i> to validate the records with IDs in <i>pRecordIds</i>.
     * @param {Pointer<Void>} hGraph Handle to the peer graph.
     * @param {Integer} cRecordIds Specifies the number  of records specified in <i>pRecordIds</i>.  Specify zero (0) to instruct the Graphing infrastructure to validate all deferred records. If zero (0) is specified, <i>pRecordIds</i> is ignored.
     * @param {Pointer<Guid>} pRecordIds Pointer to  an array of record IDs to validate.
     * @returns {HRESULT} If the function call succeeds, the return value is <b>S_OK</b>. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
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
     * There is not enough memory to perform the specified operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the peer graph is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer graph must be  initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphvalidatedeferredrecords
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphValidateDeferredRecords(hGraph, cRecordIds, pRecordIds) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphValidateDeferredRecords", hGraphMarshal, hGraph, "uint", cRecordIds, "ptr", pRecordIds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphOpenDirectConnection function allows an application to establish a direct connection with a node in a peer graph.
     * @remarks
     * A call to <b>PeerGraphOpenDirectConnection</b> is an asynchronous call.  A <b>PEER_GRAPH_EVENT_DIRECT_CONNECTION</b> event is triggered to inform the application of the direct connection's success or failure. The actual status of the function's success or failure is given in the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_graph_event_data">PEER_GRAPH_EVENT_DATA</a> structure.
     * @param {Pointer<Void>} hGraph Handle to a peer graph.
     * @param {PWSTR} pwzPeerId Pointer to  the unique ID of a user or node to connect to. This parameter is used to identify a specific user because multiple identities can be attached to the specified address.
     * @param {Pointer<PEER_ADDRESS>} pAddress Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_address">PEER_ADDRESS</a> structure that contains the address of the node to  connect to.
     * @returns {Integer} Receives the connection ID for the requested connection.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphopendirectconnection
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphOpenDirectConnection(hGraph, pwzPeerId, pAddress) {
        pwzPeerId := pwzPeerId is String ? StrPtr(pwzPeerId) : pwzPeerId

        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphOpenDirectConnection", hGraphMarshal, hGraph, "ptr", pwzPeerId, "ptr", pAddress, "uint*", &pullConnectionId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pullConnectionId
    }

    /**
     * The PeerGraphSendData function sends data to a neighbor node or a directly connected node.
     * @remarks
     * The <b>PeerGraphSendData</b> function returns as soon as data has been sent to the network layer; the peer graphing layer does not wait for an acknowledgment from the other side of the connection.
     * 
     * <div class="alert"><b>Note</b>  In order to be able to receive data with a direct connection, an application must register for a peer event of type <b>PEER_GRAPH_EVENT_INCOMING_DATA</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphregisterevent">PeerGraphRegisterEvent</a>.</div>
     * <div> </div>
     * @param {Pointer<Void>} hGraph Handle to the peer graph.
     * @param {Integer} ullConnectionId Specifies the unique ID of  the connection to send data on.
     * @param {Pointer<Guid>} pType Specifies an application-defined data type to send. 	This parameter cannot be <b>NULL</b>.
     * @param {Integer} cbData Specifies the number of bytes pointed to by <i>pvData</i>.
     * @param {Pointer} pvData Pointer to the  data to send.
     * @returns {HRESULT} Returns S_OK  if the operation succeeds; otherwise, the function returns one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_CONNECTION_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No connection with the given ID exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the peer graph is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graph must be  initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphsenddata
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphSendData(hGraph, ullConnectionId, pType, cbData, pvData) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphSendData", hGraphMarshal, hGraph, "uint", ullConnectionId, "ptr", pType, "uint", cbData, "ptr", pvData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphCloseDirectConnection function closes a specified direct connection.
     * @param {Pointer<Void>} hGraph Handle to a peer graph.
     * @param {Integer} ullConnectionId Specifies the connection ID to disconnect from.
     * @returns {HRESULT} If the function call succeeds, the return value is <b>S_OK</b>. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_CONNECTION_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No connection with the specified ID exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to a peer graph is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graph must be  initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphclosedirectconnection
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphCloseDirectConnection(hGraph, ullConnectionId) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphCloseDirectConnection", hGraphMarshal, hGraph, "uint", ullConnectionId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphEnumConnections function creates and returns an enumeration handle used to enumerate the connections of a local node.
     * @remarks
     * When <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphgetnextitem">PeerGraphGetNextItem</a> is called with the enumeration handle returned by <b>PeerGraphEnumConnections</b>, <b>PeerGraphGetNextItem</b> returns a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_connection_info">PEER_CONNECTION_INFO</a> structure.
     * @param {Pointer<Void>} hGraph Handle to a peer graph.
     * @param {Integer} dwFlags The  type of connection to enumerate. This parameter is required. Valid values are specified by <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_connection_flags">PEER_CONNECTION_FLAGS</a>.
     * @returns {Pointer<Void>} Receives a handle to an  enumeration.  Use <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphgetnextitem">PeerGraphGetNextItem</a> to retrieve the actual connection information. When this handle is not required, free it by calling  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphendenumeration">PeerGraphEndEnumeration</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphenumconnections
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphEnumConnections(hGraph, dwFlags) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphEnumConnections", hGraphMarshal, hGraph, "uint", dwFlags, "ptr*", &phPeerEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEnum
    }

    /**
     * The PeerGraphEnumNodes function creates and returns an enumeration handle used to enumerate the nodes in a peer graph.
     * @remarks
     * If <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphgetnextitem">PeerGraphGetNextItem</a> is called with the handle that   <b>PeerGraphEnumNodes</b> returns, then <b>PeerGraphGetNextItem</b>  returns the data in the  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_node_info">PEER_NODE_INFO</a> structure.
     * @param {Pointer<Void>} hGraph Handle to  a  peer graph.
     * @param {PWSTR} pwzPeerId The peer ID   to obtain a node enumeration.	Specify <b>NULL</b> to return all nodes in  a peer graph.
     * @returns {Pointer<Void>} Receives a handle to an enumeration.  Use <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphgetnextitem">PeerGraphGetNextItem</a> to retrieve the actual node information. When this handle is not needed, free it by calling  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphendenumeration">PeerGraphEndEnumeration</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphenumnodes
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphEnumNodes(hGraph, pwzPeerId) {
        pwzPeerId := pwzPeerId is String ? StrPtr(pwzPeerId) : pwzPeerId

        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphEnumNodes", hGraphMarshal, hGraph, "ptr", pwzPeerId, "ptr*", &phPeerEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEnum
    }

    /**
     * The PeerGraphSetPresence function explicitly turns on or off the publication of presence records for a specific node.
     * @remarks
     * If presence information has not been explicitly published by the peer graph,  the nodes are not visible when a peer graph is enumerated.
     * @param {Pointer<Void>} hGraph Handle to a peer graph.
     * @param {BOOL} fPresent Specify <b>TRUE</b> to force the Peer Graphing Infrastructure to publish a presence record for this node, which overrides the setting specified by the <b>cPresenceMax</b> in <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_graph_properties">PEER_GRAPH_PROPERTIES</a>. Specify <b>FALSE</b> to return the node to the default behavior specified in the peer graph properties.
     * 
     * <div class="alert"><b>Note</b>  Depending on the peer graphing presence policy, setting <i>fPresent</i> to <b>FALSE</b> does not guarantee that a peer's presence information is removed. It means that a peer's presence is not published anymore.</div>
     * <div> </div>
     * @returns {HRESULT} If the function call succeeds, the return value is <b>S_OK</b>. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the peer graph is invalid. The presence information cannot be published.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer graph must be  initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphsetpresence
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphSetPresence(hGraph, fPresent) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphSetPresence", hGraphMarshal, hGraph, "int", fPresent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphGetNodeInfo function retrieves information about a specific node.
     * @remarks
     * There can be several nodes of a graph on a computer. For example, multiple users may have joined the graph on a specific computer, so the information that <b>PeerGraphGetNodeInfo</b> returns is    about each node—not each computer.
     * @param {Pointer<Void>} hGraph Handle to a peer graph.
     * @param {Integer} ullNodeId Specifies  the ID of a node   that an application receives  information about. Specify zero (0) to  retrieve information about the local node.
     * @returns {Pointer<PEER_NODE_INFO>} Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_node_info">PEER_NODE_INFO</a> structure that contains the requested information. When the handle is not needed, free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphfreedata">PeerGraphFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphgetnodeinfo
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphGetNodeInfo(hGraph, ullNodeId) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphGetNodeInfo", hGraphMarshal, hGraph, "uint", ullNodeId, "ptr*", &ppNodeInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppNodeInfo
    }

    /**
     * The PeerGraphSetNodeAttributes function sets the attributes of the PEER_NODE_INFO structure for the local node.
     * @remarks
     * To retrieve attributes for a node, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphgetnodeinfo">PeerGraphGetNodeInfo</a>.
     * @param {Pointer<Void>} hGraph Handle to the peer graph.
     * @param {PWSTR} pwzAttributes Pointer to  a string that represents the attributes the application associates with the local node. This string is a free-form text string that is specific to the application. Specify <b>NULL</b> to delete all attributes for the specified node.
     * @returns {HRESULT} If the function call succeeds, the return value is S_OK. Otherwise, it  returns one of the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
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
     * There is not enough memory to perform the specified operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the peer graph is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer graph must be  initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphsetnodeattributes
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphSetNodeAttributes(hGraph, pwzAttributes) {
        pwzAttributes := pwzAttributes is String ? StrPtr(pwzAttributes) : pwzAttributes

        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphSetNodeAttributes", hGraphMarshal, hGraph, "ptr", pwzAttributes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphPeerTimeToUniversalTime function converts the peer graph-maintained reference time value to a localized time value appropriate for display on the peer's computer.
     * @remarks
     * <i>Universal time</i> is the UTC time derived from the peer's system clock.
     * 
     * <i>Peer time</i> is a common reference time maintained by the peer graph, expressed as Greenwich Mean Time.
     * 
     * Peer time should be  converted to universal time whenever it is necessary to display this value on the peer's computer, such as when displaying the creation time of a record. Likewise, time-sensitive actions, such as setting the expiration time for a record or searching for records based on modification time, should use time values converted from the computer-specific universal time to graph-specific peer time.
     * 
     * Universal time can be converted to peer time by calling the converse function <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphuniversaltimetopeertime">PeerGraphUniversalTimeToPeerTime</a>.
     * @param {Pointer<Void>} hGraph Handle to the  peer graph this peer participates in. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphcreate">PeerGraphCreate</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphopen">PeerGraphOpen</a> function.
     * @param {Pointer<FILETIME>} pftPeerTime Pointer to the peer time (UTC)  value, represented as a <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/graphing-reference-links">FILETIME</a> structure.
     * @param {Pointer<FILETIME>} pftUniversalTime Pointer to the returned universal time value, represented as a <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/graphing-reference-links">FILETIME</a> structure.
     * @returns {HRESULT} Returns S_OK if the function succeeds; otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the graph is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graph must be  initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphpeertimetouniversaltime
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphPeerTimeToUniversalTime(hGraph, pftPeerTime, pftUniversalTime) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphPeerTimeToUniversalTime", hGraphMarshal, hGraph, "ptr", pftPeerTime, "ptr", pftUniversalTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGraphUniversalTimeToPeerTime function converts a universal time value from the peer's computer to a common peer graph time value.
     * @remarks
     * <i>Universal time</i> is the UTC time derived from the peer's system clock.
     * 
     * <i>Peer time</i> is a common reference time maintained by the peer graph, expressed as Greenwich Mean Time.
     * 
     * Peer time should be  converted to universal time whenever it is necessary to display this value on the peer's computer, such as when displaying the creation time of a record. Likewise, time-sensitive actions, such as setting the expiration time for a record or searching for records based on modification time, should use time values converted from the computer-specific universal time to peer graph-specific peer time.
     * 
     * Peer time can be converted to universal time by calling the converse function <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphpeertimetouniversaltime">PeerGraphPeerTimeToUniversalTime</a>.
     * @param {Pointer<Void>} hGraph Handle to the  peer graph this peer participates in. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphcreate">PeerGraphCreate</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphopen">PeerGraphOpen</a> function.
     * @param {Pointer<FILETIME>} pftUniversalTime Pointer to the universal time value, represented as a <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/graphing-reference-links">FILETIME</a> structure.
     * @param {Pointer<FILETIME>} pftPeerTime Pointer to the returned peer time (UTC)  value, represented as a <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/graphing-reference-links">FILETIME</a> structure.
     * @returns {HRESULT} Returns S_OK if the function succeeds; otherwise, the function returns either one of the RPC errors or one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the peer graph is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The graph must be  initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphstartup">PeerGraphStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergraphuniversaltimetopeertime
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGraphUniversalTimeToPeerTime(hGraph, pftUniversalTime, pftPeerTime) {
        hGraphMarshal := hGraph is VarRef ? "ptr" : "ptr"

        result := DllCall("P2PGRAPH.dll\PeerGraphUniversalTimeToPeerTime", hGraphMarshal, hGraph, "ptr", pftUniversalTime, "ptr", pftPeerTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerFreeData function deallocates a block of data and returns it to the memory pool. Use the PeerFreeData function to free data that the Peer Identity Manager, Peer Grouping, and Peer Collaboration APIs return.
     * @remarks
     * Do not use this function to release memory that the Peer Graphing API returns. Use <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphfreedata">PeerGraphFreeData</a> for memory that  the Peer Graphing API returns.
     * @param {Pointer<Void>} pvData Pointer to a block of data to be deallocated. This parameter must reference a valid block of memory.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peerfreedata
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerFreeData(pvData) {
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        DllCall("P2P.dll\PeerFreeData", pvDataMarshal, pvData)
    }

    /**
     * The PeerGetItemCount function returns a count of the items in a peer enumeration.
     * @param {Pointer<Void>} hPeerEnum Handle to the peer enumeration on which a count is performed. A peer enumeration function generates this handle.
     * @returns {Integer} Returns the total number of items in a peer enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergetitemcount
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGetItemCount(hPeerEnum) {
        hPeerEnumMarshal := hPeerEnum is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGetItemCount", hPeerEnumMarshal, hPeerEnum, "uint*", &pCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCount
    }

    /**
     * The PeerGetNextItem function returns a specific number of items from a peer enumeration.
     * @remarks
     * The <b>PeerGetNextItem</b> function returns  the following: 
     * 
     * <ul>
     * <li>Items that are equal to or less than the amount specified in <i>pCount</i>.</li>
     * <li>A list of items that are less than the amount specified when the amount is greater than the number of items available.</li>
     * </ul>
     * <div class="alert"><b>Note</b>  For example, when the inbound value of <i>pCount</i> is 10 and the remainder of the enumeration is 5 items, only 5 items are returned and the value pointed to by <i>pCount</i> is set to 5.</div>
     * <div> </div>
     * All items returned must be freed by passing a pointer to the array of pointers  to the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a> function.
     * 
     * The end of an enumeration is indicated when the function returns with the <i>pCount</i> parameter set to zero (0).
     * @param {Pointer<Void>} hPeerEnum Handle to the peer enumeration from which items are retrieved. This handle is generated by a peer enumeration function.
     * @param {Pointer<Integer>} pCount Pointer to an integer that specifies the number of items to be retrieved from the peer enumeration. When returned, it contains the number of items in <i>ppvItems</i>. This parameter cannot be <b>NULL</b>.
     * @returns {Pointer<Pointer<Void>>} Receives a pointer to an array of pointers to the next <i>pCount</i> items in the peer enumeration. The  data, for example, a record or member information block, depends on the actual peer enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergetnextitem
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGetNextItem(hPeerEnum, pCount) {
        hPeerEnumMarshal := hPeerEnum is VarRef ? "ptr" : "ptr"
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := DllCall("P2P.dll\PeerGetNextItem", hPeerEnumMarshal, hPeerEnum, pCountMarshal, pCount, "ptr*", &pppvItems := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pppvItems
    }

    /**
     * The PeerEndEnumeration function releases an enumeration, for example, a record or member enumeration, and deallocates all resources associated with the enumeration.
     * @param {Pointer<Void>} hPeerEnum Handle to the enumeration to be released. This handle is generated by a peer enumeration function.
     * @returns {HRESULT} Returns <b>S_OK</b> if the operation succeeds. Otherwise, the function returns the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peerendenumeration
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerEndEnumeration(hPeerEnum) {
        hPeerEnumMarshal := hPeerEnum is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerEndEnumeration", hPeerEnumMarshal, hPeerEnum, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGroupStartup function initiates a peer group by using a requested version of the Peer infrastructure.
     * @remarks
     * The   <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/pnrp-namespace-provider-api">Peer Name Resolution Protocol (PNRP)</a> service must be started before calling this function.
     * 
     * This function is called by the application before calling any other Peer Grouping function.
     * 
     * For this release, applications should use <b>PEER_GROUP_VERSION</b> as the requested version.
     * 
     * A peer group started with this function is closed by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupshutdown">PeerGroupShutdown</a> when the application terminates.
     * @param {Integer} wVersionRequested Specifies the highest version of the Peer Infrastructure that a caller can support. The high order byte specifies the minor version (revision) number.  The low order byte specifies the major version number This parameter is required.
     * @param {Pointer<PEER_VERSION_DATA>} pVersionData Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_version_data">PEER_VERSION_DATA</a> structure that contains the specific level of support provided by the Peer Infrastructure. This parameter is required.
     * @returns {HRESULT} Returns <b>S_OK</b> if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_DEPENDENCY_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/pnrp-namespace-provider-api">Peer Name Resolution Protocol (PNRP)</a> service must be started before calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupstartup">PeerGroupStartup</a>.
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
     * There is not enough memory available to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_IPV6_NOT_INSTALLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The grouping service failed to start because IPv6 is not installed on the computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_UNSUPPORTED_VERSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested version is not supported by the installed Peer subsystem.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Cryptography-specific errors can be returned from the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/microsoft-base-cryptographic-provider">Microsoft RSA Base Provider</a>. These errors are prefixed with CRYPT_* and defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupstartup
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupStartup(wVersionRequested, pVersionData) {
        result := DllCall("P2P.dll\PeerGroupStartup", "ushort", wVersionRequested, "ptr", pVersionData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGroupShutdown function closes a peer group created with PeerGroupStartup and disposes of any allocated resources.
     * @returns {HRESULT} Returns <b>S_OK</b> if the operation succeeds. Otherwise, the function returns  the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function terminated unexpectedly.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Cryptography-specific errors can be returned from the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/microsoft-base-cryptographic-provider">Microsoft RSA Base Provider</a>. These errors are prefixed with CRYPT_* and defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupshutdown
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupShutdown() {
        result := DllCall("P2P.dll\PeerGroupShutdown", "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGroupCreate function creates a new peer group.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupconnect">PeerGroupConnect</a> must be called by the group creator immediately after creation. If this does not take place, users given an invitation will call PeerGroupConnect successfully but they will not be able to listen and will eventually receive the connection failed event. 
     * 
     * An application  obtains an identity by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peeridentitycreate">PeerIdentityCreate</a>, or any other method that returns an identity name string. This identity  serves as the owner of the group, and is the initial member of the peer group when created.
     * 
     * For applications that utilize passwords, it is recommended the passwords are handled securely  by calling the <a href="https://docs.microsoft.com/windows/desktop/api/dpapi/nf-dpapi-cryptprotectmemory">CryptoProtectMemory</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> functions.
     * @param {Pointer<PEER_GROUP_PROPERTIES>} pProperties Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_group_properties">PEER_GROUP_PROPERTIES</a> structure that specifies the specific details of the group, such as the peer group names, invitation lifetimes, and presence lifetimes. This parameter is required.
     * 
     * The following members must be set:<ul>
     * <li><b>pwzCreatorPeerName</b></li>
     * </ul>
     * 
     * 
     * The following members cannot be set:<ul>
     * <li><b>pwzGroupPeerName</b></li>
     * </ul>The remaining members are optional.
     * @returns {Pointer<Void>} Returns the  handle pointer to the  peer group. Any function called with this handle as a parameter  has the corresponding action performed on that peer group.  This parameter is required.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupcreate
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupCreate(pProperties) {
        result := DllCall("P2P.dll\PeerGroupCreate", "ptr", pProperties, "ptr*", &phGroup := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phGroup
    }

    /**
     * The PeerGroupOpen function opens a peer group that a peer has created or joined. After a peer group is opened, the peer can register for event notifications.
     * @remarks
     * Multiple applications can open the same group simultaneously. Any application can choose to open a group without subsequently calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupconnect">PeerGroupConnect</a>. These applications are considered to be offline. However, a second application can open and connect the peer to the group, which means that an application must be ready to connect at any time.
     * @param {PWSTR} pwzIdentity Pointer to a Unicode string that contains the identity  a peer  uses to open a group.  This parameter is required.
     * @param {PWSTR} pwzGroupPeerName Pointer to a Unicode string that contains the peer name of the peer group. This parameter is required.
     * @param {PWSTR} pwzCloud Pointer to a Unicode string that contains the name of the PNRP cloud in which the peer group is located. If the value is <b>NULL</b>,  the cloud specified in the peer group properties is used.
     * @returns {Pointer<Void>} Pointer to a handle for a  peer group. If this value is <b>NULL</b>, the open operation is unsuccessful. This parameter is required.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupopen
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupOpen(pwzIdentity, pwzGroupPeerName, pwzCloud) {
        pwzIdentity := pwzIdentity is String ? StrPtr(pwzIdentity) : pwzIdentity
        pwzGroupPeerName := pwzGroupPeerName is String ? StrPtr(pwzGroupPeerName) : pwzGroupPeerName
        pwzCloud := pwzCloud is String ? StrPtr(pwzCloud) : pwzCloud

        result := DllCall("P2P.dll\PeerGroupOpen", "ptr", pwzIdentity, "ptr", pwzGroupPeerName, "ptr", pwzCloud, "ptr*", &phGroup := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phGroup
    }

    /**
     * The PeerGroupJoin function prepares a peer with an invitation to join an existing peer group prior to calling PeerGroupConnect or PeerGroupConnectByAddress.
     * @param {PWSTR} pwzIdentity Pointer to a Unicode string that contains the identity opening the specified peer group. If this parameter is <b>NULL</b>, the implementation uses the identity obtained from <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peeridentitygetdefault">PeerIdentityGetDefault</a>.
     * @param {PWSTR} pwzInvitation Pointer to a Unicode string that contains the XML invitation granted by another peer. An invitation is created when the inviting peer calls <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreateinvitation">PeerGroupCreateInvitation</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupissuecredentials">PeerGroupIssueCredentials</a>. Specific details regarding this invitation can be obtained as a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_invitation_info">PEER_INVITATION_INFO</a> structure by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupparseinvitation">PeerGroupParseInvitation</a>. This parameter is required.
     * @param {PWSTR} pwzCloud Pointer to a Unicode string that contains the name of the PNRP cloud where a group is located.  The default value is <b>NULL</b>, which indicates that the cloud specified in the invitation must be used.
     * @returns {Pointer<Void>} Pointer to the handle of the peer group. To start communication with a group, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupconnect">PeerGroupConnect</a>. This parameter is required.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupjoin
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupJoin(pwzIdentity, pwzInvitation, pwzCloud) {
        pwzIdentity := pwzIdentity is String ? StrPtr(pwzIdentity) : pwzIdentity
        pwzInvitation := pwzInvitation is String ? StrPtr(pwzInvitation) : pwzInvitation
        pwzCloud := pwzCloud is String ? StrPtr(pwzCloud) : pwzCloud

        result := DllCall("P2P.dll\PeerGroupJoin", "ptr", pwzIdentity, "ptr", pwzInvitation, "ptr", pwzCloud, "ptr*", &phGroup := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phGroup
    }

    /**
     * Prepares a peer with an invitation and the correct password to join a password-protected peer group prior to calling PeerGroupConnect or PeerGroupConnectByAddress.
     * @remarks
     * In the event of a clock skew between participating machines, the initial <b>PeerGroupPasswordJoin</b> function may still succeed while the following call of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupconnect">PeerGroupConnect</a> can result in a failure to join depending on the severity of the skew.
     * @param {PWSTR} pwzIdentity Pointer to a Unicode string that contains the identity opening the specified peer group. If this parameter is <b>NULL</b>, the implementation uses the identity obtained from <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peeridentitygetdefault">PeerIdentityGetDefault</a>.
     * @param {PWSTR} pwzInvitation Pointer to a Unicode string that contains the XML invitation granted by another peer. An invitation with a password is created when the inviting peer calls <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreatepasswordinvitation">PeerGroupCreatePasswordInvitation</a>. Specific details regarding this invitation, including the password set by the group creator, can be obtained as a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_invitation_info">PEER_INVITATION_INFO</a> structure by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupparseinvitation">PeerGroupParseInvitation</a>. This parameter is required.
     * @param {PWSTR} pwzPassword Pointer to a zero-terminated Unicode string that contains the password required to validate and join the peer group. This password must match the password specified in the invitation. This parameter is required.
     * @param {PWSTR} pwzCloud Pointer to a Unicode string that contains the name of the PNRP cloud where a group is located.  The default value is <b>NULL</b>, which indicates that the cloud specified in the invitation must be used.
     * @returns {Pointer<Void>} Pointer to the handle of the peer group. To start communication with a group, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupconnect">PeerGroupConnect</a>. This parameter is required.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergrouppasswordjoin
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupPasswordJoin(pwzIdentity, pwzInvitation, pwzPassword, pwzCloud) {
        pwzIdentity := pwzIdentity is String ? StrPtr(pwzIdentity) : pwzIdentity
        pwzInvitation := pwzInvitation is String ? StrPtr(pwzInvitation) : pwzInvitation
        pwzPassword := pwzPassword is String ? StrPtr(pwzPassword) : pwzPassword
        pwzCloud := pwzCloud is String ? StrPtr(pwzCloud) : pwzCloud

        result := DllCall("P2P.dll\PeerGroupPasswordJoin", "ptr", pwzIdentity, "ptr", pwzInvitation, "ptr", pwzPassword, "ptr", pwzCloud, "ptr*", &phGroup := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phGroup
    }

    /**
     * The PeerGroupConnect function initiates a PNRP search for a peer group and attempts to connect to it. After this function is called successfully, a peer can communicate with other members of the peer group.
     * @remarks
     * An application  registers for peer events before calling this function. If the function call is unsuccessful, a PEER_GROUP_EVENT_CONNECTION_FAILED event is raised. Otherwise, a PEER_GROUP_EVENT_STATUS_CHANGED event is raised.
     * 
     * The PEER_GROUP_EVENT_CONNECTION_FAILED event is also raised when a group creator fails to call <b>PeerGroupConnect</b> immediately after creation. If this does not take place, users given an invitation will call <b>PeerGroupConnect</b> successfully but they will not be able to listen and will eventually receive the connection failed event.
     * 
     * In the event of a clock skew between participating machines, the success of <b>PeerGroupConnect</b> may depend on the severity of the skew. When troubleshooting a failure to join, this possibility should be taken into consideration by verifying that the machine clocks are synchronized.
     * 
     * To be present in the peer group and receive events but remain unconnected, use the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a> 
     * 	 function.
     * 
     * If a time-out value for <b>PeerGroupConnect</b> is not provided in the application, encountering a failure will cause the application to hang.  A time-out value  of 30 seconds is recommended.
     * 
     * Prior to calling <b>PeerGroupConnect</b>, a group exists in a '<b>Disconnected State</b>'. During this time the group cannot be detected or receive connections. In order  to return a group to this state, the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupclose">PeerGroupClose</a> function must be called.
     * @param {Pointer<Void>} hGroup Handle to the peer group  to which a peer intends to connect. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>,<a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergrouppasswordjoin">PeerGroupPasswordJoin</a> function. This parameter is required.
     * @returns {HRESULT} Returns S_OK if the operation succeeds. Otherwise, the function returns  the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GROUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the peer group is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Cryptography-specific errors can be returned from the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/microsoft-base-cryptographic-provider">Microsoft RSA Base Provider</a>. These errors are prefixed with CRYPT_* and defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupconnect
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupConnect(hGroup) {
        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupConnect", hGroupMarshal, hGroup, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Attempts to connect to the peer group that other peers with known IPv6 addresses are participating in.
     * @remarks
     * If  a time-out value for PeerGroupConnectByAddress is not provided in the application, encountering a failure will cause the application to hang.  A time-out value  of 30 seconds is recommended.
     * @param {Pointer<Void>} hGroup Handle to the peer group  to which a peer intends to connect. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>,<a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergrouppasswordjoin">PeerGroupPasswordJoin</a> function. This parameter is required.
     * @param {Integer} cAddresses The total number of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_address">PEER_ADDRESS</a> structures pointed to by <i>pAddresses</i>.
     * @param {Pointer<PEER_ADDRESS>} pAddresses Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_address">PEER_ADDRESS</a> structures that specify the endpoints of peers participating in the group.
     * @returns {HRESULT} Returns S_OK if the operation succeeds. Otherwise, the function returns  the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GROUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the peer group is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Cryptography-specific errors may be returned from the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/microsoft-base-cryptographic-provider">Microsoft RSA Base Provider</a>. These errors are prefixed with CRYPT_* and defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupconnectbyaddress
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupConnectByAddress(hGroup, cAddresses, pAddresses) {
        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupConnectByAddress", hGroupMarshal, hGroup, "uint", cAddresses, "ptr", pAddresses, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGroupClose function invalidates the peer group handle obtained by a previous call to the PeerGroupCreate, PeerGroupJoin, or PeerGroupOpen function.
     * @remarks
     * If the peer group handle closed is the last handle that refers to a peer group shared  across multiple applications or processes, the call  also closes the respective network connections  for the peer.
     * @param {Pointer<Void>} hGroup Handle to the peer group to close. This handle is returned by the  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @returns {HRESULT} Returns S_OK if the operation succeeds. Otherwise, the function returns the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GROUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the peer group is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Cryptography-specific errors can be returned from the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/microsoft-base-cryptographic-provider">Microsoft RSA Base Provider</a>. These errors are prefixed with CRYPT_* and defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupclose
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupClose(hGroup) {
        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupClose", hGroupMarshal, hGroup, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGroupDelete function deletes the local data and certificate associated with a peer group.
     * @remarks
     * If a peer group is deleted, all handles associated with that group immediately become invalid. As a best practice,  ensure that all handles for this group are closed before calling this function. Otherwise, this data is deleted from  all other running peer applications that use it, which can cause  errors and instability.
     * @param {PWSTR} pwzIdentity Pointer to a Unicode string that contains the identity opening the specified peer group. If this parameter is <b>NULL</b>, the implementation uses the identity obtained from <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peeridentitygetdefault">PeerIdentityGetDefault</a>.
     * @param {PWSTR} pwzGroupPeerName Pointer to a Unicode string that contains the peer name of the peer group for which data is deleted. This parameter is required. The group
     * 	name can be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupgetproperties">PeerGroupGetProperties</a>  prior to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupclose">PeerGroupClose</a>, or by parsing the invitation with
     * 	<a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupparseinvitation">PeerGroupParseInvitation</a>.
     * @returns {HRESULT} Returns S_OK  if the operation succeeds. Otherwise, the function returns one of the following values.
     * 
     * <div class="alert"><b>Note</b>  If a delete operation fails due to a file system error, the appropriate file system error is returned.</div>
     * <div> </div>
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access to the peer  group database is denied. Ensure that the peer has permission to perform this operation. In this case, the peer must be the original creator of the peer group.
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
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer group cannot be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NO_KEY_ACCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access to the identity or peer group keys is denied. Typically, this is  caused by an incorrect access control list (ACL) for the folder that contains the user or computer keys. This can happen when the ACL is  reset manually. 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Cryptography-specific errors can be returned from the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/microsoft-base-cryptographic-provider">Microsoft RSA Base Provider</a>. These errors are prefixed with CRYPT_* and defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupdelete
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupDelete(pwzIdentity, pwzGroupPeerName) {
        pwzIdentity := pwzIdentity is String ? StrPtr(pwzIdentity) : pwzIdentity
        pwzGroupPeerName := pwzGroupPeerName is String ? StrPtr(pwzGroupPeerName) : pwzGroupPeerName

        result := DllCall("P2P.dll\PeerGroupDelete", "ptr", pwzIdentity, "ptr", pwzGroupPeerName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGroupCreateInvitation function returns an XML string that can be used by the specified peer to join a group.
     * @remarks
     * Peers cannot create invitations for peers whose assumed role is superior to their own. For example, a peer in a member role cannot create an invitation for a peer in an administrator role.
     * @param {Pointer<Void>} hGroup Handle to the peer group for which this invitation is issued. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {PWSTR} pwzIdentityInfo Pointer to a Unicode string that contains the XML blob (including the GMC) returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peeridentitygetxml">PeerIdentityGetXML</a> with the identity of the peer. Alternatively, this parameter can contain a pointer to an XML blob generated by <b>PeerIdentityGetXML</b>  using the peer information contained in <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> to generate an invitation for a peer contact.
     * @param {Pointer<FILETIME>} pftExpiration Specifies a UTC <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/graphing-reference-links">FILETIME</a> structure that contains the specific date and time the invitation  expires. This value cannot be greater than the remaining lifetime of the issuing peer. If this parameter is <b>NULL</b>, the invitation lifetime is set to the maximum value possible - the remaining lifetime of the peer.
     * @param {Integer} cRoles Specifies the count of roles in  <i>pRoleInfo</i>.
     * @param {Pointer<Guid>} pRoles Pointer to a list of GUIDs that specifies the combined set of available roles. The available roles are as follows.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEER_GROUP_ROLE_ADMIN"></a><a id="peer_group_role_admin"></a><dl>
     * <dt><b>PEER_GROUP_ROLE_ADMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This role can issue invitations, issue credentials,   and renew the GMC of other administrators, as well as behave as a member of the peer group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEER_GROUP_ROLE_MEMBER"></a><a id="peer_group_role_member"></a><dl>
     * <dt><b>PEER_GROUP_ROLE_MEMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This role can publish records to the group database.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {PWSTR} Pointer to a Unicode string that contains the invitation from the issuer. This invitation can be passed to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> by the recipient in order to join the specified peer group. To return the details of the invitation as a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_invitation_info">PEER_INVITATION_INFO</a> structure, pass this string to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupparseinvitation">PeerGroupParseInvitation</a>. To release this data, pass this pointer to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupcreateinvitation
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupCreateInvitation(hGroup, pwzIdentityInfo, pftExpiration, cRoles, pRoles) {
        pwzIdentityInfo := pwzIdentityInfo is String ? StrPtr(pwzIdentityInfo) : pwzIdentityInfo

        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupCreateInvitation", hGroupMarshal, hGroup, "ptr", pwzIdentityInfo, "ptr", pftExpiration, "uint", cRoles, "ptr", pRoles, "ptr*", &ppwzInvitation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwzInvitation
    }

    /**
     * Returns an XML string that can be used by the specified peer to join a group with a matching password.
     * @param {Pointer<Void>} hGroup Handle to the peer group for which this invitation is issued. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @returns {PWSTR} Pointer to a Unicode string that contains the invitation from the issuer. This invitation can be passed to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergrouppasswordjoin">PeerGroupPasswordJoin</a> by the recipient in order to join the specified peer group. To return the details of the invitation as a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_invitation_info">PEER_INVITATION_INFO</a> structure, pass this string to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupparseinvitation">PeerGroupParseInvitation</a>. To release this data, pass this pointer to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * 
     * This function requires that the following fields are set on the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_group_properties">PEER_GROUP_PROPERTIES</a> structure passed to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>.<ul>
     * <li><b>pwzGroupPassword</b>. This field must contain the password used to validate peers joining the peer group.</li>
     * <li><b>groupPasswordRole</b>. This field must containing the GUID of the role (administrator or peer) for which the password is required.</li>
     * <li><b>dwAuthenticationSchemes</b>. This field must have the <b>PEER_GROUP_PASSWORD_AUTHENTICATION</b> flag (0x00000001) set on it.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupcreatepasswordinvitation
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupCreatePasswordInvitation(hGroup) {
        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupCreatePasswordInvitation", hGroupMarshal, hGroup, "ptr*", &ppwzInvitation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwzInvitation
    }

    /**
     * The PeerGroupParseInvitation function returns a PEER_INVITATION_INFO structure with the details of a specific invitation.
     * @param {PWSTR} pwzInvitation Pointer to a Unicode string that contains the specific peer group invitation. This parameter is required.
     * @returns {Pointer<PEER_INVITATION_INFO>} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_invitation_info">PEER_INVITATION_INFO</a> structure with the details of a specific invitation. To release the resources used by this structure, pass this pointer to  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>. This parameter is required.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupparseinvitation
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupParseInvitation(pwzInvitation) {
        pwzInvitation := pwzInvitation is String ? StrPtr(pwzInvitation) : pwzInvitation

        result := DllCall("P2P.dll\PeerGroupParseInvitation", "ptr", pwzInvitation, "ptr*", &ppInvitationInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppInvitationInfo
    }

    /**
     * The PeerGroupGetStatus function retrieves the current status of a group.
     * @param {Pointer<Void>} hGroup Handle to a peer group whose status is returned. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @returns {Integer} Pointer to a set of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_group_status">PEER_GROUP_STATUS</a> flags that describe the status of a peer group.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupgetstatus
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupGetStatus(hGroup) {
        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupGetStatus", hGroupMarshal, hGroup, "uint*", &pdwStatus := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwStatus
    }

    /**
     * The PeerGroupGetProperties function retrieves information on the properties of a specified group.
     * @remarks
     * Group properties cannot be retrieved if a peer has not synchronized with a peer group database. To synchronize with a peer group database before calling this function, first call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupconnect">PeerGroupConnect</a>.
     * @param {Pointer<Void>} hGroup Handle to a peer group whose properties are retrieved. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @returns {Pointer<PEER_GROUP_PROPERTIES>} Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_group_properties">PEER_GROUP_PROPERTIES</a> structure that contains information about peer   group properties. This data must be freed with <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>. This parameter is required.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupgetproperties
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupGetProperties(hGroup) {
        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupGetProperties", hGroupMarshal, hGroup, "ptr*", &ppProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppProperties
    }

    /**
     * The PeerGroupSetProperties function sets the current peer group properties. In version 1.0 of this API, only the creator of the peer group can perform this operation.
     * @remarks
     * For applications that utilize passwords, it is recommended the passwords are handled securely  by calling the <a href="https://docs.microsoft.com/windows/desktop/api/dpapi/nf-dpapi-cryptprotectmemory">CryptoProtectMemory</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> functions.
     * @param {Pointer<Void>} hGroup Handle to the peer group whose properties are set by a peer. This handle is returned by the  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {Pointer<PEER_GROUP_PROPERTIES>} pProperties Pointer to a peer-populated <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_group_properties">PEER_GROUP_PROPERTIES</a> 
     * 	   structure that contains the new properties. To obtain this structure, a peer must first call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupgetproperties">PeerGroupGetProperties</a>, change the appropriate fields, and then pass it as this parameter. This parameter is required.
     * 
     * The following members of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_group_properties">PEER_GROUP_PROPERTIES</a> cannot be changed:<ul>
     * <li><b>dwSize</b></li>
     * <li><b>pwzCloud</b></li>
     * <li><b>pwzClassifier</b></li>
     * <li><b>pwzGroupPeerName</b></li>
     * <li><b>pwzCreatorPeerName</b></li>
     * </ul>
     * @returns {HRESULT} Returns <b>S_OK</b>  if the operation succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory available to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_GROUP_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group is not in a state where peer group properties can be set. For example, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> has been called, but synchronization with the peer group database is not complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GROUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the peer group is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GROUP_PROPERTIES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the specified properties is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_AUTHORIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current identity does not have the authorization to change these properties. In this case, the identity is not the  creator of the peer group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_PASSWORD_DOES_NOT_MEET_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *   Password specified does not meet system password requirements.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Cryptography-specific errors can be returned from the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/microsoft-base-cryptographic-provider">Microsoft RSA Base Provider</a>. These errors are prefixed with CRYPT_* and defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupsetproperties
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupSetProperties(hGroup, pProperties) {
        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupSetProperties", hGroupMarshal, hGroup, "ptr", pProperties, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGroupEnumMembers function creates an enumeration of available peer group members and the associated membership information.
     * @remarks
     * The local node is always the very first item in the enumeration if <i>pwzIdentity</i> is <b>NULL</b>, and <i>dwFlags</i> is set to indicate that the local node is a member of the explicit subset.
     * 
     * By default, every member publishes membership information to the peer group. If <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_group_property_flags">PEER_MEMBER_DATA_OPTIONAL</a> is set on the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_member">PEER_MEMBER</a> data for that peer, this information is only  available when a peer performs an action within the group, for example, publishing a record, updating presence, or issuing a GMC.
     * @param {Pointer<Void>} hGroup Handle to the peer group whose members are enumerated. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {Integer} dwFlags Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_member_flags">PEER_MEMBER_FLAGS</a> flags that indicate which types of members to include in the enumeration. If this value is set to zero, all members of the peer group are included.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEER_MEMBER_PRESENT"></a><a id="peer_member_present"></a><dl>
     * <dt><b>PEER_MEMBER_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerate all members of the current peer group that are online.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} pwzIdentity Unicode string that contains the identity of a specific peer whose information is  retrieved and returned in a one-item enumeration. If this parameter is <b>NULL</b>, all members of the current peer group are retrieved. This parameter is required.
     * @returns {Pointer<Void>} Pointer to the enumeration that contains the returned list of peer group members. This handle is passed to  
     * 	 <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a> to retrieve the items, with each item represented as a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_member">PEER_MEMBER</a> structure. When finished, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerendenumeration">PeerEndEnumeration</a> is called to return the memory used by the enumeration. This parameter is required.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupenummembers
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupEnumMembers(hGroup, dwFlags, pwzIdentity) {
        pwzIdentity := pwzIdentity is String ? StrPtr(pwzIdentity) : pwzIdentity

        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupEnumMembers", hGroupMarshal, hGroup, "uint", dwFlags, "ptr", pwzIdentity, "ptr*", &phPeerEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEnum
    }

    /**
     * The PeerGroupOpenDirectConnection function establishes a direct connection with another peer in a peer group.
     * @remarks
     * Every direct connection opened with this function must be closed with [PEER_GROUP_EVENT DATA](/windows/win32/api/p2p/ns-p2p-peer_group_event_data-r1) structure has the  <b>status</b> member of its component <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_event_connection_change_data">PEER_EVENT_CONNECTION_CHANGE_DATA</a> structure set to PEER_CONNECTION_FAILED.
     * @param {Pointer<Void>} hGroup Handle to the peer group that hosts the direct connection. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {PWSTR} pwzIdentity Pointer to a Unicode string that contains the identity   a peer  connects to. This parameter is required.
     * @param {Pointer<PEER_ADDRESS>} pAddress Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_address">PEER_ADDRESS</a> structure that contains the IPv6 address   the peer  connects to. This parameter is required.
     * @returns {Integer} Unsigned 64-bit integer that identifies the direct connection. This ID value cannot be assumed as valid until the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_group_event_type">PEER_GROUP_EVENT_DIRECT_CONNECTION</a> event is raised and indicates that the connection has been accepted by the other peer. This parameter is required.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupopendirectconnection
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupOpenDirectConnection(hGroup, pwzIdentity, pAddress) {
        pwzIdentity := pwzIdentity is String ? StrPtr(pwzIdentity) : pwzIdentity

        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupOpenDirectConnection", hGroupMarshal, hGroup, "ptr", pwzIdentity, "ptr", pAddress, "uint*", &pullConnectionId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pullConnectionId
    }

    /**
     * The PeerGroupCloseDirectConnection function closes a specific direct connection between two peers.
     * @param {Pointer<Void>} hGroup Handle to the peer group that contains the peers involved in the direct connection. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {Integer} ullConnectionId Specifies the connection ID  to disconnect from. This parameter is required and has no default value.
     * @returns {HRESULT} Returns S_OK if the operation succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_CONNECTION_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A direct connection that matches the supplied connection ID cannot be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GROUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the peer group is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Cryptography-specific errors can be returned from the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/microsoft-base-cryptographic-provider">Microsoft RSA Base Provider</a>. These errors are prefixed with CRYPT_* and defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupclosedirectconnection
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupCloseDirectConnection(hGroup, ullConnectionId) {
        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupCloseDirectConnection", hGroupMarshal, hGroup, "uint", ullConnectionId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGroupEnumConnections function creates an enumeration of connections currently active on the peer.
     * @param {Pointer<Void>} hGroup Handle to the group that contains the connections to be enumerated. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {Integer} dwFlags Specifies the flags that indicate the type of connection to enumerate. Valid values are specified by <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_connection_flags">PEER_CONNECTION_FLAGS</a>.
     * @returns {Pointer<Void>} Pointer to the enumeration that contains the returned list of active connections. This handle is passed to  
     * 	 <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a> to retrieve the items, with each item represented as a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_connection_info">PEER_CONNECTION_INFO</a> structure. When finished, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerendenumeration">PeerEndEnumeration</a> is called to return the memory used by the enumeration. This parameter is required.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupenumconnections
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupEnumConnections(hGroup, dwFlags) {
        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupEnumConnections", hGroupMarshal, hGroup, "uint", dwFlags, "ptr*", &phPeerEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEnum
    }

    /**
     * The PeerGroupSendData function sends data to a member over a neighbor or direct connection.
     * @remarks
     * To receive data, the receiving peer must have registered for the <b>PEER_GROUP_EVENT_INCOMING_DATA</b> peer event.
     * @param {Pointer<Void>} hGroup Handle to the group that contains both members of a connection. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {Integer} ullConnectionId Unsigned 64-bit integer that contains the ID of the connection that  hosts the data transmission. A connection ID is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopendirectconnection">PeerGroupOpenDirectConnection</a>. This parameter is required.
     * @param {Pointer<Guid>} pType Pointer to a <b>GUID</b> value that uniquely identifies the data being transmitted. This parameter is required.
     * @param {Integer} cbData Specifies the size of  the data in <i>pvData</i>, in bytes. This parameter is required.
     * @param {Pointer} pvData Pointer to the block of data to send. The receiving application is responsible for parsing this data. This parameter is required.
     * @returns {HRESULT} Returns <b>S_OK</b>  if the operation succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_CONNECTION_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A connection with the ID specified in <i>ullConnectionId</i>  cannot be found.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Cryptography-specific errors can be returned from the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/microsoft-base-cryptographic-provider">Microsoft RSA Base Provider</a>. These errors are prefixed with CRYPT_* and defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupsenddata
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupSendData(hGroup, ullConnectionId, pType, cbData, pvData) {
        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupSendData", hGroupMarshal, hGroup, "uint", ullConnectionId, "ptr", pType, "uint", cbData, "ptr", pvData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGroupRegisterEvent function registers a peer for specific peer group events.
     * @remarks
     * Before you close the HPEEREVENT handle, you must unregister for the peer event  types by passing the handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupunregisterevent">PeerGroupUnregisterEvent</a>.
     * @param {Pointer<Void>} hGroup Handle of the peer group on which to monitor the specific peer events. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {HANDLE} hEvent Pointer to a Windows  event handle, which is signaled when a peer event is fired. When this handle is signaled, the peer should call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupgeteventdata">PeerGroupGetEventData</a> until the function returns <b>PEER_S_NO_EVENT_DATA</b>.  This parameter is required.
     * @param {Integer} cEventRegistration Contains the number of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_group_event_registration">PEER_GROUP_EVENT_REGISTRATION</a> structures listed in <i>pEventRegistrations</i>. This parameter is required.
     * @param {Pointer<PEER_GROUP_EVENT_REGISTRATION>} pEventRegistrations Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_group_event_registration">PEER_GROUP_EVENT_REGISTRATION</a> 
     * 		 structures that contains the peer event types for which registration  occurs. This parameter is required.
     * @returns {Pointer<Void>} Pointer to the returned HPEEREVENT handle. A peer can unregister for this peer event by passing this handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupunregisterevent">PeerGroupUnregisterEvent</a>. This parameter is required.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupregisterevent
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupRegisterEvent(hGroup, hEvent, cEventRegistration, pEventRegistrations) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupRegisterEvent", hGroupMarshal, hGroup, "ptr", hEvent, "uint", cEventRegistration, "ptr", pEventRegistrations, "ptr*", &phPeerEvent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEvent
    }

    /**
     * The PeerGroupUnregisterEvent function unregisters a peer from notification of peer events associated with the supplied event handle.
     * @remarks
     * This function must be called before the HPEEREVENT handle is closed.
     * @param {Pointer<Void>} hPeerEvent Handle returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupregisterevent">PeerGroupRegisterEvent</a>.  This parameter is required.
     * @returns {HRESULT} Returns <b>S_OK</b>  if the operation succeeds. Otherwise, the function returns  the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Cryptography-specific errors can be returned from the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/microsoft-base-cryptographic-provider">Microsoft RSA Base Provider</a>. These errors are prefixed with CRYPT_* and defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupunregisterevent
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupUnregisterEvent(hPeerEvent) {
        hPeerEventMarshal := hPeerEvent is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupUnregisterEvent", hPeerEventMarshal, hPeerEvent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGroupGetEventData function allows an application to retrieve the data returned by a grouping event.
     * @remarks
     * When an event occurs for which a peer has requested notification, the corresponding peer event handle is signaled. The peer  calls this method until [PEER_GROUP_EVENT_DATA](/windows/win32/api/p2p/ns-p2p-peer_group_event_data-r1) structures are retrieved. Each data structure contains the following two key pieces of data: 
     * 
     * <ul>
     * <li>The registration associated with a peer event.</li>
     * <li>The actual data for a peer event.</li>
     * </ul>
     * @param {Pointer<Void>} hPeerEvent Handle obtained from a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupregisterevent">PeerGroupRegisterEvent</a>. This parameter is required.
     * @returns {Pointer<PEER_GROUP_EVENT_DATA>} Pointer to a [PEER_GROUP_EVENT_DATA](/windows/win32/api/p2p/ns-p2p-peer_group_event_data-r1) structure that contains data about the peer event. This data structure must be freed after use with <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>. This parameter is required.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupgeteventdata
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupGetEventData(hPeerEvent) {
        hPeerEventMarshal := hPeerEvent is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupGetEventData", hPeerEventMarshal, hPeerEvent, "ptr*", &ppEventData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppEventData
    }

    /**
     * The PeerGroupGetRecord function retrieves a specific group record.
     * @param {Pointer<Void>} hGroup Handle to a group that contains a specific record. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {Pointer<Guid>} pRecordId Specifies the GUID value that uniquely identifies a required record within a peer group. This parameter is required.
     * @returns {Pointer<PEER_RECORD>} Pointer to the address of a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_record">PEER_RECORD</a> structure that contains a returned record. This structure is freed by passing its pointer to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>. This parameter is required.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupgetrecord
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupGetRecord(hGroup, pRecordId) {
        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupGetRecord", hGroupMarshal, hGroup, "ptr", pRecordId, "ptr*", &ppRecord := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppRecord
    }

    /**
     * The PeerGroupAddRecord function adds a new record to the peer group, which is propagated to all participating peers.
     * @param {Pointer<Void>} hGroup Handle to the peer group. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {Pointer<PEER_RECORD>} pRecord Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_record">PEER_RECORD</a> structure that is added to the peer group specified in <i>hGroup</i>. This parameter is required.
     * 
     * The following members in <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_record">PEER_RECORD</a> must be populated.
     * 
     * <ul>
     * <li><b>dwSize</b></li>
     * <li><b>type</b></li>
     * <li><b>ftExpiration</b></li>
     * </ul>
     * <b>ftExpiration</b>   must be expressed as peer time (see <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupuniversaltimetopeertime">PeerGroupUniversalTimeToPeerTime</a>).
     * 
     * The following members  are ignored and overwritten if populated.
     * 
     * <ul>
     * <li><b>id</b></li>
     * <li><b>pwzCreatorId</b></li>
     * <li><b>pwzLastModifiedById</b></li>
     * <li><b>ftCreation</b></li>
     * <li><b>ftLastModified</b></li>
     * <li><b>securityData</b></li>
     * </ul>
     * The remaining fields are optional.
     * @param {Pointer<Guid>} pRecordId Pointer to a GUID that identifies the  record. This parameter is required.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
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
     * There is not enough memory to perform the specified operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_GROUP_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer group is not in a state where records can be added. For example, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a>  is called, but synchronization with the peer group database has not completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_ATTRIBUTES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The XML string that contains the record attributes in the <b>pwzAttributes</b>  member of the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_record">PEER_RECORD</a> structure does not comply with the <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/record-attribute-schema">schema specification</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GROUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the peer group is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_PEER_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The supplied peer name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_RECORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more fields in <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_record">PEER_RECORD</a> are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_MAX_RECORD_SIZE_EXCEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The record has exceeded the maximum size allowed by the peer group properties.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_AUTHORIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The identity is not authorized to publish a record of that type.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Cryptography-specific errors can be returned from the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/microsoft-base-cryptographic-provider">Microsoft RSA Base Provider</a>. These errors are prefixed with CRYPT_* and defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupaddrecord
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupAddRecord(hGroup, pRecord, pRecordId) {
        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupAddRecord", hGroupMarshal, hGroup, "ptr", pRecord, "ptr", pRecordId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGroupUpdateRecord function updates a record within a specific peer group.
     * @param {Pointer<Void>} hGroup Handle to the peer group whose record is updated. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {Pointer<PEER_RECORD>} pRecord Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_record">PEER_RECORD</a> structure that contains the updated record for <i>hGroup</i>.  This parameter is required.
     * 
     * The following members in <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_record">PEER_RECORD</a> can be updated.
     * 
     * <ul>
     * <li><b>pwzAttributes</b></li>
     * <li><b>ftExpiration</b></li>
     * <li><b>data</b></li>
     * </ul>
     * The following members in <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_record">PEER_RECORD</a> must be present, but cannot be changed.
     * 
     * <ul>
     * <li><b>dwSize</b></li>
     * <li><b>id</b></li>
     * <li><b>type</b></li>
     * <li><b>dwFlags</b></li>
     * </ul>
     * The following members are ignored if populated.
     * 
     * <ul>
     * <li><b>dwVersion</b></li>
     * <li><b>pwzCreatorId</b></li>
     * <li><b>pwzModifiedById</b></li>
     * <li><b>ftCreation</b></li>
     * <li><b>ftLastModified</b></li>
     * <li><b>securityData</b></li>
     * </ul>
     * The members that remain are optional.
     * @returns {HRESULT} Returns <b>S_OK</b>  if the operation succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the specified parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_GROUP_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer group is not in a state where a record can be updated, for example, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> has been called, but synchronization with the peer group database is not complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GROUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the peer group is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_AUTHORIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current peer identity does not have the authorization to delete the record. In this case, the peer identity is not the  creator of the record.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_RECORD_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The record cannot be located in the data store.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Cryptography-specific errors can be returned from the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/microsoft-base-cryptographic-provider">Microsoft RSA Base Provider</a>. These errors are prefixed with CRYPT_* and defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupupdaterecord
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupUpdateRecord(hGroup, pRecord) {
        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupUpdateRecord", hGroupMarshal, hGroup, "ptr", pRecord, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGroupDeleteRecord function deletes a record from a peer group. The creator, as well as any other member in an administrative role may delete a specific record.
     * @param {Pointer<Void>} hGroup Handle to the peer group that contains the record. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {Pointer<Guid>} pRecordId Specifies the GUID value that uniquely identifies the record to be deleted. This parameter is required.
     * @returns {HRESULT} Returns S_OK  if the operation succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_GROUP_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer group is not in a state where records can be deleted. For example, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a>  is called, but synchronization with the peer group database has not completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GROUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the peer group is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_AUTHORIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current identity does not have the authorization to delete the record. In this case, the identity is not the creator or a member in an administrative role may delete a specific record.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_RECORD_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The record cannot be located in the data store.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Cryptography-specific errors can be returned from the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/microsoft-base-cryptographic-provider">Microsoft RSA Base Provider</a>. These errors are prefixed with CRYPT_* and defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupdeleterecord
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupDeleteRecord(hGroup, pRecordId) {
        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupDeleteRecord", hGroupMarshal, hGroup, "ptr", pRecordId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGroupEnumRecords function creates an enumeration of peer group records.
     * @param {Pointer<Void>} hGroup Handle to the peer group whose records are enumerated. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {Pointer<Guid>} pRecordType Pointer to  a <b>GUID</b> value that uniquely identifies a specific record type. If this parameter is <b>NULL</b>, all records are returned.
     * @returns {Pointer<Void>} Pointer to the enumeration that contains the returned list of records. This handle is passed to  
     * 	 <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a> to retrieve the items, with each item represented as a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_record">PEER_RECORD</a> structure. When finished, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerendenumeration">PeerEndEnumeration</a> is called to return the memory used by the enumeration. This parameter is required.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupenumrecords
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupEnumRecords(hGroup, pRecordType) {
        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupEnumRecords", hGroupMarshal, hGroup, "ptr", pRecordType, "ptr*", &phPeerEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEnum
    }

    /**
     * The PeerGroupSearchRecords function searches the local peer group database for records that match the supplied criteria.
     * @param {Pointer<Void>} hGroup Handle to the peer group whose local database is searched. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {PWSTR} pwzCriteria Pointer to a Unicode XML string that contains the record search query. For information about formulating an XML query string to search the peer group records database, see the <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/record-search-query-format">Record Search Query Format</a> documentation. This parameter is required.
     * @returns {Pointer<Void>} Pointer to the enumeration that contains the returned list of records. This handle is passed to  
     * 	 <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a> to retrieve the items with each item represented as a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_record">PEER_RECORD</a> structure. When finished, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerendenumeration">PeerEndEnumeration</a> is called to return the memory used by the enumeration. This parameter is required.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupsearchrecords
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupSearchRecords(hGroup, pwzCriteria) {
        pwzCriteria := pwzCriteria is String ? StrPtr(pwzCriteria) : pwzCriteria

        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupSearchRecords", hGroupMarshal, hGroup, "ptr", pwzCriteria, "ptr*", &phPeerEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEnum
    }

    /**
     * The PeerGroupExportDatabase function exports a peer group database to a specific file, which can be transported to another computer and imported with the PeerGroupImportDatabase function.
     * @param {Pointer<Void>} hGroup Handle to the peer group whose database is exported to a local file on the peer. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {PWSTR} pwzFilePath Pointer to a Unicode string that contains the absolute file system path and file name where the exported database is stored. For example, "C:\backup\p2pdb.db". If this file already exists at the specified location, the older file is overwritten. This parameter is required.
     * @returns {HRESULT} Returns S_OK  if the operation succeeds. Otherwise, the function returns one of the following values.
     * 
     * <div class="alert"><b>Note</b>  If an export fails due to a file system error, the appropriate file system error, defined in winerror.h, is returned.</div>
     * <div> </div>
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
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
     * There is not enough memory to perform the specified operation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Cryptography-specific errors can be returned from the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/microsoft-base-cryptographic-provider">Microsoft RSA Base Provider</a>. These errors are prefixed with CRYPT_* and defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupexportdatabase
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupExportDatabase(hGroup, pwzFilePath) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupExportDatabase", hGroupMarshal, hGroup, "ptr", pwzFilePath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGroupImportDatabase function imports a peer group database from a local file.
     * @remarks
     * This function must be called before <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupconnect">PeerGroupConnect</a>, and after <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a>.
     * @param {Pointer<Void>} hGroup Handle to a peer group whose database is imported from a local file. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {PWSTR} pwzFilePath Pointer to a Unicode string that contains the absolute file system path and file name where the data is stored, for example, "C:\backup\p2pdb.db". If the file does not exist at this location, an appropriate error from the file system is returned. This parameter is required.
     * @returns {HRESULT} Returns <b>S_OK</b>  if the operation succeeds. Otherwise, the function returns one of the following values.
     * 
     * <div class="alert"><b>Note</b>  If an import fails due to a file system error, the appropriate file system error is returned.</div>
     * <div> </div>
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_GROUP_IN_USE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation cannot be completed because the peer group database is currently in use. For example, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupconnect">PeerGroupConnect</a> has been called by a peer, but has not yet completed any database transactions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_INVALID_GROUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the peer group is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Cryptography-specific errors can be returned from the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/microsoft-base-cryptographic-provider">Microsoft RSA Base Provider</a>. These errors are prefixed with CRYPT_* and defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupimportdatabase
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupImportDatabase(hGroup, pwzFilePath) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupImportDatabase", hGroupMarshal, hGroup, "ptr", pwzFilePath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGroupIssueCredentials function issues credentials, including a GMC, to a specific identity, and optionally returns an invitation XML string the invited peer can use to join a peer group.
     * @remarks
     * This function can only be called successfully by an administrator.
     * 
     * The credentials for a member (<a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_credential_info">PEER_CREDENTIAL_INFO</a>) are obtained  by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupenummembers">PeerGroupEnumMembers</a>. The credentials are located in  the <b>pCredentialInfo</b> field of the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_member">PEER_MEMBER</a> structure for a specific member.
     * @param {Pointer<Void>} hGroup Handle to a peer group  for which a peer will issue credentials to potential invited peers. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {PWSTR} pwzSubjectIdentity Specifies the identity of a peer to whom credentials will be issued. This parameter is required.
     * @param {Pointer<PEER_CREDENTIAL_INFO>} pCredentialInfo <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_credential_info">PEER_CREDENTIAL_INFO</a> structure that contains information about the credentials  of a peer whose identity is specified in <i>pwzSubjectIdentity</i>. If this parameter is <b>NULL</b>, the information stored in the peer database is used, instead. This parameter is optional.
     * 
     * If this parameter is provided, the following fields in <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_credential_info">PEER_CREDENTIAL_INFO</a> are ignored:<ul>
     * <li><b>pwzIssuerPeerName</b></li>
     * <li><b>pwzIssuerFriendlyName</b></li>
     * </ul>
     * @param {Integer} dwFlags Specifies a set of flags used to describe actions taken when credentials are issued. If this parameter is set to 0 (zero), the credentials are returned in <i>ppwzInvitation</i>. This parameter is optional.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEER_GROUP_STORE_CREDENTIALS"></a><a id="peer_group_store_credentials"></a><dl>
     * <dt><b>PEER_GROUP_STORE_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Publish the subject identity's newly-created GMC in the group database.  The GMC is picked up automatically by the subject. If this flag is not set, the credentials must be obtained by a different application such as email.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {PWSTR} Pointer to an invitation XML string returned by the function call. This invitation is passed out-of-band to the invited peer who uses it in a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a>. This parameter is optional.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupissuecredentials
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupIssueCredentials(hGroup, pwzSubjectIdentity, pCredentialInfo, dwFlags) {
        pwzSubjectIdentity := pwzSubjectIdentity is String ? StrPtr(pwzSubjectIdentity) : pwzSubjectIdentity

        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupIssueCredentials", hGroupMarshal, hGroup, "ptr", pwzSubjectIdentity, "ptr", pCredentialInfo, "uint", dwFlags, "ptr*", &ppwzInvitation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwzInvitation
    }

    /**
     * The PeerGroupExportConfig function exports the group configuration for a peer as an XML string that contains the identity, group name, and the GMC for the identity.
     * @remarks
     * After being exported, this configuration can be passed out-of-band to another peer, where the configuration of the identity can be established. To import the configuration, pass  the XML string returned by this function with the password set on it to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupimportconfig">PeerGroupImportConfig</a>.
     * 
     * The configuration XML string appears in the following format:
     * 
     * 
     * ``` syntax
     * &lt;PEERGROUPCONFIG VERSION="1.0"&gt;
     *   &lt;IDENTITYPEERNAME&gt;
     *     &lt;!-- UTF-8 encoded peer name of the identity --&gt;
     *   &lt;/IDENTITYPEERNAME&gt;
     *   &lt;GROUPPEERNAME&gt;
     *     &lt;!-- UTF-8 encoded peer name of the group --&gt;
     *   &lt;/GROUPPEERNAME&gt;
     *   &lt;CLOUDNAME&gt;
     *     &lt;!-- UTF-8 encoded Unicode name of the cloud --&gt;
     *   &lt;/CLOUDNAME&gt;
     *   &lt;SCOPE&gt;
     *     &lt;!-- UTF-8 encoded Unicode name of the scope: global, site-local, link-local --&gt;
     *   &lt;/SCOPE&gt;
     *   &lt;CLOUDFLAGS&gt;
     *     &lt;!-- A DWORD containing cloud-specific settings, represented as a string --&gt;
     *   &lt;/CLOUDFLAGS&gt;
     *   &lt;GMC xmlns:dt="urn:schemas-microsoft-com:datatypes" dt:dt="bin.base64"&gt;
     *     &lt;!-- base64/PKCS7 encoded GMC chain --&gt;
     *   &lt;/GMC&gt;
     * &lt;/PEERGROUPCONFIG&gt;
     * ```
     * @param {Pointer<Void>} hGroup Handle to the group. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {PWSTR} pwzPassword Specifies the password used to protect the exported configuration. There are no rules or limits for the formation of this password. This parameter is required.
     * @returns {PWSTR} Pointer to the returned XML configuration string that contains the identity, group peer name, cloud peer name, group scope, and the GMC for the identity. This parameter is required.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupexportconfig
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupExportConfig(hGroup, pwzPassword) {
        pwzPassword := pwzPassword is String ? StrPtr(pwzPassword) : pwzPassword

        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupExportConfig", hGroupMarshal, hGroup, "ptr", pwzPassword, "ptr*", &ppwzXML := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwzXML
    }

    /**
     * The PeerGroupImportConfig function imports a peer group configuration for an identity based on the specific settings in a supplied XML configuration string.
     * @remarks
     * To generate a peer group configuration, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupexportconfig">PeerGroupExportConfig</a>, pass in an identity to export,  a password, and a handle to the peer group.
     * 
     * The configuration XML string appears in the following format:
     * 
     * 
     * ``` syntax
     * &lt;PEERGROUPCONFIG VERSION="1.0"&gt;
     *   &lt;IDENTITYPEERNAME&gt;
     *     &lt;!-- UTF-8 encoded peer name of the identity --&gt;
     *   &lt;/IDENTITYPEERNAME&gt;
     *   &lt;GROUPPEERNAME&gt;
     *     &lt;!-- UTF-8 encoded peer name of the peer group --&gt;
     *   &lt;/GROUPPEERNAME&gt;
     *   &lt;CLOUDNAME&gt;
     *     &lt;!-- UTF-8 encoded Unicode name of the cloud --&gt;
     *   &lt;/CLOUDNAME&gt;
     *   &lt;SCOPE&gt;
     *     &lt;!-- UTF-8 encoded Unicode name of the scope: global, site-local, link-local --&gt;
     *   &lt;/SCOPE&gt;
     *   &lt;CLOUDFLAGS&gt;
     *     &lt;!-- A DWORD that contains cloud-specific settings, represented as a string --&gt;
     *   &lt;/CLOUDFLAGS&gt;
     *   &lt;GMC xmlns:dt="urn:schemas-microsoft-com:datatypes" dt:dt="bin.base64"&gt;
     *     &lt;!-- base64/PKCS7 encoded GMC chain --&gt;
     *   &lt;/GMC&gt;
     * &lt;/PEERGROUPCONFIG&gt;
     * ```
     * @param {PWSTR} pwzXML Specifies a Unicode string that contains a previously exported (using <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupexportconfig">PeerGroupExportConfig</a>) peer group configuration. For the specific XML format of the  string, see to the Remarks section of this topic. This parameter is required.
     * @param {PWSTR} pwzPassword Specifies the password used to access  the encrypted peer group configuration data, as a Unicode string. This parameter is required.
     * @param {BOOL} fOverwrite If true, the existing group configuration is overwritten. If false, the group configuration is written only if a previous group configuration does not exist. The default value is false. This parameter is required.
     * @param {Pointer<PWSTR>} ppwzIdentity Contains the peer identity returned after an import completes. This parameter is required.
     * @param {Pointer<PWSTR>} ppwzGroup Contains a peer group peer name returned after an import completes. This parameter is required.
     * @returns {HRESULT} Returns <b>S_OK</b> if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
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
     * There is not enough memory to perform a specified operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A peer group configuration already exists, and <i>fOverwrite</i> is set to false.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Cryptography-specific errors can be returned from the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/microsoft-base-cryptographic-provider">Microsoft RSA Base Provider</a>. These errors are prefixed with CRYPT_* and defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupimportconfig
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupImportConfig(pwzXML, pwzPassword, fOverwrite, ppwzIdentity, ppwzGroup) {
        pwzXML := pwzXML is String ? StrPtr(pwzXML) : pwzXML
        pwzPassword := pwzPassword is String ? StrPtr(pwzPassword) : pwzPassword

        ppwzIdentityMarshal := ppwzIdentity is VarRef ? "ptr*" : "ptr"
        ppwzGroupMarshal := ppwzGroup is VarRef ? "ptr*" : "ptr"

        result := DllCall("P2P.dll\PeerGroupImportConfig", "ptr", pwzXML, "ptr", pwzPassword, "int", fOverwrite, ppwzIdentityMarshal, ppwzIdentity, ppwzGroupMarshal, ppwzGroup, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGroupPeerTimeToUniversalTime function converts the peer group-maintained reference time value to a localized time value appropriate for display on a peer computer.
     * @remarks
     * <i>Universal time</i> is  the universal time value maintained on a peer  computer.
     * 
     * <i>Peer time</i> is a common reference time maintained by a peer group, expressed as UTC. It is often offset from the universal time value, and is used to correct latency issues.
     * 
     * Universal time can be converted to peer time by calling the converse function <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupuniversaltimetopeertime">PeerGroupUniversalTimeToPeerTime</a>.
     * @param {Pointer<Void>} hGroup Handle to the  peer group that a peer participates in. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {Pointer<FILETIME>} pftPeerTime Pointer to the peer time value—Coordinated Universal Time (UTC)—that is represented as a <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/graphing-reference-links">FILETIME</a> structure.  This parameter is required.
     * @param {Pointer<FILETIME>} pftUniversalTime Pointer to the returned universal time value that is  represented as a <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/graphing-reference-links">FILETIME</a> structure. This parameter is <b>NULL</b> if an error occurs.
     * @returns {HRESULT} Returns <b>S_OK</b> if the function succeeds. Otherwise, the function returns either one of the remote procedure call (RPC) errors or one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_GROUP_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer group is not in a state that peer time can be  retrieved accurately, for example, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> has been called, but synchronization with the group database has not completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer group must be  initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupstartup">PeerGroupStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Cryptography-specific errors can be returned from the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/microsoft-base-cryptographic-provider">Microsoft RSA Base Provider</a>. These errors are prefixed with CRYPT_* and defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergrouppeertimetouniversaltime
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupPeerTimeToUniversalTime(hGroup, pftPeerTime, pftUniversalTime) {
        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupPeerTimeToUniversalTime", hGroupMarshal, hGroup, "ptr", pftPeerTime, "ptr", pftUniversalTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerGroupUniversalTimeToPeerTime function converts a local time value from a peer's computer to a common peer group time value.
     * @remarks
     * <i>Universal time</i> is  the universal time value maintained on a peer's computer.
     * 
     * <i>Peer time</i> is a common reference time maintained by a peer group, expressed as Coordinated Universal Time (UTC). It is often offset from the universal time value, and is used to correct latency issues.
     * 
     * Peer time can be converted to universal time by calling the converse function <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergrouppeertimetouniversaltime">PeerGroupPeerTimeToUniversalTime</a>.
     * @param {Pointer<Void>} hGroup Handle to the  peer group a peer participates in. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreate">PeerGroupCreate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupopen">PeerGroupOpen</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> function. This parameter is required.
     * @param {Pointer<FILETIME>} pftUniversalTime Pointer to the universal time value, represented as a <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/graphing-reference-links">FILETIME</a> structure. This parameter is required.
     * @param {Pointer<FILETIME>} pftPeerTime Pointer to the returned peer time—Greenwich Mean Time (GMT) value that is represented as a <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/graphing-reference-links">FILETIME</a> structure. This parameter is <b>NULL</b> if an error occurs.
     * @returns {HRESULT} Returns <b>S_OK</b> if the function succeeds. Otherwise, the function returns either one of the RPC errors or one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_GROUP_NOT_READY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer group is not in a state where peer time can be accurately calculated. For example, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupjoin">PeerGroupJoin</a> has been called, but synchronization with the peer group database has not completed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The group must be  initialized with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupstartup">PeerGroupStartup</a> before using this function.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Cryptography-specific errors can be returned from the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/microsoft-base-cryptographic-provider">Microsoft RSA Base Provider</a>. These errors are prefixed with CRYPT_* and defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peergroupuniversaltimetopeertime
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerGroupUniversalTimeToPeerTime(hGroup, pftUniversalTime, pftPeerTime) {
        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupUniversalTimeToPeerTime", hGroupMarshal, hGroup, "ptr", pftUniversalTime, "ptr", pftPeerTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hGroup 
     * @param {Pointer<Void>} hPeerEventHandle 
     * @returns {HRESULT} 
     * @deprecated 
     */
    static PeerGroupResumePasswordAuthentication(hGroup, hPeerEventHandle) {
        hGroupMarshal := hGroup is VarRef ? "ptr" : "ptr"
        hPeerEventHandleMarshal := hPeerEventHandle is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerGroupResumePasswordAuthentication", hGroupMarshal, hGroup, hPeerEventHandleMarshal, hPeerEventHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerIdentityCreate function creates a new peer identity and returns its name.
     * @remarks
     * The key pair and the classifier are used to generate the peer name of a new peer identity.  After a peer identity is created, it is automatically stored on the disk.
     * 
     * The name of the identity should be freed by using <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.  This does not delete the peer identity.  To delete the identity, use <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peeridentitydelete">PeerIdentityDelete</a> function.
     * 
     * If <i>hCryptProv</i> is not <b>NULL</b>, it can be released by using <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/identity-manager-reference-links">CryptReleaseContext</a> after the call returns.
     * @param {PWSTR} pwzClassifier Specifies the classifier to append to the published peer identity name. This string is a Unicode string, and can be <b>NULL</b>. This string can only be 150 characters long, including the  <b>NULL</b> terminator.
     * @param {PWSTR} pwzFriendlyName Specifies the friendly name of the peer identity. This  is a Unicode string, and can be <b>NULL</b>. This string can only be 256 characters long, including the  <b>NULL</b> terminator. If <i>pwzFriendlyName</i> is <b>NULL</b>, the name of the identity is the friendly name.  The friendly name is optional, and it does not have to be unique.
     * @param {Pointer} hCryptProv Handle to the cryptographic service provider (CSP) that contains an AT_KEYEXCHANGE key pair of at least 1024 bits in length. This key pair is used as the basis for a new peer identity. If <i>hCryptProv</i> is zero (0), a new key pair is generated for the peer identity. 
     * 
     * <div class="alert"><b>Note</b>  The Identity Manager API does not support a CSP that has user protected keys. If  a CSP that has user protected keys  is used, <b>PeerIdentityCreate</b> returns <b>E_INVALIDARG</b>. </div>
     * <div> </div>
     * @returns {PWSTR} Receives a pointer to the name of a peer identity that is created. This name must be used in all subsequent calls to  the Peer Identity Manager, Peer Grouping, or PNRP functions that operate on behalf of the peer identity. Returns <b>NULL</b> if the peer identity cannot be created.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peeridentitycreate
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerIdentityCreate(pwzClassifier, pwzFriendlyName, hCryptProv) {
        pwzClassifier := pwzClassifier is String ? StrPtr(pwzClassifier) : pwzClassifier
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := DllCall("P2P.dll\PeerIdentityCreate", "ptr", pwzClassifier, "ptr", pwzFriendlyName, "ptr", hCryptProv, "ptr*", &ppwzIdentity := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwzIdentity
    }

    /**
     * The PeerIdentityGetFriendlyName function returns the friendly name of the peer identity.
     * @param {PWSTR} pwzIdentity Specifies the peer identity to obtain a friendly name.
     * @returns {PWSTR} Receives a pointer to the friendly name. When <i>ppwzFriendlyName</i> is not required anymore, the application is responsible for freeing this string by calling  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peeridentitygetfriendlyname
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerIdentityGetFriendlyName(pwzIdentity) {
        pwzIdentity := pwzIdentity is String ? StrPtr(pwzIdentity) : pwzIdentity

        result := DllCall("P2P.dll\PeerIdentityGetFriendlyName", "ptr", pwzIdentity, "ptr*", &ppwzFriendlyName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwzFriendlyName
    }

    /**
     * The PeerIdentitySetFriendlyName function modifies the friendly name for a specified peer identity. The friendly name is the human-readable name.
     * @param {PWSTR} pwzIdentity Specifies a peer identity to modify.
     * @param {PWSTR} pwzFriendlyName Specifies a new friendly name. Specify <b>NULL</b> or an empty string to reset a friendly name to the default value, which is the Unicode version of the peer name.
     * @returns {HRESULT} If the function call succeeds, the return value is <b>S_OK</b>. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
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
     * There is not enough memory to perform the specified operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NO_KEY_ACCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access to the peer identity or peer group keys is denied. Typically, this is  caused by an incorrect access control list (ACL) for the folder that contains the user or computer keys. This can happen when the ACL has been  reset manually. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A peer identity that matches a specified name cannot be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peeridentitysetfriendlyname
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerIdentitySetFriendlyName(pwzIdentity, pwzFriendlyName) {
        pwzIdentity := pwzIdentity is String ? StrPtr(pwzIdentity) : pwzIdentity
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := DllCall("P2P.dll\PeerIdentitySetFriendlyName", "ptr", pwzIdentity, "ptr", pwzFriendlyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerIdentityGetCryptKey function retrieves a handle to a cryptographic service provider (CSP).
     * @remarks
     * The  key can be retrieved by calling <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/identity-manager-reference-links">CryptGetUserKey</a>.
     * 
     * When the handle is not required anymore, the application is responsible for releasing the handle by using <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/identity-manager-reference-links">CryptReleaseContext</a>.
     * @param {PWSTR} pwzIdentity Specifies the peer identity to retrieve the key pair for.
     * @returns {Pointer} Receives a pointer to the handle of the  cryptographic service provider (CSP) that contains an AT_KEYEXCHANGE RSA key pair.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peeridentitygetcryptkey
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerIdentityGetCryptKey(pwzIdentity) {
        pwzIdentity := pwzIdentity is String ? StrPtr(pwzIdentity) : pwzIdentity

        result := DllCall("P2P.dll\PeerIdentityGetCryptKey", "ptr", pwzIdentity, "ptr*", &phCryptProv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phCryptProv
    }

    /**
     * The PeerIdentityDelete function permanently deletes a peer identity. This includes removing all certificates, private keys, and all group information associated with a specified peer identity.
     * @param {PWSTR} pwzIdentity Specifies a peer identity to delete.
     * @returns {HRESULT} If the function call succeeds, the return value is <b>S_OK</b>. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_GROUPS_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The peer identity cannot be deleted because it has  peer groups associated with it.   All peer groups associated with the specified identity must be deleted by using   <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupdelete">PeerGroupDelete</a> before a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peeridentitydelete">PeerIdentityDelete</a> can succeed.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A peer identity that matches the specified name cannot be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peeridentitydelete
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerIdentityDelete(pwzIdentity) {
        pwzIdentity := pwzIdentity is String ? StrPtr(pwzIdentity) : pwzIdentity

        result := DllCall("P2P.dll\PeerIdentityDelete", "ptr", pwzIdentity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PeerEnumIdentities function creates and returns a peer enumeration handle used to enumerate all the peer identities that belong to a specific user.
     * @remarks
     * Once the application has obtained the peer enumeration handle, use <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a> and <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetitemcount">PeerGetItemCount</a> to enumerate the peer identities.
     * 
     * When enumerating peer identities, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a>  returns an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_name_pair">PEER_NAME_PAIR</a> structures.
     * 
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerendenumeration">PeerEndEnumeration</a> to free the enumeration handle when it is no longer required.
     * @returns {Pointer<Void>} Receives a handle to the peer enumeration that contains the list of peer identities, with each item represented as a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_name_pair">PEER_NAME_PAIR</a> structure. Pass this handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a> to retrieve the items; when finished, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerendenumeration">PeerEndEnumeration</a>  to release the memory.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peerenumidentities
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerEnumIdentities() {
        result := DllCall("P2P.dll\PeerEnumIdentities", "ptr*", &phPeerEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEnum
    }

    /**
     * The PeerEnumGroups function creates and returns a peer enumeration handle used to enumerate all the peer groups associated with a specific peer identity.
     * @remarks
     * Once the application has obtained the enumeration handle, use <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a> and <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetitemcount">PeerGetItemCount</a> to enumerate the peer groups.
     * 
     * When enumerating peer groups, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a>  returns an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_name_pair">PEER_NAME_PAIR</a> structures.
     * 
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerendenumeration">PeerEndEnumeration</a> to free the peer enumeration handle when it is no longer required.
     * @param {PWSTR} pwzIdentity Specifies the peer identity to enumerate groups for.
     * @returns {Pointer<Void>} Receives a handle to the peer enumeration that contains the list of peer groups that the specified identity is a member of, with each item represented as a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_name_pair">PEER_NAME_PAIR</a> structure. Pass this handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a> to retrieve the items; when finished, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerendenumeration">PeerEndEnumeration</a> release the memory.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peerenumgroups
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerEnumGroups(pwzIdentity) {
        pwzIdentity := pwzIdentity is String ? StrPtr(pwzIdentity) : pwzIdentity

        result := DllCall("P2P.dll\PeerEnumGroups", "ptr", pwzIdentity, "ptr*", &phPeerEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEnum
    }

    /**
     * The PeerCreatePeerName function creates a new name based on the existing name of the specified peer identity and classifier. However, a new identity is not created by a call to PeerCreatePeerName.
     * @remarks
     * The parameter  <i>ppwzPeername</i> must be set to null before the <b>PeerCreatePeerName</b> function is called.
     * @param {PWSTR} pwzIdentity Specifies the identity to use as the basis for the new peer name. If <i>pwzIdentity</i> is <b>NULL</b>, the name created is not based on any peer identity, and is therefore an unsecured name.
     * 
     * This parameter can only be <b>NULL</b> if <i>pwzClassifier</i> is not <b>NULL</b>.
     * @param {PWSTR} pwzClassifier Pointer to the Unicode string that contains the new classifier. This classifier is appended to the existing authority portion of the peer name of the specified identity. This string is 150 characters long, including the <b>NULL</b> terminator. Specify <b>NULL</b> to return the peer name of the identity.  
     * 
     * This parameter can only be <b>NULL</b> if <i>pwzIdentity</i> is not <b>NULL</b>.
     * @returns {PWSTR} Pointer that receives a pointer to the new peer name. When this string is not required anymore, free it by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercreatepeername
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerCreatePeerName(pwzIdentity, pwzClassifier) {
        pwzIdentity := pwzIdentity is String ? StrPtr(pwzIdentity) : pwzIdentity
        pwzClassifier := pwzClassifier is String ? StrPtr(pwzClassifier) : pwzClassifier

        result := DllCall("P2P.dll\PeerCreatePeerName", "ptr", pwzIdentity, "ptr", pwzClassifier, "ptr*", &ppwzPeerName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwzPeerName
    }

    /**
     * The PeerIdentityGetXML function returns a description of the peer identity, which can then be passed to third parties and used to invite a peer identity into a peer group. This information is returned as an XML fragment.
     * @remarks
     * The XML fragment returned has the following structure:
     * 
     * 
     * ``` syntax
     * &lt;PEERIDENTITYINFO VERSION="1.0"&gt;
     *      &lt;IDC xmlns:dt="urn:schemas-microsoft-com:datatypes" dt:dt="bin.base64"&gt;
     *           Base 64 encoded certificate.
     *      &lt;/IDC&gt;
     * &lt;/PEERIDENTITYINFO&gt;
     * ```
     * 
     * This XML fragment is used when creating an invitation to join a group.
     * 
     * Applications are not allowed to add tags within the <b>PEERIDENTITYINFO</b> tag or modify this XML fragment in any way.  Applications are allowed to incorporate this XML fragment into other XML documents, but must strip out all application-specific XML before passing this fragment to the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreateinvitation">PeerGroupCreateInvitation</a>.
     * @param {PWSTR} pwzIdentity Specifies the peer identity to retrieve peer identity information for. When this parameter is passed as <b>NULL</b>, a "default" identity will be generated for the user by the peer infrastructure.
     * @returns {PWSTR} Pointer to a pointer to a Unicode string that contains the XML fragment. When <i>ppwzIdentityXML</i> is no longer required, the application is responsible for freeing this string by calling  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peeridentitygetxml
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerIdentityGetXML(pwzIdentity) {
        pwzIdentity := pwzIdentity is String ? StrPtr(pwzIdentity) : pwzIdentity

        result := DllCall("P2P.dll\PeerIdentityGetXML", "ptr", pwzIdentity, "ptr*", &ppwzIdentityXML := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwzIdentityXML
    }

    /**
     * The PeerIdentityExport function allows a user to export one peer identity. The user can then transfer the peer identity to a different computer.
     * @remarks
     * Peer-to-peer group membership credentials are not exported. Only one peer identity  is  exported. An exported peer identity can be imported on another computer by using <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peeridentityimport">PeerIdentityImport</a>.  
     * 
     * Exporting a peer identity   does not remove it from a local ccmputer, it  makes a copy of it. The copy can be used to backup and restore a peer identity. 
     * 
     * 
     * The XML fragment used by <b>PeerIdentityExport</b> is as follows:
     * 
     * 
     * ``` syntax
     * &lt;PEERIDENTITYEXPORT VERSION="1.0"&gt;
     *    &lt;PEERNAME&gt;
     *      &lt;!-- UTF-8 encoded peer name of the identity --&gt;
     *    &lt;/PEERNAME&gt;
     *    &lt;DATA xmlns:dt="urn:schemas-microsoft-com:datatypes" dt:dt="bin.base64"&gt;
     *       &lt;!-- base64 encoded / PFX encoded and encrypted IDC with the private key --&gt;
     *    &lt;/DATA&gt;
     * &lt;/PEERIDENTITYEXPORT&gt;
     * 
     * ```
     * @param {PWSTR} pwzIdentity Specifies the peer identity  to export. This parameter is required and does not have a default value.
     * @param {PWSTR} pwzPassword Specifies the password to use to encrypt the peer identity. This parameter cannot be <b>NULL</b>. This password must also be used to import the peer identity, or the import operation fails.
     * @returns {PWSTR} Receives a pointer to the exported peer identity in XML format. If the export operation is successful, the application must free <i>ppwzExportXML</i> by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peeridentityexport
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerIdentityExport(pwzIdentity, pwzPassword) {
        pwzIdentity := pwzIdentity is String ? StrPtr(pwzIdentity) : pwzIdentity
        pwzPassword := pwzPassword is String ? StrPtr(pwzPassword) : pwzPassword

        result := DllCall("P2P.dll\PeerIdentityExport", "ptr", pwzIdentity, "ptr", pwzPassword, "ptr*", &ppwzExportXML := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwzExportXML
    }

    /**
     * The PeerIdentityImport function imports one peer identity. If the peer identity exists on a computer, PEER_E_ALREADY_EXISTS is returned.
     * @remarks
     * The XML fragment used by <b>PeerIdentityImport</b> is as follows:
     * 
     * 
     * ``` syntax
     * &lt;PEERIDENTITYEXPORT VERSION="1.0"&gt;
     *    &lt;IDENTITY&gt;
     *      &lt;!-- UTF-8 encoded peer name of the identity --&gt;
     *    &lt;/IDENTITY&gt;
     *    &lt;IDENTITYDATA xmlns:dt="urn:schemas-microsoft-com:datatypes" dt:dt="bin.base64"&gt;
     *       &lt;!-- base64 encoded / PFX encoded and encrypted IDC with the private key --&gt;
     *    &lt;/IDENTTYDATA&gt;
     * &lt;/PEERIDENTITYEXPORT&gt;
     * 
     * ```
     * @param {PWSTR} pwzImportXML Pointer to the XML format peer identity to import, which is returned by <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peeridentityexport">PeerIdentityExport</a>. This binary data must match the exported data byte-for-byte.  The XML must remain valid XML with no extra 
     * characters.
     * @param {PWSTR} pwzPassword Specifies the password to use to de-crypt a peer identity. The password must be identical to the password supplied to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peeridentityexport">PeerIdentityExport</a>. This parameter cannot be <b>NULL</b>.
     * @returns {PWSTR} Pointer to a string that represents a peer identity that is imported.  If the import operation is successful, the application must free <i>ppwzIdentity</i> by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peeridentityimport
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerIdentityImport(pwzImportXML, pwzPassword) {
        pwzImportXML := pwzImportXML is String ? StrPtr(pwzImportXML) : pwzImportXML
        pwzPassword := pwzPassword is String ? StrPtr(pwzPassword) : pwzPassword

        result := DllCall("P2P.dll\PeerIdentityImport", "ptr", pwzImportXML, "ptr", pwzPassword, "ptr*", &ppwzIdentity := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwzIdentity
    }

    /**
     * The PeerIdentityGetDefault function retrieves the default peer name set for the current user.
     * @returns {PWSTR} Pointer to the address of a zero-terminated Unicode string that contains the default name of the current user.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peeridentitygetdefault
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerIdentityGetDefault() {
        result := DllCall("P2P.dll\PeerIdentityGetDefault", "ptr*", &ppwzPeerName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwzPeerName
    }

    /**
     * Initializes the Peer Collaboration infrastructure.
     * @remarks
     * This function must be called before any other peer collaboration (PeerCollab*) functions are called.
     * 
     * When the application no longer requires the Peer Collaboration infrastructure, it must make a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabshutdown">PeerCollabShutdown</a>. If <b>PeerCollabStartup</b> is called multiple times, there must be a separate corresponding call to <b>PeerCollabShutdown</b>. All of the components of the infrastructure are cleaned up only when the last call to <b>PeerCollabShutdown</b> occurs.
     * 
     * The current supported version is <b>1.0</b>. Call <c>MAKEWORD(1, 0)</c> to generate this version number WORD value.
     * @param {Integer} wVersionRequested Contains the minimum version of the Peer Collaboration infrastructure requested by the peer.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_UNSUPPORTED_VERSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested version of the Peer Collaboration Infrastructure is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabstartup
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabStartup(wVersionRequested) {
        result := DllCall("P2P.dll\PeerCollabStartup", "ushort", wVersionRequested, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Shuts down the Peer Collaboration infrastructure and releases any resources associated with it.
     * @remarks
     * A call to this function decreases the number of references to the Peer Collaboration infrastructure by 1. If the reference count equals 0, then all resources associated with the Peer Collaboration infrastructure are released.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application did not make a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabstartup">PeerCollabStartup</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabshutdown
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabShutdown() {
        result := DllCall("P2P.dll\PeerCollabShutdown", "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Signs the peer into a hosted Internet (serverless presence) or subnet (&quot;People Near Me&quot;) peer collaboration network presence provider.
     * @remarks
     * If the p2phost.exe service is not running, this function will launch it.
     * 
     * If an attempt is made to launch the p2phost.exe service from an  elevated process, an error is returned. As a result, security cannot be compromised by an application mistakenly granting administrative privileges   to p2phost.exe. It is not possible to launch p2phost.exe in a non-interactive mode, as it needs to display Windows dialog boxes for incoming invites.
     * 
     * Calling <b>PeerCollabSignin</b> displays a sign-in user interface if the user has not authorized automatic sign-in. If <i>hwndParent</i> is specified, the user interface window will use <i>hwndParent</i> as the parent window.
     * 
     * When a user signs in to "People Near Me", the user's display name, machine name, and IP address are published to peers on the  subnet. The user can optionally specify a display picture for publishing. This information is not published if <b>PeerCollabSignin</b> is not called or the user signs out. 
     * 
     * Once signed in, the user can view a list of peers signed in on the subnet and available for interaction. This list will be empty if nobody else has signed in to "People Near Me" on the subnet.
     * 
     *  Multiple applications can  use the infrastructure at any given moment. It is not recommended for a single application to call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabsignout">PeerCollabSignout</a>, as other applications will not be able to use the infrastructure.
     * Applications must also be prepared to handle the user signing in and signing out, or situations where a machine goes to sleep or hibernation.
     * 
     * 
     * The <b>PeerCollabSignin</b> function currently requires up to two seconds to complete.
     * 
     * Display names are not necessarily unique. Users should verify the identity of the person using a display name by e-mail, phone, or in person before accepting an invitation to interact.
     * 
     * To sign out of a peer collaborative network, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabsignout">PeerCollabSignout</a> with the same set of sign-in options. A user can also sign out through the user interface.
     * @param {HWND} hwndParent Windows handle to the parent application signing in.
     * @param {Integer} dwSigninOptions <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_signin_flags">PEER_SIGNIN_FLAGS</a> enumeration value that contains the presence provider sign-in options for the calling peer.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
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
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application did not make a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabstartup">PeerCollabStartup</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_SERVICE_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An attempt was made to call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabsignin">PeerCollabSignIn</a> from an elevated process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_S_NO_CONNECTIVITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sign-in succeeded, but IPv6 addresses are not available at this time.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabsignin
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabSignin(hwndParent, dwSigninOptions) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := DllCall("P2P.dll\PeerCollabSignin", "ptr", hwndParent, "uint", dwSigninOptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Signs a peer out of a specific type of peer collaboration network presence provider.
     * @remarks
     * If the local peer's collaboration infrastructure is signed out of both Internet and People Near Me presence, all transient information like objects and the endpoint ID are deleted. Any application that uses this information must republish the information. A single event that indicates signout is raised, instead of sending multiple individual events for each object or application. 
     * 
     *  Multiple applications can  use the infrastructure at any given moment. It is not recommended for a single application to sign out, as other applications will not be able to use the infrastructure.
     * Applications must also be prepared to handle user sign in and sign out, or situations where a machine goes to sleep or into hibernation.
     * @param {Integer} dwSigninOptions <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_signin_flags">PEER_SIGNIN_FLAGS</a> enumeration value that contains the presence provider sign-in options for the calling peer. This value is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabgetsigninoptions">PeerCollabGetSigninOptions</a> from the peer application.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
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
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application did not make a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabstartup">PeerCollabStartup</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabsignout
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabSignout(dwSigninOptions) {
        result := DllCall("P2P.dll\PeerCollabSignout", "uint", dwSigninOptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Obtains the peer's current signed-in peer collaboration network presence options.
     * @returns {Integer} The <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_signin_flags">PEER_SIGNIN_FLAGS</a> enumeration value is returned by this function.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabgetsigninoptions
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabGetSigninOptions() {
        result := DllCall("P2P.dll\PeerCollabGetSigninOptions", "uint*", &pdwSigninOptions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwSigninOptions
    }

    /**
     * Sends an invitation to a trusted peer contact to join the sender's peer collaboration activity over a secured connection. The availability of the invitation response is updated through an asynchronous event.
     * @remarks
     * This API ensures the peer that receives the invitation is the contact specified as input. The connection will fail if the specific contact is not present on the endpoint specified.  The use of <b>PeerCollabAsyncInviteContact</b> is recommended  in place of the less secure <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabasyncinviteendpoint">PeerCollabAsyncInviteEndpoint</a>.
     * 
     * A toast will appear for the recipient of the invitation. This toast will be converted to a dialog box in which the user can accept or decline the invitation. When the invitation is successfully accepted, the collaborative application is launched on the recipient's machine.
     * 
     * 
     * To successfully receive the invitation the application must be registered on the recipient's machine using <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabregisterapplication">PeerCollabRegisterApplication</a>. It is also possible for the sender of the invite to have  failure codes returned because the recipient has turned off application invites.
     * 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabgetinvitationresponse">PeerCollabGetInvitiationResponse</a> function will return PEER_E_CONNECTION_FAILED if the contact to which the invitation is being sent is not accepting invitations.
     * 
     * If the recipient is accepting invitations only from trusted contacts, then the sender of the invite must be added to the contact store of the recipient machine. The sender must be added to the contact store before the invitation attempt. To add a contact to the contact store, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabaddcontact">PeerCollabAddContact</a>. 
     * 
     * 
     * To cancel an outstanding invitation, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabcancelinvitation">PeerCollabCancelInvitation</a>.
     * @param {Pointer<PEER_CONTACT>} pcContact Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure that contains the contact information associated with the recipient of the invite. This parameter is optional.
     * 
     * To invite the endpoint of the calling peer specified in <i>pcEndpoint</i>, set the pointer value to <b>NULL</b>.
     * @param {Pointer<PEER_ENDPOINT>} pcEndpoint Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains information about the invited peer's endpoint. The endpoint must be associated with the peer contact specified in <i>pcContact</i>.
     * @param {Pointer<PEER_INVITATION>} pcInvitation Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_invitation">PEER_INVITATION</a> structure that contains the invitation request to send to the endpoint  specified in <i>pcEndpoint</i>. E_INVALIDARG is returned if this parameter is set to <b>NULL</b>.
     * @param {HANDLE} hEvent Handle to the event for this invitation, created by a previous call to CreateEvent. The event is signaled when the status of the asynchronous invitation is updated. To obtain the response data, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabgetinvitationresponse">PeerCollabGetInvitationResponse</a>.
     * 
     * If the event is not provided the caller must poll for the result by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabgetinvitationresponse">PeerCollabGetInvitationResponse</a>.
     * @returns {HANDLE} A pointer to a handle to the sent invitation. The framework will cleanup the response information after the invitation response is received if <b>NULL</b> is specified. When <b>NULL</b> is not the specified handle to the invitation provided, it must be closed by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabclosehandle">PeerCollabCloseHandle</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabasyncinvitecontact
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabAsyncInviteContact(pcContact, pcEndpoint, pcInvitation, hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        phInvitation := HANDLE()
        result := DllCall("P2P.dll\PeerCollabAsyncInviteContact", "ptr", pcContact, "ptr", pcEndpoint, "ptr", pcInvitation, "ptr", hEvent, "ptr", phInvitation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phInvitation
    }

    /**
     * Obtains the response from a peer previously invited to join a peer collaboration activity.
     * @remarks
     * This function must be called after <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabasyncinvitecontact">PeerCollabAsyncInviteContact</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabasyncinviteendpoint">PeerCollabAsyncInviteEndpoint</a> is called and the event handle provided to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabregisterevent">PeerCollabRegisterEvent</a> is signaled on the peer that sent the invitation.
     * @param {HANDLE} hInvitation Handle to an invitation to join a peer collaboration activity.
     * @returns {Pointer<PEER_INVITATION_RESPONSE>} Pointer to the address of a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_invitation_response">PEER_INVITATION_RESPONSE</a> structure that contains an invited peer's response to a previously transmitted invitation request.
     * 
     * Free the memory associated with this structure by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabgetinvitationresponse
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabGetInvitationResponse(hInvitation) {
        hInvitation := hInvitation is Win32Handle ? NumGet(hInvitation, "ptr") : hInvitation

        result := DllCall("P2P.dll\PeerCollabGetInvitationResponse", "ptr", hInvitation, "ptr*", &ppInvitationResponse := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppInvitationResponse
    }

    /**
     * Cancels an invitation previously sent by the caller to a contact.
     * @remarks
     * When <b>PeerCollabCancelInvitation</b> is called, depending on the state of the invitation, it will perform one or more of the following actions:
     * 
     * 
     * <ul>
     * <li>If the connection to the receiver is not yet established, it will cancel the connection creation process and the receiver will not see the invitation.</li>
     * <li>If the invitation has been received, but not responded to, it will notify the recipient contact that the invitation has been canceled. As a result, the receiver will not be able to respond to the invitation.</li>
     * <li>If the receiver has already responded to the invitation, the call performs a no-op.
     * After canceling the invitation, you must call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabclosehandle">PeerCollabCloseHandle</a>.
     * </li>
     * </ul>
     * @param {HANDLE} hInvitation Handle to a previously sent invitation.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
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
     * The provided handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application did not make a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabstartup">PeerCollabStartup</a>.
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
     * The handle specified is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabcancelinvitation
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabCancelInvitation(hInvitation) {
        hInvitation := hInvitation is Win32Handle ? NumGet(hInvitation, "ptr") : hInvitation

        result := DllCall("P2P.dll\PeerCollabCancelInvitation", "ptr", hInvitation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Closes the handle to a Peer Collaboration activity invitation.
     * @remarks
     * You must call this API after the handle has been signaled for an event and any data associated with the event has been obtained.
     * @param {HANDLE} hInvitation Handle obtained by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabasyncinvitecontact">PeerCollabAsyncInviteContact</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabasyncinviteendpoint">PeerCollabAsyncInviteEndpoint</a>.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
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
     * The handle specified is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabclosehandle
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabCloseHandle(hInvitation) {
        hInvitation := hInvitation is Win32Handle ? NumGet(hInvitation, "ptr") : hInvitation

        result := DllCall("P2P.dll\PeerCollabCloseHandle", "ptr", hInvitation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sends an invitation to join a peer collaboration activity to a trusted contact. This call is synchronous and, if successful, obtains a response from the contact.
     * @remarks
     * This API ensures the peer that receives the invitation is the contact specified as input. The connection will fail if the specific contact is not present on the endpoint specified.  The use of <b>PeerCollabInviteContact</b> is recommended  in place of the less secure <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabinviteendpoint">PeerCollabInviteEndpoint</a>.
     * 
     * A toast will appear for the recipient of the invitation. This toast will be converted to a dialog box in which the user can accept or decline the invitation. When the invitation is successfully accepted, the collaborative application is launched on the recipient's machine.
     * 
     * 
     * To successfully receive the invitation, the application must be registered on the recipient's machine using <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabregisterapplication">PeerCollabRegisterApplication</a>. It is also possible for the sender of the invite to have  failure codes returned because the recipient has turned off application invites.
     * 
     * 
     * If the recipient is accepting invitations only from trusted contacts, then the sender of the invite must be added to the contact store of the recipient machine. The sender must be added to the contact store before the invitation attempt. To add a contact to the contact store, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabaddcontact">PeerCollabAddContact</a>. 
     * 
     * 
     * The recipient of the invitation must respond within 5 minutes to avoid timeout.
     * @param {Pointer<PEER_CONTACT>} pcContact Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure that contains the contact information associated with the invitee.
     * @param {Pointer<PEER_ENDPOINT>} pcEndpoint Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains information about the invited peer. This peer is sent an invitation when this API is called.
     * @param {Pointer<PEER_INVITATION>} pcInvitation Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_invitation">PEER_INVITATION</a> structure that contains the invitation request to send to the endpoint(s)  specified in <i>pcEndpoint</i>. This parameter must not be set to <b>NULL</b>.
     * @returns {Pointer<PEER_INVITATION_RESPONSE>} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_invitation_response">PEER_INVITATION_RESPONSE</a> structure that receives an invited peer endpoint's responses to the invitation request.
     * 
     * If this call fails with an error, this parameter will be <b>NULL</b>.
     * 
     * Free the memory returned by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabinvitecontact
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabInviteContact(pcContact, pcEndpoint, pcInvitation) {
        result := DllCall("P2P.dll\PeerCollabInviteContact", "ptr", pcContact, "ptr", pcEndpoint, "ptr", pcInvitation, "ptr*", &ppResponse := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppResponse
    }

    /**
     * Sends an invitation to a specified peer endpoint to join the sender's peer collaboration activity. The availability of the response to the invitation is updated through an asynchronous event.
     * @remarks
     * This API sends an invitation to the endpoint specified as input. It does not guarantee that the recipient of the invite is the specific contact that the user  intended to send the invite to. To ensure that the invitation is sent to the correct contact use <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabasyncinvitecontact">PeerCollabAsyncInviteContact</a>.
     * 
     * A toast will appear for the recipient of the invitation. This toast will be converted to a dialog box in which the user can accept or decline the invitation. When the invitation is successfully accepted, the collaborative application is launched on the recipient's machine.
     * 
     * 
     * To successfully receive the invitation, the application must be registered on the recipient's machine using <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabregisterapplication">PeerCollabRegisterApplication</a>. It is also possible for the sender of the invite to have  failure codes returned because the recipient has turned off application invites.
     * 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabgetinvitationresponse">PeerCollabGetInvitiationResponse</a> function will return PEER_E_CONNECTION_FAILED if the endpoint to which the invitation is being sent is not accepting invitations.
     * 
     * 
     * 
     * If the recipient is accepting invitations only from trusted contacts, then the sender of the invite must be added to the contact store of the recipient machine. The sender must be added to the contact store before the invitation attempt. To add a contact to the contact store, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabaddcontact">PeerCollabAddContact</a>.
     * @param {Pointer<PEER_ENDPOINT>} pcEndpoint Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains information about the invited peer. This peer is sent an invitation when this API is called.
     * 
     * This parameter must not be set to <b>NULL</b>.
     * @param {Pointer<PEER_INVITATION>} pcInvitation Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_invitation">PEER_INVITATION</a> structure that contains the invitation request to send to the endpoint  specified in <i>pcEndpoint</i>. E_INVALIDARG is returned if this parameter is set to <b>NULL</b>.
     * @param {HANDLE} hEvent Handle to the event for this invitation, created by a previous call to CreateEvent. The event is signaled when the status of the asynchronous invitation is updated. To obtain the response data, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabgetinvitationresponse">PeerCollabGetInvitationResponse</a>.
     * 
     * If the event is not provided, the caller must poll for the result by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabgetinvitationresponse">PeerCollabGetInvitationResponse</a>.
     * @returns {HANDLE} A pointer to a handle to the sent invitation. If this parameter is <b>NULL</b>, the framework will cleanup the response information after the invitation response is received. If this parameter is not <b>NULL</b>, the handle must be closed by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabclosehandle">PeerCollabCloseHandle</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabasyncinviteendpoint
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabAsyncInviteEndpoint(pcEndpoint, pcInvitation, hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        phInvitation := HANDLE()
        result := DllCall("P2P.dll\PeerCollabAsyncInviteEndpoint", "ptr", pcEndpoint, "ptr", pcInvitation, "ptr", hEvent, "ptr", phInvitation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phInvitation
    }

    /**
     * Sends an invitation to a specified peer endpoint to join the sender's peer collaboration activity. This call is synchronous and, if successful, obtains a response from the peer endpoint.
     * @remarks
     * This API sends an invitation to the endpoint specified as input. It does not guarantee that the recipient of the invite is the specific contact that the user  intended to send the invite to. To ensure that the invitation is sent to the correct contact, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabinvitecontact">PeerCollabInviteContact</a>.
     * 
     * A toast will appear for the recipient of the invitation. This toast will be converted to a dialog box in which the user can accept or decline the invitation. When the invitation is successfully accepted, the collaborative application is launched on the recipient's machine.
     * 
     * 
     * To successfully receive the invitation, the application must be registered on the recipient's machine using <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabregisterapplication">PeerCollabRegisterApplication</a>. It is also possible for the sender of the invite to have  failure codes returned because the recipient has turned off application invites.
     * 
     * 
     * The recipient of the invitation must respond within 5 minutes to avoid timeout.
     * @param {Pointer<PEER_ENDPOINT>} pcEndpoint Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains information about the invited peer. This peer is sent an invitation when this API is called.
     * 
     * This parameter must not be set to <b>NULL</b>.
     * @param {Pointer<PEER_INVITATION>} pcInvitation Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_invitation">PEER_INVITATION</a> structure that contains the invitation request to send to the endpoint  specified in <i>pcEndpoint</i>. This parameter must not be set to <b>NULL</b>.
     * @returns {Pointer<PEER_INVITATION_RESPONSE>} Pointer to a   <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_invitation_response">PEER_INVITATION_RESPONSE</a> structure that receives an invited peer endpoint's responses to the invitation request.
     * 
     * If this call fails with an error, on output this parameter will be <b>NULL</b>.
     * 
     * Free the memory associated with this structure by pass it to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabinviteendpoint
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabInviteEndpoint(pcEndpoint, pcInvitation) {
        result := DllCall("P2P.dll\PeerCollabInviteEndpoint", "ptr", pcEndpoint, "ptr", pcInvitation, "ptr*", &ppResponse := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppResponse
    }

    /**
     * Obtains the peer application launch information, including the contact name, the peer endpoint, and the invitation request.
     * @remarks
     * When an application invite is accepted, the application is launched with  the information sent as part of the application invite. This information can be obtained by calling <b>PeerCollabGetAppLaunchInfo</b>.
     * @returns {Pointer<PEER_APP_LAUNCH_INFO>} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_app_launch_info">PEER_APP_LAUNCH_INFO</a> structure that receives the peer application launch data.
     * 
     * Free the memory associated with this structure by passing it to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabgetapplaunchinfo
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabGetAppLaunchInfo() {
        result := DllCall("P2P.dll\PeerCollabGetAppLaunchInfo", "ptr*", &ppLaunchInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppLaunchInfo
    }

    /**
     * Registers an application with the local computer so that it can be launched in a peer collaboration activity.
     * @remarks
     * An <i>application</i> is a set of software or software  features available on the peer's endpoint. Commonly, this refers to software packages that support peer networking activities, like games or other collaborative applications.
     * 
     * The collaboration infrastructure can receive application invites from trusted contacts or from "People Near Me", which are based on the scope the collaboration infrastructure is signed in with using PeerCollabSignin.
     * 
     * A peer's application has a GUID representing a single specific application. When an application is registered for a peer, this GUID and the corresponding application can be made available to all trusted contacts of the peer, indicating the activities the peer can participate in. To unregister a peer's application, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabunregisterapplication">PeerCollabUnregisterApplication</a> with this GUID.
     * 
     * When registering an application, it is recommended that developers specify a relative path, such as <b>%ProgramFiles%</b>, instead of an absolute path. This prevents application failure due to a change in the location of application files. For example, if the <b>C:\ProgramFiles</b> directory is moved to <b>E:\\</b>. 
     * 
     * Only applications that are local to the machine can be registered. It is not possible to register when an application's executable path is located on a network share like a UNC path or locally-mapped network drive.
     * 
     * Applications can be registered in  the 'ALL_USERS' and 'CURRENT_USER' scopes. In the event an application is registered in both  scopes simultaneously, an application registered in 'CURRENT_USER' scope takes precedence over an application registered in 'ALL_USERS' scope.
     * It is important to note that to register for the registration type of 'ALL_USERS' the caller must be operating with administrative privileges.
     * 
     * The maximum number of applications that can be registered for a specific <i>registrationType</i> is 64.
     * @param {Pointer<PEER_APPLICATION_REGISTRATION_INFO>} pcApplication Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_application_registration_info">PEER_APPLICATION_REGISTRATION_INFO</a> structure that contains the UUID of the peer's application feature set as well as any additional peer-specific data.
     * @param {Integer} registrationType A <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_application_registration_type">PEER_APPLICATION_REGISTRATION_TYPE</a> value that describes whether the peer's application is registered to the <b>current user</b> or <b>all users</b> of the peer's machine.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
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
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabregisterapplication
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabRegisterApplication(pcApplication, registrationType) {
        result := DllCall("P2P.dll\PeerCollabRegisterApplication", "ptr", pcApplication, "int", registrationType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Unregisters the specific applications of a peer from the local computer.
     * @remarks
     * An <i>application</i> is a set of software or software  features available on the peer's endpoint. Commonly, this refers to software packages that support peer networking activities, like games or other collaborative applications.
     * 
     * The collaboration infrastructure can receive application invites from trusted contacts or from "People Near Me", which are based on what scope the collaboration infrastructure is signed in with using PeerCollabSignin.
     * 
     * A peer's application has a GUID representing a single specific application. When application is registered for a peer, this GUID and the corresponding application can be made available to all trusted contacts of the peer, indicating the activities the peer can participate in. To unregister a peer's application, call <b>PeerCollabUnregisterApplication</b> with this GUID.
     * 
     * To unregister the application for all users, the caller of this API must be elevated.
     * @param {Pointer<Guid>} pApplicationId Pointer to the GUID value that represents a particular peer's application.
     * @param {Integer} registrationType A <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_application_registration_type">PEER_APPLICATION_REGISTRATION_TYPE</a> value that describes whether the peer's application is deregistered for the current user or all users of the peer's machine.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
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
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application  requested to unregister was not registered for the given <i>registrationType.</i>
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabunregisterapplication
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabUnregisterApplication(pApplicationId, registrationType) {
        result := DllCall("P2P.dll\PeerCollabUnregisterApplication", "ptr", pApplicationId, "int", registrationType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Obtains application-specific registration information.
     * @remarks
     * An <i>application</i> is a set of software or software  features available on the peer's endpoint. Commonly, this refers to software packages that support peer networking activities, like games or other collaborative applications.
     * 
     * A peer's application has a GUID representing a single application. When an application is registered for a peer, this GUID and the corresponding application can be made available to all trusted contacts of the peer, indicating the activities the peer can participate in. To unregister a peer's application, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabunregisterapplication">PeerCollabUnregisterApplication</a> with this GUID.
     * @param {Pointer<Guid>} pApplicationId Pointer to the GUID value that represents a particular peer's application registration flags.
     * @param {Integer} registrationType A <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_application_registration_type">PEER_APPLICATION_REGISTRATION_TYPE</a> enumeration value that describes whether the peer's application is registered to the current user or all users of the local machine.
     * @returns {Pointer<PEER_APPLICATION_REGISTRATION_INFO>} Pointer to the address of a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_application_registration_info">PEER_APPLICATION_REGISTRATION_INFO</a> structure that contains the information about a peer's specific registered application. The data returned in this parameter can be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabgetapplicationregistrationinfo
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabGetApplicationRegistrationInfo(pApplicationId, registrationType) {
        result := DllCall("P2P.dll\PeerCollabGetApplicationRegistrationInfo", "ptr", pApplicationId, "int", registrationType, "ptr*", &ppApplication := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppApplication
    }

    /**
     * Obtains the enumeration handle used to retrieve peer application information.
     * @remarks
     * To obtain the individual peer applications, pass the returned handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a>. An array of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_application_registration_info">PEER_APPLICATION_REGISTRATION_INFO</a> structures will be returned. To close the enumeration and release the resources associated with it, pass this handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerendenumeration">PeerEndEnumeration</a>. Individual items returned by the enumeration must be released with <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * 
     * An <i>application</i> is a set of software or software  features available on the peer's endpoint. Commonly, this refers to software packages that support peer networking activities, like games or other collaborative applications.
     * 
     * A peer's application has a GUID representing a single specific application. When an application is registered for a peer, this GUID and the corresponding application can be made available to all trusted contacts of the peer, indicating the activities the peer can participate in. To unregister a peer's application, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabunregisterapplication">PeerCollabUnregisterApplication</a> with this GUID.
     * 
     * Peer application registration information items are returned as individual <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_application_registration_info">PEER_APPLICATION_REGISTRATION_INFO</a> structures.
     * @param {Integer} registrationType A <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_application_registration_type">PEER_APPLICATION_REGISTRATION_TYPE</a> value that specifies whether the peer's application is registered to the <b>current user</b> or <b>all users</b> of the peer's machine.
     * @returns {Pointer<Void>} Pointer to a peer enumeration handle for the peer application registration information. This data is obtained by passing this handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabenumapplicationregistrationinfo
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabEnumApplicationRegistrationInfo(registrationType) {
        result := DllCall("P2P.dll\PeerCollabEnumApplicationRegistrationInfo", "int", registrationType, "ptr*", &phPeerEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEnum
    }

    /**
     * Retrieves the presence information for the endpoint associated with a specific contact.
     * @remarks
     * To obtain a peer object successfully:<ul>
     * <li>The endpoint must have been previously obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabenumendpoints">PeerCollabEnumEndpoints</a>.
     * </li>
     * <li>The local peer must have subscribed to the endpoint by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabsubscribeendpointdata">PeerCollabSubscribeEndpointData</a>.</li>
     * <li>The endpoint data must be refreshed by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabrefreshendpointdata">PeerCollabRefreshEndpointData</a> successfully.</li>
     * </ul>
     * @param {Pointer<PEER_ENDPOINT>} pcEndpoint Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains the specific endpoint associated with the contact specified in <i>pcContact</i> for which presence information must be returned.
     * @returns {Pointer<PEER_PRESENCE_INFO>} Pointer  to the address of the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_presence_info">PEER_PRESENCE_INFO</a> structure that contains the requested presence data for the supplied endpoint.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabgetpresenceinfo
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabGetPresenceInfo(pcEndpoint) {
        result := DllCall("P2P.dll\PeerCollabGetPresenceInfo", "ptr", pcEndpoint, "ptr*", &ppPresenceInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppPresenceInfo
    }

    /**
     * Returns the handle to an enumeration that contains the applications registered to a specific peer's endpoint(s).
     * @remarks
     * In order to enumerate the applications for the specified endpoint  successfully, application data must be available on the endpoint. For application data to be available, one of the following must occur:<ul>
     * <li>The endpoint must have been previously obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabenumendpoints">PeerCollabEnumEndpoints</a>.
     * </li>
     * <li>The local peer must have subscribed to the endpoint by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabsubscribeendpointdata">PeerCollabSubscribeEndpointData</a>.</li>
     * <li>The endpoint data must be refreshed by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabrefreshendpointdata">PeerCollabRefreshEndpointData</a> successfully.</li>
     * </ul>
     * 
     * 
     * To obtain the individual peer applications, pass the returned handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a>. To close the enumeration and release the resources associated with it, pass this handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerendenumeration">PeerEndEnumeration</a>. Individual items returned by the enumeration must be released with <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * 
     * Peer application data items are returned as individual <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_application">PEER_APPLICATION</a> structures.
     * 
     * The <b>PeerCollabEnumApplications</b> function returns an empty array for endpoints on the subnet that are not trusted contacts.
     * @param {Pointer<PEER_ENDPOINT>} pcEndpoint Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains the endpoint information for a peer whose applications will be enumerated. 
     * 
     * If this parameter is set to <b>NULL</b>, the published application information for the local peer's endpoint is enumerated.
     * @param {Pointer<Guid>} pApplicationId Pointer to the GUID value that uniquely identifies a particular application of the supplied peer. If this parameter is supplied, the only peer application returned is the one that matches this GUID.
     * @returns {Pointer<Void>} Pointer to the handle for the enumerated set of registered applications that correspond to the GUID returned in <i>pObjectId</i>. Pass this handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a> to obtain each item in the enumerated set.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabenumapplications
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabEnumApplications(pcEndpoint, pApplicationId) {
        result := DllCall("P2P.dll\PeerCollabEnumApplications", "ptr", pcEndpoint, "ptr", pApplicationId, "ptr*", &phPeerEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEnum
    }

    /**
     * Returns the handle to an enumeration that contains the peer objects associated with a specific peer's endpoint.
     * @remarks
     * Peer objects are run-time data items associated with a particular application, such as a picture, an avatar, a certificate, or a specific description. Each peer object must be smaller than 16K in size.
     * 
     * <b>PeerCollabEnumObjects</b> will return all of the objects published for the local peer. The objects can be published by more than one application.
     * 
     * To obtain the individual peer objects, pass the returned handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a>. The peer objects are returned as an array of pointers to the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_object">PEER_OBJECT</a> structures. If the endpoint is not publishing any objects, an empty array will be returned. To close the enumeration and release the resources associated with it, pass this handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerendenumeration">PeerEndEnumeration</a>. Individual items returned by the enumeration must be released with <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * 
     * To obtain a peer object successfully:<ul>
     * <li>The endpoint must have been previously obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabenumendpoints">PeerCollabEnumEndpoints</a>.
     * </li>
     * <li>The local peer must have subscribed to the endpoint by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabsubscribeendpointdata">PeerCollabSubscribeEndpointData</a>.</li>
     * <li>The endpoint data must be refreshed by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabrefreshendpointdata">PeerCollabRefreshEndpointData</a> successfully.</li>
     * </ul>
     * 
     * 
     * If the user is publishing a picture, the picture can be obtained by retrieving the corresponding object. The GUID for the picture object is PEER_COLLAB_OBJECTID_USER_PICTURE.
     * @param {Pointer<PEER_ENDPOINT>} pcEndpoint Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains the endpoint information for a peer whose objects will be enumerated. 
     * 
     * If this parameter is <b>NULL</b> the published objects of the  local peer's contacts are returned.
     * @param {Pointer<Guid>} pObjectId Pointer to a GUID value that uniquely identifies a peer object with the supplied peer. If this parameter is supplied, the only peer object returned is the one that matches this GUID.
     * @returns {Pointer<Void>} Pointer to the handle for the enumerated set of peer objects that correspond to the GUID returned in <i>pObjectId</i>. Pass this handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a> to obtain each item in the enumerated set.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabenumobjects
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabEnumObjects(pcEndpoint, pObjectId) {
        result := DllCall("P2P.dll\PeerCollabEnumObjects", "ptr", pcEndpoint, "ptr", pObjectId, "ptr*", &phPeerEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEnum
    }

    /**
     * Returns the handle to an enumeration that contains the endpoints associated with a specific peer contact.
     * @remarks
     * It is recommended that a contact record is updated using <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabupdatecontact">PeerCollabUpdateContact</a> prior to calling <b>PeerCollabEnumEndpoints</b>. Failure to do so can result in a return of E_INVALIDARG.
     * 
     * Endpoints will be available only for contacts with <i>fWatch</i> set to <b>true</b>.  Only endpoints that have the "Me" contact of the calling peer saved as a trusted contact and have <i>WatcherPermissions</i> set to <b>allow</b> will be available.  A contact must also be signed-in to the internet. In the event the contact is not signed-in, the error <b>E_INVALIDARG</b> will be returned.
     * 
     * To obtain the individual peer endpoints, pass the returned handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a>. An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structures will be returned. If no endpoints are available, an empty array will be returned. To close the enumeration and release the resources associated with it, pass this handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerendenumeration">PeerEndEnumeration</a>. Individual items returned by the enumeration must be released with <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * 
     * The limit for connections to a single contact is 50.
     * @param {Pointer<PEER_CONTACT>} pcContact Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure that contains the contact information for a specific peer. This parameter must not be <b>NULL</b>.
     * @returns {Pointer<Void>} Pointer to a handle for the enumerated set of endpoints that are associated with the supplied peer contact. Pass this handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a> to obtain each item in the enumerated set.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabenumendpoints
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabEnumEndpoints(pcContact) {
        result := DllCall("P2P.dll\PeerCollabEnumEndpoints", "ptr", pcContact, "ptr*", &phPeerEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEnum
    }

    /**
     * Updates the calling peer node with new endpoint data.
     * @remarks
     * <b>PeerCollabRefreshEndpointData</b> allows an application to refresh data associated with the endpoint. Upon completion of the API, the PEER_EVENT_REQUEST_STATUS_CHANGED event will be raised. The event will contain a success or failure code. 
     * 
     * On success, the application can call functions like <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabgetpresenceinfo">PeerCollabGetPresenceInfo</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabenumapplications">PeerCollabEnumApplications</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabenumobjects">PeerCollabEnumObjects</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabquerycontactdata">PeerCollabQueryContactData</a> to obtain additional data.
     * When the data is no longer needed it can be deleted by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabdeleteendpointdata">PeerCollabDeleteEndpointData</a>. 
     * 
     * If a peer is subscribed to the endpoint, the subscribed data takes higher precedence than the data that was  cached by calling PeerCollabRefreshEndpointDataand will return <b>PEER_EVENT_REQUEST_STATUS_CHANGED</b>.
     * 
     * The <b>PeerCollabRefreshEndpointData</b> API takes a snapshot of the data for the specified endpoint. If endpoint data changes  after this snapshot is taken, the caller will have a stale copy of the data. If PeerCollabRefreshEndpointData is called by an application multiple times for the same endpoint, the latest data received replaces the data stored from an earlier call to the API. However, in order to ensure that the caller is notified of any changes and always has the latest copy, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabsubscribeendpointdata">PeerCollabSubscribeEndpointData</a> is recommended instead of <b>PeerCollabRefreshEndpointData</b>.
     * 
     * The <b>PeerCollabRefreshEndpointData</b> function will timeout at 30 seconds.
     * @param {Pointer<PEER_ENDPOINT>} pcEndpoint Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains the updated peer endpoint information for the current peer node.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
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
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabrefreshendpointdata
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabRefreshEndpointData(pcEndpoint) {
        result := DllCall("P2P.dll\PeerCollabRefreshEndpointData", "ptr", pcEndpoint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deletes the peer endpoint data on the calling peer node that matches the supplied endpoint data.
     * @remarks
     * The function <b>PeerCollabDeleteEndpointData</b> is used to remove cached endpoint data previously retrieved by  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabrefreshendpointdata">PeerCollabRefreshEndpointData</a> when it is no longer required. Any data obtained through <b>PeerCollabRefreshEndpointData</b> remains in memory until <b>PeerCollabDeleteEndpointData</b> is called.
     * @param {Pointer<PEER_ENDPOINT>} pcEndpoint Pointer to a [PEER_ENDPOINT](./ns-p2p-peer_endpoint.md) structure that contains the peer endpoint information to delete from the current peer node.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
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
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabdeleteendpointdata
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabDeleteEndpointData(pcEndpoint) {
        result := DllCall("P2P.dll\PeerCollabDeleteEndpointData", "ptr", pcEndpoint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the contact information for the supplied peer endpoint.
     * @remarks
     * To retrieve contact data for an endpoint  successfully, one of the following must occur:<ul>
     * <li>The endpoint must have been previously obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabenumendpoints">PeerCollabEnumEndpoints</a>.
     * </li>
     * <li>The local peer must have subscribed to the endpoint by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabsubscribeendpointdata">PeerCollabSubscribeEndpointData</a>.</li>
     * <li>The endpoint data must be refreshed by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabrefreshendpointdata">PeerCollabRefreshEndpointData</a> successfully.</li>
     * </ul>
     * @param {Pointer<PEER_ENDPOINT>} pcEndpoint Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains the peer endpoint about which to obtain contact information. 
     * 
     * If this parameter is set to <b>NULL</b>, the contact information for the current peer endpoint is obtained.
     * @returns {PWSTR} Pointer to a zero-terminated Unicode string buffer that contains the contact data for the endpoint supplied in <i>pcEndpoint</i>. Call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a> to free the data.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabquerycontactdata
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabQueryContactData(pcEndpoint) {
        result := DllCall("P2P.dll\PeerCollabQueryContactData", "ptr", pcEndpoint, "ptr*", &ppwzContactData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwzContactData
    }

    /**
     * Creates a subscription to an available endpoint.
     * @remarks
     * <b>PeerCollabSubscribeEndpointData</b> is an asynchronous call, meaning that the process to subscribe the endpoint has been started but not necessarily completed when this call returns. An application should wait for PEER_EVENT_REQUEST_STATUS_CHANGED to get the result of the subscription request.
     * 
     * This function will timeout at 30 seconds.
     * 
     * <b>PeerCollabSubscribeEndpointData</b> can be called multiple times from different applications for the same endpoint. Each call is reference counted; only when the last reference is released is a peer unsubscribed. To release the reference call <b>PeerCollabUnsubscribeEndpointData</b>.
     * 
     * When an application exits without calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabunsubscribeendpointdata">PeerCollabUnsubscribeEndpointData</a>, all of the references for that application are released automatically.
     * 
     * To successfully call the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabgetpresenceinfo">PeerCollabGetPresenceInfo</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabenumapplications">PeerCollabEnumApplications</a>, <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabenumobjects">PeerCollabEnumObjects</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabquerycontactdata">PeerCollabQueryContactData</a> APIs, an application must first call <b>PeerCollabSubscribeEndpointData</b>.
     * @param {Pointer<PEER_ENDPOINT>} pcEndpoint Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains the peer endpoint used to obtain presence information.
     * @returns {HRESULT} Returns S_OK or PEER_S_SUBSCRIPTION_EXISTS  if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
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
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows Peer infrastructure is not initialized. Calling the relevant initialization function  is required.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabsubscribeendpointdata
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabSubscribeEndpointData(pcEndpoint) {
        result := DllCall("P2P.dll\PeerCollabSubscribeEndpointData", "ptr", pcEndpoint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes a subscription to an endpoint created with PeerCollabSubscribeEndpointData.
     * @remarks
     * Each call is reference counted. As a result, the peer is unsubscribed only when the last reference is released.
     * 
     * The <b>PeerCollabUnsubscribeEndpointData</b> function will timeout at 30 seconds.
     * @param {Pointer<PEER_ENDPOINT>} pcEndpoint Pointer to a [PEER_ENDPOINT](./ns-p2p-peer_endpoint.md) structure that contains the peer endpoint that is used to remove the subscription.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
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
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows Peer infrastructure is not initialized. Calling the relevant initialization function  is required.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabunsubscribeendpointdata
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabUnsubscribeEndpointData(pcEndpoint) {
        result := DllCall("P2P.dll\PeerCollabUnsubscribeEndpointData", "ptr", pcEndpoint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Updates the caller's presence information to any contacts watching it.
     * @remarks
     * Contacts watching this peer's presence will have a PEER_EVENT_PRESENCE_CHANGED event raised locally that signals this peer's change in presence status. A peer's presence status cannot be set to offline while signed-in. By default,   a peer's presence status is 'online' and the descriptive text is <b>NULL</b> when signing in. 
     * 
     * Any  descriptive text for presence status is limited to 255 Unicode characters.
     * @param {Pointer<PEER_PRESENCE_INFO>} pcPresenceInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_presence_info">PEER_PRESENCE_INFO</a> structure that contains the new presence information to publish for the calling peer application.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
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
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The Windows Peer infrastructure is not initialized. Calling the relevant initialization function  is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_SIGNED_IN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation requires the user to be signed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabsetpresenceinfo
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabSetPresenceInfo(pcPresenceInfo) {
        result := DllCall("P2P.dll\PeerCollabSetPresenceInfo", "ptr", pcPresenceInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the name of the current endpoint of the calling peer, as previously set by a call to PeerCollabSetEndpointName.
     * @remarks
     * The endpoint name is limited to 25 Unicode characters. To free this data call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @returns {PWSTR} Pointer to a zero-terminated Unicode string name of the peer endpoint currently used by the calling application.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabgetendpointname
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabGetEndpointName() {
        result := DllCall("P2P.dll\PeerCollabGetEndpointName", "ptr*", &ppwzEndpointName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwzEndpointName
    }

    /**
     * Sets the name of the current endpoint used by the peer application.
     * @remarks
     * An endpoint name is set to the machine name by default. However, a new endpoint name set by the <b>PeerCollabSetEndpointName</b> function will persist across reboots.
     * @param {PWSTR} pwzEndpointName Pointer to the new name of the current endpoint, represented as a zero-terminated Unicode string. An error is raised if the new name is the same as the current one. An endpoint name is limited to 255 Unicode characters.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
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
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_SIGNED_IN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation requires the user to be signed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabsetendpointname
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabSetEndpointName(pwzEndpointName) {
        pwzEndpointName := pwzEndpointName is String ? StrPtr(pwzEndpointName) : pwzEndpointName

        result := DllCall("P2P.dll\PeerCollabSetEndpointName", "ptr", pwzEndpointName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates or updates a peer data object used in a peer collaboration network.
     * @remarks
     * Peer objects are run-time data items associated with a particular application, such as a picture, an avatar, a certificate, or a specific description. Each peer object must be smaller than 16K in size and cannot be 0.
     * 
     * If an object is already published, <b>PeerCollabSetObject</b> will update the existing   object data.
     * The last application that updates the object will take ownership of the object. As a result, if  the application is terminated the object is deleted.
     * 
     * If an object's 'published' status is removed due to sign-out rather than the closure of the associated application, the application is responsible for publishing the object the next time the user signs on.
     * 
     * 
     * Trusted contacts watching this peer object will have a <b>PEER_EVENT_OBJECT_CHANGED</b> event raised locally, signaling this peer object's change in status.
     * 
     * <b>PeerCollabSetObject</b> can be used to publish at most 128 objects.
     * 
     * There is one object with a given <i>GUID</i> published at any given time.
     * @param {Pointer<PEER_OBJECT>} pcObject Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_object">PEER_OBJECT</a> structure that contains the peer object on the peer collaboration network.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
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
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows Peer infrastructure is not initialized. Calling the relevant initialization function  is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_SIGNED_IN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation requires the user to be signed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabsetobject
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabSetObject(pcObject) {
        result := DllCall("P2P.dll\PeerCollabSetObject", "ptr", pcObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deletes a peer object from the calling endpoint.
     * @remarks
     * Peer objects are run-time data items associated with a particular application, such as a picture, an avatar, a certificate, or a specific description. Each peer object must be smaller than 3216K in size.
     * 
     * Trusted contacts watching this peer object and the subscriber of the "Me" contact will have a PEER_EVENT_OBJECT_CHANGED event raised, signaling this peer object's change in status. PEER_EVENT_MY_OBJECT_CHANGED will be raised locally.
     * 
     * Pre-defined objects, like Picture objects, cannot be deleted by calling this API.
     * @param {Pointer<Guid>} pObjectId Pointer to a GUID value that uniquely identifies the peer object to delete from the calling endpoint.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
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
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows Peer infrastructure is not initialized. Calling the relevant initialization function  is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_SIGNED_IN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation requires the user to be signed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabdeleteobject
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabDeleteObject(pObjectId) {
        result := DllCall("P2P.dll\PeerCollabDeleteObject", "ptr", pObjectId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers an application with the peer collaboration infrastructure to receive callbacks for specific peer collaboration events.
     * @remarks
     * If the p2phost.exe service is not running, this function will attempt to launch it for registrations that require p2phost. 
     * 
     * If attempt is made to launch p2phost.exe from an elevated process, an error is returned. As a result, security cannot be compromised by an application mistakenly granting administrative privileges   to p2phost.exe. It is not possible to launch p2phost.exe in a non-interactive mode, as it needs to display Windows dialog boxes for incoming invites.
     * 
     * When <b>PeerCollabRegisterEvent</b> is called on machines under heavy stress, the function may return  the PEER_E_SERVICE_NOT_AVAILABLE error code.
     * 
     * An application can call <b>PeerCollabRegisterEvent</b> multiple times, where each call is   considered to be a separate registration. When an event is registered multiple times, each registration  receives a  copy of the event.
     * @param {HANDLE} hEvent Handle created by CreateEvent that the application is signaled on  when an event is triggered.  When an application is signaled, it must call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabgeteventdata">PeerCollabGetEventData</a> to retrieve events until PEER_S_NO_EVENT_DATA is returned.
     * @param {Integer} cEventRegistration The number of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_collab_event_registration">PEER_COLLAB_EVENT_REGISTRATION</a> structures in <i>pEventRegistrations</i>.
     * @param {Pointer<PEER_COLLAB_EVENT_REGISTRATION>} pEventRegistrations An array of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_collab_event_registration">PEER_COLLAB_EVENT_REGISTRATION</a> structures that specify the peer collaboration events for which the application requests notification.
     * @returns {Pointer<Void>} The peer event handle returned by this function. This handle is passed to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabgeteventdata">PeerCollabGetEventData</a> when a peer collaboration network event is raised on the peer.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabregisterevent
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabRegisterEvent(hEvent, cEventRegistration, pEventRegistrations) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := DllCall("P2P.dll\PeerCollabRegisterEvent", "ptr", hEvent, "uint", cEventRegistration, "ptr", pEventRegistrations, "ptr*", &phPeerEvent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEvent
    }

    /**
     * Obtains the data associated with a peer collaboration event raised on the peer.
     * @param {Pointer<Void>} hPeerEvent The peer collaboration network event handle obtained by a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabregisterevent">PeerCollabRegisterEvent</a>.
     * @returns {Pointer<PEER_COLLAB_EVENT_DATA>} Pointer to a list of [PEER_COLLAB_EVENT_DATA](/windows/win32/api/p2p/ns-p2p-peer_collab_event_data-r1) structures that contain data about the peer collaboration network event. These data structures must be freed after use by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabgeteventdata
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabGetEventData(hPeerEvent) {
        hPeerEventMarshal := hPeerEvent is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerCollabGetEventData", hPeerEventMarshal, hPeerEvent, "ptr*", &ppEventData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppEventData
    }

    /**
     * Deregisters an application from notification about specific peer collaboration events.
     * @param {Pointer<Void>} hPeerEvent Handle to the peer collaboration event the peer application will deregister. This handle is obtained with a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabregisterevent">PeerCollabRegisterEvent</a>.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
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
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabunregisterevent
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabUnregisterEvent(hPeerEvent) {
        hPeerEventMarshal := hPeerEvent is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerCollabUnregisterEvent", hPeerEventMarshal, hPeerEvent, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns a handle to an enumerated set that contains all of the peer collaboration network &quot;people near me&quot; endpoints currently available on the subnet of the calling peer.
     * @remarks
     * To obtain the individual peer "people near me" contacts, pass the returned handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergetnextitem">PeerGetNextItem</a>. An array of pointers to the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_people_near_me">PEER_PEOPLE_NEAR_ME</a> structures are returned. To close the enumeration and release the resources associated with it, pass this handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerendenumeration">PeerEndEnumeration</a>. Individual items returned by the enumeration must be released with <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @returns {Pointer<Void>} Pointer to a handle of an enumerated set that contains all of the peer collaboration network "people near me" endpoints currently available on the subnet of the calling peer.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabenumpeoplenearme
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabEnumPeopleNearMe() {
        result := DllCall("P2P.dll\PeerCollabEnumPeopleNearMe", "ptr*", &phPeerEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEnum
    }

    /**
     * Adds a contact to the contact list of a peer.
     * @param {PWSTR} pwzContactData Pointer to a zero-terminated Unicode string buffer that contains the contact data for the peer that is added to the contact list. This string buffer can either be obtained by passing the peer name of the endpoint to add as a contact to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabquerycontactdata">PeerCollabQueryContactData</a>, or through an out-of-band mechanism. 
     * 
     * To  send its own contact data out-of-band, the peer can call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabexportcontact">PeerCollabExportContact</a> with a <b>NULL</b> peer name. This function returns the contact data in XML format.
     * @returns {Pointer<PEER_CONTACT>} Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure. This parameter receives the address of a <b>PEER_CONTACT</b> structure containing peer contact information for the contact supplied in <i>pwzContactData</i>. This parameter may be <b>NULL</b>. 
     * 
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a> on the address of the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure to free this data.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabaddcontact
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabAddContact(pwzContactData) {
        pwzContactData := pwzContactData is String ? StrPtr(pwzContactData) : pwzContactData

        result := DllCall("P2P.dll\PeerCollabAddContact", "ptr", pwzContactData, "ptr*", &ppContact := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppContact
    }

    /**
     * Deletes a contact from the local contact store associated with the caller.
     * @remarks
     * Once a contact is deleted using <b>PeerCollabDeleteContact</b>, the presence updates  provided by a subscription will no longer be available for that contact. If the contact is being watched (<i>fWatch</i> is set to <b>TRUE</b>) than PEER_EVENT_WATCHLIST_CHANGED will be raised.
     * @param {PWSTR} pwzPeerName Pointer to a zero-terminated Unicode string that contains the peer name of the contact to delete. This parameter must not be <b>NULL</b>. You cannot delete the 'Me' contact.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
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
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabdeletecontact
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabDeleteContact(pwzPeerName) {
        pwzPeerName := pwzPeerName is String ? StrPtr(pwzPeerName) : pwzPeerName

        result := DllCall("P2P.dll\PeerCollabDeleteContact", "ptr", pwzPeerName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Obtains the information for a peer contact given the peer name of the contact.
     * @param {PWSTR} pwzPeerName Pointer to zero-terminated Unicode string that contains the name of the peer contact for which to obtain information. 
     * 
     * If this parameter is <b>NULL</b>, the 'Me' contact information for the calling peer is returned.
     * @returns {Pointer<PEER_CONTACT>} Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure. It receives the address of a PEER_CONTACT structure containing peer contact information for the peer name supplied in <i>pwzPeerName</i>. When this parameter is <b>NULL</b>, this function returns E_INVALIDARG.
     * 
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a> on the address of the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure to free this data.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabgetcontact
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabGetContact(pwzPeerName) {
        pwzPeerName := pwzPeerName is String ? StrPtr(pwzPeerName) : pwzPeerName

        result := DllCall("P2P.dll\PeerCollabGetContact", "ptr", pwzPeerName, "ptr*", &ppContact := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppContact
    }

    /**
     * Updates the information associated with a peer contact specified in the local contact store of the caller.
     * @remarks
     * If the contact provided is the 'Me' contact, only the nickname, display name and email address can be changed. If a nickname is changed for a contact signed in to "People Near Me", the structure  <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_event_people_near_me_changed_data">PEER_EVENT_PEOPLE_NEAR_ME_CHANGED_DATA</a> with <i>changeType</i> of PEER_CHANGE_UPDATED will be raised.
     * 
     * The <b>PeerCollabUpdateContact</b> function will timeout at 30 seconds.
     * @param {Pointer<PEER_CONTACT>} pContact Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure that contains the updated information for a specific peer contact.
     * @returns {HRESULT} Returns S_OK if the function succeeds. Otherwise, the function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough memory to support this operation.
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
     * One of the arguments is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabupdatecontact
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabUpdateContact(pContact) {
        result := DllCall("P2P.dll\PeerCollabUpdateContact", "ptr", pContact, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns a handle to an enumerated set that contains all of the peer collaboration network contacts currently available on the calling peer.
     * @remarks
     * To obtain the individual peer contacts, pass the returned handle to [PEER_CONTACT](./ns-p2p-peer_contact.md) structures will be returned. To close the enumeration and release the resources associated with it, pass this handle to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerendenumeration">PeerEndEnumeration</a>. Individual items returned by the enumeration must be released with <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @returns {Pointer<Void>} Handle to an enumerated set that contains all of the peer collaboration network contacts currently available on the calling peer, excluding the "Me" contact.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabenumcontacts
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabEnumContacts() {
        result := DllCall("P2P.dll\PeerCollabEnumContacts", "ptr*", &phPeerEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phPeerEnum
    }

    /**
     * Exports the contact data associated with a peer name to a string buffer. The buffer contains contact data in XML format.
     * @param {PWSTR} pwzPeerName Pointer to zero-terminated Unicode string that contains the name of the peer contact for which to export. 
     * 
     * If this parameter is <b>NULL</b>, the "Me" contact information for the calling peer is exported.
     * @returns {PWSTR} Pointer to a zero-terminated string buffer that contains peer contact XML data where the peer names match the string supplied in <i>pwzPeerName</i>.  
     * 
     * The memory returned here can be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabexportcontact
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabExportContact(pwzPeerName) {
        pwzPeerName := pwzPeerName is String ? StrPtr(pwzPeerName) : pwzPeerName

        result := DllCall("P2P.dll\PeerCollabExportContact", "ptr", pwzPeerName, "ptr*", &ppwzContactData := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwzContactData
    }

    /**
     * Parses a Unicode string buffer containing contact XML data into a PEER_CONTACT data structure.
     * @param {PWSTR} pwzContactData Pointer to zero-terminated Unicode string buffer that contains XML contact data as returned by functions like <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabquerycontactdata">PeerCollabQueryContactData</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peercollabexportcontact">PeerCollabExportContact</a>.
     * @returns {Pointer<PEER_CONTACT>} Pointer to the address of a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_contact">PEER_CONTACT</a> structure that contain the peer contact information parsed from <i>pwzContactData</i>. Free the memory allocated by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peercollabparsecontact
     * @deprecated 
     * @since windows6.0.6000
     */
    static PeerCollabParseContact(pwzContactData) {
        pwzContactData := pwzContactData is String ? StrPtr(pwzContactData) : pwzContactData

        result := DllCall("P2P.dll\PeerCollabParseContact", "ptr", pwzContactData, "ptr*", &ppContact := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppContact
    }

    /**
     * Encodes the supplied peer name as a format that can be used with a subsequent call to the getaddrinfo Windows Sockets function.
     * @param {PWSTR} pwzPeerName Pointer to a zero-terminated Unicode string that contains the peer name to encode as a host name.
     * @returns {PWSTR} Pointer to the address of the zero-terminated Unicode string that contains the encoded host name. This string can be passed to <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-getaddrinfo">getaddrinfo_v2</a> to obtain network information about the peer.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peernametopeerhostname
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerNameToPeerHostName(pwzPeerName) {
        pwzPeerName := pwzPeerName is String ? StrPtr(pwzPeerName) : pwzPeerName

        result := DllCall("P2P.dll\PeerNameToPeerHostName", "ptr", pwzPeerName, "ptr*", &ppwzHostName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwzHostName
    }

    /**
     * Decodes a host name returned by PeerNameToPeerHostName into the peer name string it represents.
     * @param {PWSTR} pwzHostName Pointer to a zero-terminated Unicode string that contains the host name to decode.
     * @returns {PWSTR} Pointer to the address of the zero-terminated Unicode string that contains the decoded peer name. The returned  string must be released with <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peerhostnametopeername
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerHostNameToPeerName(pwzHostName) {
        pwzHostName := pwzHostName is String ? StrPtr(pwzHostName) : pwzHostName

        result := DllCall("P2P.dll\PeerHostNameToPeerName", "ptr", pwzHostName, "ptr*", &ppwzPeerName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwzPeerName
    }

    /**
     * Starts the Peer Name Resolution Protocol (PNRP) service for the calling peer.
     * @remarks
     * To shutdown the PNRP service for the calling peer and release all resources associated with it, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerpnrpshutdown">PeerPnrpShutdown</a>.
     * @param {Integer} wVersionRequested The version of PNRP to use for this service instance. The default value is PNRP_VERSION (2).
     * @returns {HRESULT} If the function call succeeds, the return value is <b>S_OK</b>. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
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
     * There is not enough memory to perform the specified operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_UNSUPPORTED_VERSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided version is unsupported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_SERVICE_NOT_AVAILABLE </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Peer Collaboration infrastructure, which includes People Near Me, is not available. This code will also be returned whenever an attempt is made to utilize the Collaboration infrastructure from an elevated process.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peerpnrpstartup
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerPnrpStartup(wVersionRequested) {
        result := DllCall("P2P.dll\PeerPnrpStartup", "ushort", wVersionRequested, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Shuts down a running instance of the Peer Name Resolution Protocol (PNRP) service and releases all resources associated with it.
     * @returns {HRESULT} If the function call succeeds, the return value is <b>S_OK</b>. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEER_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows Peer infrastructure is not initialized. Calling the relevant initialization function  is required.
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
     * There is not enough memory to perform the specified operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peerpnrpshutdown
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerPnrpShutdown() {
        result := DllCall("P2P.dll\PeerPnrpShutdown", "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers a peer with a PNRP cloud and returns a handle that can be used for registration updates.
     * @remarks
     * A  handle must be registered in a process separate of the process it will be resolved in. If a handle is registered and resolved within the same process it will not be recognized.
     * 
     * A name cannot be registered with an endpoint more than once. When updates to a registered name are required, use <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerpnrpupdateregistration">PeerPnrpUpdateRegistration</a>.
     * 
     * When <i>pRegistrationInfo</i> is <b>NULL</b>, or PEER_PNRP_AUTO_ADDRESSES is specified for <i>cAddresses</i>, the infrastructure will keep the addresses registered up to date as addresses change or cloud availability changes.
     * @param {PWSTR} pcwzPeerName Pointer to a zero-terminated Unicode string that contains the peer name to register with the PNRP service.
     * @param {Pointer<PEER_PNRP_REGISTRATION_INFO>} pRegistrationInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_pnrp_registration_info">PEER_PNRP_REGISTRATION_INFO</a> structure that contains the endpoint information for the registering peer node. If <b>NULL</b>, the API will register the peer with all known PNRP clouds, and any registered addresses are automatically selected by the infrastructure.
     * @returns {Pointer<Void>} Handle to the  PNRP registration for the calling peer node. Use this handle to update the registration or to deregister with the PNRP service.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peerpnrpregister
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerPnrpRegister(pcwzPeerName, pRegistrationInfo) {
        pcwzPeerName := pcwzPeerName is String ? StrPtr(pcwzPeerName) : pcwzPeerName

        result := DllCall("P2P.dll\PeerPnrpRegister", "ptr", pcwzPeerName, "ptr", pRegistrationInfo, "ptr*", &phRegistration := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phRegistration
    }

    /**
     * Updates the PNRP registration information for a name.
     * @remarks
     * The <b>pwzCloudName</b>  and <b>cAddresses</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_pnrp_registration_info">PEER_PNRP_REGISTRATION_INFO</a> provided in the <i>pRegistrationInfo</i> parameter cannot be changed with PeerPnrpUpdateRegistration. Attempting to do so will return an <b>E_INVALIDARG</b> error.
     * 
     * PeerPnrpUpdateRegistration has a maximum payload of 4k.
     * @param {Pointer<Void>} hRegistration Handle to a PNRP registration for the peer node obtained by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerpnrpregister">PeerPnrpRegister</a>.
     * @param {Pointer<PEER_PNRP_REGISTRATION_INFO>} pRegistrationInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_pnrp_registration_info">PEER_PNRP_REGISTRATION_INFO</a> structure that contains the endpoint information for the registering peer node.
     * @returns {HRESULT} If the function call succeeds, the return value is <b>S_OK</b>. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
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
     * There is not enough memory to perform the specified operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peerpnrpupdateregistration
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerPnrpUpdateRegistration(hRegistration, pRegistrationInfo) {
        hRegistrationMarshal := hRegistration is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerPnrpUpdateRegistration", hRegistrationMarshal, hRegistration, "ptr", pRegistrationInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deregisters a peer from a PNRP cloud.
     * @param {Pointer<Void>} hRegistration Handle to a PNRP registration for the peer node obtained by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerpnrpregister">PeerPnrpRegister</a>.
     * @returns {HRESULT} If the function call succeeds, the return value is <b>S_OK</b>. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
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
     * There is not enough memory to perform the specified operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peerpnrpunregister
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerPnrpUnregister(hRegistration) {
        hRegistrationMarshal := hRegistration is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerPnrpUnregister", hRegistrationMarshal, hRegistration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Obtains the endpoint address(es) registered for a specific peer name.
     * @remarks
     * This call is synchronous and will block until completed. For asynchronous peer name resolution, call <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerpnrpstartresolve">PeerPnrpStartResolve</a> and obtain the resolved endpoint address when the supplied event is raised.
     * 
     * A handle must be resolved in a process separate of the process it was registered in. If a handle is registered and resolved within the same process it will not be recognized.
     * 
     * When  resolution is performed for all clouds, it is issued to each cloud simultaneously. The method will return as soon as it has received enough results from any combination of clouds.
     * 
     * The default resolve timeout used internally by this method is 30 seconds. If a  specific timeout is required,the asynchronous <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerpnrpstartresolve">PeerPnrpStartResolve</a> function should be used.
     * @param {PWSTR} pcwzPeerName Pointer to a zero-terminated string that contains the peer name for which endpoint addresses will be obtained.
     * @param {PWSTR} pcwzCloudName Pointer to a zero-terminated string that contains the name of the PNRP cloud under which to resolve the peer name. If <b>NULL</b>, the resolve is performed in all clouds. If PEER_PNRP_ALL_LINK_CLOUDS, the resolve is performed in all link local clouds. When "GLOBAL_", resolve will only take place in the global cloud.
     * @param {Pointer<Integer>} pcEndpoints The maximum number of endpoints to return in  <i>ppEndpoints</i>. Upon return, this parameter contains the actual number of endpoints in <i>ppEndpoints</i>.
     * @returns {Pointer<PEER_PNRP_ENDPOINT_INFO>} Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_pnrp_endpoint_info">PEER_PNRP_ENDPOINT_INFO</a> structures that contain the endpoints for which the peer name successfully resolved. Each endpoint contains one or more IP addresses at which the peer node can be reached.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peerpnrpresolve
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerPnrpResolve(pcwzPeerName, pcwzCloudName, pcEndpoints) {
        pcwzPeerName := pcwzPeerName is String ? StrPtr(pcwzPeerName) : pcwzPeerName
        pcwzCloudName := pcwzCloudName is String ? StrPtr(pcwzCloudName) : pcwzCloudName

        pcEndpointsMarshal := pcEndpoints is VarRef ? "uint*" : "ptr"

        result := DllCall("P2P.dll\PeerPnrpResolve", "ptr", pcwzPeerName, "ptr", pcwzCloudName, pcEndpointsMarshal, pcEndpoints, "ptr*", &ppEndpoints := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppEndpoints
    }

    /**
     * Starts an asynchronous peer name resolution operation.
     * @remarks
     * <b>PeerPnrpStartResolve</b> creates a handle to an asynchronous peer name resolution operation. 
     * 
     * Whenever an endpoint is found, the event handle provided in <i>hEvent</i> is signaled, and <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerpnrpgetendpoint">PeerPnrpGetEndpoint</a> must be called with the <i>phResolve</i> handle by the application to obtain that endpoint.
     * 
     * The last event specifies the PEER_E_NO_MORE error code, indicating that all endpoints corresponding to the peer name supplied to <b>PeerPnrpStartResolve</b> have been found. At this time, the application must close the handle with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerpnrpendresolve">PeerPnrpEndResolve</a>.
     * 
     * A handle must be resolved in a process separate from the process in which it was registered. If a handle is registered and resolved within the same process it will not be recognized.
     * @param {PWSTR} pcwzPeerName Pointer to a zero-terminated string that contains the peer name for which endpoint addresses will be obtained.
     * @param {PWSTR} pcwzCloudName Pointer to a zero-terminated string that contains the name of the PNRP cloud under which to resolve the peer name. If <b>NULL</b>, resolution is performed for all clouds. If PEER_PNRP_ALL_LINK_CLOUDS, resolution is performed for all link local clouds. When "GLOBAL_" is specified, resolution takes place in the global cloud.
     * @param {Integer} cMaxEndpoints The maximum number of endpoints to return for the peer name.
     * @param {HANDLE} hEvent Handle to the event signaled when a peer endpoint is resolved for the supplied peer name and are ready for consumption by calling PeerPnrpGetEndpoint. This event is signaled for every endpoint discovered by the PNRP service. If PEER_NO_MORE is returned by a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerpnrpgetendpoint">PeerPnrpGetEndpoint</a>, then all endpoints have been found for that peer.
     * @returns {Pointer<Void>} Handle to this peer name resolution request. This handle must be provided to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerpnrpendresolve">PeerPnrpEndResolve</a> after the resolution events are raised and the endpoints are obtained with corresponding calls to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerpnrpgetendpoint">PeerPnrpGetEndpoint</a>, or if the operation fails.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peerpnrpstartresolve
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerPnrpStartResolve(pcwzPeerName, pcwzCloudName, cMaxEndpoints, hEvent) {
        pcwzPeerName := pcwzPeerName is String ? StrPtr(pcwzPeerName) : pcwzPeerName
        pcwzCloudName := pcwzCloudName is String ? StrPtr(pcwzCloudName) : pcwzCloudName
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := DllCall("P2P.dll\PeerPnrpStartResolve", "ptr", pcwzPeerName, "ptr", pcwzCloudName, "uint", cMaxEndpoints, "ptr", hEvent, "ptr*", &phResolve := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phResolve
    }

    /**
     * Retrieves information on the Peer Name Resolution Protocol (PNRP) clouds in which the calling peer is participating.
     * @param {Pointer<Integer>} pcNumClouds The number of PNRP clouds returned in <i>ppCloudInfo</i>.
     * @param {Pointer<Pointer<PEER_PNRP_CLOUD_INFO>>} ppCloudInfo Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_pnrp_cloud_info">PEER_PNRP_CLOUD_INFO</a> structures that contain information about the PNRP clouds in which the calling peer is participating.
     * 
     * This data returned by this parameter must be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @returns {HRESULT} If the function call succeeds, the return value is <b>S_OK</b>. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
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
     * There is not enough memory to perform the specified operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peerpnrpgetcloudinfo
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerPnrpGetCloudInfo(pcNumClouds, ppCloudInfo) {
        pcNumCloudsMarshal := pcNumClouds is VarRef ? "uint*" : "ptr"
        ppCloudInfoMarshal := ppCloudInfo is VarRef ? "ptr*" : "ptr"

        result := DllCall("P2P.dll\PeerPnrpGetCloudInfo", pcNumCloudsMarshal, pcNumClouds, ppCloudInfoMarshal, ppCloudInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a peer endpoint address resolved during an asynchronous peer name resolution operation.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerpnrpstartresolve">PeerPnrpStartResolve</a> creates a handle to an asynchronous peer name resolution operation. 
     * 
     * Whenever an endpoint is found, the event handle provided in <i>hEvent</i> is signaled, and <b>PeerPnrpGetEndpoint</b> must be called with the <i>phResolve</i> handle by the application to obtain that endpoint.
     * 
     * The last event specifies the PEER_E_NO_MORE error code, indicating that all endpoints corresponding to the peer name supplied to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerpnrpstartresolve">PeerPnrpStartResolve</a> have been found. At this time, the application must close the handle with a call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerpnrpendresolve">PeerPnrpEndResolve</a>.
     * @param {Pointer<Void>} hResolve The handle to the asynchronous peer name resolution operation returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerpnrpstartresolve">PeerPnrpStartResolve</a>.
     * @returns {Pointer<PEER_PNRP_ENDPOINT_INFO>} Pointer to the address of a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_pnrp_endpoint_info">PEER_PNRP_ENDPOINT_INFO</a> structure that contains an endpoint address for the peer name supplied in the previous call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerpnrpstartresolve">PeerPnrpStartResolve</a>.
     * 
     * This data returned by this parameter must be freed by calling <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerfreedata">PeerFreeData</a>.
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peerpnrpgetendpoint
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerPnrpGetEndpoint(hResolve) {
        hResolveMarshal := hResolve is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerPnrpGetEndpoint", hResolveMarshal, hResolve, "ptr*", &ppEndpoint := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppEndpoint
    }

    /**
     * Closes the handle for an asynchronous PNRP resolution operation initiated with a previous call to PeerPnrpStartResolve.
     * @param {Pointer<Void>} hResolve The handle to the asynchronous peer name resolution operation returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerpnrpstartresolve">PeerPnrpStartResolve</a>.
     * @returns {HRESULT} If the function call succeeds, the return value is <b>S_OK</b>. Otherwise, it  returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
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
     * There is not enough memory to perform the specified operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/p2p/nf-p2p-peerpnrpendresolve
     * @deprecated 
     * @since windows5.1.2600
     */
    static PeerPnrpEndResolve(hResolve) {
        hResolveMarshal := hResolve is VarRef ? "ptr" : "ptr"

        result := DllCall("P2P.dll\PeerPnrpEndResolve", hResolveMarshal, hResolve, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * DrtCreatePnrpBootstrapResolver.
     * @remarks
     * The default PNRP Bootstrap Resolver created by this function is specific to the DRT it is created for. As a result it cannot be re-used across multiple DRTs.
     * @param {BOOL} fPublish If <b>TRUE</b>, the PeerName contained in <i>pwzPeerName</i> and passed with the PNRP Bootstrap Resolver is published by the local DRT using PNRP.  This node will be resolvable by other nodes using the PNRP bootstrap provider, and will assist other nodes attempting to bootstrap
     * @param {PWSTR} pwzPeerName The name of the peer to search for in the PNRP cloud. This string has a maximum limit of 137 unicode characters
     * @param {PWSTR} pwzCloudName The name of the cloud to search for in for the DRT corresponding to the MeshName. 
     * 
     * This string has a maximum limit of 256 unicode characters. If left blank the PNRP Bootstrap Provider will use all PNRP clouds available.
     * @param {PWSTR} pwzPublishingIdentity The PeerIdentity that is publishing into the PNRP cloud utilized for bootstrapping. This string has a maximum limit of
     * 137 unicode characters.
     * It is important to note that if <i>fPublish</i> is set to <b>TRUE</b>, the <i>PublishingIdentity</i> must be allowed to publish the PeerName specified.
     * @returns {Pointer<DRT_BOOTSTRAP_PROVIDER>} A pointer to the created PNRP bootstrap resolver which is used in the <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_settings">DRT_SETTINGS</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtcreatepnrpbootstrapresolver
     * @since windows6.1
     */
    static DrtCreatePnrpBootstrapResolver(fPublish, pwzPeerName, pwzCloudName, pwzPublishingIdentity) {
        pwzPeerName := pwzPeerName is String ? StrPtr(pwzPeerName) : pwzPeerName
        pwzCloudName := pwzCloudName is String ? StrPtr(pwzCloudName) : pwzCloudName
        pwzPublishingIdentity := pwzPublishingIdentity is String ? StrPtr(pwzPublishingIdentity) : pwzPublishingIdentity

        result := DllCall("drtprov.dll\DrtCreatePnrpBootstrapResolver", "int", fPublish, "ptr", pwzPeerName, "ptr", pwzCloudName, "ptr", pwzPublishingIdentity, "ptr*", &ppResolver := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppResolver
    }

    /**
     * DrtDeletePnrpBootstrapResolver function deletes a bootstrap resolver based on the Peer Name Resolution Protocol (PNRP).
     * @param {Pointer<DRT_BOOTSTRAP_PROVIDER>} pResolver Pointer to the created PNRP bootstrap resolver to be deleted.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtdeletepnrpbootstrapresolver
     * @since windows6.1
     */
    static DrtDeletePnrpBootstrapResolver(pResolver) {
        DllCall("drtprov.dll\DrtDeletePnrpBootstrapResolver", "ptr", pResolver)
    }

    /**
     * The DrtCreateDnsBootstrapResolver function creates a bootstrap resolver that will use the GetAddrInfo system function to resolve the hostname of a will known node already present in the DRT mesh.
     * @param {Integer} port Specifies the port to which the DRT protocol is bound on the well known node.
     * @param {PWSTR} pwszAddress Specifies the hostname of the well known node.
     * @returns {Pointer<DRT_BOOTSTRAP_PROVIDER>} Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_bootstrap_provider">DRT_BOOTSTRAP_PROVIDER</a> module to be included in the <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_settings">DRT_SETTINGS</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtcreatednsbootstrapresolver
     * @since windows6.1
     */
    static DrtCreateDnsBootstrapResolver(port, pwszAddress) {
        pwszAddress := pwszAddress is String ? StrPtr(pwszAddress) : pwszAddress

        result := DllCall("drtprov.dll\DrtCreateDnsBootstrapResolver", "ushort", port, "ptr", pwszAddress, "ptr*", &ppModule := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppModule
    }

    /**
     * DrtDeleteDnsBootstrapResolver function deletes a DNS Bootstrap Provider instance.
     * @param {Pointer<DRT_BOOTSTRAP_PROVIDER>} pResolver Pointer to a DRT_BOOTSTRAP_PROVIDER instance specifying the security provider to delete.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtdeletednsbootstrapresolver
     * @since windows6.1
     */
    static DrtDeleteDnsBootstrapResolver(pResolver) {
        DllCall("drtprov.dll\DrtDeleteDnsBootstrapResolver", "ptr", pResolver)
    }

    /**
     * DrtCreateIpv6UdpTransport function creates a transport based on the IPv6 UDP protocol.
     * @remarks
     * The default IPv6 UDP Transport  created by this function is specific to the DRT it is created for. As a result it cannot be re-used across multiple DRTs.
     * 
     * When using the Distributed Routing Table API in Windows XP with Service Pack 2 (SP2), support of the IPv6 protocol must be enabled for the creation of a transport using <b>DrtCreateIpv6UdpTransport</b> to be successful.
     * @param {Integer} scope The <b>DRT_SCOPE</b> enumeration that specifies the IPv6 scope in which the DRT is to  operate.
     * @param {Integer} dwScopeId The identifier that uniquely specifies the interface the scope is associated with.
     * 
     * For the Global scope this parameter is always the "GLOBAL_" ID and is optional when using only the global scope.
     * For the link local scope, this parameter represents the interface associated with the Network Interface Card on which the link local scope exists.
     * @param {Integer} dwLocalityThreshold The identifier that specifies how Locality information based on IpV6 addresses is used when caching neighbors.  By default, the DRT gives preference to neighbors that have an IPv6 address with a prefix in common with the local machine.
     * @param {Pointer<Integer>} pwPort Pointer to the port utilized by the local DRT instance.
     * @returns {Pointer<Void>} Pointer to a DRT transport handle specified in the <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_settings">DRT_SETTINGS</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtcreateipv6udptransport
     * @since windows6.1
     */
    static DrtCreateIpv6UdpTransport(scope, dwScopeId, dwLocalityThreshold, pwPort) {
        pwPortMarshal := pwPort is VarRef ? "ushort*" : "ptr"

        result := DllCall("drttransport.dll\DrtCreateIpv6UdpTransport", "int", scope, "uint", dwScopeId, "uint", dwLocalityThreshold, pwPortMarshal, pwPort, "ptr*", &phTransport := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phTransport
    }

    /**
     * DrtDeleteIpv6UdpTransport function deletes a transport based on the IPv6 UDP protocol.
     * @param {Pointer<Void>} hTransport The DRT transport handle specifying the transport to delete.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRT_E_INVALID_TRANSPORT_PROVIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hTransport</i> is <b>NULL</b> or invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRT_E_TRANSPORT_EXECUTING_CALLBACK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transport provider is currently executing a method.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRT_E_TRANSPORT_STILL_BOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The transport is still bound.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRT_E_TRANSPORTPROVIDER_IN_USE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All clients have not called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the transport.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  This function may also surface errors returned by underlying calls to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peerpnrpstartup">PeerPnrpStartup</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peeridentitygetcryptkey">PeerIdentityGetCryptKey</a>.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtdeleteipv6udptransport
     * @since windows6.1
     */
    static DrtDeleteIpv6UdpTransport(hTransport) {
        hTransportMarshal := hTransport is VarRef ? "ptr" : "ptr"

        result := DllCall("drttransport.dll\DrtDeleteIpv6UdpTransport", hTransportMarshal, hTransport, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * DrtCreateDerivedKeySecurityProvider function creates the derived key security provider for a Distributed Routing Table.
     * @remarks
     * The security provider created by this function is specific to the DRT it was created for. It cannot be shared by multiple DRT instances.
     * @param {Pointer<CERT_CONTEXT>} pRootCert Pointer to the certificate that is the "root" portion of the chain. This is used to ensure that keys derived from the same chain can be verified.
     * @param {Pointer<CERT_CONTEXT>} pLocalCert Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_security_provider">DRT_SECURITY_PROVIDER</a> module to be included in the <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_settings">DRT_SETTINGS</a> structure.
     * @returns {Pointer<DRT_SECURITY_PROVIDER>} Receives a pointer to the created security provider.
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtcreatederivedkeysecurityprovider
     * @since windows6.1
     */
    static DrtCreateDerivedKeySecurityProvider(pRootCert, pLocalCert) {
        result := DllCall("drtprov.dll\DrtCreateDerivedKeySecurityProvider", "ptr", pRootCert, "ptr", pLocalCert, "ptr*", &ppSecurityProvider := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppSecurityProvider
    }

    /**
     * DrtCreateDerivedKey function creates a key that can be utilized by DrtRegisterKey when the DRT is using a derived key security provider.
     * @param {Pointer<CERT_CONTEXT>} pLocalCert Pointer to the certificate that is the "local" portion of the chain.  The root of this chain must match the root specified by <i>pRootCert</i> in <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtcreatederivedkeysecurityprovider">DrtCreateDerivedKeySecurityProvider</a>. This certificate is used to generate a key that is used to register and prove "key ownership" with the DRT.
     * @param {Pointer<DRT_DATA>} pKey Pointer to the created key.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <ul>
     * <li><i>pLocalCert</i> is <b>NULL</b>.</li>
     * <li><i>pKey</i> is <b>NULL</b>.</li>
     * <li>The <b>pb</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_data">DRT_DATA</a> structure  is <b>NULL</b>.</li>
     * <li>The <b>cb</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_data">DRT_DATA</a> structure is not equal to 32 bytes.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRT_E_CAPABILITY_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <ul>
     * <li>The requested security algorithms are not available ( ie. BCRYPT_SHA256_ALGORITHM or  BCRYPT_AES_ALGORITHM).</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/bcrypt/nf-bcrypt-bcryptopenalgorithmprovider">BCryptOpenAlgorithmProvider</a> operation failed.</li>
     * <li>The <i>dwProvType</i> parameter  indicates that the certificate provider is not AES capable.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtcreatederivedkey
     * @since windows6.1
     */
    static DrtCreateDerivedKey(pLocalCert, pKey) {
        result := DllCall("drtprov.dll\DrtCreateDerivedKey", "ptr", pLocalCert, "ptr", pKey, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * DrtDeleteDerivedKeySecurityProvider function deletes a derived key security provider for a Distributed Routing Table.
     * @param {Pointer<DRT_SECURITY_PROVIDER>} pSecurityProvider Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_security_provider">DRT_SECURITY_PROVIDER</a> specifying the security provider to delete.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtdeletederivedkeysecurityprovider
     * @since windows6.1
     */
    static DrtDeleteDerivedKeySecurityProvider(pSecurityProvider) {
        DllCall("drtprov.dll\DrtDeleteDerivedKeySecurityProvider", "ptr", pSecurityProvider)
    }

    /**
     * DrtCreateNullSecurityProvider function creates a null security provider. This security provider does not require nodes to authenticate keys.
     * @returns {Pointer<DRT_SECURITY_PROVIDER>} Pointer to the [DRT_SETTINGS](./ns-drt-drt_settings.md) structure.
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtcreatenullsecurityprovider
     * @since windows6.1
     */
    static DrtCreateNullSecurityProvider() {
        result := DllCall("drtprov.dll\DrtCreateNullSecurityProvider", "ptr*", &ppSecurityProvider := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppSecurityProvider
    }

    /**
     * DrtDeleteNullSecurityProvider function deletes a null security provider for a Distributed Routing Table.
     * @param {Pointer<DRT_SECURITY_PROVIDER>} pSecurityProvider Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_security_provider">DRT_SECURITY_PROVIDER</a> structure specifying the security provider to delete.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtdeletenullsecurityprovider
     * @since windows6.1
     */
    static DrtDeleteNullSecurityProvider(pSecurityProvider) {
        DllCall("drtprov.dll\DrtDeleteNullSecurityProvider", "ptr", pSecurityProvider)
    }

    /**
     * DrtOpen function creates a local Distributed Routing Table instance against criteria specified by the DRT_SETTINGS structure.
     * @remarks
     * After <b>DrtOpen</b> is called, the DRT will begin the bootstrapping procedure and move to the <b>DRT_ACTIVE</b> or <b>DRT_ALONE</b> state, depending on the success of the bootstrap.
     * @param {Pointer<DRT_SETTINGS>} pSettings Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_settings">DRT_SETTINGS</a> structure which specifies the settings used for the creation of the DRT instance.
     * @param {HANDLE} hEvent Handle to the event signaled when an event occurs.
     * @param {Pointer<Void>} pvContext User defined context data which is passed  to the application via  events.
     * @returns {Pointer<Void>} The new handle associated with the DRT. This is used in all future operations on the DRT instance.
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtopen
     * @since windows6.1
     */
    static DrtOpen(pSettings, hEvent, pvContext) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := DllCall("drt.dll\DrtOpen", "ptr", pSettings, "ptr", hEvent, pvContextMarshal, pvContext, "ptr*", &phDrt := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phDrt
    }

    /**
     * DrtClose function closes the local instance of the DRT.
     * @param {Pointer<Void>} hDrt Handle to the DRT instance.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtclose
     * @since windows6.1
     */
    static DrtClose(hDrt) {
        hDrtMarshal := hDrt is VarRef ? "ptr" : "ptr"

        DllCall("drt.dll\DrtClose", hDrtMarshal, hDrt)
    }

    /**
     * DrtGetEventDataSize function returns the size of the DRT_EVENT_DATA structure associated with a signaled event.
     * @param {Pointer<Void>} hDrt Handle to the Distributed Routing Table instance for which the event occurred.
     * @returns {Integer} The size, in bytes, of the event data.
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtgeteventdatasize
     * @since windows6.1
     */
    static DrtGetEventDataSize(hDrt) {
        hDrtMarshal := hDrt is VarRef ? "ptr" : "ptr"

        result := DllCall("drt.dll\DrtGetEventDataSize", hDrtMarshal, hDrt, "uint*", &pulEventDataLen := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulEventDataLen
    }

    /**
     * DrtGetEventData function retrieves event data associated with a signaled event.
     * @param {Pointer<Void>} hDrt Handle to the Distributed Routing Table instance for which the event occurred.
     * @param {Integer} ulEventDataLen The size, in bytes, of the <i>pEventData</i> buffer.
     * @param {Pointer} pEventData Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_event_data">DRT_EVENT_DATA</a> structure that contains the event data.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DRT infrastructure is unaware of the requested search.
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
     * The <i>hDrt</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRT_E_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided buffer is insufficient in size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRT_E_NO_MORE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more event data available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtgeteventdata
     * @since windows6.1
     */
    static DrtGetEventData(hDrt, ulEventDataLen, pEventData) {
        hDrtMarshal := hDrt is VarRef ? "ptr" : "ptr"

        result := DllCall("drt.dll\DrtGetEventData", hDrtMarshal, hDrt, "uint", ulEventDataLen, "ptr", pEventData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The DrtRegisterKey function registers a key in the DRT.
     * @remarks
     * A node can register keys while in the <b>DRT_ACTIVE</b>, <b>DRT_ALONE</b>, or <b>DRT_NO_NETWORK</b> state.   However, keys registered in <b>DRT_ALONE</b> and <b>DRT_NO_NETWORK</b> states can only be recognized by other DRTs after the local node has transitioned to <b>DRT_ACTIVE</b>.
     * 
     *  To update an existing key, an application must first deregister the key with <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtunregisterkey">DrtUnregisterKey</a> before calling <b>DrtRegisterKey</b> to register the updated key.
     * @param {Pointer<Void>} hDrt A pointer to a handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtopen">DrtOpen</a> function.
     * @param {Pointer<DRT_REGISTRATION>} pRegistration A pointer to a handle to the <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_registration">DRT_REGISTRATION</a> structure.
     * @param {Pointer<Void>} pvKeyContext Pointer to the context data associated with the key in the DRT. This data is passed to the key-specific functions of the security provider.
     * @returns {Pointer<Void>} Pointer to a handle for a key that has been registered.
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtregisterkey
     * @since windows6.1
     */
    static DrtRegisterKey(hDrt, pRegistration, pvKeyContext) {
        hDrtMarshal := hDrt is VarRef ? "ptr" : "ptr"
        pvKeyContextMarshal := pvKeyContext is VarRef ? "ptr" : "ptr"

        result := DllCall("drt.dll\DrtRegisterKey", hDrtMarshal, hDrt, "ptr", pRegistration, pvKeyContextMarshal, pvKeyContext, "ptr*", &phKeyRegistration := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phKeyRegistration
    }

    /**
     * DrtUpdateKey function updates the application data associated with a registered key.
     * @param {Pointer<Void>} hKeyRegistration The DRT handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtregisterkey">DrtRegisterKey</a> function specifying a registered key within the DRT instance.
     * @param {Pointer<DRT_DATA>} pAppData The new application data to associate with the key.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <ul>
     * <li><i>pAppData</i> is <b>NULL</b></li>
     * <li>The value of <b>cb</b> in <i>pAppData</i> is less than 0.</li>
     * <li>The value of <b>cb</b> in <i>pAppData</i> is more than 5120.</li>
     * <li>The value of <b>pb</b> in <i>pAppData</i> is <b>NULL</b>.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hKeyRegistration</i> is an invalid handle.
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
     * The system is out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtupdatekey
     * @since windows6.1
     */
    static DrtUpdateKey(hKeyRegistration, pAppData) {
        hKeyRegistrationMarshal := hKeyRegistration is VarRef ? "ptr" : "ptr"

        result := DllCall("drt.dll\DrtUpdateKey", hKeyRegistrationMarshal, hKeyRegistration, "ptr", pAppData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The DrtUnregisterKey function deregisters a key from the DRT.
     * @remarks
     * A node can deregister a key anytime after registration.  Additionally, if an application calls <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtclose">DrtClose</a>, all keys are deregistered by the DRT infrastructure.
     * 
     * Only the application that registered they key may deregister it. An application can deregister a key from the local node. Upon completion the function triggers a <b>DRT_EVENT_LEAFSET_KEY_CHANGE</b> event;  informing the application and other nodes participating in the DRT mesh of the deregistration.
     * @param {Pointer<Void>} hKeyRegistration The DRT handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtregisterkey">DrtRegisterKey</a> function specifying a registered key within the DRT.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtunregisterkey
     * @since windows6.1
     */
    static DrtUnregisterKey(hKeyRegistration) {
        hKeyRegistrationMarshal := hKeyRegistration is VarRef ? "ptr" : "ptr"

        DllCall("drt.dll\DrtUnregisterKey", hKeyRegistrationMarshal, hKeyRegistration)
    }

    /**
     * The DrtStartSearch function searches the DRT for a key using criteria specified in the DRT_SEARCH_INFO structure.
     * @param {Pointer<Void>} hDrt The DRT handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtopen">DrtOpen</a> function.
     * @param {Pointer<DRT_DATA>} pKey Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_data">DRT_DATA</a> structure containing the key.
     * @param {Pointer<DRT_SEARCH_INFO>} pInfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_search_info">DRT_SEARCH_INFO</a> structure that specifies the properties of the search.
     * @param {Integer} timeout Specifies the milliseconds until the search is stopped.
     * @param {HANDLE} hEvent Handle to the event that is signaled when the <b>DrtStartSearch</b> API finishes or an intermediate node is found.
     * @param {Pointer<Void>} pvContext Pointer to the context data passed to the application through the event.
     * @returns {Pointer<Void>} Handle used in the call to <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtendsearch">DrtEndSearch</a>.
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtstartsearch
     * @since windows6.1
     */
    static DrtStartSearch(hDrt, pKey, pInfo, timeout, hEvent, pvContext) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        hDrtMarshal := hDrt is VarRef ? "ptr" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := DllCall("drt.dll\DrtStartSearch", hDrtMarshal, hDrt, "ptr", pKey, "ptr", pInfo, "uint", timeout, "ptr", hEvent, pvContextMarshal, pvContext, "ptr*", &hSearchContext := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return hSearchContext
    }

    /**
     * DrtContinueSearch function continues an iterative search for a key.
     * @param {Pointer<Void>} hSearchContext Handle to the search context  to close. This parameter is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtstartsearch">DrtStartSearch</a> API.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hSearchContext</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This search is not an iterative search.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtcontinuesearch
     * @since windows6.1
     */
    static DrtContinueSearch(hSearchContext) {
        hSearchContextMarshal := hSearchContext is VarRef ? "ptr" : "ptr"

        result := DllCall("drt.dll\DrtContinueSearch", hSearchContextMarshal, hSearchContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * DrtGetSearchResultSize function returns the size of the next available search result.
     * @remarks
     * The application will receive S_OK and continue to loop using the <b>DrtGetSearchResultSize</b> and <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtgetsearchresult">DrtGetSearchResult</a> functions as long as the queue contains the search results. When the queue is empty the <b>DrtGetSearchResult</b> function will return DRT_E_SEARCH_IN_PROGRESS or DRT_E_NO_MORE.
     * @param {Pointer<Void>} hSearchContext Handle to the search context to close. This parameter is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtstartsearch">DrtStartSearch</a> function.
     * @returns {Integer} Holds the size of the next available search result.
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtgetsearchresultsize
     * @since windows6.1
     */
    static DrtGetSearchResultSize(hSearchContext) {
        hSearchContextMarshal := hSearchContext is VarRef ? "ptr" : "ptr"

        result := DllCall("drt.dll\DrtGetSearchResultSize", hSearchContextMarshal, hSearchContext, "uint*", &pulSearchResultSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulSearchResultSize
    }

    /**
     * DrtGetSearchResult function.
     * @param {Pointer<Void>} hSearchContext Handle to the search context to close. This parameter is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtstartsearch">DrtStartSearch</a> function.
     * @param {Integer} ulSearchResultSize Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_search_result">DRT_SEARCH_RESULT</a> structure containing the search result.
     * @param {Pointer} pSearchResult Receives a pointer to a DRT_SEARCH_RESULT structure containing the search results.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>ulSearchPathSize</i>  is less than the  size of <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_search_result">DRT_SEARCH_RESULT</a>.
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
     * <i>hSearchContext</i> is an invalid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRT_E_FAULTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * the DRT cloud is in the faulted state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRT_E_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided buffer is insufficient in size to contain the search result.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRT_E_NO_MORE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more results to return.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRT_E_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *   The search failed because it timed out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRT_E_SEARCH_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The search is currently in progress.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtgetsearchresult
     * @since windows6.1
     */
    static DrtGetSearchResult(hSearchContext, ulSearchResultSize, pSearchResult) {
        hSearchContextMarshal := hSearchContext is VarRef ? "ptr" : "ptr"

        result := DllCall("drt.dll\DrtGetSearchResult", hSearchContextMarshal, hSearchContext, "uint", ulSearchResultSize, "ptr", pSearchResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * DrtGetSearchPathSize function returns the size of the search path, which represents the number of nodes utilized in the search operation.
     * @param {Pointer<Void>} hSearchContext Handle to the search context. This parameter is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtstartsearch">DrtStartSearch</a> function.
     * @returns {Integer} Pointer to a <b>ULONG</b> value that indicates the size of the search path.
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtgetsearchpathsize
     * @since windows6.1
     */
    static DrtGetSearchPathSize(hSearchContext) {
        hSearchContextMarshal := hSearchContext is VarRef ? "ptr" : "ptr"

        result := DllCall("drt.dll\DrtGetSearchPathSize", hSearchContextMarshal, hSearchContext, "uint*", &pulSearchPathSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulSearchPathSize
    }

    /**
     * DrtGetSearchPath function returns a list of nodes contacted during the search operation.
     * @param {Pointer<Void>} hSearchContext Handle to the search context. This parameter is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtstartsearch">DrtStartSearch</a> function.
     * @param {Integer} ulSearchPathSize The size of the search path which represents the number of nodes utilized in the search operation.
     * @param {Pointer} pSearchPath Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_address_list">DRT_ADDRESS_LIST</a> structure containing the list of addresses.
     * @returns {HRESULT} This function returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtgetsearchpath
     * @since windows6.1
     */
    static DrtGetSearchPath(hSearchContext, ulSearchPathSize, pSearchPath) {
        hSearchContextMarshal := hSearchContext is VarRef ? "ptr" : "ptr"

        result := DllCall("drt.dll\DrtGetSearchPath", hSearchContextMarshal, hSearchContext, "uint", ulSearchPathSize, "ptr", pSearchPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * DrtEndSearch function cancels a search for a key in a DRT.
     * @remarks
     * Calling the <b>DrtEndSearch</b> function will stop the return of search results via <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_search_result">DRT_SEARCH_RESULT</a>.
     * @param {Pointer<Void>} hSearchContext Handle to the search context to end. This parameter is returned from <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtstartsearch">DrtStartSearch</a>.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hSearchContext</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DRT infrastructure is unaware of the requested search.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtendsearch
     * @since windows6.1
     */
    static DrtEndSearch(hSearchContext) {
        hSearchContextMarshal := hSearchContext is VarRef ? "ptr" : "ptr"

        result := DllCall("drt.dll\DrtEndSearch", hSearchContextMarshal, hSearchContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * DrtGetInstanceName function retrieves the full name of the Distributed Routing Table instance that corresponds to the specified DRT handle.
     * @param {Pointer<Void>} hDrt Handle to the DRT instance.
     * @param {Integer} ulcbInstanceNameSize The length of the <i>pwzDrtInstanceName</i> buffer.
     * @param {Pointer} pwzDrtInstanceName Contains the complete name of the DRT instance associated with <i>hDRT</i>.
     * @returns {HRESULT} This function returns S_OK on success. Other possible values include:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pwzDrtInstanceName</i> is <b>NULL</b>.
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
     * <i>hDrt</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DRT_E_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pwzDrtInstanceName</i> buffer is insufficient in size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtgetinstancename
     * @since windows6.1
     */
    static DrtGetInstanceName(hDrt, ulcbInstanceNameSize, pwzDrtInstanceName) {
        hDrtMarshal := hDrt is VarRef ? "ptr" : "ptr"

        result := DllCall("drt.dll\DrtGetInstanceName", hDrtMarshal, hDrt, "uint", ulcbInstanceNameSize, "ptr", pwzDrtInstanceName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The DrtGetInstanceNameSize function returns the size of the Distributed Routing Table instance name.
     * @param {Pointer<Void>} hDrt Handle to the target DRT instance.
     * @returns {Integer} The length of the DRT instance name.
     * @see https://learn.microsoft.com/windows/win32/api/drt/nf-drt-drtgetinstancenamesize
     * @since windows6.1
     */
    static DrtGetInstanceNameSize(hDrt) {
        hDrtMarshal := hDrt is VarRef ? "ptr" : "ptr"

        result := DllCall("drt.dll\DrtGetInstanceNameSize", hDrtMarshal, hDrt, "uint*", &pulcbInstanceNameSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulcbInstanceNameSize
    }

    /**
     * PeerDistStartup function creates a new Peer Distribution instance handle which must be passed to all other Peer Distribution APIs.
     * @remarks
     * <b>PeerDistStartup</b> must be called before any other Peer Distribution functions. When no longer needed, the handle returned by <b>PeerDistStartup</b> should be closed via a call to <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistshutdown">PeerDistShutdown</a>.
     * @param {Integer} dwVersionRequested Contains the minimum version of the Peer Distribution requested by the application. The high order byte specifies the minor version number; the low order byte specifies the major version number.
     * @param {Pointer<Pointer>} phPeerDist A pointer to a <b>PEERDIST_INSTANCE_HANDLE</b> variable which upon success receives a newly created handle.
     * @param {Pointer<Integer>} pdwSupportedVersion A pointer to a variable which, if not <b>NULL</b>, contains the maximum version number that is supported by the Peer Distribution system. The high order byte specifies the minor version number; the low order byte specifies the major version number.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_VERSION_UNSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested version is not supported by client side DLL.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdiststartup
     * @since windows6.1
     */
    static PeerDistStartup(dwVersionRequested, phPeerDist, pdwSupportedVersion) {
        phPeerDistMarshal := phPeerDist is VarRef ? "ptr*" : "ptr"
        pdwSupportedVersionMarshal := pdwSupportedVersion is VarRef ? "uint*" : "ptr"

        result := DllCall("PeerDist.dll\PeerDistStartup", "uint", dwVersionRequested, phPeerDistMarshal, phPeerDist, pdwSupportedVersionMarshal, pdwSupportedVersion, "uint")
        return result
    }

    /**
     * PeerDistShutdown function releases resources allocated by a call to PeerDistStartup. Each handle returned by a PeerDistStartup call must be closed by a matching call to PeerDistShutdown.
     * @remarks
     * This function will remove all publications that were created  with the specified <i>hPeerDist</i> handle. It is recommended that this function is called after all pending operations have completed, as <b>PeerDistShutdown</b> cancel all pending Peer Distribution client and server operations associated with the supplied <b>PEERDIST_INSTANCE_HANDLE</b>.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned  by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistshutdown
     * @since windows6.1
     */
    static PeerDistShutdown(hPeerDist) {
        result := DllCall("PeerDist.dll\PeerDistShutdown", "ptr", hPeerDist, "uint")
        return result
    }

    /**
     * PeerDistGetStatus function returns the current status of the Peer Distribution service.
     * @remarks
     * A Group Policy change can result in the Peer Distribution service  moving to an  available, unavailable, or disabled state. Depending on the resultant state of this transition, the content, content information, or stream handles  the caller has access to may  no longer function. If this is the case, the caller must explicitly close the handles by calling the appropriate Peer Distribution API.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Pointer<Integer>} pPeerDistStatus A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/ne-peerdist-peerdist_status">PEERDIST_STATUS</a> enumeration which upon operation success receives the current status of the Peer Distribution service.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistgetstatus
     * @since windows6.1
     */
    static PeerDistGetStatus(hPeerDist, pPeerDistStatus) {
        pPeerDistStatusMarshal := pPeerDistStatus is VarRef ? "int*" : "ptr"

        result := DllCall("PeerDist.dll\PeerDistGetStatus", "ptr", hPeerDist, pPeerDistStatusMarshal, pPeerDistStatus, "uint")
        return result
    }

    /**
     * The PeerDistRegisterForStatusChangeNotification function requests the Peer Distribution service status change notification.
     * @remarks
     * This function optionally registers a completion port and an <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure for status change notification. Upon successful completion, the <i>pPeerDistStatus</i> parameter will contain a valid <b>PEERDIST_STATUS</b> value.
     * 
     * Only one active registration for each session is allowed. The caller must register for notification each time after it signals. The notification will be sent only if the current status is changed from the previous notification. After the first call of the <b>PeerDistRegisterForStatusChangeNotification</b> function for the  Peer Distribution session, the first notification will trigger only if the status is no longer equal to <b>PEERDIST_STATUS_DISABLED</b>.
     * 
     * A Peer Distribution status change can result in the Peer Distribution service moving to an available, unavailable, or disabled state. If the new status is disabled or unavailable, the content, content information, or stream handles the caller has access to will no longer function.  In this case, any API that uses these handles will fail with error <b>PEERDIST_ ERROR_INVALIDATED</b>.  The caller must explicitly close the handles by calling the appropriate Peer Distribution API.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {HANDLE} hCompletionPort A handle to the completion port that can be used for retrieving the completion notification of the asynchronous function. To create a completion port, use the <a href="https://docs.microsoft.com/windows/desktop/FileIO/createiocompletionport">CreateIoCompletionPort</a> function.  This parameter can be <b>NULL</b>.
     * @param {Pointer} ulCompletionKey Value to be returned through the <i>lpCompletionKey</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> function.  This parameter is ignored when <i>hCompletionPort</i> is <b>NULL</b>.
     * @param {Pointer<OVERLAPPED>} lpOverlapped Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. If the <b>hEvent</b> member of the structure is not <b>NULL</b>, it will be signaled via SetEvent() used in order to signal the notification. This can occur  even if the completion port is specified via the <i>hCompletionPort</i> argument.
     * @param {Pointer<Integer>} pPeerDistStatus A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/ne-peerdist-peerdist_status">PEERDIST_STATUS</a> enumeration that indicates the current status of the Peer Distribution service.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_IO_PENDING</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistregisterforstatuschangenotification
     * @since windows6.1
     */
    static PeerDistRegisterForStatusChangeNotification(hPeerDist, hCompletionPort, ulCompletionKey, lpOverlapped, pPeerDistStatus) {
        hCompletionPort := hCompletionPort is Win32Handle ? NumGet(hCompletionPort, "ptr") : hCompletionPort

        pPeerDistStatusMarshal := pPeerDistStatus is VarRef ? "int*" : "ptr"

        result := DllCall("PeerDist.dll\PeerDistRegisterForStatusChangeNotification", "ptr", hPeerDist, "ptr", hCompletionPort, "ptr", ulCompletionKey, "ptr", lpOverlapped, pPeerDistStatusMarshal, pPeerDistStatus, "uint")
        return result
    }

    /**
     * PeerDistUnregisterForStatusChangeNotification function unregisters the status change notification for the session associated with the specified handle.
     * @remarks
     * This function cancels any registered notification  previously set by a <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistregisterforstatuschangenotification">PeerDistRegisterForStatusChangeNotification</a> function call.
     * 
     * To confirm successfully canceled operations, a call should be made to <a href="https://docs.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> using the <b>OVERLAPPED</b> structure returned by <a href="https://docs.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> with an expected return of <b>FALSE</b>.
     * 
     * Additionally, calling <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> immediately after a successful <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistregisterforstatuschangenotification">PeerDistRegisterForStatusChangeNotification</a> will return the <b>ERROR_OPERATION_ABORTED</b> error code.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistunregisterforstatuschangenotification
     * @since windows6.1
     */
    static PeerDistUnregisterForStatusChangeNotification(hPeerDist) {
        A_LastError := 0

        result := DllCall("PeerDist.dll\PeerDistUnregisterForStatusChangeNotification", "ptr", hPeerDist, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * PeerDistServerPublishStream function initializes a new stream to be published to the Peer Distribution service.
     * @remarks
     * A content identifier is a user defined label for the content being published. This content identifier is used for <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserveropencontentinformation">PeerDistServerOpenContentInformation</a>, <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverunpublish">PeerDistServerUnpublish</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistservercancelasyncoperation">PeerDistServerCancelAsyncOperation</a> calls.
     * 
     * The handle received by phStream can be used in <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverpublishaddtostream">PeerDistServerPublishAddToStream</a> and <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverpublishcompletestream">PeerDistServerPublishCompleteStream</a> to publish data into the Peer Distribution service. This handle should be closed by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverclosestreamhandle">PeerDistServerCloseStreamHandle</a>.
     * 
     * A publication is accessible only to the User Account that originally published the content. If a different user calls <b>PeerDistServerPublishStream</b> with the same content identifier, a separate publication will be created under the context of that user.
     * @param {Pointer} hPeerDist A PEERDIST_INSTANCE_HANDLE returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Integer} cbContentIdentifier The length, in bytes, of the buffer that contains content identifier data.
     * @param {Pointer} pContentIdentifier A pointer to an array that contains a content identifier data.
     * @param {Integer} cbContentLength The length, in bytes, of the content to be published. This value can be 0 if the content length is not yet known.  If a non-zero argument is provided then it must match to the total data length added by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverpublishaddtostream">PeerDistServerPublishAddToStream</a> function calls.
     * @param {Pointer<PEERDIST_PUBLICATION_OPTIONS>} pPublishOptions Pointer to a [PEERDIST_PUBLICATION_OPTIONS](./ns-peerdist-peerdist_publication_options.md) structure that specifies content publishing rules.
     * @param {HANDLE} hCompletionPort A handle to the completion port that can be used for retrieving the completion notification of the asynchronous function. To create a completion port, use the <a href="https://docs.microsoft.com/windows/desktop/FileIO/createiocompletionport">CreateIoCompletionPort</a> function. This parameter can be <b>NULL</b>.
     * @param {Pointer} ulCompletionKey Value  returned through the <i>lpCompletionKey</i> parameter of the <a href="https://docs.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> function. This parameter is ignored when <i>hCompletionPort</i> is <b>NULL</b>.
     * @param {Pointer<Pointer>} phStream A pointer that receives a handle to the stream that is used to publish data into the Peer Distribution service.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified <i>hPeerDist</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The content identifier used for publication is already published.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature is disabled by Group Policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistserverpublishstream
     * @since windows6.1
     */
    static PeerDistServerPublishStream(hPeerDist, cbContentIdentifier, pContentIdentifier, cbContentLength, pPublishOptions, hCompletionPort, ulCompletionKey, phStream) {
        hCompletionPort := hCompletionPort is Win32Handle ? NumGet(hCompletionPort, "ptr") : hCompletionPort

        phStreamMarshal := phStream is VarRef ? "ptr*" : "ptr"

        result := DllCall("PeerDist.dll\PeerDistServerPublishStream", "ptr", hPeerDist, "uint", cbContentIdentifier, "ptr", pContentIdentifier, "uint", cbContentLength, "ptr", pPublishOptions, "ptr", hCompletionPort, "ptr", ulCompletionKey, phStreamMarshal, phStream, "uint")
        return result
    }

    /**
     * PeerDistServerPublishAddToStream function adds data to the publishing stream.
     * @remarks
     * When calling this function multiple times on a single stream handle, the caller must wait for each operation to complete before the next call is made.
     * @param {Pointer} hPeerDist A PEERDIST_INSTANCE_HANDLE returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Pointer} hStream A PEERDIST_STREAM_HANDLE created by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverpublishstream">PeerDistServerPublishStream</a>.
     * @param {Integer} cbNumberOfBytes Number of bytes to be published.
     * @param {Pointer} pBuffer Pointer to the buffer that contains the data to be published. This buffer must remain valid for the duration of the add operation. The caller must not use this buffer until the add operation is completed.
     * @param {Pointer<OVERLAPPED>} lpOverlapped Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. The <b>Offset</b> and <b>OffsetHigh</b> members are reserved and must be zero.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_IO_PENDING</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i> or <i>hStream</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was canceled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature is disabled by Group Policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistserverpublishaddtostream
     * @since windows6.1
     */
    static PeerDistServerPublishAddToStream(hPeerDist, hStream, cbNumberOfBytes, pBuffer, lpOverlapped) {
        result := DllCall("PeerDist.dll\PeerDistServerPublishAddToStream", "ptr", hPeerDist, "ptr", hStream, "uint", cbNumberOfBytes, "ptr", pBuffer, "ptr", lpOverlapped, "uint")
        return result
    }

    /**
     * PeerDistServerPublishCompleteStream function completes the process of adding data to the stream.
     * @remarks
     * Once this API completes successfully, <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserveropencontentinformation">PeerDistServerOpenContentInformation</a> and <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverretrievecontentinformation">PeerDistServerRetrieveContentInformation</a> can be used to retrieve content information.
     * 
     * <b>PeerDistServerPublishCompleteStream</b> does not close <i>hStream</i>. In order to close <i>hStream</i>, call <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverclosestreamhandle">PeerDistServerCloseStreamHandle</a>.
     * @param {Pointer} hPeerDist A PEERDIST_INSTANCE_HANDLE returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Pointer} hStream A PEERDIST_STREAM_HANDLE returned  by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverpublishstream">PeerDistServerPublishStream</a>.
     * @param {Pointer<OVERLAPPED>} lpOverlapped Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. The <b>Offset</b> and <b>OffsetHigh</b> are reserved and must be zero.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_IO_PENDING</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i> or <i>hStream</i> handle is invalid
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OPERATION_ABORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was canceled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature is disabled by Group Policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service  is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistserverpublishcompletestream
     * @since windows6.1
     */
    static PeerDistServerPublishCompleteStream(hPeerDist, hStream, lpOverlapped) {
        result := DllCall("PeerDist.dll\PeerDistServerPublishCompleteStream", "ptr", hPeerDist, "ptr", hStream, "ptr", lpOverlapped, "uint")
        return result
    }

    /**
     * PeerDistServerCloseStreamHandle function closes a handle returned by PeerDistServerPublishStream.
     * @remarks
     * The <b>PeerDistServerCloseStreamHandle</b> function call cancels all pending operations associated with <i>hStream</i>. To prevent unintended cancellation of publication and closure of the stream handle, this function should be called after the completion of <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverpublishcompletestream">PeerDistServerPublishCompleteStream</a>.
     * 
     * <b>PeerDistServerCloseStreamHandle</b> does not remove the publication. In order to remove the publication, call <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverunpublish">PeerDistServerUnpublish</a>.
     * @param {Pointer} hPeerDist A PEERDIST_INSTANCE_HANDLE returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Pointer} hStream A PEERDIST_STREAM_HANDLE returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverpublishstream">PeerDistServerPublishStream</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i> or <i>hStream</i> handle is invalid
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistserverclosestreamhandle
     * @since windows6.1
     */
    static PeerDistServerCloseStreamHandle(hPeerDist, hStream) {
        result := DllCall("PeerDist.dll\PeerDistServerCloseStreamHandle", "ptr", hPeerDist, "ptr", hStream, "uint")
        return result
    }

    /**
     * PeerDistServerUnpublish function removes a publication created via PeerDistServerPublishStream.
     * @remarks
     * The <b>PeerDistServerUnpublish</b> function cancels all pending operations on unpublished content within the Peer Distribution session that is associated with the specified <i>hPeerDist</i>. The client is still required  to close previously opened handles on that content with a call to <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientclosecontent">PeerDistClientCloseContent</a>.
     * 
     * A publication is accessible only to the User Account that originally published the content.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Integer} cbContentIdentifier The length, in bytes, of the content identifier.
     * @param {Pointer} pContentIdentifier Pointer to a buffer that contains the content identifier.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature is disabled by Group Policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistserverunpublish
     * @since windows6.1
     */
    static PeerDistServerUnpublish(hPeerDist, cbContentIdentifier, pContentIdentifier) {
        result := DllCall("PeerDist.dll\PeerDistServerUnpublish", "ptr", hPeerDist, "uint", cbContentIdentifier, "ptr", pContentIdentifier, "uint")
        return result
    }

    /**
     * PeerDistServerOpenContentInformation function opens a PEERDIST_CONTENTINFO_HANDLE. The client uses the handle to retrieve content information.
     * @remarks
     * If function succeeds, the handle received by <i>phContentInfo</i> can be passed to the  
     *  <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverretrievecontentinformation">PeerDistServerRetrieveContentInformation</a> function to retrieve content information.
     * The  handle   must be closed via the <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverclosecontentinformation">PeerDistServerCloseContentInformation</a> function.
     * 
     * 
     * If <i>ullContentOffset</i> and <i>cbContentLength</i> are both zero, then the content information for the whole content will be retrieved.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Integer} cbContentIdentifier The length, in bytes, of the content identifier.
     * @param {Pointer} pContentIdentifier Pointer to a buffer that contains the content identifier.
     * @param {Integer} ullContentOffset An offset from the beginning of the published content for which the content information handle is requested.
     * @param {Integer} cbContentLength The length, in bytes, of the content (starting from the ullContentOffset) for which the content information is requested.
     * @param {HANDLE} hCompletionPort A handle to the completion port used for retrieving the completion notification of the asynchronous function. To create a completion port, use the <a href="https://docs.microsoft.com/windows/desktop/FileIO/createiocompletionport">CreateIoCompletionPort</a> function. This parameter can be <b>NULL</b>.
     * @param {Pointer} ulCompletionKey Value to be returned through the <i>lpCompletionKey</i> parameter of the <a href="https://docs.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> function. This parameter is ignored when <i>hCompletionPort</i> is <b>NULL</b>.
     * @param {Pointer<Pointer>} phContentInfo A handle  used to retrieve the content information.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified content identifier data  is not published.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature is disabled by Group Policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistserveropencontentinformation
     * @since windows6.1
     */
    static PeerDistServerOpenContentInformation(hPeerDist, cbContentIdentifier, pContentIdentifier, ullContentOffset, cbContentLength, hCompletionPort, ulCompletionKey, phContentInfo) {
        hCompletionPort := hCompletionPort is Win32Handle ? NumGet(hCompletionPort, "ptr") : hCompletionPort

        phContentInfoMarshal := phContentInfo is VarRef ? "ptr*" : "ptr"

        result := DllCall("PeerDist.dll\PeerDistServerOpenContentInformation", "ptr", hPeerDist, "uint", cbContentIdentifier, "ptr", pContentIdentifier, "uint", ullContentOffset, "uint", cbContentLength, "ptr", hCompletionPort, "ptr", ulCompletionKey, phContentInfoMarshal, phContentInfo, "uint")
        return result
    }

    /**
     * PeerDistServerRetrieveContentInformation function retrieves the encoded content information associated with a handle returned by PeerDistServerOpenContentInformation.
     * @remarks
     * On the success of the <b>PeerDistServerRetrieveContentInformation</b> operation, the <b>Offset</b> and <b>OffsetHigh</b> fields of the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure will be populated with the <b>ULONGLONG</b> offset in the content information that was retrieved. The <b>OffsetHigh</b> member will be set to the higher 32 bits of the offset and the <b>Offset</b> member will be set to the lower 32 bits of the offset.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> will populate <i>lpNumberOfBytesTransferred</i> with the number of bytes transferred. In the event the caller is using a completion port to process Peer Distribution API completions, the <i>lpNumberOfBytes</i> argument of <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> will be populated with the number of bytes transferred.
     * @param {Pointer} hPeerDist A PEERDIST_INSTANCE_HANDLE returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Pointer} hContentInfo The handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserveropencontentinformation">PeerDistServerOpenContentInformation</a>.
     * @param {Integer} cbMaxNumberOfBytes The maximum number of bytes to read.
     * @param {Pointer} pBuffer Pointer to the buffer that receives the content information data.
     * @param {Pointer<OVERLAPPED>} lpOverlapped Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. This function does not allow the caller to specify the start Offset in the content. The offset is implicitly maintained per hContentInfo. The Offset and OffsetHigh are reserved and must be zero.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_IO_PENDING</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i> or <i>hContentInfo</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_NO_MORE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * EOF on the content information has been reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature is disabled by Group Policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistserverretrievecontentinformation
     * @since windows6.1
     */
    static PeerDistServerRetrieveContentInformation(hPeerDist, hContentInfo, cbMaxNumberOfBytes, pBuffer, lpOverlapped) {
        result := DllCall("PeerDist.dll\PeerDistServerRetrieveContentInformation", "ptr", hPeerDist, "ptr", hContentInfo, "uint", cbMaxNumberOfBytes, "ptr", pBuffer, "ptr", lpOverlapped, "uint")
        return result
    }

    /**
     * PeerDistServerCloseContentInformation function closes the handle opened by PeerDistServerOpenContentInformation.
     * @remarks
     * The <b>PeerDistServerCloseContentInformation</b> closes the <b>PEERDIST_CONTENTINFO_HANDLE</b>. Additionally, calling <b>PeerDistServerCloseContentInformation</b>  will cancel any pending operations associated with the <b>PEERDIST_CONTENTINFO_HANDLE</b>.
     * @param {Pointer} hPeerDist The <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Pointer} hContentInfo The handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserveropencontentinformation">PeerDistServerOpenContentInformation</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provided <i>hPeerDist</i> or <i>hContentInfo</i> handles are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature is disabled by Group Policy.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistserverclosecontentinformation
     * @since windows6.1
     */
    static PeerDistServerCloseContentInformation(hPeerDist, hContentInfo) {
        result := DllCall("PeerDist.dll\PeerDistServerCloseContentInformation", "ptr", hPeerDist, "ptr", hContentInfo, "uint")
        return result
    }

    /**
     * PeerDistServerCancelAsyncOperation function cancels the asynchronous operation associated with the content identifier and OVERLAPPED structure.
     * @remarks
     * This function will synchronously cancel the operation, but will not return until the cancelation result is posted to the completion port or wait event is set to the 'signaled' state. Any threads in waiting can receive the completion notice for the operation before or after the <b>PeerDistServerCancelAsyncOperation</b> function returns.
     * 
     * This function  does not guarantee that the operation will complete as canceled. The cancellation result will be posted only if no other results have been posted.
     * 
     * To confirm successfully canceled operations, a call should be made to <a href="https://docs.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> with an expected return of <b>FALSE</b>.  
     * 
     * Additionally, calling <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> immediately after a successful <b>PeerDistServerCancelAsyncOperation</b> will return the <b>ERROR_OPERATION_ABORTED</b> error code.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Integer} cbContentIdentifier The length, in bytes, of the content identifier.
     * @param {Pointer} pContentIdentifier Pointer to an array that contains the content identifier.
     * @param {Pointer<OVERLAPPED>} pOverlapped Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure that contains the canceling asynchronous operation data.
     * @returns {Integer} The function will return <b>ERROR_SUCCESS</b> value if the operation associated with <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure is successfully canceled. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_OPERATION_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation for <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure cannot be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature is disabled by Group Policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistservercancelasyncoperation
     * @since windows6.1
     */
    static PeerDistServerCancelAsyncOperation(hPeerDist, cbContentIdentifier, pContentIdentifier, pOverlapped) {
        A_LastError := 0

        result := DllCall("PeerDist.dll\PeerDistServerCancelAsyncOperation", "ptr", hPeerDist, "uint", cbContentIdentifier, "ptr", pContentIdentifier, "ptr", pOverlapped, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * PeerDistClientOpenContent function opens and returns a PEERDIST_CONTENT_HANDLE. The client uses the content handle to retrieve data from the Peer Distribution service.
     * @remarks
     * Client must call the <b>PeerDistClientOpenContent</b> function to obtain a <b>PEERDIST_CONTENT_HANDLE</b> handle that later can be used in the following functions:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientaddcontentinformation">PeerDistClientAddContentInformation</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientcompletecontentinformation">PeerDistClientCompleteContentInformation</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientblockread">PeerDistClientBlockRead</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientstreamread">PeerDistClientStreamRead</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientadddata">PeerDistClientAddData</a>
     * </li>
     * </ul>
     * If an optional completion port handle is specified, it is used for posting the completion results of above listed asynchronous functions.
     * 
     * The handle returned by <b>PeerDistClientOpenContent</b> function call must be closed by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientclosecontent">PeerDistClientCloseContent</a> function.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Pointer<PEERDIST_CONTENT_TAG>} pContentTag Pointer to a [PEERDIST_CONTENT_TAG](./ns-peerdist-peerdist_content_tag.md) structure that contains a 16 byte client specified identifier. This parameter is used in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientflushcontent">PeerDistClientFlushContent</a> function.
     * @param {HANDLE} hCompletionPort A handle to the completion port that can be used for retrieving the completion notification of the asynchronous function. To create a completion port, use the <a href="https://docs.microsoft.com/windows/desktop/FileIO/createiocompletionport">CreateIoCompletionPort</a> function  This parameter can be <b>NULL</b>.
     * @param {Pointer} ulCompletionKey Value to be returned through the <i>lpCompletionKey</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> function.  This parameter is ignored when <i>hCompletionPort</i> is <b>NULL</b>.
     * @param {Pointer<Pointer>} phContentHandle A pointer to a variable that receives the <b>PEERDIST_CONTENT_HANDLE</b> used to retrieve or add data.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature is disabled by Group Policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistclientopencontent
     * @since windows6.1
     */
    static PeerDistClientOpenContent(hPeerDist, pContentTag, hCompletionPort, ulCompletionKey, phContentHandle) {
        hCompletionPort := hCompletionPort is Win32Handle ? NumGet(hCompletionPort, "ptr") : hCompletionPort

        phContentHandleMarshal := phContentHandle is VarRef ? "ptr*" : "ptr"

        result := DllCall("PeerDist.dll\PeerDistClientOpenContent", "ptr", hPeerDist, "ptr", pContentTag, "ptr", hCompletionPort, "ptr", ulCompletionKey, phContentHandleMarshal, phContentHandle, "uint")
        return result
    }

    /**
     * PeerDistClientCloseContent function closes the content handle opened by PeerDistClientOpenContent.
     * @remarks
     * This function will cancel all pending asynchronous operations associated with the provided <i>hContentHandle</i>.
     * 
     *  All handles opened by the <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientopencontent">PeerDistClientOpenContent</a> function must be closed by <b>PeerDistClientCloseContent</b>.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Pointer} hContentHandle A <b>PEERDIST_CONTENT_HANDLE</b> opened  by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientopencontent">PeerDistClientOpenContent</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i> or <i>hContent</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistclientclosecontent
     * @since windows6.1
     */
    static PeerDistClientCloseContent(hPeerDist, hContentHandle) {
        result := DllCall("PeerDist.dll\PeerDistClientCloseContent", "ptr", hPeerDist, "ptr", hContentHandle, "uint")
        return result
    }

    /**
     * PeerDistClientAddContentInformation function adds the content information associated with a content handle opened by PeerDistClientOpenContent.
     * @remarks
     * In order to retrieve content data from Peer Distribution service the client must add content information that it received from the content server by calling the <b>PeerDistClientAddContentInformation</b> function. When all content information data has been added, the <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientcompletecontentinformation">PeerDistClientCompleteContentInformation</a> function must be called. Once <b>PeerDistClientCompleteContentInformation</b> is complete, the client can call <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientstreamread">PeerDistClientStreamRead</a> or <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientblockread">PeerDistClientBlockRead</a> to retrieve the data from the Peer Distribution system.
     * 
     * When calling this function multiple times on a single content handle, the caller must wait for each operation to complete before the next call is made.
     * 
     * An application is  not limited  to adding  content information with a single <b>PeerDistClientAddContentInformation</b> API call, as it is possible to add portions of that content information as it is made available. When more content information is available, the application can again call <b>PeerDistClientAddContentInformation</b>. When the application is done adding the entire content information, it must then call <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientcompletecontentinformation">PeerDistClientCompleteContentInformation</a>.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Pointer} hContentHandle A <b>PEERDIST_CONTENT_HANDLE</b> opened by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientopencontent">PeerDistClientOpenContent</a>.
     * @param {Integer} cbNumberOfBytes Number of bytes in the <i>pBuffer</i> array.
     * @param {Pointer} pBuffer Pointer to the buffer that contains the content information. This buffer must remain valid for the duration of the add operation. The caller must not use this buffer until the add operation is completed.
     * @param {Pointer<OVERLAPPED>} lpOverlapped Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. The Internal member of <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure contains the completion status of the asynchronous operation. The Offset and OffsetHigh are reserved and must be 0.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_IO_PENDING</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature is disabled by Group Policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistclientaddcontentinformation
     * @since windows6.1
     */
    static PeerDistClientAddContentInformation(hPeerDist, hContentHandle, cbNumberOfBytes, pBuffer, lpOverlapped) {
        result := DllCall("PeerDist.dll\PeerDistClientAddContentInformation", "ptr", hPeerDist, "ptr", hContentHandle, "uint", cbNumberOfBytes, "ptr", pBuffer, "ptr", lpOverlapped, "uint")
        return result
    }

    /**
     * PeerDistClientCompleteContentInformation function completes the process of adding the content information.
     * @remarks
     * Upon completion of this function, a client can call <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientstreamread">PeerDistClientStreamRead</a> or <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientblockread">PeerDistClientBlockRead</a> to retrieve the data from the Peer Distribution system.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Pointer} hContentHandle A <b>PEERDIST_CONTENT_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientopencontent">PeerDistClientOpenContent</a>.
     * @param {Pointer<OVERLAPPED>} lpOverlapped Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_IO_PENDING</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature is disabled by Group Policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistclientcompletecontentinformation
     * @since windows6.1
     */
    static PeerDistClientCompleteContentInformation(hPeerDist, hContentHandle, lpOverlapped) {
        result := DllCall("PeerDist.dll\PeerDistClientCompleteContentInformation", "ptr", hPeerDist, "ptr", hContentHandle, "ptr", lpOverlapped, "uint")
        return result
    }

    /**
     * The PeerDistClientAddData function is used to supply content to the local cache.
     * @remarks
     * The data that has been added with this function and passed verification is available to other peers or hosted cache for download. The Peer Distribution service stores this data in its local cache.
     * 
     * If the API completes with <b>PEERDIST_ERROR_OUT_OF_BOUNDS</b>, this indicates that the offset specified in the overlapped structure is beyond the end of the content.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Pointer} hContentHandle A <b>PEERDIST_CONTENT_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientopencontent">PeerDistClientOpenContent</a>.
     * @param {Integer} cbNumberOfBytes The number of bytes to be added to the local cache.
     * @param {Pointer} pBuffer Pointer to the buffer that contains the data to be added to the local cache. This buffer must remain valid for the duration of the add operation. The caller must not use this buffer until the add operation is completed.
     * @param {Pointer<OVERLAPPED>} lpOverlapped Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. The byte offset from the beginning of content, at which this data is being added, is specified by setting the <b>Offset</b> and <b>OffsetHigh</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure.  The <b>OffsetHigh</b> member MUST be set to the higher 32 bits of the byte offset and the <b>Offset</b> member MUST be set to the lower 32 bits of the byte offset.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_IO_PENDING</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i> or <i>hContent</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature is disabled by Group Policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistclientadddata
     * @since windows6.1
     */
    static PeerDistClientAddData(hPeerDist, hContentHandle, cbNumberOfBytes, pBuffer, lpOverlapped) {
        result := DllCall("PeerDist.dll\PeerDistClientAddData", "ptr", hPeerDist, "ptr", hContentHandle, "uint", cbNumberOfBytes, "ptr", pBuffer, "ptr", lpOverlapped, "uint")
        return result
    }

    /**
     * PeerDistClientBlockRead function reads content data blocks.
     * @remarks
     * <b>PeerDistClientBlockRead</b> queues the read and immediately returns to the caller.  As a result, multiple reads can be issued simultaneously.
     * <b>PeerDistClientBlockRead</b>  will complete a read as soon as any data is available and will not wait for the buffer to fill completely.
     * 
     * 
     * If the <b>PeerDistClientBlockRead</b> function operation completes successfully, the <b>Offset</b> and <b>OffsetHigh</b> fields of the <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure will be populated with the <b>ULONGLONG</b> offset at which the read started.  The OffsetHigh member will be set to the higher 32 bits of the offset and the Offset member will be set to the lower 32 bits of the offset. <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> will populate <i>lpNumberOfBytesTransferred</i> with the number of bytes transferred. In the event the caller is using a completion port to process Peer Distribution API completions then the <i>lpNumberOfBytes</i> argument of <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> will be populated with the number of bytes transferred. 
     * 
     * If the <i>cbMaxNumberOfBytesToRead</i> argument is equal to 0, and the <b>PeerDistClientBlockRead</b> function completes successfully, the number of bytes transferred (obtained via either <a href="https://docs.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> or <a href="https://docs.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a>) will contain the actual length of  content available in the local cache.
     * 
     * When this API completes with  error values <b>PEERDIST_ERROR_MISSING_DATA</b> or <b>ERROR_TIMEOUT</b>, the <b>Offset</b> and <b>OffsetHigh</b> fields of the <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure specify the <b>ULONGLONG</b> offset at which the missing data range begins.  The OffsetHigh member will be set to the higher 32 bits of the offset and the Offset member will be set to the lower 32 bits of the offset. This missing data range is the start offset (relative to start of the content) and length, in bytes, which needs to be retrieved from an alternate source, like the original content server. In order to allow the Peer Distribution service to satisfy the same read in the future, add this data to the local cache by calling PeerDistClientAddData.  The length of the missing data range is specified by the number of bytes transferred (obtained via <a href="https://docs.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> or <a href="https://docs.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a>).
     * 
     * It is important to note that the missing data range can start at any offset in the content and be any length up to the end of the content. In the event the content information passed to <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientaddcontentinformation">PeerDistClientAddContentInformation</a> was generated in response to a range request, then the missing data range will be constrained to the range request bounds. This occurs when the call to <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserveropencontentinformation">PeerDistServerOpenContentInformation</a> on the content server specified an offset and a length which was a sub-range of the content as a whole. A completion with <b>ERROR_NO_MORE</b> in this case indicates that the read offset is outside of the sub-range of the content.
     * 
     * <h3><a id="Range_Requests"></a><a id="range_requests"></a><a id="RANGE_REQUESTS"></a>Range Requests</h3>
     * If a client is interested in only a portion of the original content, a range request can be used to retrieve that portion. A range request contains an offset and length of the original content. The size of the content information is directly proportional to the size of the content requested.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserveropencontentinformation">PeerDistServerOpenContentInformation</a> supports generating content information for a range request via the ullContentOffset and <i>cbContentLength</i> parameters. The <i>ullContentOffset</i> parameter represents the offset in the original content where the range begins and <i>cbContentLength</i> represents the length of the range.
     * 
     * Once a client obtains content information representing a particular content range, that content information works seamlessly with the  <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientopencontent">PeerDistClientOpenContent</a>, <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientaddcontentinformation">PeerDistClientAddContentInformation</a> and <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientcompletecontentinformation">PeerDistClientCompleteContentInformation</a> APIs.  The content information can be passed to <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserveropencontentinformation">PeerDistServerOpenContentInformation</a> and will associate the <b>PEERDIST_CONTENT_HANDLE</b> with the content range.  <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientstreamread">PeerDistClientStreamRead</a> is constrained by the <i>ullContentOffset</i> offset and <i>cbContentLength</i> length specified in the server side call to <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverretrievecontentinformation">PeerDistServerRetrieveContentInformation</a>.  <b>PeerDistClientStreamRead</b> will begin at <i>ullContentOffset</i> and will complete with the error code <b>PEERDIST_ERROR_NO_MORE</b> when the end of the content range is reached at <i>ullContentOffset</i> + <i>cbContentLength</i>.  <b>PeerDistClientBlockRead</b> will complete with the error code <b>PEERDIST_ERROR_NO_MORE</b> if the offset specified in the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> parameter is less than <i>ullContentOffset</i> or greater than <i>ullContentOffset</i> + <i>cbContentLength</i>.  <b>PeerDistClientStreamRead</b> and <b>PeerDistClientBlockRead</b> both limit the amount of missing data reported to the content range specified in the content information associated with the <b>PEERDIST_CONTENT_HANDLE</b>.  For example, if the content information represents only the first half of the content, missing data will be limited to the first half of the content.  In all other respects, <b>PeerDistClientBlockRead</b> and <b>PeerDistClientStreamRead</b> work with content ranges in exactly the same manner in which they work with the content as a whole.
     * 
     * A client can use <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientstreamread">PeerDistClientStreamRead</a> or  <b>PeerDistClientBlockRead</b> to retrieve the content from the offset specified by the <i>ullContentOffset</i> up to the length specified by <i>cbContentLength</i> in the <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverretrievecontentinformation">PeerDistServerRetrieveContentInformation</a> call. Both  <b>PeerDistClientStreamRead</b> and  <b>PeerDistClientBlockRead</b> will complete with <b>PEERDIST_ERROR_NO_MORE</b> if the client tries to read beyond the range specified by the <i>ullContentOffset</i> and <i>cbContentLength</i>. Additionally, <b>PeerDistClientBlockRead</b> will also complete with the error code <b>PEERDIST_ERROR_NO_MORE</b> if the offset specified in the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> parameter is less than <i>ullContentOffset</i>
     * 
     *  
     * If the read cannot not be completed from either the local cache or the peer cache, both <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientstreamread">PeerDistClientStreamRead</a> and <b>PeerDistClientBlockRead</b> will report <b>PEERDIST_ERROR_MISSING_DATA</b>. When using the ranged content information, <b>PeerDistClientStreamRead</b> will report a missing data from the start offset of the range up to the end of the range. <b>PeerDistClientBlockRead</b> will report  missing data from start offset of the range up to the end of the range.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientadddata">PeerDistClientAddData</a> allows content data to be added even if it lies outside the content range.  This extended data will be validated after the corresponding content information has been added to the local cache.  Once validated, it becomes available to peers.  In other words, if a client adds only content information for the first half of content, <b>PeerDistClientAddData</b> still allows the client to add data for the entire content.  However, the second half of the content will not be validated until the corresponding content information for the second half has been added.  No other Peer Distribution APIs are affected by range requests.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Pointer} hContentHandle A content handle opened by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientopencontent">PeerDistClientOpenContent</a> function call.
     * @param {Integer} cbMaxNumberOfBytes The maximum number of bytes to read. If the <i>cbMaxNumberOfBytesToRead</i> is equal to 0, it indicates that the <b>PeerDistClientBlockRead</b> function is querying the length of available consecutive content bytes in the local cache at the current block read offset. The query will neither download content from the peers, nor return the count of bytes present in the peer cache.
     * @param {Pointer} pBuffer Pointer to the buffer that receives the data from the local cache. This buffer must remain valid for the duration of the read operation. The caller must not use this buffer until the read operation is completed. If the <i>cbMaxNumberOfBytesToRead</i> argument is equal to 0, the <i>pBuffer</i> parameter can be <b>NULL</b>
     * @param {Integer} dwTimeoutInMilliseconds Timeout value for the read, in milliseconds.  There are two special values that may be specified: 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEERDIST_READ_TIMEOUT_LOCAL_CACHE_ONLY"></a><a id="peerdist_read_timeout_local_cache_only"></a><dl>
     * <dt><b>PEERDIST_READ_TIMEOUT_LOCAL_CACHE_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that a read should  not cause any additional network traffic by contacting peers  or a Hosted Cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEERDIST_READ_TIMEOUT_DEFAULT"></a><a id="peerdist_read_timeout_default"></a><dl>
     * <dt><b>PEERDIST_READ_TIMEOUT_DEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies the default timeout of 5 seconds.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<OVERLAPPED>} lpOverlapped Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. The start offset for read is specified by setting the <b>Offset</b> and <b>OffsetHigh</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure.  The <b>OffsetHigh</b> member should be set to the higher 32 bits of the start offset and the <b>Offset</b> member should be set to the lower 32 bits of the start offset.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_IO_PENDING</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i>   or <i>hContent</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature is disabled by Group Policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service  is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistclientblockread
     * @since windows6.1
     */
    static PeerDistClientBlockRead(hPeerDist, hContentHandle, cbMaxNumberOfBytes, pBuffer, dwTimeoutInMilliseconds, lpOverlapped) {
        result := DllCall("PeerDist.dll\PeerDistClientBlockRead", "ptr", hPeerDist, "ptr", hContentHandle, "uint", cbMaxNumberOfBytes, "ptr", pBuffer, "uint", dwTimeoutInMilliseconds, "ptr", lpOverlapped, "uint")
        return result
    }

    /**
     * PeerDistClientStreamRead reads a sequence of bytes from content stream.
     * @remarks
     * <b>PeerDistClientStreamRead</b> queues the read and immediately returns to the caller.  As a result, multiple reads can be issued simultaneously with the data buffers utilized in a first-in/first-out manner.
     * <b>PeerDistClientStreamRead</b>  will complete a read as soon as any data is available and will not wait for the buffer to fill completely.
     * 
     * 
     * If the <b>PeerDistClientStreamRead</b> function operation completes successfully, the <b>Offset</b> and <b>OffsetHigh</b> fields of the <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure will be populated with the <b>ULONGLONG</b> offset at which the read started.   The OffsetHigh member will be set to the higher 32 bits of the offset and the Offset member will be set to the lower 32 bits of the offset. <a href="https://docs.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> populates <i>lpNumberOfBytesTransferred</i> with the number of bytes transferred. In the event the caller is using a completion port to process Peer Distribution API completions then the <i>lpNumberOfBytes</i> argument of <a href="https://docs.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> will be populated with the number of bytes transferred.  The stream offset will be advanced by the number of bytes reported as read. To query the length of available content for content larger than 4GB, <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientblockread">PeerDistClientBlockRead</a> can be used with <i>cbMaxNumberOfBytesToRead</i> equal to 0 and appropriate offsets.
     * 
     * If the API completes with the error value <b>PEERDIST_ERROR_MISSING_DATA</b> or <b>ERROR_TIMEOUT</b>, the <b>Offset</b> and <b>OffsetHigh</b> fields of the <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure specify the <b>ULONGLONG</b> offset at which the missing data range begins.  The <b>OffsetHigh</b> member will be set to the higher 32 bits of the offset and the <b>Offset</b> member will be set to the lower 32 bits of the offset. This missing data range is the start offset (relative to start of the content) and length, in bytes, which needs to be retrieved from an alternate source, like the original content server., In order to allow the Peer Distribution service to satisfy the same read in the future, add this data to the local cache by calling <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientadddata">PeerDistClientAddData</a>. The length of the missing data range is specified by the number of bytes transferred (obtained via <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> or <a href="https://docs.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a>).  The stream offset is advanced by the number of bytes reported as the length of the missing data range.
     * 
     * If <b>PeerDistClientStreamRead</b> is called after the stream offset has advanced beyond the end of the content, the API will complete with <b>ERROR_NO_MORE</b>.
     * 
     * It is important to note that the missing data range can start at any offset in the content and be any length up to the end of the content. In the event the content information passed to <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientaddcontentinformation">PeerDistClientAddContentInformation</a> was generated in response to a range request, then the missing data range will be constrained to the range request bounds. This will happen when the call to <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserveropencontentinformation">PeerDistServerOpenContentInformation</a> on the content server specified an offset and a length which was a sub-range of the content as a whole.  A completion with <b>ERROR_NO_MORE</b> in this case indicates that the read offset is outside of the sub-range of the content.
     * 
     * <h3><a id="Range_Requests"></a><a id="range_requests"></a><a id="RANGE_REQUESTS"></a>Range Requests</h3>
     * If a client is interested in only a portion of the original content, a range request can be used to retrieve that portion. A range request contains an offset and length of the original content. The size of the content information is directly proportional to the size of the content requested.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserveropencontentinformation">PeerDistServerOpenContentInformation</a> supports generating content information for a range request via the ullContentOffset and <i>cbContentLength</i> parameters. The <i>ullContentOffset</i> parameter represents the offset in the original content where the range begins and <i>cbContentLength</i> represents the length of the range.
     * 
     * Once a client obtains content information representing a particular content range, that content information works seamlessly with the  <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientopencontent">PeerDistClientOpenContent</a>, <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientaddcontentinformation">PeerDistClientAddContentInformation</a> and <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientcompletecontentinformation">PeerDistClientCompleteContentInformation</a> APIs.  The content information can be passed to <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserveropencontentinformation">PeerDistServerOpenContentInformation</a> and will associate the <b>PEERDIST_CONTENT_HANDLE</b> with the content range.  <b>PeerDistClientStreamRead</b> is constrained by the <i>ullContentOffset</i> offset and <i>cbContentLength</i> length specified in the server side call to <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverretrievecontentinformation">PeerDistServerRetrieveContentInformation</a>.  <b>PeerDistClientStreamRead</b> will begin at <i>ullContentOffset</i> and will complete with the error code <b>PEERDIST_ERROR_NO_MORE</b> when the end of the content range is reached at <i>ullContentOffset</i> + <i>cbContentLength</i>.  <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientblockread">PeerDistClientBlockRead</a> will complete with the error code <b>PEERDIST_ERROR_NO_MORE</b> if the offset specified in the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> parameter is less than <i>ullContentOffset</i> or greater than <i>ullContentOffset</i> + <i>cbContentLength</i>.  <b>PeerDistClientStreamRead</b> and <b>PeerDistClientBlockRead</b> both limit the amount of missing data reported to the content range specified in the content information associated with the <b>PEERDIST_CONTENT_HANDLE</b>.  For example, if the content information represents only the first half of the content, missing data will be limited to the first half of the content.  In all other respects, <b>PeerDistClientBlockRead</b> and <b>PeerDistClientStreamRead</b> work with content ranges in exactly the same manner in which they work with the content as a whole.
     * 
     * A client can use <b>PeerDistClientStreamRead</b> or  <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientblockread">PeerDistClientBlockRead</a> to retrieve the content from the offset specified by the <i>ullContentOffset</i> up to the length specified by <i>cbContentLength</i> in the <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverretrievecontentinformation">PeerDistServerRetrieveContentInformation</a> call. Both  <b>PeerDistClientStreamRead</b> and  <b>PeerDistClientBlockRead</b> will complete with <b>PEERDIST_ERROR_NO_MORE</b> if the client tries to read beyond the range specified by the <i>ullContentOffset</i> and <i>cbContentLength</i>. Additionally, <b>PeerDistClientBlockRead</b> will also complete with the error code <b>PEERDIST_ERROR_NO_MORE</b> if the offset specified in the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> parameter is less than <i>ullContentOffset</i>
     * 
     *  
     * If the read cannot not be completed from either the local cache or the peer cache, both <b>PeerDistClientStreamRead</b> and <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientblockread">PeerDistClientBlockRead</a> will report <b>PEERDIST_ERROR_MISSING_DATA</b>. When using the ranged content information, <b>PeerDistClientStreamRead</b> will report a missing data from the start offset of the range up to the end of the range. <b>PeerDistClientBlockRead</b> will report  missing data from start offset of the range up to the end of the range.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientadddata">PeerDistClientAddData</a> allows content data to be added even if it lies outside the content range.  This extended data will be validated after the corresponding content information has been added to the local cache.  Once validated, it becomes available to peers.  In other words, if a client adds only content information for the first half of content, <b>PeerDistClientAddData</b> still allows the client to add data for the entire content.  However, the second half of the content will not be validated until the corresponding content information for the second half has been added.  No other Peer Distribution APIs are affected by range requests.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Pointer} hContentHandle A content handle opened by the <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientopencontent">PeerDistClientOpenContent</a> function call.
     * @param {Integer} cbMaxNumberOfBytes The maximum number of bytes to read. If the <i>cbMaxNumberOfBytesToRead</i> is equal to 0, it indicates that the <b>PeerDistClientStreamRead</b> function is querying the length of available consecutive content bytes in the local cache at the current stream read offset. The query will neither download content from the peers, nor return the count of bytes present in the peer cache.
     * @param {Pointer} pBuffer Pointer to the buffer that receives the data from the local cache. This buffer must remain valid for the duration of the read operation. The caller must not use this buffer until the read operation is completed. If the <i>cbMaxNumberOfBytesToRead</i> argument is equal to 0, the <i>pBuffer</i> parameter can be <b>NULL</b>.
     * @param {Integer} dwTimeoutInMilliseconds Timeout value for the read, in milliseconds.  There are two special values that may be specified: 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEERDIST_READ_TIMEOUT_LOCAL_CACHE_ONLY"></a><a id="peerdist_read_timeout_local_cache_only"></a><dl>
     * <dt><b>PEERDIST_READ_TIMEOUT_LOCAL_CACHE_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that a read should  not cause any additional network traffic by contacting peers  or a Hosted Cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEERDIST_READ_TIMEOUT_DEFAULT"></a><a id="peerdist_read_timeout_default"></a><dl>
     * <dt><b>PEERDIST_READ_TIMEOUT_DEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies the default timeout of 5 seconds.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<OVERLAPPED>} lpOverlapped Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. Stream read does not allow the caller to specify the start <b>Offset</b> for the reading. The next stream read offset is implicitly maintained per <i>hContentHandle</i>.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_IO_PENDING</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i> or <i>hContent</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature is disabled by Group Policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistclientstreamread
     * @since windows6.1
     */
    static PeerDistClientStreamRead(hPeerDist, hContentHandle, cbMaxNumberOfBytes, pBuffer, dwTimeoutInMilliseconds, lpOverlapped) {
        result := DllCall("PeerDist.dll\PeerDistClientStreamRead", "ptr", hPeerDist, "ptr", hContentHandle, "uint", cbMaxNumberOfBytes, "ptr", pBuffer, "uint", dwTimeoutInMilliseconds, "ptr", lpOverlapped, "uint")
        return result
    }

    /**
     * The PeerDistClientFlushContent function allows a client to remove content added to the local cache with the PeerDistClientAddData function using the associated PEERDIST_CONTENT_TAG.
     * @remarks
     * The <i>pContentTag</i> is a client supplied tag passed to <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientopencontent">PeerDistClientOpenContent</a>, which labels the content added by the client. This tag is used by the API to selectively flush content from the Peer Distribution cache.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Pointer<PEERDIST_CONTENT_TAG>} pContentTag Pointer to a [PEERDIST_CONTENT_TAG](./ns-peerdist-peerdist_content_tag.md) structure that contains the tag supplied when <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientopencontent">PeerDistClientOpenContent</a> is called.
     * @param {HANDLE} hCompletionPort A handle to the completion port that can be used for retrieving the completion notification of the asynchronous function. To create a completion port, use the <a href="https://docs.microsoft.com/windows/desktop/FileIO/createiocompletionport">CreateIoCompletionPort</a> function. This parameter can be <b>NULL</b>.
     * @param {Pointer} ulCompletionKey Value to be returned through the <i>lpCompletionKey</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> function. This parameter is ignored when <i>hCompletionPort</i> is <b>NULL</b>.
     * @param {Pointer<OVERLAPPED>} lpOverlapped Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. <b>Offset</b> and <b>OffsetHigh</b> are reserved and must be zero.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_IO_PENDING</b>. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature is disabled by Group Policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistclientflushcontent
     * @since windows6.1
     */
    static PeerDistClientFlushContent(hPeerDist, pContentTag, hCompletionPort, ulCompletionKey, lpOverlapped) {
        hCompletionPort := hCompletionPort is Win32Handle ? NumGet(hCompletionPort, "ptr") : hCompletionPort

        result := DllCall("PeerDist.dll\PeerDistClientFlushContent", "ptr", hPeerDist, "ptr", pContentTag, "ptr", hCompletionPort, "ptr", ulCompletionKey, "ptr", lpOverlapped, "uint")
        return result
    }

    /**
     * PeerDistClientCancelAsyncOperation function cancels asynchronous operation associated with an OVERLAPPED structure and the content handle returned by PeerDistClientOpenContent.
     * @remarks
     * This function will synchronously cancel the operation, but will not return until the cancellation result is posted to the completion port or wait event is set to the signaled state. Any threads in waiting can receive the completion notice for the operation before or after the <b>PeerDistClientCancelAsyncOperation</b> function returns.
     * 
     * This function  does not guarantee that the operation will complete as canceled. The cancellation result will be posted only if no other results have been posted. 
     * 
     * To confirm successfully canceled operations, a call should be made to <a href="https://docs.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> with an expected return of <b>FALSE</b>.
     * 
     * Additionally, calling <a href="https://docs.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> immediately after a successful <b>PeerDistClientCancelAsyncOperation</b> will return the <b>ERROR_OPERATION_ABORTED</b> error code.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Pointer} hContentHandle A content handle opened by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientopencontent">PeerDistClientOpenContent</a> function call.
     * @param {Pointer<OVERLAPPED>} pOverlapped Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure that contains the canceling asynchronous operation data. If the pointer is <b>NULL</b> all asynchronous operations for specified content handle will be canceled.
     * @returns {Integer} The function will return <b>ERROR_SUCCESS</b> value if the operation associated with the specified <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure is successfully canceled. Otherwise, the function may return one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>hPeerDist</i> handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_OPERATION_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation associated with the specified <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure cannot be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The feature is disabled by Group Policy.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PEERDIST_ERROR_SERVICE_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistclientcancelasyncoperation
     * @since windows6.1
     */
    static PeerDistClientCancelAsyncOperation(hPeerDist, hContentHandle, pOverlapped) {
        A_LastError := 0

        result := DllCall("PeerDist.dll\PeerDistClientCancelAsyncOperation", "ptr", hPeerDist, "ptr", hContentHandle, "ptr", pOverlapped, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * PeerDistGetStatusEx function returns the current status and capabilities of the Peer Distribution service.
     * @remarks
     * A Group Policy change can result in the Peer Distribution service  moving to an  available, unavailable, or disabled state. Depending on the resultant state of this transition, the content, content information, or stream handles  the caller has access to may  no longer function. If this is the case, the caller must explicitly close the handles by calling the appropriate Peer Distribution API.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Pointer<PEERDIST_STATUS_INFO>} pPeerDistStatus A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/ns-peerdist-peerdist_status_info">PEERDIST_STATUS_INFO</a> structure that contains the current status and capabilities of the Peer Distribution service.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistgetstatusex
     * @since windows8.0
     */
    static PeerDistGetStatusEx(hPeerDist, pPeerDistStatus) {
        result := DllCall("PeerDist.dll\PeerDistGetStatusEx", "ptr", hPeerDist, "ptr", pPeerDistStatus, "uint")
        return result
    }

    /**
     * The PeerDistRegisterForStatusChangeNotificationEx function requests the Peer Distribution service status change notification.
     * @remarks
     * This function optionally registers a completion port and an <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure for status change notification. Upon successful completion, the <i>pPeerDistStatus</i> parameter will contain a valid <b>PEERDIST_STATUS</b> value.
     * 
     * Only one active registration for each session is allowed. The caller must register for notification each time after it signals. The notification will be sent only if the current status is changed from the previous notification. After the first call of the <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistregisterforstatuschangenotification">PeerDistRegisterForStatusChangeNotification</a> function for the  Peer Distribution session, the first notification will trigger only if the status is no longer equal to <b>PEERDIST_STATUS_DISABLED</b>.
     * 
     * A Peer Distribution status change can result in the Peer Distribution service moving to an available, unavailable, or disabled state. If the new status is disabled or unavailable, the content, content information, or stream handles the caller has access to will no longer function.  In this case, any API that uses these handles will fail with error <b>PEERDIST_ ERROR_INVALIDATED</b>.  The caller must explicitly close the handles by calling the appropriate Peer Distribution API.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {HANDLE} hCompletionPort A handle to the completion port that can be used for retrieving the completion notification of the asynchronous function. To create a completion port, use the <a href="https://docs.microsoft.com/windows/desktop/FileIO/createiocompletionport">CreateIoCompletionPort</a> function.  This parameter can be <b>NULL</b>.
     * @param {Pointer} ulCompletionKey Value to be returned through the <i>lpCompletionKey</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> function.  This parameter is ignored when <i>hCompletionPort</i> is <b>NULL</b>.
     * @param {Pointer<OVERLAPPED>} lpOverlapped Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure. If the <b>hEvent</b> member of the structure is not <b>NULL</b>, it will be signaled via SetEvent() used in order to signal the notification. This can occur  even if the completion port is specified via the <i>hCompletionPort</i> argument.
     * @param {Pointer<PEERDIST_STATUS_INFO>} pPeerDistStatus A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/ns-peerdist-peerdist_status_info">PEERDIST_STATUS_INFO</a> structure that contains the current status and capabilities of the Peer Distribution service.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistregisterforstatuschangenotificationex
     * @since windows8.0
     */
    static PeerDistRegisterForStatusChangeNotificationEx(hPeerDist, hCompletionPort, ulCompletionKey, lpOverlapped, pPeerDistStatus) {
        hCompletionPort := hCompletionPort is Win32Handle ? NumGet(hCompletionPort, "ptr") : hCompletionPort

        result := DllCall("PeerDist.dll\PeerDistRegisterForStatusChangeNotificationEx", "ptr", hPeerDist, "ptr", hCompletionPort, "ptr", ulCompletionKey, "ptr", lpOverlapped, "ptr", pPeerDistStatus, "uint")
        return result
    }

    /**
     * The PeerDistGetOverlappedResult function retrieves the results of asynchronous operations.
     * @param {Pointer<OVERLAPPED>} lpOverlapped A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure that was specified when the overlapped operation was started.
     * @param {Pointer<Integer>} lpNumberOfBytesTransferred A pointer to a variable that receives the number of bytes that were actually transferred by a read or write operation.
     * @param {BOOL} bWait If this parameter is `true`, the function does not return until the operation has been completed. If this parameter is `false` and the operation is still pending, the function returns `false`.
     * @returns {BOOL} Type: **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * `true` if the operation has completed. `false` if the *bWait* argument is `false` and the operation is still pending.
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistgetoverlappedresult
     * @since windows8.0
     */
    static PeerDistGetOverlappedResult(lpOverlapped, lpNumberOfBytesTransferred, bWait) {
        lpNumberOfBytesTransferredMarshal := lpNumberOfBytesTransferred is VarRef ? "uint*" : "ptr"

        result := DllCall("PeerDist.dll\PeerDistGetOverlappedResult", "ptr", lpOverlapped, lpNumberOfBytesTransferredMarshal, lpNumberOfBytesTransferred, "int", bWait, "int")
        return result
    }

    /**
     * PeerDistServerOpenContentInformationEx function opens a PEERDIST_CONTENTINFO_HANDLE. The client uses the handle to retrieve content information.
     * @remarks
     * If function succeeds, the handle received by <i>phContentInfo</i> can be passed to the  
     *  <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverretrievecontentinformation">PeerDistServerRetrieveContentInformation</a> function to retrieve content information.
     * The  handle   must be closed via the <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistserverclosecontentinformation">PeerDistServerCloseContentInformation</a> function.
     * 
     * 
     * If <i>ullContentOffset</i> and <i>cbContentLength</i> are both zero, then the content information for the whole content will be retrieved.
     * 
     * The <i>pRetrievalOptions</i> parameter can be used to specify the range of content information versions that the requesting client is configured to process. This enables the client to retrieve an applicable version of the content information structure.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a>.
     * @param {Integer} cbContentIdentifier The length, in bytes, of the content identifier.
     * @param {Pointer} pContentIdentifier Pointer to a buffer that contains the content identifier.
     * @param {Integer} ullContentOffset An offset from the beginning of the published content for which the content information handle is requested.
     * @param {Integer} cbContentLength The length, in bytes, of the content (starting from the ullContentOffset) for which the content information is requested.
     * @param {Pointer<PEERDIST_RETRIEVAL_OPTIONS>} pRetrievalOptions A <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/ns-peerdist-peerdist_retrieval_options">PEER_RETRIEVAL_OPTIONS</a> structure specifying additional options for retrieving content information.
     * @param {HANDLE} hCompletionPort A handle to the completion port used for retrieving the completion notification of the asynchronous function. To create a completion port, use the <a href="https://docs.microsoft.com/windows/desktop/FileIO/createiocompletionport">CreateIoCompletionPort</a> function. This parameter can be <b>NULL</b>.
     * @param {Pointer} ulCompletionKey Value to be returned through the <i>lpCompletionKey</i> parameter of the <a href="https://docs.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> function. This parameter is ignored when <i>hCompletionPort</i> is <b>NULL</b>.
     * @param {Pointer<Pointer>} phContentInfo A handle  used to retrieve the content information.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistserveropencontentinformationex
     * @since windows8.0
     */
    static PeerDistServerOpenContentInformationEx(hPeerDist, cbContentIdentifier, pContentIdentifier, ullContentOffset, cbContentLength, pRetrievalOptions, hCompletionPort, ulCompletionKey, phContentInfo) {
        hCompletionPort := hCompletionPort is Win32Handle ? NumGet(hCompletionPort, "ptr") : hCompletionPort

        phContentInfoMarshal := phContentInfo is VarRef ? "ptr*" : "ptr"

        result := DllCall("PeerDist.dll\PeerDistServerOpenContentInformationEx", "ptr", hPeerDist, "uint", cbContentIdentifier, "ptr", pContentIdentifier, "uint", ullContentOffset, "uint", cbContentLength, "ptr", pRetrievalOptions, "ptr", hCompletionPort, "ptr", ulCompletionKey, phContentInfoMarshal, phContentInfo, "uint")
        return result
    }

    /**
     * The PeerDistClientGetInformationByHandle function retrieves additional information from the Peer Distribution service for a specific content handle.
     * @param {Pointer} hPeerDist A <b>PEERDIST_INSTANCE_HANDLE</b> returned by the <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdiststartup">PeerDistStartup</a> function.
     * @param {Pointer} hContentHandle A <b>PEERDIST_CONTENT_HANDLE</b> returned by the <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientopencontent">PeerDistClientOpenContent</a> function.
     * @param {Integer} PeerDistClientInfoClass A value from the <a href="https://docs.microsoft.com/windows/win32/api/peerdist/ne-peerdist-peerdist_client_info_by_handle_class">PEERDIST_CLIENT_INFO_BY_HANDLE_CLASS</a> enumeration that indicates the information to retrieve.
     * @param {Integer} dwBufferSize The size, in bytes, of the buffer for the <i>lpInformation</i> parameter.
     * @param {Pointer} lpInformation A buffer for the returned information. The format of this information depends on the value of the <i>PeerDistClientInfoClass</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * @see https://learn.microsoft.com/windows/win32/api/peerdist/nf-peerdist-peerdistclientgetinformationbyhandle
     * @since windows8.0
     */
    static PeerDistClientGetInformationByHandle(hPeerDist, hContentHandle, PeerDistClientInfoClass, dwBufferSize, lpInformation) {
        result := DllCall("PeerDist.dll\PeerDistClientGetInformationByHandle", "ptr", hPeerDist, "ptr", hContentHandle, "int", PeerDistClientInfoClass, "uint", dwBufferSize, "ptr", lpInformation, "uint")
        return result
    }

;@endregion Methods
}
