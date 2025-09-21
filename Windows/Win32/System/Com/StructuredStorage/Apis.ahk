#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class StructuredStorage {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static PROPSETFLAG_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROPSETFLAG_NONSIMPLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROPSETFLAG_ANSI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROPSETFLAG_UNBUFFERED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PROPSETFLAG_CASE_SENSITIVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PROPSET_BEHAVIOR_CASE_SENSITIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PID_DICTIONARY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PID_CODEPAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PID_FIRST_USABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PID_FIRST_NAME_DEFAULT => 4095

    /**
     * @type {Integer (UInt32)}
     */
    static PID_LOCALE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static PID_MODIFY_TIME => 2147483649

    /**
     * @type {Integer (UInt32)}
     */
    static PID_SECURITY => 2147483650

    /**
     * @type {Integer (UInt32)}
     */
    static PID_BEHAVIOR => 2147483651

    /**
     * @type {Integer (UInt32)}
     */
    static PID_ILLEGAL => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static PID_MIN_READONLY => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static PID_MAX_READONLY => 3221225471

    /**
     * @type {Integer (UInt32)}
     */
    static PRSPEC_INVALID => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static PROPSETHDR_OSVERSION_UNKNOWN => 4294967295

    /**
     * @type {Integer (Int32)}
     */
    static PIDDI_THUMBNAIL => 2

    /**
     * @type {Integer (Int32)}
     */
    static PIDSI_TITLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PIDSI_SUBJECT => 3

    /**
     * @type {Integer (Int32)}
     */
    static PIDSI_AUTHOR => 4

    /**
     * @type {Integer (Int32)}
     */
    static PIDSI_KEYWORDS => 5

    /**
     * @type {Integer (Int32)}
     */
    static PIDSI_COMMENTS => 6

    /**
     * @type {Integer (Int32)}
     */
    static PIDSI_TEMPLATE => 7

    /**
     * @type {Integer (Int32)}
     */
    static PIDSI_LASTAUTHOR => 8

    /**
     * @type {Integer (Int32)}
     */
    static PIDSI_REVNUMBER => 9

    /**
     * @type {Integer (Int32)}
     */
    static PIDSI_EDITTIME => 10

    /**
     * @type {Integer (Int32)}
     */
    static PIDSI_LASTPRINTED => 11

    /**
     * @type {Integer (Int32)}
     */
    static PIDSI_CREATE_DTM => 12

    /**
     * @type {Integer (Int32)}
     */
    static PIDSI_LASTSAVE_DTM => 13

    /**
     * @type {Integer (Int32)}
     */
    static PIDSI_PAGECOUNT => 14

    /**
     * @type {Integer (Int32)}
     */
    static PIDSI_WORDCOUNT => 15

    /**
     * @type {Integer (Int32)}
     */
    static PIDSI_CHARCOUNT => 16

    /**
     * @type {Integer (Int32)}
     */
    static PIDSI_THUMBNAIL => 17

    /**
     * @type {Integer (Int32)}
     */
    static PIDSI_APPNAME => 18

    /**
     * @type {Integer (Int32)}
     */
    static PIDSI_DOC_SECURITY => 19

    /**
     * @type {Integer (UInt32)}
     */
    static PIDDSI_CATEGORY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PIDDSI_PRESFORMAT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PIDDSI_BYTECOUNT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PIDDSI_LINECOUNT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PIDDSI_PARCOUNT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PIDDSI_SLIDECOUNT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PIDDSI_NOTECOUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PIDDSI_HIDDENCOUNT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PIDDSI_MMCLIPCOUNT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PIDDSI_SCALE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static PIDDSI_HEADINGPAIR => 12

    /**
     * @type {Integer (UInt32)}
     */
    static PIDDSI_DOCPARTS => 13

    /**
     * @type {Integer (UInt32)}
     */
    static PIDDSI_MANAGER => 14

    /**
     * @type {Integer (UInt32)}
     */
    static PIDDSI_COMPANY => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PIDDSI_LINKSDIRTY => 16

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_EDITOR => 2

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_SUPPLIER => 3

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_SOURCE => 4

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_SEQUENCE_NO => 5

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_PROJECT => 6

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_STATUS => 7

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_OWNER => 8

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_RATING => 9

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_PRODUCTION => 10

    /**
     * @type {Integer (Int32)}
     */
    static PIDMSI_COPYRIGHT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static CWCSTORAGENAME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static STGOPTIONS_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CCH_MAX_PROPSTG_NAME => 31
;@endregion Constants

;@region Methods
    /**
     * Creates a new object and initializes it from a file using IPersistFile::Load.
     * @remarks
     * <b>CoGetInstanceFromFile</b> creates a new object and initializes it from a file using <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-load">IPersistFile::Load</a>. The result of this function is similar to creating an instance with a call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstanceex">CoCreateInstanceEx</a>, followed by an initializing call to <b>IPersistFile::Load</b>, with the following important distinctions:
     * 
     * <ul>
     * <li>Fewer network round trips are required by this function when instantiating an object on a remote computer.</li>
     * <li>In the case where <i>dwClsCtx</i> is set to CLSCTX_REMOTE_SERVER and <i>pServerInfo</i> is <b>NULL</b>, if the class is registered with the <a href="https://docs.microsoft.com/windows/desktop/com/activateatstorage">ActivateAtStorage</a> sub-key or has no associated registry information, this function will instantiate an object on the computer where <i>pwszName</i> resides, providing the least possible network traffic.</li>
     * </ul>
     * @param {Pointer<COSERVERINFO>} pServerInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a> structure that specifies the computer on which to instantiate the object and the authentication setting to be used. This parameter can be <b>NULL</b>, in which case the object is instantiated on the current computer, at the computer specified under the <a href="https://docs.microsoft.com/windows/desktop/com/remoteservername">RemoteServerName</a> registry value for the class, or at the computer where the <i>pwszName</i> file resides if the <a href="https://docs.microsoft.com/windows/desktop/com/activateatstorage">ActivateAtStorage</a> value is specified for the class or there is no local registry information.
     * @param {Pointer<Guid>} pClsid A pointer to the class identifier of the object to be created. This parameter can be <b>NULL</b>, in which case there is a call to <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-getclassfile">GetClassFile</a>, using <i>pwszName</i> as its parameter to get the class of the object to be instantiated.
     * @param {Pointer<IUnknown>} punkOuter When non-<b>NULL</b>, indicates the instance is being created as part of an aggregate, and <i>punkOuter</i> is to be used as the pointer to the new instance's controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. Aggregation is not supported cross-process or cross-computer. When instantiating an object out of process, CLASS_E_NOAGGREGATION will be returned if <i>punkOuter</i> is non-<b>NULL</b>.
     * @param {Integer} dwClsCtx Values from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration.
     * @param {Integer} grfMode Specifies how the file is to be opened. See <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>.
     * @param {Pointer<Char>} pwszName The file used to initialize the object with <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-load">IPersistFile::Load</a>. This parameter cannot be <b>NULL</b>.
     * @param {Integer} dwCount The number of structures in <i>pResults</i>. This parameter must be greater than 0.
     * @param {Pointer<MULTI_QI>} pResults An array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-multi_qi">MULTI_QI</a> structures. Each structure has three members: the identifier for a requested interface (<b>pIID</b>), the location to return the interface pointer (<b>pItf</b>) and the return value of the call to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> (<b>hr</b>).
     * @returns {HRESULT} This function can return the standard return value E_INVALIDARG, as well as the following values.
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
     * The function retrieved all of the interfaces successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_S_NOTALLINTERFACES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one, but not all of the interfaces requested in the <i>pResults</i> array were successfully retrieved. The <b>hr</b> member of each of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-multi_qi">MULTI_QI</a> structures indicates with S_OK or E_NOINTERFACE whether the specific interface was returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None of the interfaces requested in the <i>pResults</i> array were successfully retrieved.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-cogetinstancefromfile
     * @since windows5.0
     */
    static CoGetInstanceFromFile(pServerInfo, pClsid, punkOuter, dwClsCtx, grfMode, pwszName, dwCount, pResults) {
        pwszName := pwszName is String? StrPtr(pwszName) : pwszName

        result := DllCall("OLE32.dll\CoGetInstanceFromFile", "ptr", pServerInfo, "ptr", pClsid, "ptr", punkOuter, "uint", dwClsCtx, "uint", grfMode, "ptr", pwszName, "uint", dwCount, "ptr", pResults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a new object and initializes it from a storage object through an internal call to IPersistFile::Load.
     * @remarks
     * <b>CoGetInstanceFromIStorage</b> creates a new object and initializes it from a storage object using <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-load">IPersistFile::Load</a>. The result of this function is similar to creating an instance with a call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstanceex">CoCreateInstanceEx</a>, followed by an initializing call to <b>IPersistFile::Load</b>, with the following important distinctions: 
     * 
     * 
     * 
     * <ul>
     * <li>Fewer network round trips are required by this function when instantiating an object on a remote computer.
     * </li>
     * <li>In the case where <i>dwClsCtx</i> is set to CLSCTX_REMOTE_SERVER and <i>pServerInfo</i> is <b>NULL</b>, if the class is registered with the <a href="https://docs.microsoft.com/windows/desktop/com/activateatstorage">ActivateAtStorage</a> value or has no associated registry information, this function will instantiate an object on the computer where <i>pstg</i> resides, providing the least possible network traffic.</li>
     * </ul>
     * @param {Pointer<COSERVERINFO>} pServerInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a> structure that specifies the computer on which to instantiate the object and the authentication setting to be used. This parameter can be <b>NULL</b>, in which case the object is instantiated on the current computer, at the computer specified under the <a href="https://docs.microsoft.com/windows/desktop/com/remoteservername">RemoteServerName</a> registry value for the class, or at the computer where the <i>pstg</i> storage object resides if the <a href="https://docs.microsoft.com/windows/desktop/com/activateatstorage">ActivateAtStorage</a> value is specified for the class or there is no local registry information.
     * @param {Pointer<Guid>} pClsid A pointer to the class identifier of the object to be created. This parameter can be <b>NULL</b>, in which case there is a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-stat">IStorage::Stat</a> to find the class of the object.
     * @param {Pointer<IUnknown>} punkOuter When non-<b>NULL</b>, indicates the instance is being created as part of an aggregate, and <i>punkOuter</i> is to be used as the pointer to the new instance's controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. Aggregation is not supported cross-process or cross-computer. When instantiating an object out of process, CLASS_E_NOAGGREGATION will be returned if <i>punkOuter</i> is non-<b>NULL</b>.
     * @param {Integer} dwClsCtx Values from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration.
     * @param {Pointer<IStorage>} pstg A pointer to the storage object used to initialize the object with <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-load">IPersistFile::Load</a>. This parameter cannot be <b>NULL</b>.
     * @param {Integer} dwCount The number of structures in <i>pResults</i>. This parameter must be greater than 0.
     * @param {Pointer<MULTI_QI>} pResults An array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-multi_qi">MULTI_QI</a> structures. Each structure has three members: the identifier for a requested interface (<b>pIID</b>), the location to return the interface pointer (<b>pItf</b>) and the return value of the call to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> (<b>hr</b>).
     * @returns {HRESULT} This function can return the standard return value E_INVALIDARG, as well as the following values.
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
     * The function retrieved all of the interfaces successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_S_NOTALLINTERFACES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one, but not all of the interfaces requested in the <i>pResults</i> array were successfully retrieved. The <b>hr</b> member of each of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-multi_qi">MULTI_QI</a> structures indicates with S_OK or E_NOINTERFACE whether the specific interface was returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None of the interfaces requested in the <i>pResults</i> array were successfully retrieved.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-cogetinstancefromistorage
     * @since windows5.0
     */
    static CoGetInstanceFromIStorage(pServerInfo, pClsid, punkOuter, dwClsCtx, pstg, dwCount, pResults) {
        result := DllCall("OLE32.dll\CoGetInstanceFromIStorage", "ptr", pServerInfo, "ptr", pClsid, "ptr", punkOuter, "uint", dwClsCtx, "ptr", pstg, "uint", dwCount, "ptr", pResults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Opens an existing root asynchronous storage object on a byte-array wrapper object provided by the caller.
     * @remarks
     * The root storage of the asynchronous storage object is opened according to the access mode in the <i>grfMode</i> parameter. A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the opened storage object is supplied through the <i>ppstgOpen</i> parameter.
     * 
     * The byte array wrapper object must have been previously instantiated through a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-stggetifilllockbytesonfile">StgGetIFillLockBytesOnFile</a> function.
     * 
     * <b>StgOpenAsyncDocfileOnIFillLockBytes</b> does not support priority access mode or exclusions. Otherwise, it works in much the same way as the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgopenstorageonilockbytes">StgOpenStorageOnILockBytes</a> function.
     * 
     * The returned storage object has a connection point for 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iprogressnotify">IProgressNotify</a>.
     * @param {Pointer<IFillLockBytes>} pflb A <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ifilllockbytes">IFillLockBytes</a> pointer to the byte-array wrapper object that contains the storage object to be opened.
     * @param {Integer} grfMode A value that specifies the access mode to use to open the storage object. The most common access mode, taken from <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>, is STGM_READ.
     * @param {Integer} asyncFlags A value that indicates whether a connection point on a storage is inherited by its substorages and streams. ASYNC_MODE_COMPATIBILITY indicates that the connection point is inherited; ASYNC_MODE_DEFAULT indicates that the connection point is not inherited.
     * @param {Pointer<IStorage>} ppstgOpen A pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a>* pointer variable that receives the interface pointer to the root asynchronous storage object.
     * @returns {HRESULT} This function supports the standard return values E_OUTOFMEMORY, E_UNEXPECTED, E_INVALIDARG, and E_FAIL, as well as the following:
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-stgopenasyncdocfileonifilllockbytes
     */
    static StgOpenAsyncDocfileOnIFillLockBytes(pflb, grfMode, asyncFlags, ppstgOpen) {
        result := DllCall("ole32.dll\StgOpenAsyncDocfileOnIFillLockBytes", "ptr", pflb, "uint", grfMode, "uint", asyncFlags, "ptr", ppstgOpen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a new wrapper object on a byte array object provided by the caller.
     * @remarks
     * The 
     * <b>StgGetIFillLockBytesOnILockBytes</b> function makes it possible to create an asynchronous storage wrapper object on a custom byte-array object. For example, if you wanted to implement asynchronous storage on a database for which you have already created a byte-array object, you would call this function to create the wrapper object for the byte array. To do so, the function creates a new wrapper object and then initializes it by passing it a pointer to the existing byte-array object.
     * @param {Pointer<ILockBytes>} pilb Pointer to an existing byte array object.
     * @param {Pointer<IFillLockBytes>} ppflb Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ifilllockbytes">IFillLockBytes</a> pointer variable that receives the interface pointer to the new byte array wrapper object.
     * @returns {HRESULT} This function supports the standard return values E_UNEXPECTED and E_FAIL, as well as the following:
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-stggetifilllockbytesonilockbytes
     */
    static StgGetIFillLockBytesOnILockBytes(pilb, ppflb) {
        result := DllCall("ole32.dll\StgGetIFillLockBytesOnILockBytes", "ptr", pilb, "ptr", ppflb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Opens a wrapper object on a temporary file.
     * @remarks
     * The moniker that manages the downloading of the file specified in <i>pwcsName</i> calls this function in the course of creating the asynchronous storage necessary to manage the asynchronous downloading of data. The moniker first creates a temporary file, then calls this function to create the wrapper object on that file. Finally, the moniker calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-stgopenasyncdocfileonifilllockbytes">StgOpenAsyncDocfileOnIFillLockBytes</a> to open the root storage of the compound file to be downloaded into the temporary file.
     * @param {Pointer<Char>} pwcsName A pointer to the null-terminated unicode string name of the file for which a wrapper object is created.
     * @param {Pointer<IFillLockBytes>} ppflb A pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ifilllockbytes">IFillLockBytes</a>* pointer variable that receives the interface pointer to the new byte array wrapper object.
     * @returns {HRESULT} This function supports the standard return values E_OUTOFMEMORY, E_UNEXPECTED, E_INVALIDARG, and E_FAIL, in addition to the following:
     * 
     * The <b>StgGetIFillLockBytesOnFile</b>  function can also return any file system errors.
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-stggetifilllockbytesonfile
     */
    static StgGetIFillLockBytesOnFile(pwcsName, ppflb) {
        pwcsName := pwcsName is String? StrPtr(pwcsName) : pwcsName

        result := DllCall("ole32.dll\StgGetIFillLockBytesOnFile", "ptr", pwcsName, "ptr", ppflb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Opens a compound file on an ILockBytes implementation that is capable of monitoring sector data.
     * @remarks
     * The compound file implementation created by this function exposes the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilayoutstorage">ILayoutStorage</a> interface on its root storage. Applications use this interface to express the optimal layout of their compound files in order to download and render data more rapidly over a slow link. 
     * <b>StgOpenLayoutDocfile</b> returns a pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the root storage of the newly created compound file. Using this pointer, applications call <b>QueryInterface</b> to obtain a pointer to 
     * <b>ILayoutStorage</b>.
     * @param {Pointer<Char>} pwcsDfName A pointer to the null-terminated Unicode string name of the compound file to be opened.
     * @param {Integer} grfMode Access mode to use when opening the newly created storage object. Values are taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>. Be aware that priority mode and exclusions are not supported. The most common access mode is likely to be STGM_DIRECT | STGM_READ | STGM_SHARE_EXCLUSIVE.
     * @param {Integer} reserved Reserved for future use.
     * @param {Pointer<IStorage>} ppstgOpen A pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer variable that receives the interface pointer to the root object of the newly created root storage object.
     * @returns {HRESULT} This function supports the standard return values E_OUTOFMEMORY, E_UNEXPECTED, E_INVALIDARG, and E_FAIL, in addition to the following:
     * 
     * The <b>StgOpenLayoutDocfile</b> function can also return any of the error values returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgopenstorageonilockbytes">StgOpenStorageOnILockBytes</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-stgopenlayoutdocfile
     */
    static StgOpenLayoutDocfile(pwcsDfName, grfMode, reserved, ppstgOpen) {
        pwcsDfName := pwcsDfName is String? StrPtr(pwcsDfName) : pwcsDfName

        result := DllCall("dflayout.dll\StgOpenLayoutDocfile", "ptr", pwcsDfName, "uint", grfMode, "uint", reserved, "ptr", ppstgOpen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a stream object that uses an HGLOBAL memory handle to store the stream contents.
     * @remarks
     * If <i>hGlobal</i> is <b>NULL</b>, the function allocates a new memory handle and the stream is initially empty.
     * 
     * If <i>hGlobal</i> is not <b>NULL</b>, the initial contents of the stream are the current contents of the memory block. Thus, <b>CreateStreamOnHGlobal</b> can be used to open an existing stream in memory. The memory handle and its contents are undisturbed by the creation of the new stream object.
     * 
     * The initial size of the stream is the size of <i>hGlobal</i> as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalsize">GlobalSize</a> function. Because of rounding, this is not necessarily the same size that was originally allocated for the handle. If the logical size of the stream is important, follow the call to this function with a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-setsize">IStream::SetSize</a> method.
     * 
     * The new stream object’s initial seek position is the beginning of the stream.
     * 
     * After creating the stream object with 
     * <b>CreateStreamOnHGlobal</b>, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-gethglobalfromstream">GetHGlobalFromStream</a> to retrieve the memory handle associated with the stream object.
     * 
     * If a memory handle is passed to  <b>CreateStreamOnHGlobal</b> or if <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-gethglobalfromstream">GetHGlobalFromStream</a> is called, the memory handle of this function can be directly accessed by the caller while it is still in use by the stream object. Appropriate caution should be exercised in the use of this capability and its implications:
     * 
     * <ul>
     * <li>Do not free the <i>hGlobal</i> memory handle during the lifetime of the stream object. <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IStream::Release</a> must be called before freeing the memory handle.</li>
     * <li>Do not call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> to change the size of the memory handle during the lifetime of the stream object or its clones.  This may cause application crashes or memory corruption. Avoid creating multiple stream objects separately on the same memory handle, because the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-write">IStream::Write</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-setsize">IStream::SetSize</a> methods may internally call <b>GlobalReAlloc</b>.  The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-clone">IStream::Clone</a> method can be used to create a new stream object based on the same memory handle that will properly coordinate its access with the original stream object.</li>
     * <li>If possible, avoid accessing the memory block during the lifetime of the stream object, because the object may internally call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> and do not make assumptions about its size and location.  If the memory block must be accessed, the memory access calls should be surrounded by calls to <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globallock">GlobalLock</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalunlock">GlobalUnLock</a>.</li>
     * <li>Avoid calling the object’s methods while you have the memory handle locked with <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globallock">GlobalLock</a>.  This can cause method calls to fail unpredictably.</li>
     * </ul>
     * If the <i>fDeleteOnRelease</i> parameter is <b>FALSE</b>, the caller is responsible for freeing the underlying memory handle, even if the <i>hGlobal</i> parameter is <b>NULL</b>. Use the <b>GetHGlobalFromStream</b> function to obtain the underlying memory handle and <b>GlobalFree</b> that memory after the last reference to the stream is released. If the caller sets the <i>fDeleteOnRelease</i> parameter to <b>TRUE</b>, the final release will automatically free the underlying memory handle.
     * 
     * The memory handle passed as the <i>hGlobal</i> parameter must be allocated as movable and nondiscardable, as shown in the following example:
     * 
     * 
     * ```cpp
     * HGLOBAL	hMem = ::GlobalAlloc(GMEM_MOVEABLE,iSize);
     * if (!hMem)
     *     AfxThrowMemoryException();
     * 
     * LPVOID pImage = ::GlobalLock(hMem);
     * ... // Fill memory
     * ::GlobalUnlock(hMem);
     * 
     * CComPtr<IStream> spStream;
     * HRESULT hr = ::CreateStreamOnHGlobal(hMem,FALSE,&spStream);
     * ```
     * 
     * 
     * <b>CreateStreamOnHGlobal</b> will accept a memory handle allocated with <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GMEM_FIXED</a>, but this usage is not recommended. HGLOBALs allocated with <b>GMEM_FIXED</b> are not really handles and their value can change when they are reallocated. If the memory handle was allocated with <b>GMEM_FIXED</b> and <i>fDeleteOnRelease</i> is <b>FALSE</b>,  the caller must call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-gethglobalfromstream">GetHGlobalFromStream</a> to get the correct handle in order to free it.
     * 
     * Prior to Windows 7 and Windows Server 2008 R2, this implementation did not zero memory when calling <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> to grow the memory block. Increasing the size of the stream with <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-setsize">IStream::SetSize</a> or by writing to a location past the current end of the stream may leave portions of the newly allocated memory uninitialized.
     * @param {Pointer<Void>} hGlobal A memory handle allocated by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> function, or if <b>NULL</b> a new handle is to be allocated instead. The handle must be allocated as moveable and nondiscardable.
     * @param {Integer} fDeleteOnRelease A value that indicates whether the underlying handle for this stream object should be automatically freed when the stream object is released. If set to <b>FALSE</b>, the caller must free the <i>hGlobal</i> after the final release. If set to <b>TRUE</b>, the final release will automatically free the underlying handle. See the Remarks for further discussion of the case where <i>fDeleteOnRelease</i> is <b>FALSE</b>.
     * @param {Pointer<IStream>} ppstm The address of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>* pointer variable that receives the interface pointer to the new stream object. Its value cannot be <b>NULL</b>.
     * @returns {HRESULT} This function supports the standard return values E_INVALIDARG and E_OUTOFMEMORY, as well as the following.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-createstreamonhglobal
     * @since windows5.0
     */
    static CreateStreamOnHGlobal(hGlobal, fDeleteOnRelease, ppstm) {
        result := DllCall("OLE32.dll\CreateStreamOnHGlobal", "ptr", hGlobal, "int", fDeleteOnRelease, "ptr", ppstm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetHGlobalFromStream function retrieves the global memory handle to a stream that was created through a call to the CreateStreamOnHGlobal function.
     * @remarks
     * The handle <b>GetHGlobalFromStream</b> returns may be different from the original handle due to intervening <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> calls.
     * 
     * This function can be called only from within the same process from which the byte array was created.
     * @param {Pointer<IStream>} pstm <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> pointer to the stream object previously created by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-createstreamonhglobal">CreateStreamOnHGlobal</a> function.
     * @param {Pointer<Void>} phglobal Pointer to the current memory handle used by the specified stream object.
     * @returns {HRESULT} This function returns HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-gethglobalfromstream
     * @since windows5.0
     */
    static GetHGlobalFromStream(pstm, phglobal) {
        result := DllCall("OLE32.dll\GetHGlobalFromStream", "ptr", pstm, "ptr", phglobal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Unmarshals a buffer containing an interface pointer and releases the stream when an interface pointer has been marshaled from another thread to the calling thread.
     * @remarks
     * <div class="alert"><b>Important</b>  <p class="note">Security Note: Calling this method with untrusted data is a security risk. Call this method only with trusted data.
     * 
     * </div>
     * <div> </div>
     * The <b>CoGetInterfaceAndReleaseStream</b> function performs the following tasks: 
     * 
     * <ul>
     * <li>Calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-counmarshalinterface">CoUnmarshalInterface</a> to unmarshal an interface pointer previously passed in a call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-comarshalinterthreadinterfaceinstream">CoMarshalInterThreadInterfaceInStream</a>.
     * </li>
     * <li>Releases the stream pointer. Even if the unmarshaling fails, the stream is still released because there is no effective way to recover from a failure of this kind.
     * </li>
     * </ul>
     * @param {Pointer<IStream>} pStm A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface on the stream to be unmarshaled.
     * @param {Pointer<Guid>} iid A reference to the identifier of the interface requested from the unmarshaled object.
     * @param {Pointer<Void>} ppv The address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppv</i> contains the requested interface pointer to the unmarshaled interface.
     * @returns {HRESULT} This function can return the standard return values S_OK and E_INVALIDARG, as well as any of the values returned by <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-counmarshalinterface">CoUnmarshalInterface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cogetinterfaceandreleasestream
     * @since windows5.0
     */
    static CoGetInterfaceAndReleaseStream(pStm, iid, ppv) {
        result := DllCall("OLE32.dll\CoGetInterfaceAndReleaseStream", "ptr", pStm, "ptr", iid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The PropVariantCopy function copies the contents of one PROPVARIANT structure to another.
     * @remarks
     * Copies a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure by value so the original <i>pvarSrc</i> and new <i>pvarDest</i> parameters may be freed independently with calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-propvariantclear">PropVariantClear</a>. 
     * <b>PropVariantCopy</b> does not free the destination as the <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-variantcopy">VariantCopy</a> function does. For nonsimple 
     * <b>PROPVARIANT</b> types such as VT_STREAM, VT_STORAGE, and so forth, which require a subobject, the copy is made by reference. The pointer is copied, and [IUnknown::AddRef](../unknwn/nf-unknwn-iunknown-addref.md) is called on it. It is illegal to pass <b>NULL</b> for either <i>pvarDest</i> or <i>pvarSrc</i>.
     * @param {Pointer<PROPVARIANT>} pvarDest Pointer to an uninitialized 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that receives the copy.
     * @param {Pointer<PROPVARIANT>} pvarSrc Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure to be copied.
     * @returns {HRESULT} This function returns HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-propvariantcopy
     * @since windows5.0
     */
    static PropVariantCopy(pvarDest, pvarSrc) {
        result := DllCall("OLE32.dll\PropVariantCopy", "ptr", pvarDest, "ptr", pvarSrc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Frees all elements that can be freed in a given PROPVARIANT structure.
     * @remarks
     * At any level of indirection, <b>NULL</b> pointers are ignored. For example, the <i>pvar</i> parameter  points to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure of type <b>VT_CF</b>. The  <b>pclipdata</b> member of the <b>PROPVARIANT</b> structure points to a <b>CLIPDATA</b> structure. The <i>pClipData</i> pointer in the <b>CLIPDATA</b> structure is  <b>NULL</b>.  In this example, the <i>pClipData</i> pointer is ignored.  However, the <b>CLIPDATA</b> structure pointed to by the <b>pclipdata</b> member of the <b>PROPVARIANT</b> structure is freed.
     * 
     * On return, this function writes zeroes to the specified 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure, so the VT-type is <b>VT_EMPTY</b>.
     * 
     * Passing <b>NULL</b> as the <i>pvar</i> parameter produces a return code of S_OK.
     * 
     * <div class="alert"><b>Note</b>  Do not use this function to initialize 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures. Instead, initialize these structures using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-propvariantinit">PropVariantInit</a> macro (defined in Propidl.h).</div>
     * <div> </div>
     * @param {Pointer<PROPVARIANT>} pvar A pointer to an initialized 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure for which any deallocatable elements are to be freed. On return, all zeroes are written to the 
     * <b>PROPVARIANT</b> structure.
     * @returns {HRESULT} This function returns HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-propvariantclear
     * @since windows5.0
     */
    static PropVariantClear(pvar) {
        result := DllCall("OLE32.dll\PropVariantClear", "ptr", pvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The FreePropVariantArray function calls PropVariantClear on each of the PROPVARIANT structures in the rgvars array to make the value zero for each of the members of the array.
     * @remarks
     * <b>FreePropVariantArray</b> calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-propvariantclear">PropVariantClear</a> on an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures to clear all the valid members. All valid 
     * <b>PROPVARIANT</b> structures are freed. If any of the 
     * <b>PROPVARIANT</b> structures contain illegal VT types, valid members are freed and the function returns STG_E_INVALIDPARAMETER.
     * 
     * Passing <b>NULL</b> for <i>rgvars</i> is legal, and produces a return code of S_OK.
     * @param {Integer} cVariants Count of elements in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> array (<i>rgvars</i>).
     * @param {Pointer<PROPVARIANT>} rgvars Pointer to an initialized array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures for which any deallocatable elements are to be freed. On exit, all zeroes are written to the 
     * <b>PROPVARIANT</b> structure (thus tagging them as VT_EMPTY).
     * @returns {HRESULT} This function returns HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-freepropvariantarray
     * @since windows5.0
     */
    static FreePropVariantArray(cVariants, rgvars) {
        result := DllCall("OLE32.dll\FreePropVariantArray", "uint", cVariants, "ptr", rgvars, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a new compound file storage object using the COM-provided compound file implementation for the IStorage interface.
     * @remarks
     * The 
     * <b>StgCreateDocfile</b> function creates a new storage object using the COM-provided, compound-file implementation for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface. The name of the open compound file can be retrieved by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-stat">IStorage::Stat</a> method.
     * 
     * <b>StgCreateDocfile</b> creates the file if it does not exist. If it does exist, the use of the STGM_CREATE, STGM_CONVERT, and STGM_FAILIFTHERE flags in the <i>grfMode</i> parameter indicate how to proceed. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>.
     * 
     * If the compound file is opened in transacted mode (the <i>grfMode</i> parameter specifies STGM_TRANSACTED) and a file with this name already exists, the existing file is not altered until all outstanding changes are committed. If the calling process lacks write access to the existing file (because of access control in the file system), the <i>grfMode</i> parameter can only specify STGM_READ and not STGM_WRITE or STGM_READWRITE. The resulting new open compound file can still be written to, but a subsequent commit operation will fail (in transacted mode, write permissions are enforced at commit time).
     * 
     * Specifying STGM_SIMPLE provides a much faster implementation of a compound file object in a limited, but frequently used case. This can be used by applications that require a compound-file implementation with multiple streams and no storages. The simple mode does not support all of the methods on 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>.
     * 
     * If the <i>grfMode</i> parameter specifies STGM_TRANSACTED and no file yet exists with the name specified by the <i>pwcsName</i> parameter, the file is created immediately. In an access-controlled file system, the caller must have write permissions in the file system directory in which the compound file is created. If STGM_TRANSACTED is not specified, and STGM_CREATE is specified, an existing file with the same name is destroyed before the new file is created.
     * 
     * <b>StgCreateDocfile</b> can be used to create a temporary compound file by passing a <b>NULL</b> value for the <i>pwcsName</i> parameter. However, these files are temporary only in the sense that they have a system-provided unique name — likely one that is meaningless to the user. The caller is responsible for deleting the temporary file when finished with it, unless STGM_DELETEONRELEASE was specified for the <i>grfMode</i> parameter.
     * @param {Pointer<Char>} pwcsName A pointer to a null-terminated Unicode string name for the compound file being created. It is passed uninterpreted to the file system. This can be a relative name or <b>NULL</b>. If <b>NULL</b>, a temporary compound file is allocated with a unique name.
     * @param {Integer} grfMode Specifies the access mode to use when opening the new storage object. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>. If the caller specifies transacted mode together with STGM_CREATE or STGM_CONVERT, the overwrite or conversion takes place when the commit operation is called for the root storage. If <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-commit">IStorage::Commit</a> is not called for the root storage object, previous contents of the file will be restored. STGM_CREATE and STGM_CONVERT cannot be combined with the STGM_NOSNAPSHOT flag, because a snapshot copy is required when a file is overwritten or converted in the transacted mode.
     * @param {Pointer<IStorage>} ppstgOpen A pointer to the location of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the new storage object.
     * @returns {HRESULT} <b>StgCreateDocfile</b> can also return any file system errors or system errors wrapped in an <b>HRESULT</b>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-strategies">Error Handling Strategies</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/com/handling-unknown-errors">Handling Unknown Errors</a>.
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-stgcreatedocfile
     * @since windows5.0
     */
    static StgCreateDocfile(pwcsName, grfMode, ppstgOpen) {
        static reserved := 0 ;Reserved parameters must always be NULL

        pwcsName := pwcsName is String? StrPtr(pwcsName) : pwcsName

        result := DllCall("OLE32.dll\StgCreateDocfile", "ptr", pwcsName, "uint", grfMode, "uint", reserved, "ptr", ppstgOpen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates and opens a new compound file storage object on top of a byte-array object provided by the caller.
     * @remarks
     * The 
     * <b>StgCreateDocfileOnILockBytes</b> function creates a storage object on top of a byte array object using the COM-provided, compound-file implementation of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface. 
     * <b>StgCreateDocfileOnILockBytes</b> can be used to store a document in an arbitrary data store, such as memory or a relational database. The byte array (indicated by the <i>pLkbyt</i> parameter, which points to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> interface on the object) is used for the underlying storage in place of a disk file.
     * 
     * Except for specifying a programmer-provided byte-array object, 
     * <b>StgCreateDocfileOnILockBytes</b> is similar to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgcreatedocfile">StgCreateDocfile</a> function. 
     * 
     * The newly created compound file is opened according to the access modes in the <i>grfMode</i> parameter, subject to the following restrictions: 
     * 
     * Sharing mode behavior and transactional isolation depend on the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> implementation supporting <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ilockbytes-lockregion">LockRegion</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ilockbytes-unlockregion">UnlockRegion</a> with <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-locktype">LOCK_ONLYONCE</a> semantics.  Implementations can indicate to structured storage they support this functionality by setting the <b>LOCK_ONLYONCE</b> bit in the <b>grfLocksSupported</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a>.  If an <b>ILockBytes</b> implementation does not support this functionality, sharing modes will not be enforced, and root-level transactional commits will not coordinate properly with other transactional instances opened on the same byte array.  Applications that use an <b>ILockBytes</b> implementation that does not support region locking, such as the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-createstreamonhglobal">CreateStreamOnHGlobal</a> implementation, should avoid opening multiple concurrent instances on the same byte array.
     * 
     * <b>StgCreateDocfileOnILockBytes</b> does not support simple mode.  The <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM_SIMPLE</a> flag, if present, is ignored.
     * 
     * For conversion purposes, the file is considered to already exist. As a result, it is not useful to use the <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM_FAILIFTHERE</a> value, because it causes an error to be returned. However, both STGM_CREATE and STGM_CONVERT remain useful.
     * 
     * The ability to build a compound file on top of a byte-array object is provided to support having the data (underneath an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> tree structure) live in a nonpersistent space. Given this capability, there is nothing preventing a document that is stored in a file from using this facility. For example, a container might do this to minimize the impact on its file format caused by adopting COM. However, it is recommended that COM documents adopt the 
     * <b>IStorage</b> interface for their own outer-level storage. This has the following advantages:
     * 
     * <ul>
     * <li>The storage structure of the document is the same as its storage structure when it is an embedded object, reducing the number of cases the application needs to handle.</li>
     * <li>One can write tools to access the OLE embedded and linked objects within the document without special knowledge of the document's file format. An example of such a tool is a copy utility that copies all the documents included in a container containing linked objects. A copy utility like this needs access to the contained links to determine the extent of files to be copied.</li>
     * <li>The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> implementation addresses the problem of how to commit the changes to the file. An application using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> interface must handle these issues itself.</li>
     * </ul>
     * @param {Pointer<ILockBytes>} plkbyt A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> interface on the underlying byte-array object on which to create a compound file.
     * @param {Integer} grfMode Specifies the access mode to use when opening the new compound file. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a> and the Remarks section below.
     * @param {Integer} reserved Reserved for future use; must be zero.
     * @param {Pointer<IStorage>} ppstgOpen A pointer to the location of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer on the new storage object.
     * @returns {HRESULT} The <b>StgCreateDocfileOnILockBytes</b> function can also return any file system errors, or system errors wrapped in an <b>HRESULT</b>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> interface error return values. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-strategies">Error Handling Strategies</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/com/handling-unknown-errors">Handling Unknown Errors</a>.
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-stgcreatedocfileonilockbytes
     * @since windows5.0
     */
    static StgCreateDocfileOnILockBytes(plkbyt, grfMode, reserved, ppstgOpen) {
        result := DllCall("OLE32.dll\StgCreateDocfileOnILockBytes", "ptr", plkbyt, "uint", grfMode, "uint", reserved, "ptr", ppstgOpen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Opens an existing root storage object in the file system.
     * @remarks
     * The 
     * <b>StgOpenStorage</b> function opens the specified root storage object according to the access mode in the <i>grfMode</i> parameter, and, if successful, supplies an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the opened storage object in the <i>ppstgOpen</i> parameter.
     * 
     * To support the simple mode for saving a storage object with no substorages, the 
     * <b>StgOpenStorage</b> function accepts one of the following two flag combinations as valid modes in the <i>grfMode</i> parameter.
     * 
     * 
     * ``` syntax
     *     STGM_SIMPLE | STGM_READWRITE | STGM_SHARE_EXCLUSIVE
     * ```
     * 
     * 
     * ``` syntax
     *     STGM_SIMPLE | STGM_READ | STGM_SHARE_EXCLUSIVE
     * ```
     * 
     * To support the single-writer, multireader, direct mode, the first flag combination is the valid <i>grfMode</i> parameter for the writer.  The second flag combination is valid for readers.
     * 
     * 
     * ``` syntax
     *     STGM_DIRECT_SWMR | STGM_READWRITE | STGM_SHARE_DENY_WRITE
     * ```
     * 
     * 
     * ``` syntax
     *     STGM_DIRECT_SWMR | STGM_READ | STGM_SHARE_DENY_NONE
     * ```
     * 
     * In direct mode, one of the following three combinations are valid.
     * 
     * 
     * ``` syntax
     *     STGM_DIRECT | STGM_READWRITE | STGM_SHARE_EXCLUSIVE
     * ```
     * 
     * 
     * ``` syntax
     *     STGM_DIRECT | STGM_READ | STGM_SHARE_DENY_WRITE
     * ```
     * 
     * 
     * ``` syntax
     *     STGM_DIRECT | STGM_READ | STGM_SHARE_EXCLUSIVE
     * ```
     * 
     * <div class="alert"><b>Note</b>  Opening a storage object in read/write mode without denying write permission to others (the <i>grfMode</i> parameter specifies STGM_SHARE_DENY_WRITE) can be a time-consuming operation because the 
     * <b>StgOpenStorage</b> call must make a snapshot of the entire storage object.</div>
     * <div> </div>
     * Applications often try to open storage objects with the following access permissions. If the application succeeds, it never needs to make a snapshot copy.
     * 
     * 
     * ``` syntax
     * STGM_READWRITE | STGM_SHARE_DENY_WRITE 
     *     // transacted versus direct mode omitted for exposition 
     * ```
     * 
     * The application can revert to using the permissions and make a snapshot copy, if the previous access permissions fail. The application should prompt the user before making a time-consuming copy.
     * 
     * 
     * ``` syntax
     * STGM_READWRITE 
     *     // transacted versus direct mode omitted for exposition 
     * ```
     * 
     * If the document-sharing semantics implied by the access modes are appropriate, the application could try to open the storage as follows. In this case, if the application succeeds, a snapshot copy will not have been made (because <b>STGM_SHARE_DENY_WRITE</b> was specified, denying others write access).
     * 
     * 
     * ``` syntax
     * STGM_READ | STGM_SHARE_DENY_WRITE 
     *     // transacted versus direct mode omitted for exposition 
     * ```
     * 
     * <div class="alert"><b>Note</b>  To reduce the expense of making a snapshot copy, applications can open storage objects in priority mode (<i>grfMode</i> specifies <b>STGM_PRIORITY</b>).</div>
     * <div> </div>
     * The <i>snbExclude</i> parameter specifies a set of element names in this storage object that are to be emptied as the storage object is opened: streams are set to a length of zero; storage objects have all their elements removed. By excluding certain streams, the expense of making a snapshot copy can be significantly reduced. Almost always, this approach is used after first opening the storage object in priority mode, then completely reading the now-excluded elements into memory. This earlier priority-mode opening of the storage object should be passed through the <i>pstgPriority</i> parameter to remove the exclusion implied by priority mode. The calling application is responsible for rewriting the contents of excluded items before committing. Thus, this technique is most likely useful only to applications whose documents do not require constant access to their storage objects while they are active.
     * 
     * The <i>pstgPriority</i> parameter is intended as a convenience for callers replacing an existing storage object, often one opened in priority mode, with a new storage object opened on the same file but in a different mode. When <i>pstgPriority</i> is not <b>NULL</b>, it is used to specify the file name instead of <i>pwcsName</i>, which is ignored. However, it is recommended that applications always pass <b>NULL</b> for <i>pstgPriority</i> because <b>StgOpenStorage</b> releases the object under some circumstances, and does not release it under other circumstances.  In particular, if the function returns a failure result, it is not possible for the caller to determine whether or not the storage object was released.
     * 
     * The functionality of the <i>pstgPriority</i> parameter can be duplicated by the caller in a safer manner as shown in the following example:
     * 
     * 
     * ``` syntax
     * // Replacement for:
     * // HRESULT hr = StgOpenStorage(
     * //         NULL, pstgPriority, grfMode, NULL, 0, &amp;pstgNew);
     * 
     * STATSTG statstg;
     * HRESULT hr = pstgPriority-&gt;Stat(&amp;statstg, 0);
     * pStgPriority-&gt;Release();
     * pStgPriority = NULL;
     * if (SUCCEEDED(hr))
     * {
     *     hr = StgOpenStorage(statstg.pwcsName, NULL, grfMode, NULL, 0, &amp;pstgNew);
     * }     
     * 
     * ```
     * @param {Pointer<Char>} pwcsName A pointer to the path of the <b>null</b>-terminated Unicode string file that contains the storage object to open. This parameter is ignored if the <i>pstgPriority</i> parameter is not <b>NULL</b>.
     * @param {Pointer<IStorage>} pstgPriority A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface that should be <b>NULL</b>. If not <b>NULL</b>, this parameter is used as described below in the Remarks section.
     * 
     * After <b>StgOpenStorage</b> returns, the storage object specified in <i>pStgPriority</i> may have been released and should no longer be used.
     * @param {Integer} grfMode Specifies the access mode to use to open the storage object.
     * @param {Pointer<UInt16>} snbExclude If not <b>NULL</b>, pointer to a block of elements in the storage to be excluded as the storage object is opened. The exclusion occurs regardless of whether a snapshot copy happens on the open. Can be <b>NULL</b>.
     * @param {Integer} reserved Indicates reserved for future use; must be zero.
     * @param {Pointer<IStorage>} ppstgOpen A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a>* pointer variable that receives the interface pointer to the opened storage.
     * @returns {HRESULT} The <b>StgOpenStorage</b> function can also return any file system errors or system errors wrapped in an <b>HRESULT</b>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-strategies">Error Handling Strategies</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/com/handling-unknown-errors">Handling Unknown Errors</a>.
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-stgopenstorage
     * @since windows5.0
     */
    static StgOpenStorage(pwcsName, pstgPriority, grfMode, snbExclude, reserved, ppstgOpen) {
        pwcsName := pwcsName is String? StrPtr(pwcsName) : pwcsName

        result := DllCall("OLE32.dll\StgOpenStorage", "ptr", pwcsName, "ptr", pstgPriority, "uint", grfMode, "ptr", snbExclude, "uint", reserved, "ptr", ppstgOpen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The StgOpenStorageOnILockBytes function opens an existing storage object that does not reside in a disk file, but instead has an underlying byte array provided by the caller.
     * @remarks
     * <b>StgOpenStorageOnILockBytes</b> opens the specified root storage object. A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the opened storage object is supplied through the <i>ppstgOpen</i> parameter.
     * 
     * The storage object must have been previously created by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgcreatedocfileonilockbytes">StgCreateDocfileOnILockBytes</a> function.
     * 
     * Except for specifying a programmer-provided byte-array object, 
     * <b>StgOpenStorageOnILockBytes</b> is similar to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgopenstorage">StgOpenStorage</a> function. The storage object is opened according to the access modes in the <i>grfMode</i> parameter, subject to the following restrictions:
     * 
     * Sharing mode behavior and transactional isolation depend on the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> implementation supporting <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ilockbytes-lockregion">LockRegion</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ilockbytes-unlockregion">UnlockRegion</a> with <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-locktype">LOCK_ONLYONCE</a> semantics.  Implementations can indicate to structured storage they support this functionality by setting the <b>LOCK_ONLYONCE</b> bit in the <b>grfLocksSupported</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a>.  If an <b>ILockBytes</b> implementation does not support this functionality, sharing modes will not be enforced, and root-level transactional commits will not coordinate properly with other transactional instances opened on the same byte array.  Applications that use an <b>ILockBytes</b> implementation that does not support region locking, such as the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-createstreamonhglobal">CreateStreamOnHGlobal</a> implementation, should avoid opening multiple concurrent instances on the same byte array.
     * 
     * <b>StgOpenStorageOnILockBytes</b> does not support simple mode.  The <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM_SIMPLE</a> flag, if present, is ignored. 
     * 
     * The  <i>pStgPriority</i> parameter is intended as a convenience for callers replacing an existing storage object, often one opened in priority mode, with a new storage object opened on the same byte array. Unlike the <i>pStgPriority</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgopenstorage">StgOpenStorage</a>, this parameter does not affect the open operation performed by <b>StgOpenStorageOnILockBytes</b> and is simply an existing storage object the caller would like released.  Callers should always pass <b>NULL</b> for this parameter because <b>StgOpenStorageOnILockBytes</b> releases the object under some circumstances, and does not release it under other circumstances.
     * The use of the <i>pStgPriority</i> parameter can be duplicated by the caller in a safer manner by instead releasing the object before calling <b>StgOpenStorageOnILockBytes</b>, as shown in the following example:
     * 
     * 
     * ``` syntax
     * // Replacement for:
     * // HRESULT hr = StgOpenStorageOnILockBytes(
     * //         plkbyt, pStgPriority, grfMode, NULL, 0, &amp;pstgNew);
     * 
     * pStgPriority-&gt;Release();
     * pStgPriority = NULL;
     * hr = StgOpenStorage(plkbyt, NULL, grfMode, NULL, 0, &amp;pstgNew);
     *     
     * 
     * ```
     * 
     * For more information, refer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgopenstorage">StgOpenStorage</a>.
     * @param {Pointer<ILockBytes>} plkbyt <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> pointer to the underlying byte array object that contains the storage object to be opened.
     * @param {Pointer<IStorage>} pstgPriority A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface that should be <b>NULL</b>. If not <b>NULL</b>, this parameter is used as described below in the Remarks section.
     * 
     * After <b>StgOpenStorageOnILockBytes</b> returns, the storage object specified in <i>pStgPriority</i> may have been released and should no longer be used.
     * @param {Integer} grfMode Specifies the access mode to use to open the storage object. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a> and the Remarks section below.
     * @param {Pointer<UInt16>} snbExclude Can be <b>NULL</b>. If not <b>NULL</b>, this parameter points to a block of elements in this storage that are to be excluded as the storage object is opened. This exclusion occurs independently of whether a snapshot copy happens on the open.
     * @param {Pointer<IStorage>} ppstgOpen Points to the location of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the opened storage on successful return.
     * @returns {HRESULT} The <b>StgOpenStorageOnILockBytes</b> function can also return any file system errors, or system errors wrapped in an <b>HRESULT</b>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> interface error return values. See 
     * <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-strategies">Error Handling Strategies</a> 
     * and 
     * <a href="https://docs.microsoft.com/windows/desktop/com/handling-unknown-errors">Handling Unknown Errors</a>.
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-stgopenstorageonilockbytes
     * @since windows5.0
     */
    static StgOpenStorageOnILockBytes(plkbyt, pstgPriority, grfMode, snbExclude, ppstgOpen) {
        static reserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\StgOpenStorageOnILockBytes", "ptr", plkbyt, "ptr", pstgPriority, "uint", grfMode, "ptr", snbExclude, "uint", reserved, "ptr", ppstgOpen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The StgIsStorageFile function indicates whether a particular disk file contains a storage object.
     * @remarks
     * At the beginning of the disk file underlying a storage object is a signature distinguishing a storage object from other file formats. The 
     * <b>StgIsStorageFile</b> function is useful to applications whose documents use a disk file format that might or might not use storage objects.
     * 
     * If a root compound file has been created in transacted mode but not yet committed, this method still return S_OK.
     * @param {Pointer<Char>} pwcsName Pointer to the null-terminated Unicode string name of the disk file to be examined. The <i>pwcsName</i> parameter is passed uninterpreted to the underlying file system.
     * @returns {HRESULT} <b>StgIsStorageFile</b> function can also return any file system errors or system errors wrapped in an <b>HRESULT</b>. See 
     * <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-strategies">Error Handling Strategies</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/com/handling-unknown-errors">Handling Unknown Errors</a>
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-stgisstoragefile
     * @since windows5.0
     */
    static StgIsStorageFile(pwcsName) {
        pwcsName := pwcsName is String? StrPtr(pwcsName) : pwcsName

        result := DllCall("OLE32.dll\StgIsStorageFile", "ptr", pwcsName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The StgIsStorageILockBytes function indicates whether the specified byte array contains a storage object.
     * @remarks
     * At the beginning of the byte array underlying a storage object is a signature distinguishing a storage object (supporting the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface) from other file formats. The 
     * <b>StgIsStorageILockBytes</b> function is useful to applications whose documents use a byte array (a byte array object supports the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> interface) that might or might not use storage objects.
     * @param {Pointer<ILockBytes>} plkbyt <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> pointer to the byte array to be examined.
     * @returns {HRESULT} This function can also return any file system errors, or system errors wrapped in an <b>HRESULT</b>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> interface error return values. See 
     * <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-strategies">Error Handling Strategies</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/com/handling-unknown-errors">Handling Unknown Errors</a>
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-stgisstorageilockbytes
     * @since windows5.0
     */
    static StgIsStorageILockBytes(plkbyt) {
        result := DllCall("OLE32.dll\StgIsStorageILockBytes", "ptr", plkbyt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The StgSetTimes function sets the creation, access, and modification times of the indicated file, if supported by the underlying file system.
     * @remarks
     * The 
     * <b>StgSetTimes</b> function sets the time values for the specified file. Each of the time value parameters can be <b>NULL</b>, indicating that no modification should occur.
     * 
     * It is possible that one or more of these time values are not supported by the underlying file system. This function sets the times that can be set and ignores the rest.
     * @param {Pointer<Char>} lpszName Pointer to the name of the file to be changed.
     * @param {Pointer<FILETIME>} pctime Pointer to the new value for the creation time.
     * @param {Pointer<FILETIME>} patime Pointer to the new value for the access time.
     * @param {Pointer<FILETIME>} pmtime Pointer to the new value for the modification time.
     * @returns {HRESULT} The <b>StgSetTimes</b> function can also return any file system errors or system errors wrapped in an <b>HRESULT</b>. See 
     * <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-strategies">Error Handling Strategies</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/com/handling-unknown-errors">Handling Unknown Errors</a>.
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-stgsettimes
     * @since windows5.0
     */
    static StgSetTimes(lpszName, pctime, patime, pmtime) {
        lpszName := lpszName is String? StrPtr(lpszName) : lpszName

        result := DllCall("OLE32.dll\StgSetTimes", "ptr", lpszName, "ptr", pctime, "ptr", patime, "ptr", pmtime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a new storage object using a provided implementation for the IStorage or IPropertySetStorage interfaces.
     * @remarks
     * When an application modifies its file, it usually creates a copy of the original. The <b>StgCreateStorageEx</b> function is one way for creating a copy. This function works indirectly with the Encrypting File System (EFS) duplication API. When you use this function, you will need to set the options for the file storage in the <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/ns-coml2api-stgoptions">STGOPTIONS</a> structure.
     * 
     * <b>StgCreateStorageEx</b> is a superset of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgcreatedocfile">StgCreateDocfile</a> function, and should be used by new code. Future enhancements to Structured Storage will be exposed through the 
     * <b>StgCreateStorageEx</b> function. See the following Requirements section for information on supported platforms.
     * 
     * The 
     * <b>StgCreateStorageEx</b> function creates a new storage object using one of the system-provided, structured-storage implementations. This function can be used to obtain an  
     * <a href="https://docs.microsoft.com/windows/desktop/Stg/istorage-compound-file-implementation">IStorage compound file implementation</a>, an <a href="https://docs.microsoft.com/windows/desktop/Stg/ipropertysetstorage-compound-file-implementation">IPropertySetStorage compound file implementation</a>, or to obtain an 
     * <a href="https://docs.microsoft.com/windows/desktop/Stg/ipropertysetstorage-ntfs-file-system-implementation">IPropertySetStorage NTFS implementation</a>.
     * 
     * When a new file is created, the storage implementation used depends on the 
     * flag that you specify and on the type of drive on which the file is stored. For more information, see the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380330(v=vs.85)">STGFMT</a> enumeration.
     * 
     * <b>StgCreateStorageEx</b> creates the file if it does not exist. If it does exist, the use of the STGM_CREATE, STGM_CONVERT, and STGM_FAILIFTHERE flags in the <i>grfMode</i> parameter indicate how to proceed. For more information on these values, see <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>. It is not valid, in direct mode, to specify the STGM_READ mode in the <i>grfMode</i> parameter (direct mode is indicated by not specifying the STGM_TRANSACTED flag). This function cannot be used to open an existing file; use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgopenstorageex">StgOpenStorageEx</a> function instead.
     * 
     * You can use the 
     * <b>StgCreateStorageEx</b> function to get access to the root storage of a structured-storage document or the property set storage of any file that supports property sets. See the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380330(v=vs.85)">STGFMT</a> documentation for information about which IIDs are supported for different 
     * <b>STGFMT</b> values.
     * 
     * When a file is created with this function to access the NTFS property set implementation, special sharing rules apply. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Stg/ipropertysetstorage-ntfs-file-system-implementation">IPropertySetStorage-NTFS Implementation</a>.
     * 
     * If a compound file is created in transacted mode (by specifying STGM_TRANSACTED) and read-only mode (by specifying STGM_READ), it is possible to make changes to the returned storage object. For example, it is possible to call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-createstream">IStorage::CreateStream</a>. However, it is not possible to commit those changes by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-commit">IStorage::Commit</a>. Therefore, such changes will be lost.
     * 
     * Specifying STGM_SIMPLE provides a much faster implementation of a compound file object in a limited, but frequently used case involving applications that require a compound file implementation with multiple streams and no storages. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>. It is not valid to specify that STGM_TRANSACTED if STGM_SIMPLE is specified.
     * 
     * The simple mode does not support all the methods on 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a>. Specifically, in simple mode, supported 
     * <b>IStorage</b> methods are <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-createstream">CreateStream</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-commit">Commit</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-setclass">SetClass</a> as well as the COM <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> methods of <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>, <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> and <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. In addition, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-setelementtimes">SetElementTimes</a> is supported with a <b>NULL</b> name, allowing applications to set times on a root storage. All the other methods of 
     * <b>IStorage</b> return STG_E_INVALIDFUNCTION.
     * 
     * If the <i>grfMode</i> parameter specifies STGM_TRANSACTED and no file yet exists with the name specified by the <i>pwcsName</i> parameter, the file is created immediately. In an access-controlled file system, the caller must have write permissions for the file system directory in which the compound file is created. If STGM_TRANSACTED is not specified, and STGM_CREATE is specified, an existing file with the same name is destroyed before creating the new file.
     * 
     * You can also use 
     * <b>StgCreateStorageEx</b> to create a temporary compound file by passing a <b>NULL</b> value for the <i>pwcsName</i> parameter. However, these files are temporary only in the sense that they have a unique system-provided name – one that is probably meaningless to the user. The caller is responsible for deleting the temporary file when finished with it, unless STGM_DELETEONRELEASE was specified for the <i>grfMode</i> parameter. For more information on these flags, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>.
     * @param {Pointer<Char>} pwcsName A pointer to the path of the file to create. It is passed uninterpreted to the file system. This can be a relative name or <b>NULL</b>. If <b>NULL</b>, a temporary file is allocated with a unique name. If non-<b>NULL</b>, the string size must not exceed MAX_PATH characters. 
     * 
     * 
     * 
     * 
     * <b>Windows 2000:  </b>Unlike the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function, you cannot exceed the MAX_PATH limit by using the "\\?\" prefix.
     * @param {Integer} grfMode A value that specifies the access mode to use when opening the new storage object. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>. If the caller specifies transacted mode together with STGM_CREATE or STGM_CONVERT, the overwrite or conversion takes place when the commit operation is called for the root storage. If <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-commit">IStorage::Commit</a> is not called for the root storage object, previous contents of the file will be restored. STGM_CREATE and STGM_CONVERT cannot be combined with the STGM_NOSNAPSHOT flag, because a snapshot copy is required when a file is overwritten or converted in the transacted mode.
     * @param {Integer} stgfmt A value that specifies the storage file format. For more information, see the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380330(v=vs.85)">STGFMT</a> enumeration.
     * @param {Integer} grfAttrs A value that depends on the value of the <i>stgfmt</i> parameter.
     * 
     * <table>
     * <tr>
     * <th>Parameter Values</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STGFMT_DOCFILE"></a><a id="stgfmt_docfile"></a><dl>
     * <dt><b>STGFMT_DOCFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 0, or FILE_FLAG_NO_BUFFERING. For more information, see  
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a>. If the sector size of the file, specified in <i>pStgOptions</i>, is not an integer multiple of the underlying disk's physical sector size, this operation will fail.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="All_other_values_of_stgfmt"></a><a id="all_other_values_of_stgfmt"></a><a id="ALL_OTHER_VALUES_OF_STGFMT"></a><dl>
     * <dt><b>All other values of <i>stgfmt</i></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Must be 0.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<STGOPTIONS>} pStgOptions The <i>pStgOptions</i> parameter is valid only if the <i>stgfmt</i> parameter is set to STGFMT_DOCFILE. If the <i>stgfmt</i> parameter is set to STGFMT_DOCFILE, <i>pStgOptions</i> points to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/ns-coml2api-stgoptions">STGOPTIONS</a> structure, which specifies features of the storage object, such as the sector size. This parameter may be <b>NULL</b>, which creates a storage object with a default sector size of 512 bytes. If non-<b>NULL</b>, the <b>ulSectorSize</b> member must be set to either 512 or 4096. If set to 4096, STGM_SIMPLE may not be specified in the <i>grfMode</i> parameter. The <b>usVersion</b> member must be set before calling 
     * <b>StgCreateStorageEx</b>. For more information, see <b>STGOPTIONS</b>.
     * @param {Pointer<Void>} pSecurityDescriptor Enables the ACLs to be set when the file is created. If not <b>NULL</b>, needs to be a pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure. See <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> for information on how to set ACLs on files.
     * 
     * <b>Windows Server 2003, Windows 2000 Server, Windows XP and Windows 2000 Professional:  </b>Value must be <b>NULL</b>.
     * @param {Pointer<Guid>} riid A value that specifies the interface identifier (IID) of the interface pointer to return. This IID may be for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a> interface.
     * @param {Pointer<Void>} ppObjectOpen A pointer to an interface pointer variable that receives a pointer for an interface on the new storage object; contains <b>NULL</b> if operation failed.
     * @returns {HRESULT} This function can also return any file system errors or system errors wrapped in an <b>HRESULT</b>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-strategies">Error Handling Strategies</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/com/handling-unknown-errors">Handling Unknown Errors</a>.
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-stgcreatestorageex
     * @since windows5.0
     */
    static StgCreateStorageEx(pwcsName, grfMode, stgfmt, grfAttrs, pStgOptions, pSecurityDescriptor, riid, ppObjectOpen) {
        pwcsName := pwcsName is String? StrPtr(pwcsName) : pwcsName

        result := DllCall("OLE32.dll\StgCreateStorageEx", "ptr", pwcsName, "uint", grfMode, "uint", stgfmt, "uint", grfAttrs, "ptr", pStgOptions, "ptr", pSecurityDescriptor, "ptr", riid, "ptr", ppObjectOpen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Opens an existing root storage object in the file system. Use this function to open Compound Files and regular files.
     * @remarks
     * <b>StgOpenStorageEx</b> is a superset of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgopenstorage">StgOpenStorage</a> function, and should be used by new code. Future enhancements to  structured storage will be exposed through this function. For more information about supported platforms, see the Requirements section.
     * 
     * The 
     * <b>StgOpenStorageEx</b> function opens the specified root storage object according to the access mode in the <i>grfMode</i> parameter, and, if successful, supplies an interface pointer for the opened storage object in the <i>ppObjectOpen</i> parameter. This function can be used to obtain an <a href="https://docs.microsoft.com/windows/desktop/Stg/istorage-compound-file-implementation">IStorage compound file implementation</a>, an <a href="https://docs.microsoft.com/windows/desktop/Stg/ipropertysetstorage-compound-file-implementation">IPropertySetStorage compound file implementation</a>, or an  
     * <a href="https://docs.microsoft.com/windows/desktop/Stg/ipropertysetstorage-ntfs-file-system-implementation">NTFS file system implementation of IPropertySetStorage</a>.
     * 
     * When you open a file, the system selects a structured storage implementation depending on which 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380330(v=vs.85)">STGFMT</a> flag you specify on the file type and on the type of drive where the file is stored.
     * 
     * Use the 
     * <b>StgOpenStorageEx</b> function to access the root storage of a structured storage document or the property set storage of any file that supports property sets. For more information about which interface identifiers (IIDs) are supported for the different 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380330(v=vs.85)">STGFMT</a> values, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380330(v=vs.85)">STGFMT</a>.
     * 
     * When a file is opened with this function to access the NTFS property set implementation, special sharing rules apply. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Stg/ipropertysetstorage-ntfs-file-system-implementation">IPropertySetStorage-NTFS Implementation</a>.
     * 
     * If a compound file is opened in transacted mode, by specifying STGM_TRANSACTED, and read-only mode, by specifying STGM_READ, it is possible to change the returned storage object. For example, it is possible to call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-createstream">IStorage::CreateStream</a>. However, it is not possible to commit those changes by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-commit">IStorage::Commit</a>. Therefore, such changes will be lost.
     * 
     * It is not valid to use the <b>STGM_CREATE</b>, <b>STGM_DELETEONRELEASE</b>, or <b>STGM_CONVERT</b> flags in the <i>grfMode</i> parameter for this function.
     * 
     * To support the simple mode for saving a storage object with no substorages, the 
     * <b>StgOpenStorageEx</b> function accepts one of  the following two flag combinations as valid modes in the <i>grfMode</i> parameter:
     * 
     * 
     * ``` syntax
     *     STGM_SIMPLE | STGM_READWRITE | STGM_SHARE_EXCLUSIVE
     * ```
     * 
     * 
     * ``` syntax
     *     STGM_SIMPLE | STGM_READ | STGM_SHARE_EXCLUSIVE
     * ```
     * 
     * To support the single-writer, multireader, direct mode, the first flag combination is the valid <i>grfMode</i> parameter for the writer.  The second flag combination is valid for readers.
     * 
     * 
     * ``` syntax
     *     STGM_DIRECT_SWMR | STGM_READWRITE | STGM_SHARE_DENY_WRITE
     * ```
     * 
     * 
     * ``` syntax
     *     STGM_DIRECT_SWMR | STGM_READ | STGM_SHARE_DENY_NONE
     * ```
     * 
     * For more information about simple mode and single-writer/multiple-reader modes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>.
     * 
     * <div class="alert"><b>Note</b>  Opening a transacted mode storage object in read and/or write mode without denying write permissions to others (for example, the <i>grfMode</i> parameter specifies <b>STGM_SHARE_DENY_WRITE</b>) can be time-consuming because the 
     * <b>StgOpenStorageEx</b> call must create a snapshot copy of the entire storage object.</div>
     * <div> </div>
     * @param {Pointer<Char>} pwcsName A pointer to the path of the null-terminated Unicode string file that contains the storage object. This string size cannot exceed <b>MAX_PATH</b> characters.
     * 
     * <b>Windows Server 2003 and Windows XP/2000:  </b>Unlike the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function, the <b>MAX_PATH</b> limit cannot be exceeded by using the "\\?\" prefix.
     * @param {Integer} grfMode A value that specifies the access mode to open the new storage object. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>. If the caller specifies transacted mode together with <b>STGM_CREATE</b> or <b>STGM_CONVERT</b>, the overwrite or conversion occurs when the commit operation is called for the root storage. If <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-commit">IStorage::Commit</a> is not called for the root storage object, previous contents of the file will be restored. <b>STGM_CREATE</b> and <b>STGM_CONVERT</b> cannot be combined with the <b>STGM_NOSNAPSHOT</b> flag, because a snapshot copy is required when a file is overwritten or converted in transacted mode.
     * 
     * If the storage object is opened in direct mode (<b>STGM_DIRECT</b>) with access to either <b>STGM_WRITE</b> or <b>STGM_READWRITE</b>, the sharing mode must be <b>STGM_SHARE_EXCLUSIVE</b> unless the <b>STGM_DIRECT_SWMR</b> mode is specified. For more information, see the Remarks section. If the storage object is opened in direct mode with access to <b>STGM_READ</b>, the sharing mode must be either <b>STGM_SHARE_EXCLUSIVE</b> or <b>STGM_SHARE_DENY_WRITE</b>, unless <b>STGM_PRIORITY</b> or <b>STGM_DIRECT_SWMR</b> is specified. For more information, see the Remarks section.
     * 
     * The mode in which a file is opened can affect implementation performance. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Stg/structured-storage-interfaces">Compound File Implementation Limits</a>.
     * @param {Integer} stgfmt A value that specifies the storage file format. For more information, see the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa380330(v=vs.85)">STGFMT</a> enumeration.
     * @param {Integer} grfAttrs A value that depends upon the value of the <i>stgfmt</i> parameter. 
     * 
     * <b>STGFMT_DOCFILE</b> must be zero (0) or <b>FILE_FLAG_NO_BUFFERING</b>. For more information about this value, see <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a>. If the sector size of the file, specified in <i>pStgOptions</i>, is not an integer multiple of the physical sector size of the underlying disk, then this operation will fail. All other values of <i>stgfmt</i> must be zero.
     * @param {Pointer<STGOPTIONS>} pStgOptions A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/ns-coml2api-stgoptions">STGOPTIONS</a> structure that contains data about the storage object opened. The <i>pStgOptions</i> parameter is valid only if the <i>stgfmt</i> parameter is set to <b>STGFMT_DOCFILE</b>. The <b>usVersion</b> member must be set before calling 
     * <b>StgOpenStorageEx</b>. For more information, see the <b>STGOPTIONS</b> structure.
     * @param {Pointer<Void>} pSecurityDescriptor Reserved; must be zero.
     * @param {Pointer<Guid>} riid A value that specifies the GUID of the interface pointer to return. Can also be the header-specified value for <b>IID_IStorage</b> to obtain the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface or for <b>IID_IPropertySetStorage</b> to obtain the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a> interface.
     * @param {Pointer<Void>} ppObjectOpen The address of an interface pointer variable that receives a pointer for an interface on the storage object opened; contains <b>NULL</b> if operation failed.
     * @returns {HRESULT} This function can also return any file system errors or system errors wrapped in an <b>HRESULT</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-strategies">Error Handling Strategies</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/com/handling-unknown-errors">Handling Unknown Errors</a>.
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-stgopenstorageex
     * @since windows5.0
     */
    static StgOpenStorageEx(pwcsName, grfMode, stgfmt, grfAttrs, pStgOptions, pSecurityDescriptor, riid, ppObjectOpen) {
        pwcsName := pwcsName is String? StrPtr(pwcsName) : pwcsName

        result := DllCall("OLE32.dll\StgOpenStorageEx", "ptr", pwcsName, "uint", grfMode, "uint", stgfmt, "uint", grfAttrs, "ptr", pStgOptions, "ptr", pSecurityDescriptor, "ptr", riid, "ptr", ppObjectOpen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates and opens a property set in a specified storage or stream object.
     * @remarks
     * <b>StgCreatePropStg</b> creates and opens a new property set which supplies the system-provided, stand-alone implementation of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a> interface. The new property set is contained in the storage or stream object specified by <i>pUnk</i>. The value of the <i>grfFlags</i> parameter indicates whether <i>pUnk</i> specifies a storage or stream object. For example, if PROPSETFLAG_NONSIMPLE is set, then <i>pUnk</i> can be queried for an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on a storage object.
     * 
     * In either case, this function calls <i>pUnk-&gt;AddRef</i> for the storage or stream object containing the property set. It is the responsibility of the caller to release the object when it is no longer needed.
     * 
     * This function is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertysetstorage-create">IPropertySetStorage::Create</a> method. However, 
     * <b>StgCreatePropStg</b> adds the <i>pUnk</i> parameter and supports the PROPSETFLAG_UNBUFFERED value for the <i>grfFlags</i> parameter. Use this function instead of the 
     * <b>Create</b> method if you have an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface that does not support the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a> interface, or if you want to use the PROPSETFLAG_UNBUFFERED value. For more information about using this PROPSETFLAG_UNBUFFERED enumeration value, see <a href="https://docs.microsoft.com/windows/desktop/Stg/propsetflag-constants">PROPSETFLAG Constants</a>.
     * 
     * The property set automatically contains code page and locale identifier (ID) properties. These are set to the current system default and the current user default, respectively.
     * 
     * The <i>grfFlags</i> parameter is a combination of values taken from <a href="https://docs.microsoft.com/windows/desktop/Stg/propsetflag-constants">PROPSETFLAG Constants</a>. The new enumeration value PROPSETFLAG_UNBUFFERED is supported. For more information, see <b>PROPSETFLAG Constants</b>.
     * 
     * This function is exported out of the redistributable Iprop.dll, which is included in Windows NT 4.0 with Service Pack 2 (SP2) and later and available as a redistributable in Windows 95, Windows 98 and later. In Windows 2000 and Windows XP, it is exported out of ole32.dll. It can also be exported out of iprop.dll in Windows 2000 and Windows XP, but the call gets forwarded to ole32.dll.
     * @param {Pointer<IUnknown>} pUnk A pointer to the <b>IUnknown</b> interface on the storage or stream object that stores the new property set.
     * @param {Pointer<Guid>} fmtid The FMTID of the property set to be created.
     * @param {Pointer<Guid>} pclsid A Pointer to the initial CLSID for this property set. May be <b>NULL</b>, in which case <i>pclsid</i> is set to all zeroes.
     * @param {Integer} grfFlags The values from <a href="https://docs.microsoft.com/windows/desktop/Stg/propsetflag-constants">PROPSETFLAG Constants</a> that determine how the property set is created and opened.
     * @param {Pointer<IPropertyStorage>} ppPropStg The address of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a>* pointer variable that receives the interface pointer to the new property set.
     * @returns {HRESULT} This function supports the standard return values E_INVALIDARG and E_UNEXPECTED, in addition to the following:
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-stgcreatepropstg
     * @since windows5.0
     */
    static StgCreatePropStg(pUnk, fmtid, pclsid, grfFlags, ppPropStg) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\StgCreatePropStg", "ptr", pUnk, "ptr", fmtid, "ptr", pclsid, "uint", grfFlags, "uint", dwReserved, "ptr", ppPropStg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Opens a specified property set in a specified storage or stream object.
     * @remarks
     * <b>StgOpenPropStg</b> opens the requested property set and supplies the system-provided, stand-alone implementation of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a> interface. The requested property set is contained in the storage or stream object specified by <i>pUnk</i>. The value of the <i>grfFlags</i> parameter indicates whether <i>pUnk</i> specifies a storage or stream object. For example, if PROPSETFLAG_NONSIMPLE is set, then <i>pUnk</i> can be queried for an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on a storage object.
     * 
     * In either case, this function calls <i>pUnk-&gt;AddRef</i> for the storage or stream object containing the property set. The caller must release the object when no longer required.
     * 
     * This function is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertysetstorage-open">IPropertySetStorage::Open</a> method. However, 
     * <b>StgOpenPropStg</b> adds the <i>pUnk</i> and <i>grfFlags</i> parameters, including the PROPSETFLAG_UNBUFFERED value for the <i>grfFlags</i> parameter. Use this function instead of the 
     * Open method if you have an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface that does not support the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a> interface, or if you want to use the PROPSETFLAG_UNBUFFERED value. For more information about using PROPSETFLAG_UNBUFFERED, see <a href="https://docs.microsoft.com/windows/desktop/Stg/propsetflag-constants">PROPSETFLAG Constants</a>.
     * 
     * The <i>grfFlags</i> parameter is a combination of values taken from <a href="https://docs.microsoft.com/windows/desktop/Stg/propsetflag-constants">PROPSETFLAG Constants</a>. The new enumeration value PROPSETFLAG_UNBUFFERED is supported. For more information, see 
     * <b>PROPSETFLAG Constants</b>.
     * 
     * This function is exported out of the redistributable iprop.dll, which is included in Windows NT 4.0 with Service Pack 2 (SP2) and available as a redistributable in Windows 95 and later. In Windows 2000, it is exported out of Ole32.dll. It can also be exported out of iprop.dll in Windows 2000, but the call gets forwarded to ole32.dll.
     * @param {Pointer<IUnknown>} pUnk The interface pointer for <b>IUnknown</b> interface on the storage or stream object that contains the requested property set object.
     * @param {Pointer<Guid>} fmtid The FMTID of the property set to be opened.
     * @param {Integer} grfFlags The values from <a href="https://docs.microsoft.com/windows/desktop/Stg/propsetflag-constants">PROPSETFLAG Constants</a>.
     * @param {Pointer<IPropertyStorage>} ppPropStg A pointer to 
     * an <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a>* pointer variable that receives the interface pointer to the requested property set.
     * @returns {HRESULT} This function supports the standard return values E_INVALIDARG and E_UNEXPECTED, in addition to the following:
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-stgopenpropstg
     * @since windows5.0
     */
    static StgOpenPropStg(pUnk, fmtid, grfFlags, ppPropStg) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\StgOpenPropStg", "ptr", pUnk, "ptr", fmtid, "uint", grfFlags, "uint", dwReserved, "ptr", ppPropStg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a property set storage object from a specified storage object.
     * @remarks
     * The 
     * <b>StgCreatePropSetStg</b> function creates an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a> interface that will act on the given 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface specified by the <i>pStorage</i> parameter. This function does not modify this 
     * <b>IStorage</b> by itself, although subsequent calls to the 
     * <b>IPropertySetStorage</b> interface might.
     * 
     * <b>StgCreatePropSetStg</b> calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> on the storage object specified by <i>pStorage</i>. The caller must release the object when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>.
     * @param {Pointer<IStorage>} pStorage A pointer to the storage object that contains or will contain one or more property sets.
     * @param {Pointer<IPropertySetStorage>} ppPropSetStg A pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a>* pointer variable that receives the interface pointer to the property-set storage object.
     * @returns {HRESULT} This function supports the standard return value <b>E_INVALIDARG</b> as well as the following:
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-stgcreatepropsetstg
     * @since windows5.0
     */
    static StgCreatePropSetStg(pStorage, ppPropSetStg) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\StgCreatePropSetStg", "ptr", pStorage, "uint", dwReserved, "ptr", ppPropSetStg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a property set format identifier (FMTID) to its storage or stream name.
     * @remarks
     * <b>FmtIdToPropStgName</b> maps a property set FMTID to its stream name for a simple property set or to its storage name for a nonsimple property set.
     * 
     * This function is useful in creating or opening a property set using the PROPSETFLAG_UNBUFFERED value with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgcreatepropstg">StgCreatePropStg</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgopenpropstg">StgOpenPropStg</a> functions. For more information about PROPSETFLAG_UNBUFFERED, see <a href="https://docs.microsoft.com/windows/desktop/Stg/propsetflag-constants">PROPSETFLAG Constants</a>.
     * @param {Pointer<Guid>} pfmtid A pointer to the FMTID of the property set.
     * @param {Pointer<Char>} oszName A pointer to a null-terminated string that receives the storage or stream name of the property set identified by <i>pfmtid</i>. The array allocated for this string must be at least CCH_MAX_PROPSTG_NAME (32) characters in length.
     * @returns {HRESULT} This function supports the standard return value E_INVALIDARG as well as the following:
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-fmtidtopropstgname
     * @since windows5.0
     */
    static FmtIdToPropStgName(pfmtid, oszName) {
        oszName := oszName is String? StrPtr(oszName) : oszName

        result := DllCall("OLE32.dll\FmtIdToPropStgName", "ptr", pfmtid, "ptr", oszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a property set storage or stream name to its format identifier.
     * @remarks
     * The <b>PropStgNameToFmtId</b> function maps the stream name of a simple property set or the storage name of a nonsimple property set to its format identifier.
     * 
     * This function is useful in creating or opening a property set using the PROPSETFLAG_UNBUFFERED value with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgcreatepropstg">StgCreatePropStg</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgopenpropstg">StgOpenPropStg</a> functions. For more information about PROPSETFLAG_UNBUFFERED, see <a href="https://docs.microsoft.com/windows/desktop/Stg/propsetflag-constants">PROPSETFLAG Constants</a>.
     * @param {Pointer<Char>} oszName A pointer to a null-terminated Unicode string that contains the stream name of a simple property set or the storage name of a nonsimple property set.
     * @param {Pointer<Guid>} pfmtid A pointer to a FMTID variable that receives the format identifier of the property set specified by <i>oszName</i>.
     * @returns {HRESULT} This function supports the standard return value E_INVALIDARG as well as the following:
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-propstgnametofmtid
     * @since windows5.0
     */
    static PropStgNameToFmtId(oszName, pfmtid) {
        oszName := oszName is String? StrPtr(oszName) : oszName

        result := DllCall("OLE32.dll\PropStgNameToFmtId", "ptr", oszName, "ptr", pfmtid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The ReadClassStg function reads the CLSID previously written to a storage object with the WriteClassStg function.
     * @remarks
     * <b>ReadClassStg</b> is a helper function that calls the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-stat">IStorage::Stat</a> method and retrieves the CLSID previously written to the storage object with a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-writeclassstg">WriteClassStg</a> from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structure.
     * @param {Pointer<IStorage>} pStg Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the storage object containing the CLSID to be retrieved.
     * @param {Pointer<Guid>} pclsid Pointer to where the CLSID is written. May return CLSID_NULL.
     * @returns {HRESULT} This function supports the standard return value E_OUTOFMEMORY, in addition to the following:
     * 
     * This function also returns any of the error values returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-stat">IStorage::Stat</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-readclassstg
     * @since windows5.0
     */
    static ReadClassStg(pStg, pclsid) {
        result := DllCall("OLE32.dll\ReadClassStg", "ptr", pStg, "ptr", pclsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The WriteClassStg function stores the specified class identifier (CLSID) in a storage object.
     * @remarks
     * The 
     * <b>WriteClassStg</b> function writes a CLSID to the specified storage object so that it can be read by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-readclassstg">ReadClassStg</a> function. Container applications typically call this function before calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-save">IPersistStorage::Save</a> method.
     * @param {Pointer<IStorage>} pStg <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the storage object that gets a new CLSID.
     * @param {Pointer<Guid>} rclsid Pointer to the CLSID to be stored with the object.
     * @returns {HRESULT} This function returns HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-writeclassstg
     * @since windows5.0
     */
    static WriteClassStg(pStg, rclsid) {
        result := DllCall("OLE32.dll\WriteClassStg", "ptr", pStg, "ptr", rclsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Reads the CLSID previously written to a stream object with the WriteClassStm function.
     * @remarks
     * Most applications do not call the 
     * <b>ReadClassStm</b> function directly. COM calls it before making a call to an object's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststream-load">IPersistStream::Load</a> implementation.
     * @param {Pointer<IStream>} pStm A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface on the stream object that contains the CLSID to be read. This CLSID must have been previously written to the stream object using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-writeclassstm">WriteClassStm</a>.
     * @param {Pointer<Guid>} pclsid A pointer to where the CLSID is to be written.
     * @returns {HRESULT} This function also returns any of the error values returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">ISequentialStream::Read</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-readclassstm
     * @since windows5.0
     */
    static ReadClassStm(pStm, pclsid) {
        result := DllCall("OLE32.dll\ReadClassStm", "ptr", pStm, "ptr", pclsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The WriteClassStm function stores the specified CLSID in the stream.
     * @remarks
     * The 
     * <b>WriteClassStm</b> function writes a CLSID to the specified stream object so it can be read by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-readclassstm">ReadClassStm</a> function. Most applications do not call 
     * <b>WriteClassStm</b> directly. OLE calls it before making a call to an object's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststream-save">IPersistStream::Save</a> method.
     * @param {Pointer<IStream>} pStm <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> pointer to the stream into which the CLSID is to be written.
     * @param {Pointer<Guid>} rclsid Specifies the CLSID to write to the stream.
     * @returns {HRESULT} This function returns HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-writeclassstm
     * @since windows5.0
     */
    static WriteClassStm(pStm, rclsid) {
        result := DllCall("OLE32.dll\WriteClassStm", "ptr", pStm, "ptr", rclsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetHGlobalFromILockBytes function retrieves a global memory handle to a byte array object created using the CreateILockBytesOnHGlobal function.
     * @remarks
     * After a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-createilockbytesonhglobal">CreateILockBytesOnHGlobal</a>, which creates a byte array object on global memory, 
     * <b>GetHGlobalFromILockBytes</b> retrieves a pointer to the handle of the global memory underlying the byte array object. The handle this function returns might be different from the original handle due to intervening calls to the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> function.
     * 
     * The contents of the returned memory handle can be written to a clean disk file, and then opened as a storage object using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgopenstorage">StgOpenStorage</a> function.
     * 
     * This function only works within the same process from which the byte array was created.
     * @param {Pointer<ILockBytes>} plkbyt Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> interface on the byte-array object previously created by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-createilockbytesonhglobal">CreateILockBytesOnHGlobal</a> function.
     * @param {Pointer<Void>} phglobal Pointer to the current memory handle used by the specified byte-array object.
     * @returns {HRESULT} This function returns HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-gethglobalfromilockbytes
     * @since windows5.0
     */
    static GetHGlobalFromILockBytes(plkbyt, phglobal) {
        result := DllCall("OLE32.dll\GetHGlobalFromILockBytes", "ptr", plkbyt, "ptr", phglobal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a byte array object that uses an HGLOBAL memory handle to store the bytes intended for in-memory storage of a compound file.
     * @remarks
     * If <i>hGlobal</i> is <b>NULL</b>, the <b>CreateILockBytesOnHGlobal</b> allocates a new memory handle and the byte array is empty initially.
     * 
     * If <i>hGlobal</i> is not <b>NULL</b>, the initial contents of the byte array object are the current contents of the memory block. Thus, this function can be used to open an existing byte array in memory, for example to reload a storage object previously created by the <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgcreatedocfileonilockbytes">StgCreateDocfileOnILockBytes</a> function. The memory handle and its contents are undisturbed by the creation of the new byte array object.
     * 
     * The initial size of the byte array is the size of <i>hGlobal</i> as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalsize">GlobalSize</a> function. This is not necessarily the same size that was originally allocated for the handle because of rounding. If the logical size of the byte array is important, follow the call to <b>CreateILockBytesOnHGlobal</b> with a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ilockbytes-setsize">ILockBytes::SetSize</a>.
     * 
     * After creating the byte array object with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-createstreamonhglobal">CreateStreamOnHGlobal</a>, <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgcreatedocfileonilockbytes">StgCreateDocfileOnILockBytes</a> can be used to create a new storage object in memory, or <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgopenstorageonilockbytes">StgOpenStorageOnILockBytes</a> can be used to reopen a previously existing storage object that is already contained in the memory block. <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-gethglobalfromilockbytes">GetHGlobalFromILockBytes</a> can be called to retrieve the memory handle associated with the byte array object.
     * 
     * If a memory handle is passed to <b>CreateILockBytesOnHGlobal</b> or if <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-gethglobalfromilockbytes">GetHGlobalFromILockBytes</a> is called, the memory handle of this function can be directly accessed by the caller while it is still in use by the byte array object.  Appropriate caution should be exercised in the use of this capability and its implications:
     * 
     * <ul>
     * <li>Do not free the <i>hGlobal</i> memory handle during the lifetime of the byte array object. <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">ILockBytes::Release</a> must be called before the memory handle is freed.</li>
     * <li>Do not call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> to change the size of the memory handle during the lifetime of the byte array object.  This may cause application crashes or memory corruption. Avoid creating multiple byte array objects on the same memory handle, because <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ilockbytes-writeat">ILockBytes::WriteAt</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ilockbytes-setsize">ILockBytes::SetSize</a> methods may internally call <b>GlobalReAlloc</b>.</li>
     * <li>If possible, avoid accessing the memory block during the lifetime of the byte array object, because the object may internally call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> and do not make assumptions about its size and location.  If the memory block must be accessed, the memory access calls should be surrounded by calls to <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globallock">GlobalLock</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalunlock">GlobalUnLock</a>.</li>
     * <li>Avoid calling the object’s methods while the memory handle is locked with <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globallock">GlobalLock</a>.  This can cause method calls to fail unpredictably.</li>
     * </ul>
     * If the caller sets the <i>fDeleteOnRelease</i> parameter to <b>FALSE</b>, then the caller must also free the <i>hGlobal</i> after the final release. If the caller sets the <i>fDeleteOnRelease</i> parameter to <b>TRUE</b>, the final release will automatically free the <i>hGlobal</i>. The memory handle passed as the hGlobal parameter must be allocated as movable and nondiscardable, as shown in the following example:
     * 
     * 
     * ```cpp
     * HGLOBAL	hMem = ::GlobalAlloc(GMEM_MOVEABLE,iSize);
     * if (!hMem)
     *     AfxThrowMemoryException();
     * 
     * LPVOID pCompoundFile = ::GlobalLock(hMem);
     * ... // Fill memory
     * ::GlobalUnlock(hMem);
     * 
     * CComPtr<ILockBytes> spLockBytes;
     * HRESULT hr = ::CreateILockBytesOnHGlobal(hMem,FALSE,&spLockBytes);
     * 
     * 
     * ```
     * 
     * 
     * <b>CreateILockBytesOnHGlobal</b> will accept memory allocated with <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GMEM_FIXED</a>, but this usage is not recommended. HGLOBALs allocated with <b>GMEM_FIXED</b> are not really handles and their value can change when they are reallocated. If the memory handle was allocated with <b>GMEM_FIXED</b> and <i>fDeleteOnRelease</i> is <b>FALSE</b>, then the caller must call <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-gethglobalfromilockbytes">GetHGlobalFromILockBytes</a> to get the correct HGLOBAL value in order to free the handle.
     * 
     * This implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> does not support region locking.  Applications that use this implementation with the <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgcreatedocfileonilockbytes">StgCreateDocfileOnILockBytes</a> or <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgopenstorageonilockbytes">StgOpenStorageOnILockBytes</a> functions should avoid opening multiple concurrent instances on the same <b>ILockBytes</b> object. 
     * 
     * Prior to Windows 7 and Windows Server 2008 R2, this implementation did not zero memory when calling <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalrealloc">GlobalReAlloc</a> to grow the memory block. Increasing the size of the byte array with <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ilockbytes-setsize">ILockBytes::SetSize</a> or by writing to a location past the current end of the byte array will leave any unwritten portions of the newly allocated memory uninitialized. The storage objects returned by the <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgcreatedocfileonilockbytes">StgCreateDocfileOnILockBytes</a> and <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgopenstorageonilockbytes">StgOpenStorageOnILockBytes</a> may increase the size of the byte array without initializing all of the newly allocated space.
     * 
     * Compound files in memory are typically used as scratch space or with APIs that require a storage object, and in these cases the uninitialized memory is generally not a concern. However, if the contents of the memory block will be written to a file, consider the following alternatives to avoid potential information disclosure:<ul>
     * <li>Copy the logical contents of the in-memory compound file to the destination file using the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-copyto">IStorage::CopyTo</a> method rather than directly writing the contents of the memory block.</li>
     * <li>Instead of a compound file in memory, create a temporary file by calling <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgcreatestorageex">StgCreateStorageEx</a> with a <b>NULL</b> value for the <i>pwcsName</i> parameter. When it is time to write to the destination file, use the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irootstorage-switchtofile">IRootStorage::SwitchToFile</a> method.</li>
     * <li>Implement the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> interface such that memory reallocations are zeroed (see for example the <b>HEAP_ZERO_MEMORY</b> flag in <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heaprealloc">HeapReAlloc</a>). The memory contents of this byte array can then be written to a file. </li>
     * </ul>
     * @param {Pointer<Void>} hGlobal A memory handle allocated by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> function, or if <b>NULL</b> a new handle is to be allocated instead. The handle must be allocated as moveable and nondiscardable.
     * @param {Integer} fDeleteOnRelease A flag  that specifies whether the underlying handle for this byte array object should be automatically freed when the object is released. If set to <b>FALSE</b>, the caller must free the <i>hGlobal</i> after the final release. If set to <b>TRUE</b>, the final release will automatically free the <i>hGlobal</i> parameter.
     * @param {Pointer<ILockBytes>} pplkbyt The address of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> pointer variable that receives the interface pointer to the new byte array object.
     * @returns {HRESULT} This function supports the standard return values <b>E_INVALIDARG</b> and <b>E_OUTOFMEMORY</b>, as well as the following:
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-createilockbytesonhglobal
     * @since windows5.0
     */
    static CreateILockBytesOnHGlobal(hGlobal, fDeleteOnRelease, pplkbyt) {
        result := DllCall("OLE32.dll\CreateILockBytesOnHGlobal", "ptr", hGlobal, "int", fDeleteOnRelease, "ptr", pplkbyt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetConvertStg function returns the current value of the convert bit for the specified storage object.
     * @remarks
     * The 
     * <b>GetConvertStg</b> function is called by object servers that support the conversion of an object from one format to another. The server must be able to read the storage object using the format of its previous class identifier (CLSID) and write the object using the format of its new CLSID to support the object's conversion. For example, a spreadsheet created by one application can be converted to the format used by a different application.
     * 
     * The convert bit is set by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-setconvertstg">SetConvertStg</a> function. A container application can call this function on the request of an end user, or a setup program can call it when installing a new version of an application. An end user requests converting an object through the <b>Convert To</b> dialog box. When an object is converted, the new CLSID is permanently assigned to the object, so the object is subsequently associated with the new CLSID.
     * 
     * Then, when the object is activated, its server calls the 
     * <b>GetConvertStg</b> function to retrieve the value of the convert bit from the storage object. If the bit is set, the object's CLSID has been changed, and the server must read the old format and write the new format for the storage object.
     * 
     * After retrieving the bit value, the object application should clear the convert bit by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-setconvertstg">SetConvertStg</a> function with its <i>fConvert</i> parameter set to <b>FALSE</b>.
     * @param {Pointer<IStorage>} pStg <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the storage object from which the convert bit is to be retrieved.
     * @returns {HRESULT} <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-openstream">IStorage::OpenStream</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-openstorage">IStorage::OpenStorage</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">ISequentialStream::Read</a> storage and stream access errors.
     * @see https://learn.microsoft.com/windows/win32/api/coml2api/nf-coml2api-getconvertstg
     * @since windows5.0
     */
    static GetConvertStg(pStg) {
        result := DllCall("OLE32.dll\GetConvertStg", "ptr", pStg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a PROPVARIANT data type to a SERIALIZEDPROPERTYVALUE data type.
     * @remarks
     * This function converts a <b>PROPVARIANT</b> to a property. If the function fails it throws an exception that represents <b>STATUS_INVALID_PARAMETER NT_STATUS</b>.
     * @param {Pointer<PROPVARIANT>} pvar A  pointer to <b>PROPVARIANT</b>.
     * @param {Integer} CodePage A property set codepage.
     * @param {Pointer} pprop Optional. A pointer to <b>SERIALIZEDPROPERTYVALUE</b>.
     * @param {Pointer<UInt32>} pcb A pointer to the remaining stream length, updated to the actual property size on return.
     * @param {Integer} pid The propid (used if indirect).
     * @param {Pointer<UInt32>} pcIndirect Optional. A pointer to the indirect property count.
     * @returns {Pointer<SERIALIZEDPROPERTYVALUE>} Returns a pointer to <b>SERIALIZEDPROPERTYVALUE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/propidl/nf-propidl-stgconvertvarianttoproperty
     * @since windows5.0
     */
    static StgConvertVariantToProperty(pvar, CodePage, pprop, pcb, pid, pcIndirect) {
        static fReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("ole32.dll\StgConvertVariantToProperty", "ptr", pvar, "ushort", CodePage, "ptr", pprop, "uint*", pcb, "uint", pid, "char", fReserved, "uint*", pcIndirect, "ptr")
        return result
    }

    /**
     * Converts a SERIALIZEDPROPERTYVALUE data type to a PROPVARIANT data type.
     * @remarks
     * This function converts a property  to a <b>PROPVARIANT</b> data type. If the function fails, it throws an exception that represents an <b>NT_STATUS</b> such as <b>STATUS_INVALID_PARAMETER</b>.
     * @param {Pointer<SERIALIZEDPROPERTYVALUE>} pprop A pointer to <b>SERIALIZEDPROPERTYVALUE</b>.
     * @param {Integer} CodePage A property set codepage.
     * @param {Pointer<PROPVARIANT>} pvar A pointer to <b>PROPVARIANT</b>.
     * @param {Pointer<IMemoryAllocator>} pma A pointer to a class that implements the <a href="https://docs.microsoft.com/windows/desktop/Stg/imemoryallocator">IMemoryAllocator</a> abstract class.
     * @returns {Integer} Returns <b>TRUE</b> is the property converted was an indirect type (<b>VT_STREAM</b> or <b>VT_STREAMED_OBJECT</b>); otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/propidl/nf-propidl-stgconvertpropertytovariant
     * @since windows5.0
     */
    static StgConvertPropertyToVariant(pprop, CodePage, pvar, pma) {
        result := DllCall("ole32.dll\StgConvertPropertyToVariant", "ptr", pprop, "ushort", CodePage, "ptr", pvar, "ptr", pma, "char")
        return result
    }

    /**
     * The StgPropertyLengthAsVariant function examines a SERIALIZEDPROPERTYVALUE and returns the amount of memory that this property would occupy as a PROPVARIANT.
     * @remarks
     * Use this function to decide whether or not to deserialize a property value in a low-memory scenario.  Most applications will have no need to call this function.
     * @param {Pointer} pProp A pointer to a <b>SERIALIZEDPROPERTYVALUE</b>.
     * @param {Integer} cbProp The size of the <i>pProp</i> buffer in bytes.
     * @param {Integer} CodePage A property set code page.
     * @returns {Integer} Returns the amount of memory the property would occupy as a <b>PROPVARIANT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/propapi/nf-propapi-stgpropertylengthasvariant
     * @since windows5.0
     */
    static StgPropertyLengthAsVariant(pProp, cbProp, CodePage) {
        static bReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("ole32.dll\StgPropertyLengthAsVariant", "ptr", pProp, "uint", cbProp, "ushort", CodePage, "char", bReserved, "uint")
        return result
    }

    /**
     * The WriteFmtUserTypeStg function writes a clipboard format and user type to the storage object.
     * @remarks
     * The 
     * <b>WriteFmtUserTypeStg</b> function must be called in an object's implementation of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-save">IPersistStorage::Save</a> method. It must also be called by document-level objects that use structured storage for their persistent representation in their save sequence.
     * 
     * To read the information saved, applications call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-readfmtusertypestg">ReadFmtUserTypeStg</a> function.
     * @param {Pointer<IStorage>} pstg <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the storage object where the information is to be written.
     * @param {Integer} cf Specifies the clipboard format that describes the structure of the native area of the storage object. The format tag includes the policy for the names of streams and substorages within this storage object and the rules for interpreting data within those streams.
     * @param {Pointer<Char>} lpszUserType Pointer to a null-terminated Unicode string that specifies the object's current user type. The user type value, itself, cannot be <b>NULL</b>. This is the type returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getusertype">IOleObject::GetUserType</a> method. If this function is transported to a remote machine where the object class does not exist, this persistently stored user type can be shown to the user in dialog boxes.
     * @returns {HRESULT} This function returns HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api/ole2/nf-ole2-writefmtusertypestg
     * @since windows5.0
     */
    static WriteFmtUserTypeStg(pstg, cf, lpszUserType) {
        lpszUserType := lpszUserType is String? StrPtr(lpszUserType) : lpszUserType

        result := DllCall("OLE32.dll\WriteFmtUserTypeStg", "ptr", pstg, "ushort", cf, "ptr", lpszUserType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The ReadFmtUserTypeStg function returns the clipboard format and user type previously saved with the WriteFmtUserTypeStg function.
     * @remarks
     * <b>ReadFmtUserTypeStg</b> returns the clipboard format and the user type string from the specified storage object. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-writeclassstg">WriteClassStg</a> function must have been called before calling the 
     * <b>ReadFmtUserTypeStg</b> function.
     * @param {Pointer<IStorage>} pstg Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the storage object from which the information is to be read.
     * @param {Pointer<UInt16>} pcf Pointer to where the clipboard format is to be written on return. It can be <b>NULL</b>, indicating the format is of no interest to the caller.
     * @param {Pointer<Char>} lplpszUserType Address of <b>LPWSTR</b> pointer variable that receives a pointer to the null-terminated Unicode user-type string. The caller can specify <b>NULL</b> for this parameter, which indicates that the user type is of no interest. This function allocates memory for the string. The caller is responsible for freeing the memory with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {HRESULT} This function supports the standard return values E_FAIL, E_INVALIDARG, and E_OUTOFMEMORY, in addition to the following:
     * 
     * This function also returns any of the error values returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">ISequentialStream::Read</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/ole2/nf-ole2-readfmtusertypestg
     * @since windows5.0
     */
    static ReadFmtUserTypeStg(pstg, pcf, lplpszUserType) {
        result := DllCall("OLE32.dll\ReadFmtUserTypeStg", "ptr", pstg, "ushort*", pcf, "ptr", lplpszUserType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts the specified object from the OLE 1 storage model to an OLE 2 structured storage object without specifying presentation data.
     * @remarks
     * This function converts an OLE 1 object to an OLE 2 structured storage object. Use this function to update OLE 1 objects to OLE 2 objects when a new version of the object application supports OLE 2.
     * 
     * On entry, the <i>lpolestm</i> parameter should be created and positioned just as it would be for an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole/nf-ole-oleloadfromstream">OleLoadFromStream</a> function call. On exit, the <i>lpolestm</i> parameter is positioned just as it would be on exit from an <b>OleLoadFromStream</b> function, and the <i>pstg</i> parameter contains the uncommitted persistent representation of the OLE 2 storage object.
     * 
     * For OLE 1 objects that use native data for their presentation, the 
     * <b>OleConvertOLESTREAMToIStorage</b> function returns <b>CONVERT10_S_NO_PRESENTATION</b>. On receiving this return value, callers should call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-update">IOleObject::Update</a> to get the presentation data so it can be written to storage.
     * 
     * Applications that do not use the OLE default caching resources, but use the conversion resources, can use an alternate function, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleconvertolestreamtoistorageex">OleConvertOLESTREAMToIStorageEx</a>, which can specify the presentation data to convert. In the 
     * <b>OleConvertOLESTREAMToIStorageEx</b> function, the presentation data read from the <b>OLESTREAM</b> structure is passed out and the newly created OLE 2 storage object does not contain a presentation stream.
     * 
     * The following procedure describes the conversion process using 
     * <b>OleConvertOLESTREAMToIStorage</b>.
     * 
     * <p class="proch"><b>Converting an OLE 1 object to an OLE 2 storage object</b>
     * 
     * <ol>
     * <li>Create a root 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> object by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgcreatedocfile">StgCreateDocfile</a> function (..., &amp;<i>pstg</i>).</li>
     * <li>Open the OLE 1 file (using <a href="https://docs.microsoft.com/windows/desktop/direct3dtools/ipixengine-openfile-bstr-bstr-inewframescallback-ptr-ifileiocallback-ptr-lcid">OpenFile</a> or another OLE 1 technique).</li>
     * <li>Read from the file, using the OLE 1 procedure for reading files, until an OLE object is found.</li>
     * <li>Allocate an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> object from the root 
     * <b>IStorage</b> created in Step 1. 
     * 
     * 
     * 
     * ```cpp
     * pstg->lpVtbl->CreateStorage(...&pStgChild); 
     * hRes = OleConvertIStorageToOLESTREAM(polestm, pStgChild); 
     * hRes = OleLoad(pStgChild, &IID_IOleObject, pClientSite, ppvObj);
     * ```
     * 
     * 
     * </li>
     * <li>Repeat Step 3 until the file is completely read.</li>
     * </ol>
     * @param {Pointer<TypeHandle>} lpolestream A pointer to a stream that contains the persistent representation of the object in the OLE 1 storage format.
     * @param {Pointer<IStorage>} pstg A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the OLE 2 structured storage object.
     * @param {Pointer<DVTARGETDEVICE>} ptd A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-dvtargetdevice">DVTARGETDEVICE</a> structure that specifies the target device for which the OLE 1 object is rendered.
     * @returns {HRESULT} This function supports the standard return value <b>E_INVALIDARG</b>, in addition to the following:
     * @see https://learn.microsoft.com/windows/win32/api/ole2/nf-ole2-oleconvertolestreamtoistorage
     * @since windows5.0
     */
    static OleConvertOLESTREAMToIStorage(lpolestream, pstg, ptd) {
        result := DllCall("ole32.dll\OleConvertOLESTREAMToIStorage", "ptr", lpolestream, "ptr", pstg, "ptr", ptd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The OleConvertIStorageToOLESTREAM function converts the specified storage object from OLE 2 structured storage to the OLE 1 storage object model but does not include the presentation data. This is one of several compatibility functions.
     * @remarks
     * This function converts an OLE 2 storage object to OLE 1 format. The <b>OLESTREAM</b> structure code implemented for OLE 1 must be available.
     * 
     * On entry, the stream to which <i>lpolestm</i> points should be created and positioned just as it would be for an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole/nf-ole-olesavetostream">OleSaveToStream</a> call. On exit, the stream contains the persistent representation of the object using OLE 1 storage.
     * 
     * <div class="alert"><b>Note</b>  Paintbrush objects are dealt with differently from other objects because their native data is in device-independent bitmap (DIB) format. When Paintbrush objects are converted using 
     * <b>OleConvertIStorageToOLESTREAM</b>, no presentation data is added to the <b>OLESTREAM</b> structure. To include presentation data, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleconvertistoragetoolestreamex">OleConvertIStorageToOLESTREAMEx</a> function instead.</div>
     * <div> </div>
     * @param {Pointer<IStorage>} pstg Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the storage object to be converted to an OLE 1 storage.
     * @param {Pointer<TypeHandle>} lpolestream Pointer to an OLE 1 stream structure where the persistent representation of the object is saved using the OLE 1 storage model.
     * @returns {HRESULT} This function supports the standard return value E_INVALIDARG, in addition to the following:
     * @see https://learn.microsoft.com/windows/win32/api/ole2/nf-ole2-oleconvertistoragetoolestream
     * @since windows5.0
     */
    static OleConvertIStorageToOLESTREAM(pstg, lpolestream) {
        result := DllCall("ole32.dll\OleConvertIStorageToOLESTREAM", "ptr", pstg, "ptr", lpolestream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The SetConvertStg function sets the convert bit in a storage object to indicate that the object is to be converted to a new class when it is opened. The setting can be retrieved with a call to the GetConvertStg function.
     * @remarks
     * The 
     * <b>SetConvertStg</b> function determines the status of the convert bit in a contained object. It is called by both the container application and the server in the process of converting an object from one class to another. When a user specifies through a <b>Convert To</b> dialog (which the container produces with a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oledlg/nf-oledlg-oleuiconverta">OleUIConvert</a> function) that an object is to be converted, the container must take the following steps:
     * 
     * <ol>
     * <li>Unload the object if it is currently loaded.</li>
     * <li>Call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-writeclassstg">WriteClassStg</a> to write the new CLSID to the object storage.</li>
     * <li>Call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-writefmtusertypestg">WriteFmtUserTypeStg</a> to write the new user-type name and the existing main format to the storage.</li>
     * <li>Call 
     * <b>SetConvertStg</b> with the <i>fConvert</i> parameter set to <b>TRUE</b> to indicate that the object has been tagged for conversion to a new class the next time it is loaded.</li>
     * <li>Just before the object is loaded, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oledoautoconvert">OleDoAutoConvert</a> to handle any needed object conversion, unless you call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleload">OleLoad</a>, which calls it internally.</li>
     * </ol>
     * When an object is initialized from a storage object and the server is the destination of a convert-to operation, the object server should do the following:
     * 
     * <ol>
     * <li>Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-getconvertstg">GetConvertStg</a> function to retrieve the value of the conversion bit.</li>
     * <li>If the bit is set, the server reads the data out of the object according to the format associated with the new CLSID.</li>
     * <li>When the object is asked to save itself, the object should call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-writefmtusertypestg">WriteFmtUserTypeStg</a> function using the normal native format and user type of the object.</li>
     * <li>The object should then call 
     * <b>SetConvertStg</b> with the <i>fConvert</i> parameter set to <b>FALSE</b> to reset the object's conversion bit.</li>
     * </ol>
     * @param {Pointer<IStorage>} pStg <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the storage object in which to set the conversion bit.
     * @param {Integer} fConvert If <b>TRUE</b>, sets the conversion bit for the object to indicate the object is to be converted when opened. If <b>FALSE</b>, clears the conversion bit.
     * @returns {HRESULT} See the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-createstream">IStorage::CreateStream</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-openstream">IStorage::OpenStream</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">ISequentialStream::Read</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-write">ISequentialStream::Write</a> methods for possible storage and stream access errors.
     * @see https://learn.microsoft.com/windows/win32/api/ole2/nf-ole2-setconvertstg
     * @since windows5.0
     */
    static SetConvertStg(pStg, fConvert) {
        result := DllCall("OLE32.dll\SetConvertStg", "ptr", pStg, "int", fConvert, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The OleConvertIStorageToOLESTREAMEx function converts the specified storage object from OLE 2 structured storage to the OLE 1 storage object model, including the presentation data.
     * @remarks
     * The 
     * <b>OleConvertIStorageToOLESTREAMEx</b> function converts an OLE 2 storage object to OLE 1 format. It differs from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleconvertistoragetoolestream">OleConvertIStorageToOLESTREAM</a> function in that the 
     * <b>OleConvertIStorageToOLESTREAMEx</b> function also passes the presentation data to the OLE 1 storage object, whereas the 
     * <b>OleConvertIStorageToOLESTREAM</b> function does not.
     * 
     * Because 
     * <b>OleConvertIStorageToOLESTREAMEx</b> can specify which presentation data to convert, it can be used by applications that do not use OLE default caching resources but do use OLE's conversion resources.
     * 
     * The value of the <b>tymed</b> member of 
     * <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> must be either TYMED_HGLOBAL or TYMED_ISTREAM; refer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-tymed">TYMED</a> enumeration for more information. The medium is not released by the 
     * <b>OleConvertIStorageToOLESTREAMEx</b> function.
     * @param {Pointer<IStorage>} pstg Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the storage object to be converted to an OLE 1 storage.
     * @param {Integer} cfFormat Format of the presentation data. May be <b>NULL</b>, in which case the <i>lWidth</i>, <i>lHeight</i>, <i>dwSize</i>, and <i>pmedium</i> parameters are ignored.
     * @param {Integer} lWidth Width of the object presentation data in HIMETRIC units.
     * @param {Integer} lHeight Height of the object presentation data in HIMETRIC units.
     * @param {Integer} dwSize Size of the data, in bytes, to be converted.
     * @param {Pointer<STGMEDIUM>} pmedium Pointer to the 
     * <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> structure for the serialized data to be converted.
     * @param {Pointer<TypeHandle>} polestm Pointer to a stream where the persistent representation of the object is saved using the OLE 1 storage model.
     * @returns {HRESULT} This function supports the standard return value E_INVALIDARG, in addition to the following:
     * @see https://learn.microsoft.com/windows/win32/api/ole2/nf-ole2-oleconvertistoragetoolestreamex
     * @since windows5.0
     */
    static OleConvertIStorageToOLESTREAMEx(pstg, cfFormat, lWidth, lHeight, dwSize, pmedium, polestm) {
        result := DllCall("ole32.dll\OleConvertIStorageToOLESTREAMEx", "ptr", pstg, "ushort", cfFormat, "int", lWidth, "int", lHeight, "uint", dwSize, "ptr", pmedium, "ptr", polestm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The OleConvertOLESTREAMToIStorageEx function converts the specified object from the OLE 1 storage model to an OLE 2 structured storage object including presentation data. This is one of several compatibility functions.
     * @remarks
     * This function converts an OLE 1 object to an OLE 2 structured storage object. You can use this function to update OLE 1 objects to OLE 2 objects when a new version of the object application supports OLE 2.
     * 
     * This function differs from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleconvertolestreamtoistorage">OleConvertOLESTREAMToIStorage</a> function in that the presentation data read from the <b>OLESTREAM</b> structure is passed out and the newly created OLE 2 storage object does not contain a presentation stream.
     * 
     * Since this function can specify which presentation data to convert, it can be used by applications that do not use OLE's default caching resources but do use the conversion resources.
     * 
     * The <b>tymed</b> member of 
     * <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> can only be TYMED_NULL or TYMED_ISTREAM. If it is TYMED_NULL, the data will be returned in a global handle through the <b>hGlobal</b> member of <b>STGMEDIUM</b>, otherwise data will be written into the <b>pstm</b> member of this structure.
     * @param {Pointer<TypeHandle>} polestm Pointer to the stream that contains the persistent representation of the object in the OLE 1 storage format.
     * @param {Pointer<IStorage>} pstg Pointer to the OLE 2 structured storage object.
     * @param {Pointer<UInt16>} pcfFormat Pointer to where the format of the presentation data is returned. May be <b>NULL</b>, indicating the absence of presentation data.
     * @param {Pointer<Int32>} plwWidth Pointer to where the width value (in HIMETRIC) of the presentation data is returned.
     * @param {Pointer<Int32>} plHeight Pointer to where the height value (in HIMETRIC) of the presentation data is returned.
     * @param {Pointer<UInt32>} pdwSize Pointer to where the size in bytes of the converted data is returned.
     * @param {Pointer<STGMEDIUM>} pmedium Pointer to where the 
     * <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> structure for the converted serialized data is returned.
     * @returns {HRESULT} This function returns HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api/ole2/nf-ole2-oleconvertolestreamtoistorageex
     * @since windows5.0
     */
    static OleConvertOLESTREAMToIStorageEx(polestm, pstg, pcfFormat, plwWidth, plHeight, pdwSize, pmedium) {
        result := DllCall("ole32.dll\OleConvertOLESTREAMToIStorageEx", "ptr", polestm, "ptr", pstg, "ushort*", pcfFormat, "int*", plwWidth, "int*", plHeight, "uint*", pdwSize, "ptr", pmedium, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a Windows Runtime property value.
     * @remarks
     * We recommend that you use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-iid_ppv_args">IID_PPV_ARGS</a> macro, defined in Objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, which eliminates the possibility of a coding error in <i>riid</i> that could lead to unexpected results.
     * @param {Pointer<PROPVARIANT>} propvar Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Guid>} riid A reference to the IID of the interface to retrieve through <i>ppv</i>, typically IID_IPropertyValue (defined in Windows.Foundation.h).
     * @param {Pointer<Void>} ppv When this method returns successfully, contains the interface pointer requested in <i>riid</i>. This is typically an <a href="https://docs.microsoft.com/uwp/api/Windows.Foundation.IPropertyValue">IPropertyValue</a> pointer. If the call fails, this value is <b>NULL</b>.
     * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-propvarianttowinrtpropertyvalue
     * @since windows8.0
     */
    static PropVariantToWinRTPropertyValue(propvar, riid, ppv) {
        result := DllCall("PROPSYS.dll\PropVariantToWinRTPropertyValue", "ptr", propvar, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Copies the content from a Windows runtime property value to a PROPVARIANT structure.
     * @param {Pointer<IUnknown>} punkPropertyValue A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface from which this function can access the contents of a Windows runtime property value by retrieving and using the <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nn-windows-foundation-ipropertyvalue">Windows::Foundation::IPropertyValue</a> interface.
     * @param {Pointer<PROPVARIANT>} ppropvar Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure. When this function returns, the <b>PROPVARIANT</b> contains the converted info.
     * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-winrtpropertyvaluetopropvariant
     * @since windows8.0
     */
    static WinRTPropertyValueToPropVariant(punkPropertyValue, ppropvar) {
        result := DllCall("PROPSYS.dll\WinRTPropertyValueToPropVariant", "ptr", punkPropertyValue, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a string resource embedded in an executable file.
     * @remarks
     * This function creates a VT_LPWSTR propvariant. If the specified resource does not exist, it initializes the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> with an empty string. Resource strings longer than 1024 characters are truncated and null-terminated.
     * @param {Pointer<Void>} hinst Type: <b>HINSTANCE</b>
     * 
     * Handle to an instance of the module whose executable file contains the string resource.
     * @param {Integer} id Type: <b>UINT</b>
     * 
     * Integer identifier of the string to be loaded.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantfromresource
     * @since windows5.1.2600
     */
    static InitPropVariantFromResource(hinst, id, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromResource", "ptr", hinst, "uint", id, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a PROPVARIANT structure using the contents of a buffer.
     * @remarks
     * Creates a VT_VECTOR | VT_UI1 propvariant.
     * @param {Pointer} pv Type: <b>const void*</b>
     * 
     * Pointer to the buffer.
     * @param {Integer} cb Type: <b>UINT</b>
     * 
     * The length of the buffer, in bytes.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantfrombuffer
     * @since windows5.1.2600
     */
    static InitPropVariantFromBuffer(pv, cb, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromBuffer", "ptr", pv, "uint", cb, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a class identifier (CLSID).
     * @remarks
     * Creates a VT_CLSID propvariant.
     * @param {Pointer<Guid>} clsid Type: <b>REFCLSID</b>
     * 
     * Reference to the CLSID.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantfromclsid
     * @since windows5.1.2600
     */
    static InitPropVariantFromCLSID(clsid, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromCLSID", "ptr", clsid, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a GUID. The structure is initialized as VT_LPWSTR.
     * @remarks
     * Creates a VT_LPWSTR <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>, which formats the GUID in a form similar to <c>{c200e360-38c5-11ce-ae62-08002b2b79ef}</c>.
     * @param {Pointer<Guid>} guid Type: <b>REFGUID</b>
     * 
     * Reference to the source <b>GUID</b>.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantfromguidasstring
     * @since windows5.1.2600
     */
    static InitPropVariantFromGUIDAsString(guid, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromGUIDAsString", "ptr", guid, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on information stored in a FILETIME structure.
     * @remarks
     * Creates a VT_FILETIME propvariant.
     * @param {Pointer<FILETIME>} pftIn Type: <b>const FILETIME*</b>
     * 
     * Pointer to the date and time as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantfromfiletime
     * @since windows5.1.2600
     */
    static InitPropVariantFromFileTime(pftIn, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromFileTime", "ptr", pftIn, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a specified PROPVARIANT vector element.
     * @remarks
     * This helper function works for <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures of the following types:
     * 
     *                 
     * 
     * <ul>
     * <li>VT_LPWSTR</li>
     * <li>VT_BSTR</li>
     * <li>VT_BOOL</li>
     * <li>VT_I2</li>
     * <li>VT_I4</li>
     * <li>VT_I8</li>
     * <li>VT_U12</li>
     * <li>VT_U14</li>
     * <li>VT_U18</li>
     * <li>VT_FILETIME</li>
     * <li>VT_VECTOR | (any one of VT_LPWSTR, VT_BSTR, VT_BOOL, VT_I2, VT_I4, VT_I8, VT_U12, VT_U14, VT_U18, VT_FILETIME)</li>
     * <li>VT_ARRAY | (any one of VT_BSTR, VT_BOOL, VT_I2, VT_I4, VT_I8, VT_U12, VT_U14, VT_U18)</li>
     * </ul>
     * Additional types may be supported in the future.
     * 
     * This function extracts a single value from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure and uses that value to initialize the output <b>PROPVARIANT</b> structure. The calling application must use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/oe/oe-imimeallocator-propvariantclear">PropVariantClear</a> to free the <b>PROPVARIANT</b> referred to by <i>ppropvar</i> when it is no longer needed.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> is a vector or array, <i>iElem</i> must be less than the number of elements in the vector or array.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has a single value, <i>iElem</i> must be 0.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> is empty, this function always returns an error code.
     * 
     * You can use <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantgetelementcount">PropVariantGetElementCount</a> to obtain the number of elements in the vector or array.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * The source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * The index of the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure element.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantfrompropvariantvectorelem
     * @since windows5.1.2600
     */
    static InitPropVariantFromPropVariantVectorElem(propvarIn, iElem, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromPropVariantVectorElem", "ptr", propvarIn, "uint", iElem, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a vector element in a PROPVARIANT structure with a value stored in another PROPVARIANT.
     * @remarks
     * This function is used to convert a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains a single value into a vector value.
     * 
     * For simple source types, this function initializes the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> as a vector of one element.
     * 
     * For a source that contains a string, this function initializes the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> with zero or more substrings taken from the source string, treating semicolons as delimiters. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-initpropvariantfromstringasvector">InitPropVariantFromStringAsVector</a> for more details.
     * 
     * The following input types are supported:
     *             
     *                 
     * 
     * <ul>
     * <li>VT_I2</li>
     * <li>VT_UI2</li>
     * <li>VT_I4</li>
     * <li>VT_UI4</li>
     * <li>VT_I8</li>
     * <li>VT_UI8</li>
     * <li>VT_R8</li>
     * <li>VT_BOOL</li>
     * <li>VT_DATE</li>
     * <li>VT_FILETIME</li>
     * <li>VT_BSTR</li>
     * <li>VT_LPWSTR</li>
     * </ul>
     * Additional types may be supported in the future.
     * @param {Pointer<PROPVARIANT>} propvarSingle Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains a single value.
     * @param {Pointer<PROPVARIANT>} ppropvarVector Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantvectorfrompropvariant
     * @since windows5.1.2600
     */
    static InitPropVariantVectorFromPropVariant(propvarSingle, ppropvarVector) {
        result := DllCall("PROPSYS.dll\InitPropVariantVectorFromPropVariant", "ptr", propvarSingle, "ptr", ppropvarVector, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a PROPVARIANT structure from a specified Boolean vector.
     * @remarks
     * This creates a <b>VT_BOOL</b> | <b>VT_VECTOR</b> propvariant.
     * @param {Pointer<Int32>} prgf Type: <b>const BOOL*</b>
     * 
     * Pointer to the Boolean vector used to initialize the structure. If this parameter is <b>NULL</b>, the elements pointed to by the <b>cabool.pElems</b> structure member are initialized with VARIANT_FALSE.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * The number of vector elements.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantfrombooleanvector
     * @since windows5.1.2600
     */
    static InitPropVariantFromBooleanVector(prgf, cElems, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromBooleanVector", "int*", prgf, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a specified vector of 16-bit integer values.
     * @remarks
     * Creates a VT_VECTOR | VT_I2 propvariant.
     * @param {Pointer<Int16>} prgn Type: <b>const SHORT*</b>
     * 
     * Pointer to a source vector of <b>SHORT</b> values. If this parameter is <b>NULL</b>, the vector is initialized with zeros.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * The number of elements in the vector.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantfromint16vector
     * @since windows5.1.2600
     */
    static InitPropVariantFromInt16Vector(prgn, cElems, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromInt16Vector", "short*", prgn, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a vector of 16-bit unsigned integer values.
     * @remarks
     * Creates a VT_VECTOR | VT_UI2 propvariant.
     * @param {Pointer<UInt16>} prgn Type: <b>const USHORT*</b>
     * 
     * Pointer to a source vector of <b>USHORT</b> values. If this parameter is <b>NULL</b>, the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> is initialized with zeros.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * Number of elements in the vector pointed to by <i>prgn</i>.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantfromuint16vector
     * @since windows5.1.2600
     */
    static InitPropVariantFromUInt16Vector(prgn, cElems, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromUInt16Vector", "ushort*", prgn, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a vector of 32-bit integer values.
     * @remarks
     * Creates a VT_VECTOR | VT_I4 propvariant.
     * @param {Pointer<Int32>} prgn Type: <b>const LONG*</b>
     * 
     * Pointer to a source vector of <b>LONG</b> values. If this parameter is <b>NULL</b>, the vector is initialized with zeros.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * The number of vector elements.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantfromint32vector
     * @since windows5.1.2600
     */
    static InitPropVariantFromInt32Vector(prgn, cElems, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromInt32Vector", "int*", prgn, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a vector of 32-bit unsigned integer values.
     * @remarks
     * Creates a VT_VECTOR | VT_UI4 propvariant.
     * @param {Pointer<UInt32>} prgn Type: <b>const ULONG*</b>
     * 
     * Pointer to a source vector of <b>ULONG</b> values. If this parameter is <b>NULL</b>, the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> is initialized with zeros.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * Number of elements in the vector pointed to by <i>prgn</i>.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantfromuint32vector
     * @since windows5.1.2600
     */
    static InitPropVariantFromUInt32Vector(prgn, cElems, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromUInt32Vector", "uint*", prgn, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a vector of Int64 values.
     * @remarks
     * Creates a VT_VECTOR | VT_I8 propvariant.
     * @param {Pointer<Int64>} prgn Type: <b>const LONGLONG*</b>
     * 
     * Pointer to a source vector of <b>LONGLONG</b> values. If this parameter is <b>NULL</b>, the vector is initialized with zeros.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * The number of elements in the vector.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantfromint64vector
     * @since windows5.1.2600
     */
    static InitPropVariantFromInt64Vector(prgn, cElems, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromInt64Vector", "int64*", prgn, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a vector of 64-bit unsigned integers.
     * @remarks
     * Creates a VT_VECTOR | VT_UI8 propvariant.
     * @param {Pointer<UInt64>} prgn Type: <b>const ULONGLONG*</b>
     * 
     * Pointer to a source vector of <b>ULONGLONG</b> values. If this parameter is <b>NULL</b>, the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> is initialized with zeros.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * Number of elements in the vector pointed to by <i>prgn</i>.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantfromuint64vector
     * @since windows5.1.2600
     */
    static InitPropVariantFromUInt64Vector(prgn, cElems, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromUInt64Vector", "uint*", prgn, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a specified vector of double values.
     * @remarks
     * Creates a VT_VECTOR | VT_R8 propvariant.
     * @param {Pointer<Double>} prgn Type: <b>const DOUBLE*</b>
     * 
     * Pointer to a <b>double</b> vector. If this value is <b>NULL</b>, the elements pointed to by the <b>cadbl.pElems</b> structure member are initialized with 0.0.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * The number of vector elements.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantfromdoublevector
     * @since windows5.1.2600
     */
    static InitPropVariantFromDoubleVector(prgn, cElems, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromDoubleVector", "double*", prgn, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a PROPVARIANT structure from a specified vector of FILETIME values.
     * @remarks
     * Creates a VT_VECTOR | VT_FILETIME propvariant.
     * @param {Pointer<FILETIME>} prgft Type: <b>const FILETIME*</b>
     * 
     * Pointer to the date and time as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> vector. If this value is <b>NULL</b>, the elements pointed to by the <b>cafiletime.pElems</b> structure member is initialized with (FILETIME)0.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * The number of vector elements.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantfromfiletimevector
     * @since windows5.1.2600
     */
    static InitPropVariantFromFileTimeVector(prgft, cElems, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromFileTimeVector", "ptr", prgft, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a PROPVARIANT structure from a specified string vector.
     * @param {Pointer<Char>} prgsz Type: <b>PCWSTR*</b>
     * 
     * Pointer to a buffer that contains the source string vector.
     * @param {Integer} cElems Type: <b>ULONG</b>
     * 
     * The number of vector elements in <i>prgsz</i>.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantfromstringvector
     * @since windows5.1.2600
     */
    static InitPropVariantFromStringVector(prgsz, cElems, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromStringVector", "ptr", prgsz, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a PROPVARIANT structure from a specified string. The string is parsed as a semi-colon delimited list (for example:\_&quot;A;B;C&quot;).
     * @remarks
     * Creates a VT_VECTOR | VT_LPWSTR propvariant. It parses the source string as a semicolon list of values. The string "a; b; c" creates a vector with three values. Leading and trailing whitespace are removed, and empty values are omitted.
     * 
     * If <i>psz</i> is <b>NULL</b> or contains no values, the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure is initialized as VT_EMPTY.
     * @param {Pointer<Char>} psz Type: <b>PCWSTR</b>
     * 
     * Pointer to a buffer that contains the source Unicode string.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantfromstringasvector
     * @since windows5.1.2600
     */
    static InitPropVariantFromStringAsVector(psz, ppropvar) {
        psz := psz is String? StrPtr(psz) : psz

        result := DllCall("PROPSYS.dll\InitPropVariantFromStringAsVector", "ptr", psz, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts the Boolean property value of a PROPVARIANT structure. If no value exists, then the specified default value is returned.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a Boolean value and would like to use a default value if it does not. For instance, an application that obtains values from a property store can use this to safely extract the Boolean value for Boolean properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_BOOL</b>, this helper function extracts the Boolean value. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into a Boolean. If the source <b>PROPVARIANT</b> has type <b>VT_EMPTY</b> or a conversion is not possible, then <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttobooleanwithdefault">PropVariantToBooleanWithDefault</a> returns the default provided by <i>fDefault</i>. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} fDefault Type: <b>BOOL</b>
     * 
     * Specifies the default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * The extracted Boolean value or the default value.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttobooleanwithdefault
     * @since windows5.1.2600
     */
    static PropVariantToBooleanWithDefault(propvarIn, fDefault) {
        result := DllCall("PROPSYS.dll\PropVariantToBooleanWithDefault", "ptr", propvarIn, "int", fDefault, "int")
        return result
    }

    /**
     * Extracts the Int16 property value of a PROPVARIANT structure. If no value currently exists, then specified default value is returned.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold an <b>Int16</b> value and would like to use a default value if it does not. For instance, an application obtaining values from a property store can use this to safely extract the <b>SHORT</b> value for <b>Int16</b> properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_I2</b>, this helper function extracts the <b>Int16</b> value. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into a <b>SHORT</b>. If the source <b>PROPVARIANT</b> has type <b>VT_EMPTY</b> or a conversion is not possible, then <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttoint16withdefault">PropVariantToInt16WithDefault</a> will return the default provided by <i>iDefault</i>. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iDefault Type: <b>SHORT</b>
     * 
     * Specifies default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>SHORT</b>
     * 
     * Returns the extracted <b>short</b> value, or default.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttoint16withdefault
     * @since windows5.1.2600
     */
    static PropVariantToInt16WithDefault(propvarIn, iDefault) {
        result := DllCall("PROPSYS.dll\PropVariantToInt16WithDefault", "ptr", propvarIn, "short", iDefault, "short")
        return result
    }

    /**
     * Extracts an unsigned short value from a PROPVARIANT structure. If no value exists, then the specified default value is returned.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a  <b>unsigned short</b>   value. For instance, an application obtaining values from a property store can use this to safely extract the  <b>unsigned short</b>  value for UInt16 properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_UI2</b>, this helper function extracts the <b>unsigned short</b> value. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into a <b>unsigned short</b>. If a conversion is not possible, <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttouint16">PropVariantToUInt16</a> will return a failure code and set <i>puiRet</i> to 0. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions. Of note, <b>VT_EMPTY</b> is successfully converted to 0.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} uiDefault Type: <b>USHORT</b>
     * 
     * Specifies a default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>unsigned short</b>
     * 
     * Returns extracted <b>unsigned short</b> value, or default.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttouint16withdefault
     * @since windows5.1.2600
     */
    static PropVariantToUInt16WithDefault(propvarIn, uiDefault) {
        result := DllCall("PROPSYS.dll\PropVariantToUInt16WithDefault", "ptr", propvarIn, "ushort", uiDefault, "ushort")
        return result
    }

    /**
     * Extracts an Int32 value from a PROPVARIANT structure. If no value currently exists, then the specified default value is returned.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a <b>LONG</b> value and would like to use a default value if it does not. For instance, an application obtaining values from a property store can use this to safely extract the <b>LONG</b> value for <b>Int32</b> properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_I4</b>, this helper function extracts the <b>LONG</b> value. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into a <b>LONG</b>. If the source <b>PROPVARIANT</b> has type <b>VT_EMPTY</b> or a conversion is not possible, then <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttoint32withdefault">PropVariantToInt32WithDefault</a> will return the default provided by <i>lDefault</i>. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} lDefault Type: <b>LONG</b>
     * 
     * Specifies a default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>LONG</b>
     * 
     * Returns extracted <b>LONG</b> value, or default.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttoint32withdefault
     * @since windows5.1.2600
     */
    static PropVariantToInt32WithDefault(propvarIn, lDefault) {
        result := DllCall("PROPSYS.dll\PropVariantToInt32WithDefault", "ptr", propvarIn, "int", lDefault, "int")
        return result
    }

    /**
     * Extracts a ULONG value from a PROPVARIANT structure. If no value exists, then a specified default value is returned.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a <b>ULONG</b> value and would like to use a default value if it does not. For instance, an application obtaining values from a property store can use this to safely extract the <b>ULONG</b> value for <b>UInt32</b> properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_UI4</b>, this helper function extracts the <b>ULONG</b> value. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into a <b>ULONG</b>. If the source <b>PROPVARIANT</b> has type <b>VT_EMPTY</b> or a conversion is not possible, then <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttouint32withdefault">PropVariantToUInt32WithDefault</a> will return the default provided by <i>ulDefault</i>. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} ulDefault Type: <b>ULONG</b>
     * 
     * Specifies a default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>ULONG</b>
     * 
     * Returns extracted <b>ULONG</b> value, or default.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttouint32withdefault
     * @since windows5.1.2600
     */
    static PropVariantToUInt32WithDefault(propvarIn, ulDefault) {
        result := DllCall("PROPSYS.dll\PropVariantToUInt32WithDefault", "ptr", propvarIn, "uint", ulDefault, "uint")
        return result
    }

    /**
     * Extracts the Int64 property value of a PROPVARIANT structure. If no value exists, then specified default value is returned.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a <b>LONGLONG</b> value and would like to use a default value if it does not. For instance, an application obtaining values from a property store can use this to safely extract the <b>LONGLONG</b> value for Int64 properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_I8</b>, this helper function extracts the <b>LONGLONG</b> value. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into a <b>LONGLONG</b>. If the source <b>PROPVARIANT</b> has type <b>VT_EMPTY</b> or a conversion is not possible, then <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttoint64withdefault">PropVariantToInt64WithDefault</a> will return the default provided by <i>llDefault</i>. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} llDefault Type: <b>LONGLONG</b>
     * 
     * Specifies a default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>LONGLONG</b>
     * 
     * Returns the extracted <b>LONGLONG</b> value, or default.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttoint64withdefault
     * @since windows5.1.2600
     */
    static PropVariantToInt64WithDefault(propvarIn, llDefault) {
        result := DllCall("PROPSYS.dll\PropVariantToInt64WithDefault", "ptr", propvarIn, "int64", llDefault, "int64")
        return result
    }

    /**
     * Extracts ULONGLONG value from a PROPVARIANT structure. If no value exists, then the specified default value is returned.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a <b>ULONGLONG</b> value and would like to use a default value if it does not. For instance, an application obtaining values from a property store can use this to safely extract the <b>ULONGLONG</b> value for <b>UInt64</b> properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_UI8</b>, this helper function extracts the <b>ULONGLONG</b> value. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into a <b>ULONGLONG</b>. If the source <b>PROPVARIANT</b> has type <b>VT_EMPTY</b> or a conversion is not possible, then <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttouint64withdefault">PropVariantToUInt64WithDefault</a> will return the default provided by <i>ullDefault</i>. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} ullDefault Type: <b>ULONGLONG</b>
     * 
     * Specifies a default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>ULONGLONG</b>
     * 
     * Returns the extracted unsigned <b>LONGLONG</b> value, or a default.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttouint64withdefault
     * @since windows5.1.2600
     */
    static PropVariantToUInt64WithDefault(propvarIn, ullDefault) {
        result := DllCall("PROPSYS.dll\PropVariantToUInt64WithDefault", "ptr", propvarIn, "uint", ullDefault, "uint")
        return result
    }

    /**
     * Extracts a double property value of a PROPVARIANT structure. If no value exists, then the specified default value is returned.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a double value and would like to use a default value if it does not. For instance, an application obtaining values from a property store can use this to safely extract the double value for double properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_R8</b>, this helper function extracts the double value. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into a double. If the source <b>PROPVARIANT</b> has type <b>VT_EMPTY</b> or a conversion is not possible, then <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttodoublewithdefault">PropVariantToDoubleWithDefault</a> will return the default provided by <i>dblDefault</i>. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Float} dblDefault Type: <b>DOUBLE</b>
     * 
     * Specifies default property value, for use where no value currently exists.
     * @returns {Float} Type: <b>DOUBLE</b>
     * 
     * Returns extracted <b>double</b> value, or default.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttodoublewithdefault
     * @since windows5.1.2600
     */
    static PropVariantToDoubleWithDefault(propvarIn, dblDefault) {
        result := DllCall("PROPSYS.dll\PropVariantToDoubleWithDefault", "ptr", propvarIn, "double", dblDefault, "double")
        return result
    }

    /**
     * Extracts the string property value of a PROPVARIANT structure. If no value exists, then the specified default value is returned.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a string value and would like to use a default value if it does not. For instance, an application obtaining values from a property store can use this to safely extract the string value for string properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_LPWSTR or VT_BSTR, this helper function returns a pointer to the value in the source <b>PROPVARIANT</b>. If the source <b>PROPVARIANT</b> has type VT_EMPTY or a conversion is not possible, then <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttostringwithdefault">PropVariantToStringWithDefault</a> will return the default provided by <i>pszDefault</i>. 
     * 
     * Note that this function will return pointers to data supplied in the parameters. Thus the application must ensure that the data supplied to the parameters remains valid until the result is no longer in use.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Char>} pszDefault Type: <b>LPCWSTR</b>
     * 
     * Pointer to a default Unicode string value, for use where no value currently exists. May be <b>NULL</b>.
     * @returns {Pointer<Char>} Type: <b>PCWSTR</b>
     * 
     * Returns string value or default, or the default.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttostringwithdefault
     * @since windows5.1.2600
     */
    static PropVariantToStringWithDefault(propvarIn, pszDefault) {
        pszDefault := pszDefault is String? StrPtr(pszDefault) : pszDefault

        result := DllCall("PROPSYS.dll\PropVariantToStringWithDefault", "ptr", propvarIn, "ptr", pszDefault, "char*")
        return result
    }

    /**
     * Extracts a Boolean property value of a PROPVARIANT structure. If no value can be extracted, then a default value is assigned.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a Boolean value. For instance, an application obtaining values from a property store can use this to safely extract the Boolean value for Boolean properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_BOOL</b>, this helper function extracts the Boolean value. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into a Boolean. If a conversion is not possible, <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttoboolean">PropVariantToBoolean</a> will return a failure code and set <i>pfRet</i> to <b>FALSE</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions. Of note, <b>VT_EMPTY</b> is successfully converted to <b>FALSE</b>.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Int32>} pfRet Type: <b>BOOL*</b>
     * 
     * When this function returns, contains the extracted property value if one exists; otherwise, contains <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttoboolean
     * @since windows5.1.2600
     */
    static PropVariantToBoolean(propvarIn, pfRet) {
        result := DllCall("PROPSYS.dll\PropVariantToBoolean", "ptr", propvarIn, "int*", pfRet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts an Int16 property value of a PROPVARIANT structure.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold an Int16 value. For instance, an application obtaining values from a property store can use this to safely extract the Int16 value for Int16 properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_I2</b>, this helper function extracts the Int16 value. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into an Int16. If a conversion is not possible, <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttoint16">PropVariantToInt16</a> will return a failure code and set <i>piRet</i> to 0. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions. Of note, VT_EMPTY is successfully converted to 0.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Int16>} piRet Type: <b>SHORT*</b>
     * 
     * When this function returns, contains the extracted property value if one exists; otherwise, 0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttoint16
     * @since windows5.1.2600
     */
    static PropVariantToInt16(propvarIn, piRet) {
        result := DllCall("PROPSYS.dll\PropVariantToInt16", "ptr", propvarIn, "short*", piRet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a unsigned short value from a PROPVARIANT structure. If no value can be extracted, then a default value is assigned.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a <b>unsigned short</b> value. For instance, an application obtaining values from a property store can use this to safely extract the <b>unsigned short</b> value for UInt16 properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_UI2</b>, this helper function extracts the <b>unsigned short</b> value. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into a USHORT. If a conversion is not possible, <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttouint16">PropVariantToUInt16</a> will return a failure code and set <i>puiRet</i> to 0. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions. Of note, VT_EMPTY is successfully converted to 0.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt16>} puiRet Type: <b>USHORT*</b>
     * 
     * When this function returns, contains the extracted property value if one exists; otherwise, 0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttouint16
     * @since windows5.1.2600
     */
    static PropVariantToUInt16(propvarIn, puiRet) {
        result := DllCall("PROPSYS.dll\PropVariantToUInt16", "ptr", propvarIn, "ushort*", puiRet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts the Int32 property value of a PROPVARIANT structure. If no value can be extracted, then a default value is assigned.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold an <b>Int32</b> value. For instance, an application obtaining values from a property store can use this to safely extract the <b>Int32</b> value for <b>Int32</b> properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_I4</b>, this helper function extracts the <b>long</b> value. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into a <b>long</b>. If a conversion is not possible, <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttoint32">PropVariantToInt32</a> will return a failure code and set <i>plRet</i> to 0. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions. Of note, <b>VT_EMPTY</b> is successfully converted to 0.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Int32>} plRet Type: <b>LONG*</b>
     * 
     * When this function returns, contains the extracted value if one exists; otherwise, 0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttoint32
     * @since windows5.1.2600
     */
    static PropVariantToInt32(propvarIn, plRet) {
        result := DllCall("PROPSYS.dll\PropVariantToInt32", "ptr", propvarIn, "int*", plRet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts an ULONG value from a PROPVARIANT structure. If no value can be extracted, then a default value is assigned.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a <b>ULONG</b> value. For instance, an application obtaining values from a property store can use this to safely extract the <b>ULONG</b>  value for UInt32 properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_UI4</b>, this helper function extracts the <b>ULONG</b> value. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into a <b>ULONG</b>. If a conversion is not possible, <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttouint32">PropVariantToUInt32</a> will return a failure code and set <i>pulRet</i> to 0. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions. Of note, <b>VT_EMPTY</b> is successfully converted to 0.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * A reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt32>} pulRet Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the extracted property value if one exists; otherwise, 0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttouint32
     * @since windows5.1.2600
     */
    static PropVariantToUInt32(propvarIn, pulRet) {
        result := DllCall("PROPSYS.dll\PropVariantToUInt32", "ptr", propvarIn, "uint*", pulRet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a LONGLONG value from a PROPVARIANT structure. If no value can be extracted, then a default value is assigned.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold an <b>LONGLONG</b> value. For instance, an application obtaining values from a property store can use this to safely extract the <b>LONGLONG</b> value for Int64 properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_I8</b>, this helper function extracts the <b>LONGLONG</b> value. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into a <b>LONGLONG</b>. If a conversion is not possible, <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttoint64">PropVariantToInt64</a> will return a failure code and set <i>pllRet</i> to 0. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions. Of note, <b>VT_EMPTY</b> is successfully converted to 0.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Int64>} pllRet Type: <b>LONGLONG*</b>
     * 
     * When this function returns, contains the extracted property value if one exists; otherwise, 0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttoint64
     * @since windows5.1.2600
     */
    static PropVariantToInt64(propvarIn, pllRet) {
        result := DllCall("PROPSYS.dll\PropVariantToInt64", "ptr", propvarIn, "int64*", pllRet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a UInt64 value from a PROPVARIANT structure. If no value can be extracted, then a default value is assigned.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a <b>ULONGLONG</b> value. For instance, an application obtaining values from a property store can use this to safely extract the <b>ULONGLONG</b>  value for <b>UInt64</b> properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_UI8</b>, this helper function extracts the <b>ULONGLONG</b>  value. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into a <b>ULONGLONG</b>. If a conversion is not possible, <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttouint64">PropVariantToUInt64</a> will return a failure code and set <i>pullRet</i> to 0. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions. Of note, <b>VT_EMPTY</b> is successfully converted to 0.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt64>} pullRet Type: <b>ULONGLONG*</b>
     * 
     * When this function returns, contains the extracted property value if one exists; otherwise, 0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttouint64
     * @since windows5.1.2600
     */
    static PropVariantToUInt64(propvarIn, pullRet) {
        result := DllCall("PROPSYS.dll\PropVariantToUInt64", "ptr", propvarIn, "uint*", pullRet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts double value from a PROPVARIANT structure.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a single double floating point value. For instance, an application obtaining values from a property store can use this to safely extract a double value for double properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_R8</b>, this helper function extracts the double value. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into a double. If a conversion is not possible, <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttodouble">PropVariantToDouble</a> will return a failure code and set <i>pdblRet</i> to 0.0. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions. Of note, <b>VT_EMPTY</b> is successfully converted to 0.0.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Double>} pdblRet Type: <b>DOUBLE*</b>
     * 
     * When this function returns, contains the extracted property value if one exists; otherwise, contains 0.0.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttodouble
     * @since windows5.1.2600
     */
    static PropVariantToDouble(propvarIn, pdblRet) {
        result := DllCall("PROPSYS.dll\PropVariantToDouble", "ptr", propvarIn, "double*", pdblRet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts the buffer value from a PROPVARIANT structure of type VT_VECTOR | VT_UI1 or VT_ARRRAY | VT_UI1.
     * @remarks
     * This function is used in places where the calling application expects a<a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a buffer value. The calling application should check that the value has the expected length before calling this function.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_VECTOR | VT_UI1 or VT_ARRAY | VT_UI1, this function extracts the first <i>cb</i> bytes from the value and places them in the buffer pointed to by <i>pv</i>. If the value has fewer than <i>cb</i> bytes, then <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttobuffer">PropVariantToBuffer</a> fails and the buffer is not modified. If the value has more than <i>cb</i> bytes, then <b>PropVariantToBuffer</b> succeeds and truncates the value.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * The source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer} pv Type: <b>VOID*</b>
     * 
     * Pointer to a buffer of length <i>cb</i> bytes. When this function returns, contains the first <i>cb</i> bytes of the extracted buffer value.
     * @param {Integer} cb Type: <b>UINT</b>
     * 
     * The buffer length, in bytes.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
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
     * If successful, or an error value otherwise. 
     * 
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
     * The<a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was of the wrong type.
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
     * The<a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> value had fewer than <i>cb</i> bytes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttobuffer
     * @since windows5.1.2600
     */
    static PropVariantToBuffer(propvar, pv, cb) {
        result := DllCall("PROPSYS.dll\PropVariantToBuffer", "ptr", propvar, "ptr", pv, "uint", cb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a string value from a PROPVARIANT structure.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a string value. For instance, an application obtaining values from a property store can use this to safely extract a string value for string properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_LPWSTR or <b>VT_BSTR</b>, this function extracts the string and places it into the provided buffer. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into a string. If a conversion is not possible, <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttostring">PropVariantToString</a> will return a failure code and set <i>psz</i> to '\0'. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions. Of note, <b>VT_EMPTY</b> is successfully converted to "".
     * 
     * In addition to the terminating <b>NULL</b>, at most <i>cch</i>-1 characters are written into the buffer pointed to by <i>psz</i>. If the value in the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> is longer than will fit into the buffer, a truncated <b>NULL</b> Terminated copy of the string is written to the buffer and this function returns <b>STRSAFE_E_INSUFFICIENT_BUFFER</b>. The resulting string will always be <b>NULL</b> terminated.
     * 
     * In addition to the conversions provided by <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a>, the following special cases apply to <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttostring">PropVariantToString</a>. 
     *             
     * 
     * <ul>
     * <li>Vector-valued <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>s are converted to strings by separating each element with using "; ". For example, <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttostring">PropVariantToString</a> converts a vector of 3 integers, {3, 1, 4}, to the string "3; 1; 4". The semicolon is independent of the current locale.</li>
     * <li>VT_BLOB, VT_STREAM, VT_STREAMED_OBJECT, and VT_UNKNOWN values are converted to strings using an unsupported encoding. It is not possible to decode strings created in this way and the format may change in the future.</li>
     * </ul>
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Char>} psz Type: <b>PWSTR</b>
     * 
     * Points to a string buffer. When this function returns, the buffer is initialized with a <b>NULL</b> terminated Unicode string value.
     * @param {Integer} cch Type: <b>UINT</b>
     * 
     * Size of the buffer pointed to by <i>psz</i>, in characters.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
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
     * The value was extracted and the result buffer was <b>NULL</b> terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STRSAFE_E_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The copy operation failed due to insufficient buffer space. The destination buffer contains a truncated, null-terminated version of the intended result. In situations where truncation is acceptable, this may not necessarily be seen as a failure condition.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Some other error value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The extraction failed for some other reason.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttostring
     * @since windows5.1.2600
     */
    static PropVariantToString(propvar, psz, cch) {
        psz := psz is String? StrPtr(psz) : psz

        result := DllCall("PROPSYS.dll\PropVariantToString", "ptr", propvar, "ptr", psz, "uint", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a GUID value from a PROPVARIANT structure.
     * @remarks
     * This helper function works for<a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures of the following types: 
     *           
     * 
     * <ul>
     * <li>VT_GUID</li>
     * <li>VT_BSTR</li>
     * <li>VT_LPWSTR</li>
     * <li>VT_ARRAY | VT_UI1</li>
     * </ul>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttoguid">PropVariantToGUID</a> is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a single <b>GUID</b> or <b>GUID</b> value. For instance, an application obtaining values from a property store can use this to safely extract the <b>GUID</b> value for <b>GUID</b> properties.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Guid>} pguid Type: <b>GUID*</b>
     * 
     * When this function returns, contains the extracted property value if one exists.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttoguid
     * @since windows5.1.2600
     */
    static PropVariantToGUID(propvar, pguid) {
        result := DllCall("PROPSYS.dll\PropVariantToGUID", "ptr", propvar, "ptr", pguid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a string property value from a PROPVARIANT structure.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a string value.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_LPWSTR or VT_BSTR, this function extracts the string into a newly allocated buffer. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into a string. If a conversion is not possible, <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttostringalloc">PropVariantToStringAlloc</a> will return a failure code and set <i>ppszOut</i> to <b>NULL</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions. Of note, <b>VT_EMPTY</b> is successfully converted to an allocated buffer containing "".
     * 
     * The calling application is responsible for using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to release the string pointed to by <i>ppszOut</i> when it is no longer needed.
     * 
     * In addition to the conversions provided by <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a>, the following special cases apply to <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttostringalloc">PropVariantToStringAlloc</a>. 
     *                 
     * 
     * <ul>
     * <li>Vector-valued PROPVARIANTs are converted to strings by separating each element with using "; ". For example, <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttostringalloc">PropVariantToStringAlloc</a> converts a vector of 3 integers, {3, 1, 4}, to the string "3; 1; 4". The semicolon is independent of the current locale.</li>
     * <li>VT_BLOB, VT_STREAM, VT_STREAMED_OBJECT, and VT_UNKNOWN values are converted to strings using an unsupported encoding. It is not possible to decode strings created in this way and the format may change in the future.</li>
     * </ul>
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Char>} ppszOut Type: <b>PWSTR*</b>
     * 
     * When this function returns, contains a pointer to the extracted property value if one exists.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttostringalloc
     * @since windows5.1.2600
     */
    static PropVariantToStringAlloc(propvar, ppszOut) {
        result := DllCall("PROPSYS.dll\PropVariantToStringAlloc", "ptr", propvar, "ptr", ppszOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts the BSTR property value of a PROPVARIANT structure.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a string value.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_BSTR</b> or VT_LPWSTR, this function extracts the string as a <b>BSTR</b> value. Otherwise, it attempts to convert the value in the <b>PROPVARIANT</b> structure into a string. If a conversion is not possible, <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttobstr">PropVariantToBSTR</a> returns a failure code and sets <i>pbstrOut</i> to <b>NULL</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> for a list of possible conversions.
     * 
     * <b>VT_EMPTY</b> is successfully converted to an allocated BSTR containing "".
     * 
     * The calling application is responsible for using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to release the <b>BSTR</b> pointed to by <i>pbstrOut</i> when it is no longer needed.
     * 
     * In addition to the conversions provided by <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a>, the following special cases apply to <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttobstr">PropVariantToBSTR</a>.
     *                 
     * 
     * <ul>
     * <li>Vector-valued <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANTs</a> are converted to strings by separating each element with using "; ". For example, <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvarianttobstr">PropVariantToBSTR</a> converts a vector of 3 integers, {3, 1, 4}, to the string "3; 1; 4". The semicolon is independent of the current locale.</li>
     * <li>VT_BLOB, VT_STREAM, VT_STREAMED_OBJECT, and VT_UNKNOWN values are converted to strings through an unsupported encoding. It is not possible to decode strings created in this way and the format may change in the future.</li>
     * </ul>
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Char>} pbstrOut Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a>*</b>
     * 
     * Pointer to the extracted property value if one exists; otherwise, contains an empty string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttobstr
     * @since windows5.1.2600
     */
    static PropVariantToBSTR(propvar, pbstrOut) {
        result := DllCall("PROPSYS.dll\PropVariantToBSTR", "ptr", propvar, "ptr", pbstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts the FILETIME structure from a PROPVARIANT structure.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a single filetime value. For instance, an application obtaining values from a property store can use this to safely extract a filetime value for filetime properties.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_FILETIME or VT_DATE, this helper function extracts the value as a FILETIME using the timezone specified by <i>pstfOut</i>. If the source <b>PROPVARIANT</b> is VT_EMPTY or any other type, this function returns a failure result.
     * 
     * The source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> must be in Coordinated Universal Time (UTC). The PSTF_UTC and PSTF_LOCAL flags allow the calling application to specify what time zone the output should be converted to.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} pstfOut Type: <b>PSTIME_FLAGS</b>
     * 
     * Specifies one of the following time flags.
     * @param {Pointer<FILETIME>} pftOut Type: <b>FILETIME*</b>
     * 
     * When this function returns, contains the extracted <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttofiletime
     * @since windows5.1.2600
     */
    static PropVariantToFileTime(propvar, pstfOut, pftOut) {
        result := DllCall("PROPSYS.dll\PropVariantToFileTime", "ptr", propvar, "int", pstfOut, "ptr", pftOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the element count of a PROPVARIANT structure.
     * @remarks
     * This function works for all valid <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> types. See <b>PROPVARIANT</b> for the valid type combinations.
     * 
     * This function is useful to get the count of elements to iterate through using a looping statement, especially for iterations that call functions such as <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantgetuint32elem">PropVariantGetUInt32Elem</a> or <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantgetelem">PropVariantGetElem</a>.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {Integer} Type: <b>ULONG</b>
     * 
     * Returns the element count of a VT_VECTOR or VT_ARRAY value: for single values, returns 1; for empty structures, returns 0.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvariantgetelementcount
     * @since windows5.1.2600
     */
    static PropVariantGetElementCount(propvar) {
        result := DllCall("PROPSYS.dll\PropVariantGetElementCount", "ptr", propvar, "uint")
        return result
    }

    /**
     * Extracts a Boolean vector from a PROPVARIANT structure.
     * @remarks
     * This helper function is used when the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a Boolean vector value with a fixed number of elements.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_VECTOR | VT_BOOL or VT_ARRAY | VT_BOOL, this helper function extracts up to <i>crgf</i> Boolean values and places them into the buffer pointed to by <i>prgf</i>. If the <b>PROPVARIANT</b> contains more elements than will fit into the <i>prgf</i> buffer, this function returns an error and sets <i>pcElem</i> to 0.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Int32>} prgf Type: <b>BOOL*</b>
     * 
     * Points to a buffer that contains <i>crgf</i> <b>BOOL</b> values. When this function returns, the buffer has been initialized with <i>pcElem</i> Boolean elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} crgf Type: <b>ULONG</b>
     * 
     * Number of elements in the buffer pointed to by <i>prgf</i>.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of Boolean elements extracted from source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
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
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> contained more than <i>crgf</i> values. The buffer pointed to by <i>prgf</i>.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttobooleanvector
     * @since windows5.1.2600
     */
    static PropVariantToBooleanVector(propvar, prgf, crgf, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToBooleanVector", "ptr", propvar, "int*", prgf, "uint", crgf, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a vector of Int16 values from a PROPVARIANT structure.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold an <b>Int16</b> vector value with a fixed number of elements.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_VECTOR | VT_I2 or VT_ARRAY | VT_I2, this helper function extracts up to <i>crgn</i> Int16 values and places them into the buffer pointed to by <i>prgn</i>. If the <b>PROPVARIANT</b> contains more elements than will fit into the <i>prgn</i> buffer, this function returns an error and sets <i>pcElem</i> to 0.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Int16>} prgn Type: <b>SHORT*</b>
     * 
     *  Points to a buffer containing <i>crgn</i> SHORT values. When this function returns, the buffer has been initialized with <i>pcElem</i> SHORT elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Size of the buffer pointed to by <i>prgn</i> in elements.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of <b>Int16</b> elements extracted from source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
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
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> contained more than <i>crgn</i> values. The buffer pointed to by <i>prgn</i>.
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
     * The<a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttoint16vector
     * @since windows5.1.2600
     */
    static PropVariantToInt16Vector(propvar, prgn, crgn, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToInt16Vector", "ptr", propvar, "short*", prgn, "uint", crgn, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into an unsigned short vector.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a vector of <b>unsigned short</b> values with a fixed number of elements.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_VECTOR</b> | <b>VT_UI2</b> or <b>VT_ARRAY</b> | <b>VT_UI2</b>, this helper function extracts up to <i>crgn</i>   <b>unsigned short</b> values and places them into the buffer pointed to by <i>prgn</i>. If the <b>PROPVARIANT</b> contains more elements than will fit into the prgn buffer, this function returns an error and sets <i>pcElem</i> to 0.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt16>} prgn Type: <b>USHORT*</b>
     * 
     * Points to a buffer containing <i>crgn</i> <b>unsigned short</b> values. When this function returns, the buffer has been initialized with <i>pcElem</i> <b>unsigned short</b> elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Size of the buffer pointed to by <i>prgn</i> in elements.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of <b>unsigned short</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
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
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> contained more than <i>crgn</i> values. The buffer pointed to by <i>prgn</i>.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttouint16vector
     * @since windows5.1.2600
     */
    static PropVariantToUInt16Vector(propvar, prgn, crgn, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToUInt16Vector", "ptr", propvar, "ushort*", prgn, "uint", crgn, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a vector of long values from a PROPVARIANT structure.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a vector of <b>LONG</b> values with a fixed number of elements.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_VECTOR</b> | <b>VT_I4</b> or <b>VT_ARRAY</b> | <b>VT_I4</b>, this helper function extracts up to <i>crgn</i>   <b>LONG</b> values and places them into the buffer pointed to by <i>prgn</i>. If the <b>PROPVARIANT</b> contains more elements than will fit into the <i>prgn</i> buffer, this function returns an error and sets <i>pcElem</i> to 0.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Int32>} prgn Type: <b>LONG*</b>
     * 
     * Points to a buffer containing <i>crgn</i>   <b>LONG</b> values. When this function returns, the buffer has been initialized with <i>pcElem</i>   <b>LONG</b> elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Size of the buffer pointed to by <i>prgn</i> in elements.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of <b>LONG</b> elements extracted from source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
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
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> contained more than crgn values. The buffer pointed to by <i>prgn</i>.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttoint32vector
     * @since windows5.1.2600
     */
    static PropVariantToInt32Vector(propvar, prgn, crgn, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToInt32Vector", "ptr", propvar, "int*", prgn, "uint", crgn, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into an ULONG vector.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a vector of <b>ULONG</b> values with a fixed number of elements.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_VECTOR</b> | <b>VT_UI4</b> or <b>VT_ARRAY</b> | <b>VT_UI4</b>, this helper function extracts up to <i>crgn</i>   <b>ULONG</b> values and places them into the buffer pointed to by <i>prgn</i>. If the <b>PROPVARIANT</b> contains more elements than will fit into the <i>prgn</i> buffer, this function returns an error and sets <i>pcElem</i> to 0.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt32>} prgn Type: <b>ULONG*</b>
     * 
     * Points to a buffer containing <i>crgn</i>   <b>ULONG</b> values. When this function returns, the buffer has been initialized with <i>pcElem</i>   <b>ULONG</b> elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Size of the buffer pointed to by <i>prgn</i>, in elements.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of <b>ULONG</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
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
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> contained more than <i>crgn</i> values. The buffer pointed to by <i>prgn</i> is too small.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttouint32vector
     * @since windows5.1.2600
     */
    static PropVariantToUInt32Vector(propvar, prgn, crgn, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToUInt32Vector", "ptr", propvar, "uint*", prgn, "uint", crgn, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into an Int64 vector.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a vector of <b>LONGLONG</b> values with a fixed number of elements.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_VECTOR</b> | <b>VT_I8</b> or <b>VT_ARRAY</b> | <b>VT_I8</b>, this helper function extracts up to <i>crgn</i>   <b>LONGLONG</b> values and places them into the buffer pointed to by <i>prgn</i>. If the <b>PROPVARIANT</b> contains more elements than will fit into the prgn buffer, this function returns an error and sets <i>pcElem</i> to 0.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Int64>} prgn Type: <b>LONGLONG*</b>
     * 
     * Points to a buffer containing <i>crgn</i>   <b>LONGLONG</b> values. When this function returns, the buffer has been initialized with <i>pcElem</i>  <b>LONGLONG</b> elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Size of the buffer pointed to by <i>prgn</i> in elements.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of <b>LONGLONG</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
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
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> contained more than <i>crgn</i> values. The buffer pointed to by <i>prgn</i>.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttoint64vector
     * @since windows5.1.2600
     */
    static PropVariantToInt64Vector(propvar, prgn, crgn, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToInt64Vector", "ptr", propvar, "int64*", prgn, "uint", crgn, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a ULONGLONG vector.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a vector of <b>ULONGLONG</b> values with a fixed number of elements.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_VECTOR</b> | <b>VT_UI8</b> or <b>VT_ARRAY</b> | <b>VT_UI8</b>, this helper function extracts up to <i>crgn</i>   <b>ULONGLONG</b> values and places them into the buffer pointed to by <i>prgn</i>. If the <b>PROPVARIANT</b> contains more elements than will fit into the <i>prgn</i> buffer, this function returns an error and sets <i>pcElem</i> to 0.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt64>} prgn Type: <b>ULONGLONG*</b>
     * 
     * Points to a buffer containing <i>crgn</i>   <b>ULONGLONG</b> values. When this function returns, the buffer has been initialized with <i>pcElem</i>   <b>ULONGLONG</b> elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Size of the buffer pointed to by <i>prgn</i>, in elements.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of <b>ULONGLONG</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
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
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> contained more than <i>crgn</i> values. The buffer pointed to by <i>prgn</i>.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttouint64vector
     * @since windows5.1.2600
     */
    static PropVariantToUInt64Vector(propvar, prgn, crgn, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToUInt64Vector", "ptr", propvar, "uint*", prgn, "uint", crgn, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a vector of doubles from a PROPVARIANT structure.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a double vector value with a fixed number of elements.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_VECTOR | VT_R8 or VT_ARRAY | VT_R8, this helper function extracts up to <i>crgn</i> double values and places them into the buffer pointed to by <i>prgn</i>. If the <b>PROPVARIANT</b> contains more elements than will fit into the <i>prgn</i> buffer, this function returns an error and sets <i>pcElem</i> to 0.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Double>} prgn Type: <b>DOUBLE*</b>
     * 
     * Points to a buffer containing <i>crgn</i> DOUBLE values. When this function returns, the buffer has been initialized with <i>pcElem</i> double elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Size in elements of the buffer pointed to by <i>prgn</i>.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of double elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttodoublevector
     * @since windows5.1.2600
     */
    static PropVariantToDoubleVector(propvar, prgn, crgn, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToDoubleVector", "ptr", propvar, "double*", prgn, "uint", crgn, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a FILETIME vector.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a filetime vector value with a fixed number of elements.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_VECTOR | VT_FILETIME, this helper function extracts up to <i>crgft</i> FILETIME values and places them into the buffer pointed to by <i>prgft</i>. If the <b>PROPVARIANT</b> contains more elements than will fit into the <i>prgft</i> buffer, this function returns an error and sets <i>pcElem</i> to 0.
     * 
     * The output FILETIMEs will use the same time zone as the source FILETIMEs.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<FILETIME>} prgft Type: <b>FILETIME*</b>
     * 
     *  Points to a buffer containing <i>crgft</i> FILETIME values. When this function returns, the buffer has been initialized with <i>pcElem</i> FILETIME elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} crgft Type: <b>ULONG</b>
     * 
     *  Size in elements of the buffer pointed to by <i>prgft</i>.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of FILETIME elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values.
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
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> contained more than crgn values. The buffer pointed to by <i>prgft</i>.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttofiletimevector
     * @since windows5.1.2600
     */
    static PropVariantToFileTimeVector(propvar, prgft, crgft, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToFileTimeVector", "ptr", propvar, "ptr", prgft, "uint", crgft, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a vector of strings from a PROPVARIANT structure.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a vector of string values with a fixed number of elements.
     * 
     * This function works for the following <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> types:
     *             
     * 
     * <ul>
     * <li>VT_VECTOR | VT_LPWSTR</li>
     * <li>VT_VECTOR | VT_BSTR</li>
     * <li>VT_ARRAY | VT_BSTR</li>
     * </ul>
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has a supported type, this helper function extracts up to <i>crgsz</i> string values and places an allocated copy of each into the buffer pointed to by prgsz. If the <b>PROPVARIANT</b> contains more elements than will fit into the <i>prgsz</i> buffer, this function returns an error and sets <i>pcElem</i> to 0.
     * 
     * Since each string in pointed to by the output buffer has been newly allocated, the calling application is responsible for using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to free each string in the output buffer when they are no longer needed.
     * 
     * If a <b>BSTR</b> in the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> is <b>NULL</b>, it is converted to a newly allocated string containing "" in the output.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Char>} prgsz Type: <b>PWSTR*</b>
     * 
     * Pointer to a vector of string pointers. When this function returns, the buffer has been initialized with <i>pcElem</i> elements pointing to newly allocated strings containing the data extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>.
     * @param {Integer} crgsz Type: <b>ULONG</b>
     * 
     * Size of the buffer pointed to by <i>prgsz</i>, in elements.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     *  When this function returns, contains the count of strings extracted from source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
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
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TYPE_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The source<a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> contained more than <i>crgsz</i> values. The buffer pointed to by <i>prgsz</i>.
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
     * The<a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttostringvector
     * @since windows5.1.2600
     */
    static PropVariantToStringVector(propvar, prgsz, crgsz, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToStringVector", "ptr", propvar, "ptr", prgsz, "uint", crgsz, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly allocated Boolean vector.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a Boolean vector value.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_VECTOR | VT_BOOL or VT_ARRAY | VT_BOOL, this function extracts a vector of Boolean values into a newly allocated vector of <b>BOOL</b> values. The calling application is responsible for using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to release the vector pointed to by <i>pprgf</i> when it is no longer needed.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Int32>} pprgf Type: <b>BOOL**</b>
     * 
     * When this function returns, contains a pointer to a vector of Boolean values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of Boolean elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
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
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
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
     * The<a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttobooleanvectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToBooleanVectorAlloc(propvar, pprgf, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToBooleanVectorAlloc", "ptr", propvar, "ptr", pprgf, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly allocated Int16 vector.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold an <b>Int16</b> vector value.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_VECTOR | VT_I2 or VT_ARRAY | VT_I2, this function extracts a vector of <b>Int16</b> values into a newly allocated vector of SHORT values. The calling application is responsible for using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to release the vector pointed to by <i>pprgn</i> when it is no longer needed.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Int16>} pprgn Type: <b>SHORT**</b>
     * 
     * When this function returns, contains a pointer to a vector of <b>Int16</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     *  When this function returns, contains the count of <b>Int16</b> elements extracted from source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
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
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
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
     * The<a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttoint16vectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToInt16VectorAlloc(propvar, pprgn, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToInt16VectorAlloc", "ptr", propvar, "ptr", pprgn, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly-allocated unsigned short vector.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a vector of <b>unsigned short</b> values.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_VECTOR</b> | <b>VT_UI2</b> or <b>VT_ARRAY</b> | <b>VT_UI2</b>, this function extracts a vector of <b>unsigned short</b> values into a newly allocated vector. The calling application is responsible for using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to release the vector pointed to by <i>pprgn</i> when it is no longer needed.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt16>} pprgn Type: <b>USHORT**</b>
     * 
     * When this function returns, contains a pointer to a vector of <b>unsigned short</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     *  When this function returns, contains the count of <b>unsigned short</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
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
     * Returns <b>S_OK</b> if successful, or an error value otherwise
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttouint16vectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToUInt16VectorAlloc(propvar, pprgn, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToUInt16VectorAlloc", "ptr", propvar, "ptr", pprgn, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly-allocated Int32 vector.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold an Int32 vector value.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_VECTOR</b> | <b>VT_I4</b> or <b>VT_ARRAY</b> | <b>VT_I4</b>, this function extracts a vector of <b>LONG</b> values into a newly allocated vector. The calling application is responsible for using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to release the vector pointed to by <i>pprgn</i> when it is no longer needed.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Int32>} pprgn Type: <b>LONG**</b>
     * 
     * When this function returns, contains a pointer to a vector of <b>LONG</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of <b>LONG</b> elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
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
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
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
     * The<a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttoint32vectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToInt32VectorAlloc(propvar, pprgn, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToInt32VectorAlloc", "ptr", propvar, "ptr", pprgn, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly-allocated ULONG vector.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a vector of <b>ULONG</b> values.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_VECTOR</b> | <b>VT_UI4</b> or <b>VT_ARRAY</b> | <b>VT_UI4</b>, this function extracts a vector of <b>ULONG</b> values into a newly allocated vector. The calling application is responsible for using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to release the vector pointed to by <i>pprgn</i> when it is no longer needed.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt32>} pprgn Type: <b>ULONG**</b>
     * 
     * When this function returns, contains a pointer to a vector of <b>ULONG</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of <b>ULONG</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
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
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttouint32vectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToUInt32VectorAlloc(propvar, pprgn, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToUInt32VectorAlloc", "ptr", propvar, "ptr", pprgn, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly-allocated LONGLONG vector.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a vector of <b>LONGLONG</b> values.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_VECTOR</b> | <b>VT_I8</b> or <b>VT_ARRAY</b> | <b>VT_I8</b>, this function extracts a vector of <b>LONGLONG</b> values into a newly allocated vector. The calling application is responsible for using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to release the vector pointed to by <i>pprgn</i> when it is no longer needed.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Int64>} pprgn Type: <b>LONGLONG**</b>
     * 
     * When this function returns, contains a pointer to a vector of <b>LONGLONG</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of <b>LONGLONG</b> values extracted from source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
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
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
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
     * The<a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttoint64vectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToInt64VectorAlloc(propvar, pprgn, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToInt64VectorAlloc", "ptr", propvar, "ptr", pprgn, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly-allocated ULONGLONG vector.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a vector of <b>ULONGLONG</b> values.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <b>VT_VECTOR</b> | <b>VT_UI8</b> or <b>VT_ARRAY</b> | <b>VT_UI8</b>, this function extracts a vector of <b>ULONGLONG</b> values into a newly allocated vector. The calling application is responsible for using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to release the vector pointed to by <i>pprgn</i> when it is no longer needed.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt64>} pprgn Type: <b>ULONGLONG**</b>
     * 
     * When this function returns, contains a pointer to a vector of <b>ULONGLONG</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of <b>ULONGLONG</b> elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
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
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttouint64vectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToUInt64VectorAlloc(propvar, pprgn, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToUInt64VectorAlloc", "ptr", propvar, "ptr", pprgn, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly-allocated double vector.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a double vector value.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_VECTOR | VT_R8 or VT_ARRAY | VT_R8, this function extracts a vector of double values into a newly allocated vector of DOUBLE values. The calling application is responsible for using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to release the vector pointed to by <i>pprgn</i> when it is no longer needed.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Double>} pprgn Type: <b>DOUBLE**</b>
     * 
     * When this function returns, contains a pointer to a vector of double values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of double elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttodoublevectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToDoubleVectorAlloc(propvar, pprgn, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToDoubleVectorAlloc", "ptr", propvar, "ptr", pprgn, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly-allocated FILETIME vector.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a FILETIME vector value.
     * 
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_VECTOR | VT_FILETIME, this function extracts a vector of FILETIMEs values into a newly allocated vector of FILETIME values. The calling application is responsible for using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to release the vector pointed to by <i>pprgft</i> when it is no longer needed.
     * 
     * The output FILETIMEs will use the same time zone as the source FILETIMEs.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<FILETIME>} pprgft Type: <b>FILETIME**</b>
     * 
     *  When this function returns, contains a pointer to a vector of FILETIME values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of FILETIME elements extracted from source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values.
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
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
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
     * The<a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttofiletimevectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToFileTimeVectorAlloc(propvar, pprgft, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToFileTimeVectorAlloc", "ptr", propvar, "ptr", pprgft, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly allocated strings in a newly allocated vector.
     * @remarks
     * This helper function is used in places where the calling application expects a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> to hold a vector of string values.
     * 
     * This helper function works for the following<a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> types:
     *             
     * 
     * <ul>
     * <li>VT_VECTOR | VT_LPWSTR</li>
     * <li>VT_VECTOR | VT_BSTR</li>
     * <li>VT_ARRAY | VT_BSTR</li>
     * </ul>
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has a supported type, this function extracts a vector of string values into a newly allocated vector of newly allocated strings. The calling application is responsible for using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> to release both the strings contained in the output vector, and the output vector itself, when they are no longer needed.
     * 
     * If a <b>BSTR</b> in the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> is <b>NULL</b>, this function will place a newly allocated string containing "" into the output vector.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Char>} pprgsz Type: <b>PWSTR**</b>
     * 
     * When this function returns, contains a pointer to a vector of strings extracted from source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<UInt32>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of string elements extracted from source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return one of these values.
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
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttostringvectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToStringVectorAlloc(propvar, pprgsz, pcElem) {
        result := DllCall("PROPSYS.dll\PropVariantToStringVectorAlloc", "ptr", propvar, "ptr", pprgsz, "uint*", pcElem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a single Boolean element from a PROPVARIANT structure of type VT_BOOL, VT_VECTOR | VT_BOOL, or VT_ARRAY | VT_BOOL.
     * @remarks
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure has type <c>VT_BOOL</c>, <i>iElem</i> must be 0. Otherwise <i>iElem</i> must be less than the number of elements in the vector or array. You can use <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantgetelementcount">PropVariantGetElementCount</a> to obtain the number of elements in the vector or array.
     * 
     * The following example uses this function to loop through the values in a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * A reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * Specifies the vector or array index; otherwise, <i>iElem</i> must be 0.
     * @param {Pointer<Int32>} pfVal Type: <b>BOOL*</b>
     * 
     * When this function returns, contains the extracted Boolean value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvariantgetbooleanelem
     * @since windows5.1.2600
     */
    static PropVariantGetBooleanElem(propvar, iElem, pfVal) {
        result := DllCall("PROPSYS.dll\PropVariantGetBooleanElem", "ptr", propvar, "uint", iElem, "int*", pfVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a single Int16 element from a PROPVARIANT structure of type VT_I2, VT_VECTOR | VT_I2, or VT_ARRAY | VT_I2.
     * @remarks
     * This helper function works for <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures of the following types.
     *                 
     * 
     * <ul>
     * <li>VT_I2</li>
     * <li>VT_VECTOR | VT_I2</li>
     * <li>VT_ARRAY | VT_I2</li>
     * </ul>
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_I2, <i>iElem</i> must be 0. Otherwise, <i>iElem</i> must be less than the number of elements in the vector or array. You can use <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantgetelementcount">PropVariantGetElementCount</a> to obtain the number of elements in the vector or array.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * The vector or array index; otherwise, this value must be 0.
     * @param {Pointer<Int16>} pnVal Type: <b>SHORT*</b>
     * 
     * When this function returns, contains the extracted Int32 element value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvariantgetint16elem
     * @since windows5.1.2600
     */
    static PropVariantGetInt16Elem(propvar, iElem, pnVal) {
        result := DllCall("PROPSYS.dll\PropVariantGetInt16Elem", "ptr", propvar, "uint", iElem, "short*", pnVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a single unsigned Int16 element from a PROPVARIANT structure of type VT_U12, VT_VECTOR | VT_U12, or VT_ARRAY | VT_U12.
     * @remarks
     * This helper function works for <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures of the following types: 
     *             
     *                 
     * 
     * <ul>
     * <li>VT_UI2</li>
     * <li>VT_VECTOR | VT_UI2</li>
     * <li>VT_ARRAY | VT_UI2</li>
     * </ul>
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_UI2, iElem must be 0. Otherwise iElem must be less than the number of elements in the vector or array. You can use <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantgetelementcount">PropVariantGetElementCount</a> to obtain the number of elements in the vector or array.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * The vector or array index; otherwise, <i>iElem</i> must be 0.
     * @param {Pointer<UInt16>} pnVal Type: <b>USHORT*</b>
     * 
     * When this function returns, contains the extracted element value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvariantgetuint16elem
     * @since windows5.1.2600
     */
    static PropVariantGetUInt16Elem(propvar, iElem, pnVal) {
        result := DllCall("PROPSYS.dll\PropVariantGetUInt16Elem", "ptr", propvar, "uint", iElem, "ushort*", pnVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a single Int32 element from a PROPVARIANT of type VT_I4, VT_VECTOR | VT_I4, or VT_ARRAY | VT_I4.
     * @remarks
     * This helper function works for <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures of the following types: 
     *           
     *                 
     * 
     * <ul>
     * <li>VT_I4</li>
     * <li>VT_VECTTOR | VT_I4</li>
     * <li>VT_ARRAY | VT_I4</li>
     * </ul>
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_I4, iElem must be 0. Otherwise, <i>iElem</i> must be less than the number of elements in the vector or array. You can use <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantgetelementcount">PropVariantGetElementCount</a>  to obtain the number of elements in the vector or array.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * The vector or array index; otherwise, <i>iElem</i> must be 0.
     * @param {Pointer<Int32>} pnVal Type: <b>LONG*</b>
     * 
     * When this function, contains the extracted Int32 value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvariantgetint32elem
     * @since windows5.1.2600
     */
    static PropVariantGetInt32Elem(propvar, iElem, pnVal) {
        result := DllCall("PROPSYS.dll\PropVariantGetInt32Elem", "ptr", propvar, "uint", iElem, "int*", pnVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a single unsigned Int32 element from a PROPVARIANT structure of type VT_UI4, VT_VECTOR | VT_UI4, or VT_ARRAY | VT_UI4.
     * @remarks
     * This helper function works for <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures of the following types: 
     * 
     *                 
     * 
     * <ul>
     * <li>VT_UI4</li>
     * <li>VT_VECTOR | VT_UI4</li>
     * <li>VT_ARRAY | VT_UI4</li>
     * </ul>
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_UI4, <i>iElem</i> must be 0. Otherwise, <i>iElem</i> must be less than the number of elements in the vector or array. You can use <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantgetelementcount">PropVariantGetElementCount</a> to obtain the number of elements in the vector or array.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * The source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * A vector or array index; otherwise, <i>iElem</i> must be 0.
     * @param {Pointer<UInt32>} pnVal Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the extracted unsigned Int32 value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvariantgetuint32elem
     * @since windows5.1.2600
     */
    static PropVariantGetUInt32Elem(propvar, iElem, pnVal) {
        result := DllCall("PROPSYS.dll\PropVariantGetUInt32Elem", "ptr", propvar, "uint", iElem, "uint*", pnVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a single Int64 element from a PROPVARIANT structure of type VT_I8, VT_VECTOR | VT_I8, or VT_ARRAY | VT_I8.
     * @remarks
     * This helper function works for<a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures of the following types:
     *             
     *                 
     * 
     * <ul>
     * <li>VT_I8</li>
     * <li>VT_VECTOR | VT_I8</li>
     * <li>VT_ARRAY | VT_I8</li>
     * </ul>
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_I8, <i>iElem</i> must be 0. Otherwise, <i>iElem</i> must be less than the number of elements in the vector or array. You can use <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantgetelementcount">PropVariantGetElementCount</a> to obtain the number of elements in the vector or array.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * The vector or array index; otherwise, <i>iElem</i> must be 0.
     * @param {Pointer<Int64>} pnVal Type: <b>LONGLONG*</b>
     * 
     * When this function returns, contains the extracted Int64 value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvariantgetint64elem
     * @since windows5.1.2600
     */
    static PropVariantGetInt64Elem(propvar, iElem, pnVal) {
        result := DllCall("PROPSYS.dll\PropVariantGetInt64Elem", "ptr", propvar, "uint", iElem, "int64*", pnVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a single unsigned Int64 element from a PROPVARIANT structure of type VT_UI8, VT_VECTOR | VT_UI8, or VT_ARRAY | VT_UI8.
     * @remarks
     * This helper function works for <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures of the following types: 
     * 
     *                 
     * 
     * <ul>
     * <li>VT_UI8</li>
     * <li>VT_VECTOR | VT_UI8</li>
     * <li>VT_ARRAY | VT_UI8</li>
     * </ul>
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_UI8, <i>iElem</i> must be 0. Otherwise <i>iElem</i> must be less than the number of elements in the vector or array. You can use <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantgetelementcount">PropVariantGetElementCount</a> to obtain the number of elements in the vector or array.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * The source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * The vector or array index; otherwise, <i>iElem</i> must be 0.
     * @param {Pointer<UInt64>} pnVal Type: <b>ULONGLONG*</b>
     * 
     * When this function returns, contains the extracted Int64 value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvariantgetuint64elem
     * @since windows5.1.2600
     */
    static PropVariantGetUInt64Elem(propvar, iElem, pnVal) {
        result := DllCall("PROPSYS.dll\PropVariantGetUInt64Elem", "ptr", propvar, "uint", iElem, "uint*", pnVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a single double element from a PROPVARIANT structure of type VT_R8, VT_VECTOR | VT_R8, or VT_ARRAY | VT_R8.
     * @remarks
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type <c>VT_R8</c>, <i>iElem</i> must be 0. Otherwise <i>iElem</i> must be less than the number of elements in the vector or array. You can use <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantgetelementcount">PropVariantGetElementCount</a> to obtain the number of elements in the vector or array.
     * 
     * The following example uses this function to loop through the values in a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * Specifies vector or array index; otherwise, <i>iElem</i> must be 0.
     * @param {Pointer<Double>} pnVal Type: <b>DOUBLE*</b>
     * 
     * When this function returns, contains the extracted double value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvariantgetdoubleelem
     * @since windows5.1.2600
     */
    static PropVariantGetDoubleElem(propvar, iElem, pnVal) {
        result := DllCall("PROPSYS.dll\PropVariantGetDoubleElem", "ptr", propvar, "uint", iElem, "double*", pnVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a single FILETIME element from a PROPVARIANT structure of type VT_FILETIME, VT_VECTOR | VT_FILETIME, or VT_ARRAY | VT_FILETIME.
     * @remarks
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_FILETIME, <i>iElem</i> must be 0; otherwise, <i>iElem</i> must be less than the number of elements in the vector or array. You can use <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantgetelementcount">PropVariantGetElementCount</a> to obtain the number of elements in the vector or array.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * The source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * Specifies vector or array index; otherwise, this value must be 0.
     * @param {Pointer<FILETIME>} pftVal Type: <b>FILETIME*</b>
     * 
     * When this function returns, contains the extracted filetime value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvariantgetfiletimeelem
     * @since windows5.1.2600
     */
    static PropVariantGetFileTimeElem(propvar, iElem, pftVal) {
        result := DllCall("PROPSYS.dll\PropVariantGetFileTimeElem", "ptr", propvar, "uint", iElem, "ptr", pftVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Extracts a single Unicode string element from a PROPVARIANT structure of type VT_LPWSTR, VT_BSTR, VT_VECTOR | VT_LPWSTR, VT_VECTOR | VT_BSTR, or VT_ARRAY | VT_BSTR.
     * @remarks
     * This helper function works for <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures of the following types: 
     * 
     *                 
     * 
     * <ul>
     * <li>VT_LPWSTR</li>
     * <li>VT_BSTR</li>
     * <li>VT_VECTOR | VT_LPWSTR</li>
     * <li>VT_VECTOR | VT_BSTR</li>
     * <li>VT_ARRAY | VT_BSTR</li>
     * </ul>
     * If the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> has type VT_LPWSTR or VT_BSTR, <i>iElem</i> must be 0. Otherwise <i>iElem</i> must be less than the number of elements in the vector or array. You can use <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantgetelementcount">PropVariantGetElementCount</a> to obtain the number of elements in the vector or array.
     * 
     * If a BSTR element has a <b>NULL</b> pointer, this function allocates an empty string.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * The vector or array index; otherwise, <i>iElem</i> must be 0.
     * @param {Pointer<Char>} ppszVal Type: <b>PWSTR*</b>
     * 
     * When this function returns, contains the extracted string value. The calling application is responsible for freeing this string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> when it is no longer needed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvariantgetstringelem
     * @since windows5.1.2600
     */
    static PropVariantGetStringElem(propvar, iElem, ppszVal) {
        result := DllCall("PROPSYS.dll\PropVariantGetStringElem", "ptr", propvar, "uint", iElem, "ptr", ppszVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Frees the memory and references used by an array of PROPVARIANT structures stored in an array.
     * @remarks
     * This function releases the memory and references held by each structure in the array before setting the structures to zero.
     * 
     * This function performs the same action as <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-freepropvariantarray">FreePropVariantArray</a>, but <b>FreePropVariantArray</b> returns an <b>HRESULT</b>.
     * @param {Pointer<PROPVARIANT>} rgPropVar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures to free.
     * @param {Integer} cVars Type: <b>UINT</b>
     * 
     * The number of elements in the array specified by <i>rgPropVar</i>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-clearpropvariantarray
     * @since windows5.1.2600
     */
    static ClearPropVariantArray(rgPropVar, cVars) {
        DllCall("PROPSYS.dll\ClearPropVariantArray", "ptr", rgPropVar, "uint", cVars)
    }

    /**
     * Extends PropVariantCompare by allowing the caller to compare two PROPVARIANT structures based on specified comparison units and flags.
     * @remarks
     * This function does not compare all types; only selected types are currently comparable.
     * 
     * By default, VT_NULL / VT_EMPTY / 0-element vectors are considered to be less than any other vartype.
     * 
     * If the vartypes are different, this function attempts to convert <i>propvar2</i> to the vartype of <i>propvar1</i> before comparing them.
     * 
     * <div class="alert"><b>Note</b>  Behavior of this function, and therefore the results it returns, can change from release to release. It should not be used for canonical sorting applications.</div>
     * <div> </div>
     * @param {Pointer<PROPVARIANT>} propvar1 Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to the first <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<PROPVARIANT>} propvar2 Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to the second <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} unit Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/ne-propvarutil-propvar_compare_unit">PROPVAR_COMPARE_UNIT</a></b>
     * 
     * Specifies, where appropriate, one of the comparison units defined in <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/ne-propvarutil-propvar_compare_unit">PROPVAR_COMPARE_UNIT</a>.
     * @param {Integer} flags Type: <b>PROPVAR_COMPARE_FLAGS</b>
     * 
     * Specifies one of the following:
     * @returns {Integer} Type: <b>INT</b>
     * 
     * <ul>
     * <li>Returns 1 if <i>propvar1</i> is greater than <i>propvar2</i></li>
     * <li>Returns 0 if <i>propvar1</i> equals <i>propvar2</i></li>
     * <li>Returns -1 if <i>propvar1</i> is less than <i>propvar2</i></li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvariantcompareex
     * @since windows5.1.2600
     */
    static PropVariantCompareEx(propvar1, propvar2, unit, flags) {
        result := DllCall("PROPSYS.dll\PropVariantCompareEx", "ptr", propvar1, "ptr", propvar2, "int", unit, "int", flags, "int")
        return result
    }

    /**
     * Coerces a value stored as a PROPVARIANT structure to an equivalent value of a different variant type.
     * @remarks
     * Note that the source and destination <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures must be separate structures. You cannot overwrite the source <b>PROPVARIANT</b> data with the new destination data; attempting to do so will result in an error.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> converts values between the following types as follows. Numbers refer to conditions explained after the tables.
     * 
     * 
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <th></th>
     * <th>VT_LPWSTR</th>
     * <th>VT_BSTR</th>
     * <th>VT_BOOL</th>
     * <th>VT_FILETIME</th>
     * <th>VT_DATE</th>
     * <th>VT_CLSID</th>
     * </tr>
     * <tr>
     * <th>VT_LPWSTR</th>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes (2)</td>
     * <td>Yes (2)</td>
     * <td>Yes</td>
     * </tr>
     * <tr>
     * <th>VT_BSTR</th>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes (2)</td>
     * <td>Yes (2)</td>
     * <td>Yes</td>
     * </tr>
     * <tr>
     * <th>VT_BOOL</th>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th>VT_I2</th>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th>VT_I4</th>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th>VT_I8</th>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th>VT_UI2</th>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th>VT_UI4</th>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th>VT_UI8</th>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th>VT_R8</th>
     * <td>Yes (3)</td>
     * <td>Yes (3)</td>
     * <td>Yes</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th>VT_FILETIME</th>
     * <td>Yes (2)</td>
     * <td>Yes (2)</td>
     * <td>No</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th>VT_DATE</th>
     * <td>Yes (2)</td>
     * <td>Yes (2)</td>
     * <td>No</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th>VT_CLSID</th>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * <td>Yes</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <th></th>
     * <th>VT_I2</th>
     * <th>VT_I4</th>
     * <th>VT_I8</th>
     * <th>VT_UI2</th>
     * <th>VT_UI4</th>
     * <th>VT_UI8</th>
     * <th>VT_R8</th>
     * </tr>
     * <tr>
     * <th>VT_LPWSTR</th>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes (3)</td>
     * </tr>
     * <tr>
     * <th>VT_BSTR</th>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes (3)</td>
     * </tr>
     * <tr>
     * <th>VT_BOOL</th>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * </tr>
     * <tr>
     * <th>VT_I2</th>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * </tr>
     * <tr>
     * <th>VT_I4</th>
     * <td>Yes (1)</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * </tr>
     * <tr>
     * <th>VT_I8</th>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * <td>Yes</td>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * </tr>
     * <tr>
     * <th>VT_UI2</th>
     * <td>Yes (1)</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes (1)</td>
     * </tr>
     * <tr>
     * <th>VT_UI4</th>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * <td>Yes</td>
     * <td>Yes (1)</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes (1)</td>
     * </tr>
     * <tr>
     * <th>VT_UI8</th>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * <td>Yes</td>
     * <td>Yes (1)</td>
     * </tr>
     * <tr>
     * <th>VT_R8</th>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * <td>Yes (1)</td>
     * <td>Yes</td>
     * </tr>
     * <tr>
     * <th>VT_FILETIME</th>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th>VT_DATE</th>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th>VT_CLSID</th>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * <h3><a id="Conditions"></a><a id="conditions"></a><a id="CONDITIONS"></a>Conditions</h3>
     * <ol>
     * <li>When converting between numeric types, out-of-range conversions fail. For instance, a negative signed value to an unsigned type, or a 4-byte unsigned value larger than 65535 to a 2-byte unsigned type.</li>
     * <li>When converting between strings and dates, a canonical string form is used rather than a localized or "human-readable" representation. The format is "yyyy/mm/dd:hh:mm:ss.fff" (year, month, date, hours, minutes, seconds, milliseconds). Note that this is less precision than is supported by the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> type, but it should be sufficient for most purposes.</li>
     * <li>When converting between floating point numbers and strings, the current locale's decimal separator is used. Note that this might cause problems when these values are saved in files that are moved between different locales.</li>
     * </ol>
     * <div class="alert"><b>Note</b>  Additional types might be supported in the future.</div>
     * <div> </div>
     * Converting between vectors (<b>VT_VECTOR</b>) and arrays (<b>VT_ARRAY</b>) is supported in some cases. When it is supported, the count of elements must be the same in each. A single-valued vector can be converted to a non-vector value, but a multi-valued vector cannot be converted to a non-vector type.
     * 
     * Coercion between types is performed without respect to property-specific information. Property-specific coercions should be performed using <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-pscoercetocanonicalvalue">PSCoerceToCanonicalValue</a>. Additionally, if the string form of a value is needed for UI purposes, <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psformatfordisplay">PSFormatForDisplay</a> should be used to format the value according to locale- and property-specific information rather than using <a href="https://docs.microsoft.com/windows/desktop/api/propvarutil/nf-propvarutil-propvariantchangetype">PropVariantChangeType</a> to coerce the value to a string.
     * @param {Pointer<PROPVARIANT>} ppropvarDest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that, when this function returns successfully, receives the coerced value and its new type.
     * @param {Pointer<PROPVARIANT>} propvarSrc Type: <b>REFPROPVARIANT</b>
     * 
     * A reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the value expressed as its original type.
     * @param {Integer} flags Type: <b>PROPVAR_CHANGE_FLAGS</b>
     * 
     * Reserved, must be 0.
     * @param {Integer} vt Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms221127(v=vs.85)">VARTYPE</a></b>
     * 
     * Specifies the new type for the value. See the tables below for recognized type names.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or a standard COM error value otherwise. If the requested coercion is not possible, an error is returned.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvariantchangetype
     * @since windows5.1.2600
     */
    static PropVariantChangeType(ppropvarDest, propvarSrc, flags, vt) {
        result := DllCall("PROPSYS.dll\PropVariantChangeType", "ptr", ppropvarDest, "ptr", propvarSrc, "int", flags, "ushort", vt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts the contents of a PROPVARIANT structure to a VARIANT structure.
     * @remarks
     * Normally, the data stored in the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> is copied to the <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> without a datatype change. However, in the following cases, there is no direct <b>VARIANT</b> support for the datatype, and they are converted as shown.
     *                 
     *                 
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Original <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> Type</th>
     * <th>Stored as <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> Type</th>
     * </tr>
     * <tr>
     * <td>VT_BLOB, VT_STREAM</td>
     * <td>VT_UNKNOWN. The <b>punkVal</b> member will contain a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that contains the source data.</td>
     * </tr>
     * <tr>
     * <td>VT_LPSTR, VT_LPWSTR, VT_CLSID</td>
     * <td>VT_BSTR</td>
     * </tr>
     * <tr>
     * <td>VT_FILETIME</td>
     * <td>VT_DATE</td>
     * </tr>
     * <tr>
     * <td>VT_VECTOR|x</td>
     * <td>VT_ARRAY|y</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The following types cannot be converted with this function.
     *             
     *                 
     * 
     * <ul>
     * <li>VT_STORAGE</li>
     * <li>VT_BLOB_OBJECT</li>
     * <li>VT_STREAMED_OBJECT</li>
     * <li>VT_STORED_OBJECT</li>
     * <li>VT_CF</li>
     * <li>VT_VECTOR | VT_CF</li>
     * </ul>
     * @param {Pointer<PROPVARIANT>} pPropVar Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<VARIANT>} pVar Type: <b>VARIANT*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure. When this function returns, the <b>VARIANT</b> contains the converted information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttovariant
     * @since windows6.0.6000
     */
    static PropVariantToVariant(pPropVar, pVar) {
        result := DllCall("PROPSYS.dll\PropVariantToVariant", "ptr", pPropVar, "ptr", pVar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Copies the contents of a VARIANT structure to a PROPVARIANT structure.
     * @remarks
     * The following cannot be handled by this function.
     *                 
     *                 
     * 
     * <ul>
     * <li>VT_BYREF | VT_DATE</li>
     * <li>VT_BYREF | VT_BSTR</li>
     * <li>VT_BYREF | VT_UNKNOWN</li>
     * </ul>
     * @param {Pointer<VARIANT>} pVar Type: <b>const VARIANT*</b>
     * 
     * Pointer to a source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @param {Pointer<PROPVARIANT>} pPropVar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure. When this function returns, the <b>PROPVARIANT</b> contains the converted information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-varianttopropvariant
     * @since windows6.0.6000
     */
    static VariantToPropVariant(pVar, pPropVar) {
        result := DllCall("PROPSYS.dll\VariantToPropVariant", "ptr", pVar, "ptr", pPropVar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The StgSerializePropVariant function converts a PROPVARIANT data type to a SERIALIZEDPROPERTYVALUE data type.
     * @remarks
     * The 
     *  <b>StgSerializePropVariant</b> function serializes a <b>PROPVARIANT</b>.  The function is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-stgconvertvarianttoproperty">StgConvertVariantToProperty</a> function, but   the <b>StgSerializePropVariant</b> function automatically handles memory allocation for the new <b>SERIALIZEDPROPERTYVALUE</b>.  In addition, <b>StgSerializePropVariant</b> uses the default values <b>CP_WINUNICODE</b> and PID_ILLEGAL for code page and property ID respectively.  Use <b>StgSerializePropVariant</b> unless control over these arguments is specifically needed.
     * @param {Pointer<PROPVARIANT>} ppropvar A pointer to <b>PROPVARIANT</b>.
     * @param {Pointer<SERIALIZEDPROPERTYVALUE>} ppProp A pointer to the newly allocated  <b>SERIALIZEDPROPERTYVALUE</b>.
     * @param {Pointer<UInt32>} pcb A pointer to the size of the newly allocated  <b>SERIALIZEDPROPERTYVALUE</b>.
     * @returns {HRESULT} This function can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-stgserializepropvariant
     * @since windows5.0
     */
    static StgSerializePropVariant(ppropvar, ppProp, pcb) {
        result := DllCall("PROPSYS.dll\StgSerializePropVariant", "ptr", ppropvar, "ptr", ppProp, "uint*", pcb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The StgDeserializePropVariant function converts a SERIALIZEDPROPERTYVALUE data type to a PROPVARIANT data type.
     * @remarks
     * This function deserializes a <b>PROPVARIANT</b> data type. This function is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-stgconvertpropertytovariant">StgConvertPropertyToVariant</a> function. The <b>StgDeserializePropVariant</b> function uses the default value of <b>CP_WINUNICODE</b> for the code page and a system provided allocator that uses task memory.  Use <b>StgDeserializePropVariant</b> unless you want to specify which code page and memory allocator to use.
     * @param {Pointer<SERIALIZEDPROPERTYVALUE>} pprop A pointer to the  <b>SERIALIZEDPROPERTYVALUE</b> buffer.
     * @param {Integer} cbMax The size of the <i>pprop</i> buffer in bytes.
     * @param {Pointer<PROPVARIANT>} ppropvar A pointer to a <b>PROPVARIANT</b>.
     * @returns {HRESULT} This function can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-stgdeserializepropvariant
     * @since windows5.0
     */
    static StgDeserializePropVariant(pprop, cbMax, ppropvar) {
        result := DllCall("PROPSYS.dll\StgDeserializePropVariant", "ptr", pprop, "uint", cbMax, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
