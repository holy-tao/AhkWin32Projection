#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include .\IStorage.ahk
#Include .\IFillLockBytes.ahk
#Include ..\IStream.ahk
#Include .\IPropertyStorage.ahk
#Include .\IPropertySetStorage.ahk
#Include .\ILockBytes.ahk

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
     * @param {Pointer<COSERVERINFO>} pServerInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a> structure that specifies the computer on which to instantiate the object and the authentication setting to be used. This parameter can be <b>NULL</b>, in which case the object is instantiated on the current computer, at the computer specified under the <a href="https://docs.microsoft.com/windows/desktop/com/remoteservername">RemoteServerName</a> registry value for the class, or at the computer where the <i>pwszName</i> file resides if the <a href="https://docs.microsoft.com/windows/desktop/com/activateatstorage">ActivateAtStorage</a> value is specified for the class or there is no local registry information.
     * @param {Pointer<Guid>} pClsid A pointer to the class identifier of the object to be created. This parameter can be <b>NULL</b>, in which case there is a call to <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-getclassfile">GetClassFile</a>, using <i>pwszName</i> as its parameter to get the class of the object to be instantiated.
     * @param {IUnknown} punkOuter When non-<b>NULL</b>, indicates the instance is being created as part of an aggregate, and <i>punkOuter</i> is to be used as the pointer to the new instance's controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. Aggregation is not supported cross-process or cross-computer. When instantiating an object out of process, CLASS_E_NOAGGREGATION will be returned if <i>punkOuter</i> is non-<b>NULL</b>.
     * @param {Integer} dwClsCtx Values from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration.
     * @param {Integer} grfMode Specifies how the file is to be opened. See <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>.
     * @param {PWSTR} pwszName The file used to initialize the object with <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-load">IPersistFile::Load</a>. This parameter cannot be <b>NULL</b>.
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
     * At least one, but not all of the interfaces requested in the <i>pResults</i> array were successfully retrieved. The <b>hr</b> member of each of the <a href="/windows/desktop/api/objidl/ns-objidl-multi_qi">MULTI_QI</a> structures indicates with S_OK or E_NOINTERFACE whether the specific interface was returned.
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
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-cogetinstancefromfile
     * @since windows5.0
     */
    static CoGetInstanceFromFile(pServerInfo, pClsid, punkOuter, dwClsCtx, grfMode, pwszName, dwCount, pResults) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := DllCall("OLE32.dll\CoGetInstanceFromFile", "ptr", pServerInfo, "ptr", pClsid, "ptr", punkOuter, "uint", dwClsCtx, "uint", grfMode, "ptr", pwszName, "uint", dwCount, "ptr", pResults, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a new object and initializes it from a storage object through an internal call to IPersistFile::Load.
     * @param {Pointer<COSERVERINFO>} pServerInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a> structure that specifies the computer on which to instantiate the object and the authentication setting to be used. This parameter can be <b>NULL</b>, in which case the object is instantiated on the current computer, at the computer specified under the <a href="https://docs.microsoft.com/windows/desktop/com/remoteservername">RemoteServerName</a> registry value for the class, or at the computer where the <i>pstg</i> storage object resides if the <a href="https://docs.microsoft.com/windows/desktop/com/activateatstorage">ActivateAtStorage</a> value is specified for the class or there is no local registry information.
     * @param {Pointer<Guid>} pClsid A pointer to the class identifier of the object to be created. This parameter can be <b>NULL</b>, in which case there is a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-stat">IStorage::Stat</a> to find the class of the object.
     * @param {IUnknown} punkOuter When non-<b>NULL</b>, indicates the instance is being created as part of an aggregate, and <i>punkOuter</i> is to be used as the pointer to the new instance's controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. Aggregation is not supported cross-process or cross-computer. When instantiating an object out of process, CLASS_E_NOAGGREGATION will be returned if <i>punkOuter</i> is non-<b>NULL</b>.
     * @param {Integer} dwClsCtx Values from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration.
     * @param {IStorage} pstg A pointer to the storage object used to initialize the object with <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-load">IPersistFile::Load</a>. This parameter cannot be <b>NULL</b>.
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
     * At least one, but not all of the interfaces requested in the <i>pResults</i> array were successfully retrieved. The <b>hr</b> member of each of the <a href="/windows/desktop/api/objidl/ns-objidl-multi_qi">MULTI_QI</a> structures indicates with S_OK or E_NOINTERFACE whether the specific interface was returned.
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
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-cogetinstancefromistorage
     * @since windows5.0
     */
    static CoGetInstanceFromIStorage(pServerInfo, pClsid, punkOuter, dwClsCtx, pstg, dwCount, pResults) {
        result := DllCall("OLE32.dll\CoGetInstanceFromIStorage", "ptr", pServerInfo, "ptr", pClsid, "ptr", punkOuter, "uint", dwClsCtx, "ptr", pstg, "uint", dwCount, "ptr", pResults, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Opens an existing root asynchronous storage object on a byte-array wrapper object provided by the caller.
     * @param {IFillLockBytes} pflb A <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ifilllockbytes">IFillLockBytes</a> pointer to the byte-array wrapper object that contains the storage object to be opened.
     * @param {Integer} grfMode A value that specifies the access mode to use to open the storage object. The most common access mode, taken from <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>, is STGM_READ.
     * @param {Integer} asyncFlags A value that indicates whether a connection point on a storage is inherited by its substorages and streams. ASYNC_MODE_COMPATIBILITY indicates that the connection point is inherited; ASYNC_MODE_DEFAULT indicates that the connection point is not inherited.
     * @returns {IStorage} A pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a>* pointer variable that receives the interface pointer to the root asynchronous storage object.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-stgopenasyncdocfileonifilllockbytes
     */
    static StgOpenAsyncDocfileOnIFillLockBytes(pflb, grfMode, asyncFlags) {
        result := DllCall("ole32.dll\StgOpenAsyncDocfileOnIFillLockBytes", "ptr", pflb, "uint", grfMode, "uint", asyncFlags, "ptr*", &ppstgOpen := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorage(ppstgOpen)
    }

    /**
     * Creates a new wrapper object on a byte array object provided by the caller.
     * @param {ILockBytes} pilb Pointer to an existing byte array object.
     * @returns {IFillLockBytes} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ifilllockbytes">IFillLockBytes</a> pointer variable that receives the interface pointer to the new byte array wrapper object.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-stggetifilllockbytesonilockbytes
     */
    static StgGetIFillLockBytesOnILockBytes(pilb) {
        result := DllCall("ole32.dll\StgGetIFillLockBytesOnILockBytes", "ptr", pilb, "ptr*", &ppflb := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFillLockBytes(ppflb)
    }

    /**
     * Opens a wrapper object on a temporary file.
     * @param {PWSTR} pwcsName A pointer to the null-terminated unicode string name of the file for which a wrapper object is created.
     * @returns {IFillLockBytes} A pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ifilllockbytes">IFillLockBytes</a>* pointer variable that receives the interface pointer to the new byte array wrapper object.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-stggetifilllockbytesonfile
     */
    static StgGetIFillLockBytesOnFile(pwcsName) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        result := DllCall("ole32.dll\StgGetIFillLockBytesOnFile", "ptr", pwcsName, "ptr*", &ppflb := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFillLockBytes(ppflb)
    }

    /**
     * Opens a compound file on an ILockBytes implementation that is capable of monitoring sector data.
     * @param {PWSTR} pwcsDfName A pointer to the null-terminated Unicode string name of the compound file to be opened.
     * @param {Integer} grfMode Access mode to use when opening the newly created storage object. Values are taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>. Be aware that priority mode and exclusions are not supported. The most common access mode is likely to be STGM_DIRECT | STGM_READ | STGM_SHARE_EXCLUSIVE.
     * @param {Integer} reserved Reserved for future use.
     * @returns {IStorage} A pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer variable that receives the interface pointer to the root object of the newly created root storage object.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-stgopenlayoutdocfile
     */
    static StgOpenLayoutDocfile(pwcsDfName, grfMode, reserved) {
        pwcsDfName := pwcsDfName is String ? StrPtr(pwcsDfName) : pwcsDfName

        result := DllCall("dflayout.dll\StgOpenLayoutDocfile", "ptr", pwcsDfName, "uint", grfMode, "uint", reserved, "ptr*", &ppstgOpen := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorage(ppstgOpen)
    }

    /**
     * Creates a stream object that uses an HGLOBAL memory handle to store the stream contents.
     * @param {HGLOBAL} hGlobal A memory handle allocated by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> function, or if <b>NULL</b> a new handle is to be allocated instead. The handle must be allocated as moveable and nondiscardable.
     * @param {BOOL} fDeleteOnRelease A value that indicates whether the underlying handle for this stream object should be automatically freed when the stream object is released. If set to <b>FALSE</b>, the caller must free the <i>hGlobal</i> after the final release. If set to <b>TRUE</b>, the final release will automatically free the underlying handle. See the Remarks for further discussion of the case where <i>fDeleteOnRelease</i> is <b>FALSE</b>.
     * @returns {IStream} The address of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>* pointer variable that receives the interface pointer to the new stream object. Its value cannot be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-createstreamonhglobal
     * @since windows5.0
     */
    static CreateStreamOnHGlobal(hGlobal, fDeleteOnRelease) {
        hGlobal := hGlobal is Win32Handle ? NumGet(hGlobal, "ptr") : hGlobal

        result := DllCall("OLE32.dll\CreateStreamOnHGlobal", "ptr", hGlobal, "int", fDeleteOnRelease, "ptr*", &ppstm := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStream(ppstm)
    }

    /**
     * The GetHGlobalFromStream function retrieves the global memory handle to a stream that was created through a call to the CreateStreamOnHGlobal function.
     * @param {IStream} pstm <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> pointer to the stream object previously created by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-createstreamonhglobal">CreateStreamOnHGlobal</a> function.
     * @param {Pointer<HGLOBAL>} phglobal Pointer to the current memory handle used by the specified stream object.
     * @returns {HRESULT} This function returns HRESULT.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-gethglobalfromstream
     * @since windows5.0
     */
    static GetHGlobalFromStream(pstm, phglobal) {
        result := DllCall("OLE32.dll\GetHGlobalFromStream", "ptr", pstm, "ptr", phglobal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Unmarshals a buffer containing an interface pointer and releases the stream when an interface pointer has been marshaled from another thread to the calling thread.
     * @param {IStream} pStm A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface on the stream to be unmarshaled.
     * @param {Pointer<Guid>} iid A reference to the identifier of the interface requested from the unmarshaled object.
     * @returns {Pointer<Void>} The address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppv</i> contains the requested interface pointer to the unmarshaled interface.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cogetinterfaceandreleasestream
     * @since windows5.0
     */
    static CoGetInterfaceAndReleaseStream(pStm, iid) {
        result := DllCall("OLE32.dll\CoGetInterfaceAndReleaseStream", "ptr", pStm, "ptr", iid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * The PropVariantCopy function copies the contents of one PROPVARIANT structure to another.
     * @param {Pointer<PROPVARIANT>} pvarDest Pointer to an uninitialized 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that receives the copy.
     * @param {Pointer<PROPVARIANT>} pvarSrc Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure to be copied.
     * @returns {HRESULT} This function returns HRESULT.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-propvariantcopy
     * @since windows5.0
     */
    static PropVariantCopy(pvarDest, pvarSrc) {
        result := DllCall("OLE32.dll\PropVariantCopy", "ptr", pvarDest, "ptr", pvarSrc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Frees all elements that can be freed in a given PROPVARIANT structure.
     * @param {Pointer<PROPVARIANT>} pvar A pointer to an initialized 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure for which any deallocatable elements are to be freed. On return, all zeroes are written to the 
     * <b>PROPVARIANT</b> structure.
     * @returns {HRESULT} This function returns HRESULT.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-propvariantclear
     * @since windows5.0
     */
    static PropVariantClear(pvar) {
        result := DllCall("OLE32.dll\PropVariantClear", "ptr", pvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The FreePropVariantArray function calls PropVariantClear on each of the PROPVARIANT structures in the rgvars array to make the value zero for each of the members of the array.
     * @param {Integer} cVariants Count of elements in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> array (<i>rgvars</i>).
     * @param {Pointer<PROPVARIANT>} rgvars Pointer to an initialized array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures for which any deallocatable elements are to be freed. On exit, all zeroes are written to the 
     * <b>PROPVARIANT</b> structure (thus tagging them as VT_EMPTY).
     * @returns {HRESULT} This function returns HRESULT.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-freepropvariantarray
     * @since windows5.0
     */
    static FreePropVariantArray(cVariants, rgvars) {
        result := DllCall("OLE32.dll\FreePropVariantArray", "uint", cVariants, "ptr", rgvars, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a new compound file storage object using the COM-provided compound file implementation for the IStorage interface.
     * @param {PWSTR} pwcsName A pointer to a null-terminated Unicode string name for the compound file being created. It is passed uninterpreted to the file system. This can be a relative name or <b>NULL</b>. If <b>NULL</b>, a temporary compound file is allocated with a unique name.
     * @param {Integer} grfMode Specifies the access mode to use when opening the new storage object. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a>. If the caller specifies transacted mode together with STGM_CREATE or STGM_CONVERT, the overwrite or conversion takes place when the commit operation is called for the root storage. If <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-commit">IStorage::Commit</a> is not called for the root storage object, previous contents of the file will be restored. STGM_CREATE and STGM_CONVERT cannot be combined with the STGM_NOSNAPSHOT flag, because a snapshot copy is required when a file is overwritten or converted in the transacted mode.
     * @returns {IStorage} A pointer to the location of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the new storage object.
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-stgcreatedocfile
     * @since windows5.0
     */
    static StgCreateDocfile(pwcsName, grfMode) {
        static reserved := 0 ;Reserved parameters must always be NULL

        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        result := DllCall("OLE32.dll\StgCreateDocfile", "ptr", pwcsName, "uint", grfMode, "uint", reserved, "ptr*", &ppstgOpen := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorage(ppstgOpen)
    }

    /**
     * Creates and opens a new compound file storage object on top of a byte-array object provided by the caller.
     * @param {ILockBytes} plkbyt A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> interface on the underlying byte-array object on which to create a compound file.
     * @param {Integer} grfMode Specifies the access mode to use when opening the new compound file. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a> and the Remarks section below.
     * @param {Integer} reserved Reserved for future use; must be zero.
     * @returns {IStorage} A pointer to the location of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer on the new storage object.
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-stgcreatedocfileonilockbytes
     * @since windows5.0
     */
    static StgCreateDocfileOnILockBytes(plkbyt, grfMode, reserved) {
        result := DllCall("OLE32.dll\StgCreateDocfileOnILockBytes", "ptr", plkbyt, "uint", grfMode, "uint", reserved, "ptr*", &ppstgOpen := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorage(ppstgOpen)
    }

    /**
     * Opens an existing root storage object in the file system.
     * @param {PWSTR} pwcsName A pointer to the path of the <b>null</b>-terminated Unicode string file that contains the storage object to open. This parameter is ignored if the <i>pstgPriority</i> parameter is not <b>NULL</b>.
     * @param {IStorage} pstgPriority A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface that should be <b>NULL</b>. If not <b>NULL</b>, this parameter is used as described below in the Remarks section.
     * 
     * After <b>StgOpenStorage</b> returns, the storage object specified in <i>pStgPriority</i> may have been released and should no longer be used.
     * @param {Integer} grfMode Specifies the access mode to use to open the storage object.
     * @param {Pointer<Pointer<Integer>>} snbExclude If not <b>NULL</b>, pointer to a block of elements in the storage to be excluded as the storage object is opened. The exclusion occurs regardless of whether a snapshot copy happens on the open. Can be <b>NULL</b>.
     * @param {Integer} reserved Indicates reserved for future use; must be zero.
     * @returns {IStorage} A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a>* pointer variable that receives the interface pointer to the opened storage.
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-stgopenstorage
     * @since windows5.0
     */
    static StgOpenStorage(pwcsName, pstgPriority, grfMode, snbExclude, reserved) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        snbExcludeMarshal := snbExclude is VarRef ? "ptr*" : "ptr"

        result := DllCall("OLE32.dll\StgOpenStorage", "ptr", pwcsName, "ptr", pstgPriority, "uint", grfMode, snbExcludeMarshal, snbExclude, "uint", reserved, "ptr*", &ppstgOpen := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorage(ppstgOpen)
    }

    /**
     * The StgOpenStorageOnILockBytes function opens an existing storage object that does not reside in a disk file, but instead has an underlying byte array provided by the caller.
     * @param {ILockBytes} plkbyt <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> pointer to the underlying byte array object that contains the storage object to be opened.
     * @param {IStorage} pstgPriority A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface that should be <b>NULL</b>. If not <b>NULL</b>, this parameter is used as described below in the Remarks section.
     * 
     * After <b>StgOpenStorageOnILockBytes</b> returns, the storage object specified in <i>pStgPriority</i> may have been released and should no longer be used.
     * @param {Integer} grfMode Specifies the access mode to use to open the storage object. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Stg/stgm-constants">STGM Constants</a> and the Remarks section below.
     * @param {Pointer<Pointer<Integer>>} snbExclude Can be <b>NULL</b>. If not <b>NULL</b>, this parameter points to a block of elements in this storage that are to be excluded as the storage object is opened. This exclusion occurs independently of whether a snapshot copy happens on the open.
     * @returns {IStorage} Points to the location of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the opened storage on successful return.
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-stgopenstorageonilockbytes
     * @since windows5.0
     */
    static StgOpenStorageOnILockBytes(plkbyt, pstgPriority, grfMode, snbExclude) {
        static reserved := 0 ;Reserved parameters must always be NULL

        snbExcludeMarshal := snbExclude is VarRef ? "ptr*" : "ptr"

        result := DllCall("OLE32.dll\StgOpenStorageOnILockBytes", "ptr", plkbyt, "ptr", pstgPriority, "uint", grfMode, snbExcludeMarshal, snbExclude, "uint", reserved, "ptr*", &ppstgOpen := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorage(ppstgOpen)
    }

    /**
     * The StgIsStorageFile function indicates whether a particular disk file contains a storage object.
     * @param {PWSTR} pwcsName Pointer to the null-terminated Unicode string name of the disk file to be examined. The <i>pwcsName</i> parameter is passed uninterpreted to the underlying file system.
     * @returns {HRESULT} <b>StgIsStorageFile</b> function can also return any file system errors or system errors wrapped in an <b>HRESULT</b>. See 
     * <a href="/windows/desktop/com/error-handling-strategies">Error Handling Strategies</a> and 
     * <a href="/windows/desktop/com/handling-unknown-errors">Handling Unknown Errors</a>
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-stgisstoragefile
     * @since windows5.0
     */
    static StgIsStorageFile(pwcsName) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        result := DllCall("OLE32.dll\StgIsStorageFile", "ptr", pwcsName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The StgIsStorageILockBytes function indicates whether the specified byte array contains a storage object.
     * @param {ILockBytes} plkbyt <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> pointer to the byte array to be examined.
     * @returns {HRESULT} This function can also return any file system errors, or system errors wrapped in an <b>HRESULT</b>, or 
     * <a href="/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> interface error return values. See 
     * <a href="/windows/desktop/com/error-handling-strategies">Error Handling Strategies</a> and 
     * <a href="/windows/desktop/com/handling-unknown-errors">Handling Unknown Errors</a>
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-stgisstorageilockbytes
     * @since windows5.0
     */
    static StgIsStorageILockBytes(plkbyt) {
        result := DllCall("OLE32.dll\StgIsStorageILockBytes", "ptr", plkbyt, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The StgSetTimes function sets the creation, access, and modification times of the indicated file, if supported by the underlying file system.
     * @param {PWSTR} lpszName Pointer to the name of the file to be changed.
     * @param {Pointer<FILETIME>} pctime Pointer to the new value for the creation time.
     * @param {Pointer<FILETIME>} patime Pointer to the new value for the access time.
     * @param {Pointer<FILETIME>} pmtime Pointer to the new value for the modification time.
     * @returns {HRESULT} The <b>StgSetTimes</b> function can also return any file system errors or system errors wrapped in an <b>HRESULT</b>. See 
     * <a href="/windows/desktop/com/error-handling-strategies">Error Handling Strategies</a> and 
     * <a href="/windows/desktop/com/handling-unknown-errors">Handling Unknown Errors</a>.
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-stgsettimes
     * @since windows5.0
     */
    static StgSetTimes(lpszName, pctime, patime, pmtime) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        result := DllCall("OLE32.dll\StgSetTimes", "ptr", lpszName, "ptr", pctime, "ptr", patime, "ptr", pmtime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a new storage object using a provided implementation for the IStorage or IPropertySetStorage interfaces.
     * @param {PWSTR} pwcsName A pointer to the path of the file to create. It is passed uninterpreted to the file system. This can be a relative name or <b>NULL</b>. If <b>NULL</b>, a temporary file is allocated with a unique name. If non-<b>NULL</b>, the string size must not exceed MAX_PATH characters. 
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
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor Enables the ACLs to be set when the file is created. If not <b>NULL</b>, needs to be a pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure. See <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> for information on how to set ACLs on files.
     * 
     * <b>Windows Server 2003, Windows 2000 Server, Windows XP and Windows 2000 Professional:  </b>Value must be <b>NULL</b>.
     * @param {Pointer<Guid>} riid A value that specifies the interface identifier (IID) of the interface pointer to return. This IID may be for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a> interface.
     * @returns {Pointer<Void>} A pointer to an interface pointer variable that receives a pointer for an interface on the new storage object; contains <b>NULL</b> if operation failed.
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-stgcreatestorageex
     * @since windows5.0
     */
    static StgCreateStorageEx(pwcsName, grfMode, stgfmt, grfAttrs, pStgOptions, pSecurityDescriptor, riid) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        result := DllCall("OLE32.dll\StgCreateStorageEx", "ptr", pwcsName, "uint", grfMode, "uint", stgfmt, "uint", grfAttrs, "ptr", pStgOptions, "ptr", pSecurityDescriptor, "ptr", riid, "ptr*", &ppObjectOpen := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppObjectOpen
    }

    /**
     * Opens an existing root storage object in the file system. Use this function to open Compound Files and regular files.
     * @param {PWSTR} pwcsName A pointer to the path of the null-terminated Unicode string file that contains the storage object. This string size cannot exceed <b>MAX_PATH</b> characters.
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
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor Reserved; must be zero.
     * @param {Pointer<Guid>} riid A value that specifies the GUID of the interface pointer to return. Can also be the header-specified value for <b>IID_IStorage</b> to obtain the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface or for <b>IID_IPropertySetStorage</b> to obtain the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a> interface.
     * @returns {Pointer<Void>} The address of an interface pointer variable that receives a pointer for an interface on the storage object opened; contains <b>NULL</b> if operation failed.
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-stgopenstorageex
     * @since windows5.0
     */
    static StgOpenStorageEx(pwcsName, grfMode, stgfmt, grfAttrs, pStgOptions, pSecurityDescriptor, riid) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        result := DllCall("OLE32.dll\StgOpenStorageEx", "ptr", pwcsName, "uint", grfMode, "uint", stgfmt, "uint", grfAttrs, "ptr", pStgOptions, "ptr", pSecurityDescriptor, "ptr", riid, "ptr*", &ppObjectOpen := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppObjectOpen
    }

    /**
     * Creates and opens a property set in a specified storage or stream object.
     * @param {IUnknown} pUnk A pointer to the <b>IUnknown</b> interface on the storage or stream object that stores the new property set.
     * @param {Pointer<Guid>} fmtid The FMTID of the property set to be created.
     * @param {Pointer<Guid>} pclsid A Pointer to the initial CLSID for this property set. May be <b>NULL</b>, in which case <i>pclsid</i> is set to all zeroes.
     * @param {Integer} grfFlags The values from <a href="https://docs.microsoft.com/windows/desktop/Stg/propsetflag-constants">PROPSETFLAG Constants</a> that determine how the property set is created and opened.
     * @returns {IPropertyStorage} The address of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a>* pointer variable that receives the interface pointer to the new property set.
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-stgcreatepropstg
     * @since windows5.0
     */
    static StgCreatePropStg(pUnk, fmtid, pclsid, grfFlags) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\StgCreatePropStg", "ptr", pUnk, "ptr", fmtid, "ptr", pclsid, "uint", grfFlags, "uint", dwReserved, "ptr*", &ppPropStg := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertyStorage(ppPropStg)
    }

    /**
     * Opens a specified property set in a specified storage or stream object.
     * @param {IUnknown} pUnk The interface pointer for <b>IUnknown</b> interface on the storage or stream object that contains the requested property set object.
     * @param {Pointer<Guid>} fmtid The FMTID of the property set to be opened.
     * @param {Integer} grfFlags The values from <a href="https://docs.microsoft.com/windows/desktop/Stg/propsetflag-constants">PROPSETFLAG Constants</a>.
     * @returns {IPropertyStorage} A pointer to 
     * an <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a>* pointer variable that receives the interface pointer to the requested property set.
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-stgopenpropstg
     * @since windows5.0
     */
    static StgOpenPropStg(pUnk, fmtid, grfFlags) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\StgOpenPropStg", "ptr", pUnk, "ptr", fmtid, "uint", grfFlags, "uint", dwReserved, "ptr*", &ppPropStg := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertyStorage(ppPropStg)
    }

    /**
     * Creates a property set storage object from a specified storage object.
     * @param {IStorage} pStorage A pointer to the storage object that contains or will contain one or more property sets.
     * @returns {IPropertySetStorage} A pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a>* pointer variable that receives the interface pointer to the property-set storage object.
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-stgcreatepropsetstg
     * @since windows5.0
     */
    static StgCreatePropSetStg(pStorage) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\StgCreatePropSetStg", "ptr", pStorage, "uint", dwReserved, "ptr*", &ppPropSetStg := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertySetStorage(ppPropSetStg)
    }

    /**
     * Converts a property set format identifier (FMTID) to its storage or stream name.
     * @param {Pointer<Guid>} pfmtid A pointer to the FMTID of the property set.
     * @param {PWSTR} oszName A pointer to a null-terminated string that receives the storage or stream name of the property set identified by <i>pfmtid</i>. The array allocated for this string must be at least CCH_MAX_PROPSTG_NAME (32) characters in length.
     * @returns {HRESULT} This function supports the standard return value E_INVALIDARG as well as the following:
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-fmtidtopropstgname
     * @since windows5.0
     */
    static FmtIdToPropStgName(pfmtid, oszName) {
        oszName := oszName is String ? StrPtr(oszName) : oszName

        result := DllCall("OLE32.dll\FmtIdToPropStgName", "ptr", pfmtid, "ptr", oszName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Converts a property set storage or stream name to its format identifier.
     * @param {PWSTR} oszName A pointer to a null-terminated Unicode string that contains the stream name of a simple property set or the storage name of a nonsimple property set.
     * @param {Pointer<Guid>} pfmtid A pointer to a FMTID variable that receives the format identifier of the property set specified by <i>oszName</i>.
     * @returns {HRESULT} This function supports the standard return value E_INVALIDARG as well as the following:
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-propstgnametofmtid
     * @since windows5.0
     */
    static PropStgNameToFmtId(oszName, pfmtid) {
        oszName := oszName is String ? StrPtr(oszName) : oszName

        result := DllCall("OLE32.dll\PropStgNameToFmtId", "ptr", oszName, "ptr", pfmtid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ReadClassStg function reads the CLSID previously written to a storage object with the WriteClassStg function.
     * @param {IStorage} pStg Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the storage object containing the CLSID to be retrieved.
     * @param {Pointer<Guid>} pclsid Pointer to where the CLSID is written. May return CLSID_NULL.
     * @returns {HRESULT} This function supports the standard return value E_OUTOFMEMORY, in addition to the following:
     * 
     * This function also returns any of the error values returned by the 
     * <a href="/windows/desktop/api/objidl/nf-objidl-istorage-stat">IStorage::Stat</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-readclassstg
     * @since windows5.0
     */
    static ReadClassStg(pStg, pclsid) {
        result := DllCall("OLE32.dll\ReadClassStg", "ptr", pStg, "ptr", pclsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The WriteClassStg function stores the specified class identifier (CLSID) in a storage object.
     * @param {IStorage} pStg <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the storage object that gets a new CLSID.
     * @param {Pointer<Guid>} rclsid Pointer to the CLSID to be stored with the object.
     * @returns {HRESULT} This function returns HRESULT.
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-writeclassstg
     * @since windows5.0
     */
    static WriteClassStg(pStg, rclsid) {
        result := DllCall("OLE32.dll\WriteClassStg", "ptr", pStg, "ptr", rclsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Reads the CLSID previously written to a stream object with the WriteClassStm function.
     * @param {IStream} pStm A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface on the stream object that contains the CLSID to be read. This CLSID must have been previously written to the stream object using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-writeclassstm">WriteClassStm</a>.
     * @param {Pointer<Guid>} pclsid A pointer to where the CLSID is to be written.
     * @returns {HRESULT} This function also returns any of the error values returned by the 
     * <a href="/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">ISequentialStream::Read</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-readclassstm
     * @since windows5.0
     */
    static ReadClassStm(pStm, pclsid) {
        result := DllCall("OLE32.dll\ReadClassStm", "ptr", pStm, "ptr", pclsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The WriteClassStm function stores the specified CLSID in the stream.
     * @param {IStream} pStm <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> pointer to the stream into which the CLSID is to be written.
     * @param {Pointer<Guid>} rclsid Specifies the CLSID to write to the stream.
     * @returns {HRESULT} This function returns HRESULT.
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-writeclassstm
     * @since windows5.0
     */
    static WriteClassStm(pStm, rclsid) {
        result := DllCall("OLE32.dll\WriteClassStm", "ptr", pStm, "ptr", rclsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetHGlobalFromILockBytes function retrieves a global memory handle to a byte array object created using the CreateILockBytesOnHGlobal function.
     * @param {ILockBytes} plkbyt Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> interface on the byte-array object previously created by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-createilockbytesonhglobal">CreateILockBytesOnHGlobal</a> function.
     * @param {Pointer<HGLOBAL>} phglobal Pointer to the current memory handle used by the specified byte-array object.
     * @returns {HRESULT} This function returns HRESULT.
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-gethglobalfromilockbytes
     * @since windows5.0
     */
    static GetHGlobalFromILockBytes(plkbyt, phglobal) {
        result := DllCall("OLE32.dll\GetHGlobalFromILockBytes", "ptr", plkbyt, "ptr", phglobal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a byte array object that uses an HGLOBAL memory handle to store the bytes intended for in-memory storage of a compound file.
     * @param {HGLOBAL} hGlobal A memory handle allocated by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> function, or if <b>NULL</b> a new handle is to be allocated instead. The handle must be allocated as moveable and nondiscardable.
     * @param {BOOL} fDeleteOnRelease A flag  that specifies whether the underlying handle for this byte array object should be automatically freed when the object is released. If set to <b>FALSE</b>, the caller must free the <i>hGlobal</i> after the final release. If set to <b>TRUE</b>, the final release will automatically free the <i>hGlobal</i> parameter.
     * @returns {ILockBytes} The address of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> pointer variable that receives the interface pointer to the new byte array object.
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-createilockbytesonhglobal
     * @since windows5.0
     */
    static CreateILockBytesOnHGlobal(hGlobal, fDeleteOnRelease) {
        hGlobal := hGlobal is Win32Handle ? NumGet(hGlobal, "ptr") : hGlobal

        result := DllCall("OLE32.dll\CreateILockBytesOnHGlobal", "ptr", hGlobal, "int", fDeleteOnRelease, "ptr*", &pplkbyt := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ILockBytes(pplkbyt)
    }

    /**
     * The GetConvertStg function returns the current value of the convert bit for the specified storage object.
     * @param {IStorage} pStg <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the storage object from which the convert bit is to be retrieved.
     * @returns {HRESULT} <a href="/windows/desktop/api/objidl/nf-objidl-istorage-openstream">IStorage::OpenStream</a>, 
     * <a href="/windows/desktop/api/objidl/nf-objidl-istorage-openstorage">IStorage::OpenStorage</a>, and 
     * <a href="/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">ISequentialStream::Read</a> storage and stream access errors.
     * @see https://docs.microsoft.com/windows/win32/api//coml2api/nf-coml2api-getconvertstg
     * @since windows5.0
     */
    static GetConvertStg(pStg) {
        result := DllCall("OLE32.dll\GetConvertStg", "ptr", pStg, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Converts a PROPVARIANT data type to a SERIALIZEDPROPERTYVALUE data type.
     * @param {Pointer<PROPVARIANT>} pvar A  pointer to <b>PROPVARIANT</b>.
     * @param {Integer} CodePage A property set codepage.
     * @param {Pointer} pprop Optional. A pointer to <b>SERIALIZEDPROPERTYVALUE</b>.
     * @param {Pointer<Integer>} pcb A pointer to the remaining stream length, updated to the actual property size on return.
     * @param {Integer} pid The propid (used if indirect).
     * @param {Pointer<Integer>} pcIndirect Optional. A pointer to the indirect property count.
     * @returns {Pointer<SERIALIZEDPROPERTYVALUE>} Returns a pointer to <b>SERIALIZEDPROPERTYVALUE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//propidl/nf-propidl-stgconvertvarianttoproperty
     * @since windows5.0
     */
    static StgConvertVariantToProperty(pvar, CodePage, pprop, pcb, pid, pcIndirect) {
        static fReserved := 0 ;Reserved parameters must always be NULL

        pcbMarshal := pcb is VarRef ? "uint*" : "ptr"
        pcIndirectMarshal := pcIndirect is VarRef ? "uint*" : "ptr"

        result := DllCall("ole32.dll\StgConvertVariantToProperty", "ptr", pvar, "ushort", CodePage, "ptr", pprop, pcbMarshal, pcb, "uint", pid, "char", fReserved, pcIndirectMarshal, pcIndirect, "ptr")
        return result
    }

    /**
     * Converts a SERIALIZEDPROPERTYVALUE data type to a PROPVARIANT data type.
     * @param {Pointer<SERIALIZEDPROPERTYVALUE>} pprop A pointer to <b>SERIALIZEDPROPERTYVALUE</b>.
     * @param {Integer} CodePage A property set codepage.
     * @param {Pointer<PROPVARIANT>} pvar A pointer to <b>PROPVARIANT</b>.
     * @param {IMemoryAllocator} pma A pointer to a class that implements the <a href="https://docs.microsoft.com/windows/desktop/Stg/imemoryallocator">IMemoryAllocator</a> abstract class.
     * @returns {BOOLEAN} Returns <b>TRUE</b> is the property converted was an indirect type (<b>VT_STREAM</b> or <b>VT_STREAMED_OBJECT</b>); otherwise <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//propidl/nf-propidl-stgconvertpropertytovariant
     * @since windows5.0
     */
    static StgConvertPropertyToVariant(pprop, CodePage, pvar, pma) {
        result := DllCall("ole32.dll\StgConvertPropertyToVariant", "ptr", pprop, "ushort", CodePage, "ptr", pvar, "ptr", pma, "char")
        return result
    }

    /**
     * The StgPropertyLengthAsVariant function examines a SERIALIZEDPROPERTYVALUE and returns the amount of memory that this property would occupy as a PROPVARIANT.
     * @param {Pointer} pProp A pointer to a <b>SERIALIZEDPROPERTYVALUE</b>.
     * @param {Integer} cbProp The size of the <i>pProp</i> buffer in bytes.
     * @param {Integer} CodePage A property set code page.
     * @returns {Integer} Returns the amount of memory the property would occupy as a <b>PROPVARIANT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//propapi/nf-propapi-stgpropertylengthasvariant
     * @since windows5.0
     */
    static StgPropertyLengthAsVariant(pProp, cbProp, CodePage) {
        static bReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("ole32.dll\StgPropertyLengthAsVariant", "ptr", pProp, "uint", cbProp, "ushort", CodePage, "char", bReserved, "uint")
        return result
    }

    /**
     * The WriteFmtUserTypeStg function writes a clipboard format and user type to the storage object.
     * @param {IStorage} pstg <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the storage object where the information is to be written.
     * @param {Integer} cf Specifies the clipboard format that describes the structure of the native area of the storage object. The format tag includes the policy for the names of streams and substorages within this storage object and the rules for interpreting data within those streams.
     * @param {PWSTR} lpszUserType Pointer to a null-terminated Unicode string that specifies the object's current user type. The user type value, itself, cannot be <b>NULL</b>. This is the type returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-getusertype">IOleObject::GetUserType</a> method. If this function is transported to a remote machine where the object class does not exist, this persistently stored user type can be shown to the user in dialog boxes.
     * @returns {HRESULT} This function returns HRESULT.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-writefmtusertypestg
     * @since windows5.0
     */
    static WriteFmtUserTypeStg(pstg, cf, lpszUserType) {
        lpszUserType := lpszUserType is String ? StrPtr(lpszUserType) : lpszUserType

        result := DllCall("OLE32.dll\WriteFmtUserTypeStg", "ptr", pstg, "ushort", cf, "ptr", lpszUserType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ReadFmtUserTypeStg function returns the clipboard format and user type previously saved with the WriteFmtUserTypeStg function.
     * @param {IStorage} pstg Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the storage object from which the information is to be read.
     * @param {Pointer<Integer>} pcf Pointer to where the clipboard format is to be written on return. It can be <b>NULL</b>, indicating the format is of no interest to the caller.
     * @param {Pointer<PWSTR>} lplpszUserType Address of <b>LPWSTR</b> pointer variable that receives a pointer to the null-terminated Unicode user-type string. The caller can specify <b>NULL</b> for this parameter, which indicates that the user type is of no interest. This function allocates memory for the string. The caller is responsible for freeing the memory with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {HRESULT} This function supports the standard return values E_FAIL, E_INVALIDARG, and E_OUTOFMEMORY, in addition to the following:
     * 
     * This function also returns any of the error values returned by the 
     * <a href="/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">ISequentialStream::Read</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-readfmtusertypestg
     * @since windows5.0
     */
    static ReadFmtUserTypeStg(pstg, pcf, lplpszUserType) {
        pcfMarshal := pcf is VarRef ? "ushort*" : "ptr"
        lplpszUserTypeMarshal := lplpszUserType is VarRef ? "ptr*" : "ptr"

        result := DllCall("OLE32.dll\ReadFmtUserTypeStg", "ptr", pstg, pcfMarshal, pcf, lplpszUserTypeMarshal, lplpszUserType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Converts the specified object from the OLE 1 storage model to an OLE 2 structured storage object without specifying presentation data.
     * @param {Pointer<OLESTREAM>} lpolestream A pointer to a stream that contains the persistent representation of the object in the OLE 1 storage format.
     * @param {IStorage} pstg A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the OLE 2 structured storage object.
     * @param {Pointer<DVTARGETDEVICE>} ptd A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-dvtargetdevice">DVTARGETDEVICE</a> structure that specifies the target device for which the OLE 1 object is rendered.
     * @returns {HRESULT} This function supports the standard return value <b>E_INVALIDARG</b>, in addition to the following:
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-oleconvertolestreamtoistorage
     * @since windows5.0
     */
    static OleConvertOLESTREAMToIStorage(lpolestream, pstg, ptd) {
        result := DllCall("ole32.dll\OleConvertOLESTREAMToIStorage", "ptr", lpolestream, "ptr", pstg, "ptr", ptd, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The OleConvertIStorageToOLESTREAM function converts the specified storage object from OLE 2 structured storage to the OLE 1 storage object model but does not include the presentation data. This is one of several compatibility functions.
     * @param {IStorage} pstg Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the storage object to be converted to an OLE 1 storage.
     * @param {Pointer<OLESTREAM>} lpolestream Pointer to an OLE 1 stream structure where the persistent representation of the object is saved using the OLE 1 storage model.
     * @returns {HRESULT} This function supports the standard return value E_INVALIDARG, in addition to the following:
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-oleconvertistoragetoolestream
     * @since windows5.0
     */
    static OleConvertIStorageToOLESTREAM(pstg, lpolestream) {
        result := DllCall("ole32.dll\OleConvertIStorageToOLESTREAM", "ptr", pstg, "ptr", lpolestream, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetConvertStg function sets the convert bit in a storage object to indicate that the object is to be converted to a new class when it is opened. The setting can be retrieved with a call to the GetConvertStg function.
     * @param {IStorage} pStg <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to the storage object in which to set the conversion bit.
     * @param {BOOL} fConvert If <b>TRUE</b>, sets the conversion bit for the object to indicate the object is to be converted when opened. If <b>FALSE</b>, clears the conversion bit.
     * @returns {HRESULT} See the 
     * <a href="/windows/desktop/api/objidl/nf-objidl-istorage-createstream">IStorage::CreateStream</a>, 
     * <a href="/windows/desktop/api/objidl/nf-objidl-istorage-openstream">IStorage::OpenStream</a>, 
     * <a href="/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">ISequentialStream::Read</a>, and 
     * <a href="/windows/desktop/api/objidl/nf-objidl-isequentialstream-write">ISequentialStream::Write</a> methods for possible storage and stream access errors.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-setconvertstg
     * @since windows5.0
     */
    static SetConvertStg(pStg, fConvert) {
        result := DllCall("OLE32.dll\SetConvertStg", "ptr", pStg, "int", fConvert, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The OleConvertIStorageToOLESTREAMEx function converts the specified storage object from OLE 2 structured storage to the OLE 1 storage object model, including the presentation data.
     * @param {IStorage} pstg Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> interface on the storage object to be converted to an OLE 1 storage.
     * @param {Integer} cfFormat Format of the presentation data. May be <b>NULL</b>, in which case the <i>lWidth</i>, <i>lHeight</i>, <i>dwSize</i>, and <i>pmedium</i> parameters are ignored.
     * @param {Integer} lWidth Width of the object presentation data in HIMETRIC units.
     * @param {Integer} lHeight Height of the object presentation data in HIMETRIC units.
     * @param {Integer} dwSize Size of the data, in bytes, to be converted.
     * @param {Pointer<STGMEDIUM>} pmedium Pointer to the 
     * <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> structure for the serialized data to be converted.
     * @param {Pointer<OLESTREAM>} polestm Pointer to a stream where the persistent representation of the object is saved using the OLE 1 storage model.
     * @returns {HRESULT} This function supports the standard return value E_INVALIDARG, in addition to the following:
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-oleconvertistoragetoolestreamex
     * @since windows5.0
     */
    static OleConvertIStorageToOLESTREAMEx(pstg, cfFormat, lWidth, lHeight, dwSize, pmedium, polestm) {
        result := DllCall("ole32.dll\OleConvertIStorageToOLESTREAMEx", "ptr", pstg, "ushort", cfFormat, "int", lWidth, "int", lHeight, "uint", dwSize, "ptr", pmedium, "ptr", polestm, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The OleConvertOLESTREAMToIStorageEx function converts the specified object from the OLE 1 storage model to an OLE 2 structured storage object including presentation data. This is one of several compatibility functions.
     * @param {Pointer<OLESTREAM>} polestm Pointer to the stream that contains the persistent representation of the object in the OLE 1 storage format.
     * @param {IStorage} pstg Pointer to the OLE 2 structured storage object.
     * @param {Pointer<Integer>} pcfFormat Pointer to where the format of the presentation data is returned. May be <b>NULL</b>, indicating the absence of presentation data.
     * @param {Pointer<Integer>} plwWidth Pointer to where the width value (in HIMETRIC) of the presentation data is returned.
     * @param {Pointer<Integer>} plHeight Pointer to where the height value (in HIMETRIC) of the presentation data is returned.
     * @param {Pointer<Integer>} pdwSize Pointer to where the size in bytes of the converted data is returned.
     * @param {Pointer<STGMEDIUM>} pmedium Pointer to where the 
     * <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> structure for the converted serialized data is returned.
     * @returns {HRESULT} This function returns HRESULT.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-oleconvertolestreamtoistorageex
     * @since windows5.0
     */
    static OleConvertOLESTREAMToIStorageEx(polestm, pstg, pcfFormat, plwWidth, plHeight, pdwSize, pmedium) {
        pcfFormatMarshal := pcfFormat is VarRef ? "ushort*" : "ptr"
        plwWidthMarshal := plwWidth is VarRef ? "int*" : "ptr"
        plHeightMarshal := plHeight is VarRef ? "int*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := DllCall("ole32.dll\OleConvertOLESTREAMToIStorageEx", "ptr", polestm, "ptr", pstg, pcfFormatMarshal, pcfFormat, plwWidthMarshal, plwWidth, plHeightMarshal, plHeight, pdwSizeMarshal, pdwSize, "ptr", pmedium, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a Windows Runtime property value.
     * @param {Pointer<PROPVARIANT>} propvar Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Guid>} riid A reference to the IID of the interface to retrieve through <i>ppv</i>, typically IID_IPropertyValue (defined in Windows.Foundation.h).
     * @returns {Pointer<Void>} When this method returns successfully, contains the interface pointer requested in <i>riid</i>. This is typically an <a href="https://docs.microsoft.com/uwp/api/Windows.Foundation.IPropertyValue">IPropertyValue</a> pointer. If the call fails, this value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-propvarianttowinrtpropertyvalue
     * @since windows8.0
     */
    static PropVariantToWinRTPropertyValue(propvar, riid) {
        result := DllCall("PROPSYS.dll\PropVariantToWinRTPropertyValue", "ptr", propvar, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * Copies the content from a Windows runtime property value to a PROPVARIANT structure.
     * @param {IUnknown} punkPropertyValue A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface from which this function can access the contents of a Windows runtime property value by retrieving and using the <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nn-windows-foundation-ipropertyvalue">Windows::Foundation::IPropertyValue</a> interface.
     * @param {Pointer<PROPVARIANT>} ppropvar Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure. When this function returns, the <b>PROPVARIANT</b> contains the converted info.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-winrtpropertyvaluetopropvariant
     * @since windows8.0
     */
    static WinRTPropertyValueToPropVariant(punkPropertyValue, ppropvar) {
        result := DllCall("PROPSYS.dll\WinRTPropertyValueToPropVariant", "ptr", punkPropertyValue, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a string resource embedded in an executable file.
     * @param {HINSTANCE} hinst Type: <b>HINSTANCE</b>
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
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initpropvariantfromresource
     * @since windows5.1.2600
     */
    static InitPropVariantFromResource(hinst, id, ppropvar) {
        hinst := hinst is Win32Handle ? NumGet(hinst, "ptr") : hinst

        result := DllCall("PROPSYS.dll\InitPropVariantFromResource", "ptr", hinst, "uint", id, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a PROPVARIANT structure using the contents of a buffer.
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
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initpropvariantfrombuffer
     * @since windows5.1.2600
     */
    static InitPropVariantFromBuffer(pv, cb, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromBuffer", "ptr", pv, "uint", cb, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a class identifier (CLSID).
     * @param {Pointer<Guid>} clsid Type: <b>REFCLSID</b>
     * 
     * Reference to the CLSID.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initpropvariantfromclsid
     * @since windows5.1.2600
     */
    static InitPropVariantFromCLSID(clsid, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromCLSID", "ptr", clsid, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a GUID. The structure is initialized as VT_LPWSTR.
     * @param {Pointer<Guid>} guid Type: <b>REFGUID</b>
     * 
     * Reference to the source <b>GUID</b>.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initpropvariantfromguidasstring
     * @since windows5.1.2600
     */
    static InitPropVariantFromGUIDAsString(guid, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromGUIDAsString", "ptr", guid, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on information stored in a FILETIME structure.
     * @param {Pointer<FILETIME>} pftIn Type: <b>const FILETIME*</b>
     * 
     * Pointer to the date and time as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initpropvariantfromfiletime
     * @since windows5.1.2600
     */
    static InitPropVariantFromFileTime(pftIn, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromFileTime", "ptr", pftIn, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a specified PROPVARIANT vector element.
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
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initpropvariantfrompropvariantvectorelem
     * @since windows5.1.2600
     */
    static InitPropVariantFromPropVariantVectorElem(propvarIn, iElem, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromPropVariantVectorElem", "ptr", propvarIn, "uint", iElem, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a vector element in a PROPVARIANT structure with a value stored in another PROPVARIANT.
     * @param {Pointer<PROPVARIANT>} propvarSingle Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains a single value.
     * @param {Pointer<PROPVARIANT>} ppropvarVector Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initpropvariantvectorfrompropvariant
     * @since windows5.1.2600
     */
    static InitPropVariantVectorFromPropVariant(propvarSingle, ppropvarVector) {
        result := DllCall("PROPSYS.dll\InitPropVariantVectorFromPropVariant", "ptr", propvarSingle, "ptr", ppropvarVector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a PROPVARIANT structure from a specified Boolean vector.
     * @param {Pointer<BOOL>} prgf Type: <b>const BOOL*</b>
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
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initpropvariantfrombooleanvector
     * @since windows5.1.2600
     */
    static InitPropVariantFromBooleanVector(prgf, cElems, ppropvar) {
        prgfMarshal := prgf is VarRef ? "int*" : "ptr"

        result := DllCall("PROPSYS.dll\InitPropVariantFromBooleanVector", prgfMarshal, prgf, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a specified vector of 16-bit integer values.
     * @param {Pointer<Integer>} prgn Type: <b>const SHORT*</b>
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
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initpropvariantfromint16vector
     * @since windows5.1.2600
     */
    static InitPropVariantFromInt16Vector(prgn, cElems, ppropvar) {
        prgnMarshal := prgn is VarRef ? "short*" : "ptr"

        result := DllCall("PROPSYS.dll\InitPropVariantFromInt16Vector", prgnMarshal, prgn, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a vector of 16-bit unsigned integer values.
     * @param {Pointer<Integer>} prgn Type: <b>const USHORT*</b>
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
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initpropvariantfromuint16vector
     * @since windows5.1.2600
     */
    static InitPropVariantFromUInt16Vector(prgn, cElems, ppropvar) {
        prgnMarshal := prgn is VarRef ? "ushort*" : "ptr"

        result := DllCall("PROPSYS.dll\InitPropVariantFromUInt16Vector", prgnMarshal, prgn, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a vector of 32-bit integer values.
     * @param {Pointer<Integer>} prgn Type: <b>const LONG*</b>
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
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initpropvariantfromint32vector
     * @since windows5.1.2600
     */
    static InitPropVariantFromInt32Vector(prgn, cElems, ppropvar) {
        prgnMarshal := prgn is VarRef ? "int*" : "ptr"

        result := DllCall("PROPSYS.dll\InitPropVariantFromInt32Vector", prgnMarshal, prgn, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a vector of 32-bit unsigned integer values.
     * @param {Pointer<Integer>} prgn Type: <b>const ULONG*</b>
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
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initpropvariantfromuint32vector
     * @since windows5.1.2600
     */
    static InitPropVariantFromUInt32Vector(prgn, cElems, ppropvar) {
        prgnMarshal := prgn is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\InitPropVariantFromUInt32Vector", prgnMarshal, prgn, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a vector of Int64 values.
     * @param {Pointer<Integer>} prgn Type: <b>const LONGLONG*</b>
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
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initpropvariantfromint64vector
     * @since windows5.1.2600
     */
    static InitPropVariantFromInt64Vector(prgn, cElems, ppropvar) {
        prgnMarshal := prgn is VarRef ? "int64*" : "ptr"

        result := DllCall("PROPSYS.dll\InitPropVariantFromInt64Vector", prgnMarshal, prgn, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a vector of 64-bit unsigned integers.
     * @param {Pointer<Integer>} prgn Type: <b>const ULONGLONG*</b>
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
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initpropvariantfromuint64vector
     * @since windows5.1.2600
     */
    static InitPropVariantFromUInt64Vector(prgn, cElems, ppropvar) {
        prgnMarshal := prgn is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\InitPropVariantFromUInt64Vector", prgnMarshal, prgn, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a PROPVARIANT structure based on a specified vector of double values.
     * @param {Pointer<Float>} prgn Type: <b>const DOUBLE*</b>
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
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initpropvariantfromdoublevector
     * @since windows5.1.2600
     */
    static InitPropVariantFromDoubleVector(prgn, cElems, ppropvar) {
        prgnMarshal := prgn is VarRef ? "double*" : "ptr"

        result := DllCall("PROPSYS.dll\InitPropVariantFromDoubleVector", prgnMarshal, prgn, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a PROPVARIANT structure from a specified vector of FILETIME values.
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
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initpropvariantfromfiletimevector
     * @since windows5.1.2600
     */
    static InitPropVariantFromFileTimeVector(prgft, cElems, ppropvar) {
        result := DllCall("PROPSYS.dll\InitPropVariantFromFileTimeVector", "ptr", prgft, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a PROPVARIANT structure from a specified string vector.
     * @param {Pointer<PWSTR>} prgsz Type: <b>PCWSTR*</b>
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
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initpropvariantfromstringvector
     * @since windows5.1.2600
     */
    static InitPropVariantFromStringVector(prgsz, cElems, ppropvar) {
        prgszMarshal := prgsz is VarRef ? "ptr*" : "ptr"

        result := DllCall("PROPSYS.dll\InitPropVariantFromStringVector", prgszMarshal, prgsz, "uint", cElems, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a PROPVARIANT structure from a specified string. The string is parsed as a semi-colon delimited list (for example:\_&quot;A;B;C&quot;).
     * @param {PWSTR} psz Type: <b>PCWSTR</b>
     * 
     * Pointer to a buffer that contains the source Unicode string.
     * @param {Pointer<PROPVARIANT>} ppropvar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this function returns, contains the initialized <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-initpropvariantfromstringasvector
     * @since windows5.1.2600
     */
    static InitPropVariantFromStringAsVector(psz, ppropvar) {
        psz := psz is String ? StrPtr(psz) : psz

        result := DllCall("PROPSYS.dll\InitPropVariantFromStringAsVector", "ptr", psz, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts the Boolean property value of a PROPVARIANT structure. If no value exists, then the specified default value is returned.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {BOOL} fDefault Type: <b>BOOL</b>
     * 
     * Specifies the default property value, for use where no value currently exists.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * The extracted Boolean value or the default value.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttobooleanwithdefault
     * @since windows5.1.2600
     */
    static PropVariantToBooleanWithDefault(propvarIn, fDefault) {
        result := DllCall("PROPSYS.dll\PropVariantToBooleanWithDefault", "ptr", propvarIn, "int", fDefault, "int")
        return result
    }

    /**
     * Extracts the Int16 property value of a PROPVARIANT structure. If no value currently exists, then specified default value is returned.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iDefault Type: <b>SHORT</b>
     * 
     * Specifies default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>SHORT</b>
     * 
     * Returns the extracted <b>short</b> value, or default.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttoint16withdefault
     * @since windows5.1.2600
     */
    static PropVariantToInt16WithDefault(propvarIn, iDefault) {
        result := DllCall("PROPSYS.dll\PropVariantToInt16WithDefault", "ptr", propvarIn, "short", iDefault, "short")
        return result
    }

    /**
     * Extracts an unsigned short value from a PROPVARIANT structure. If no value exists, then the specified default value is returned.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} uiDefault Type: <b>USHORT</b>
     * 
     * Specifies a default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>unsigned short</b>
     * 
     * Returns extracted <b>unsigned short</b> value, or default.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttouint16withdefault
     * @since windows5.1.2600
     */
    static PropVariantToUInt16WithDefault(propvarIn, uiDefault) {
        result := DllCall("PROPSYS.dll\PropVariantToUInt16WithDefault", "ptr", propvarIn, "ushort", uiDefault, "ushort")
        return result
    }

    /**
     * Extracts an Int32 value from a PROPVARIANT structure. If no value currently exists, then the specified default value is returned.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} lDefault Type: <b>LONG</b>
     * 
     * Specifies a default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>LONG</b>
     * 
     * Returns extracted <b>LONG</b> value, or default.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttoint32withdefault
     * @since windows5.1.2600
     */
    static PropVariantToInt32WithDefault(propvarIn, lDefault) {
        result := DllCall("PROPSYS.dll\PropVariantToInt32WithDefault", "ptr", propvarIn, "int", lDefault, "int")
        return result
    }

    /**
     * Extracts a ULONG value from a PROPVARIANT structure. If no value exists, then a specified default value is returned.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} ulDefault Type: <b>ULONG</b>
     * 
     * Specifies a default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>ULONG</b>
     * 
     * Returns extracted <b>ULONG</b> value, or default.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttouint32withdefault
     * @since windows5.1.2600
     */
    static PropVariantToUInt32WithDefault(propvarIn, ulDefault) {
        result := DllCall("PROPSYS.dll\PropVariantToUInt32WithDefault", "ptr", propvarIn, "uint", ulDefault, "uint")
        return result
    }

    /**
     * Extracts the Int64 property value of a PROPVARIANT structure. If no value exists, then specified default value is returned.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} llDefault Type: <b>LONGLONG</b>
     * 
     * Specifies a default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>LONGLONG</b>
     * 
     * Returns the extracted <b>LONGLONG</b> value, or default.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttoint64withdefault
     * @since windows5.1.2600
     */
    static PropVariantToInt64WithDefault(propvarIn, llDefault) {
        result := DllCall("PROPSYS.dll\PropVariantToInt64WithDefault", "ptr", propvarIn, "int64", llDefault, "int64")
        return result
    }

    /**
     * Extracts ULONGLONG value from a PROPVARIANT structure. If no value exists, then the specified default value is returned.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} ullDefault Type: <b>ULONGLONG</b>
     * 
     * Specifies a default property value, for use where no value currently exists.
     * @returns {Integer} Type: <b>ULONGLONG</b>
     * 
     * Returns the extracted unsigned <b>LONGLONG</b> value, or a default.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttouint64withdefault
     * @since windows5.1.2600
     */
    static PropVariantToUInt64WithDefault(propvarIn, ullDefault) {
        result := DllCall("PROPSYS.dll\PropVariantToUInt64WithDefault", "ptr", propvarIn, "uint", ullDefault, "uint")
        return result
    }

    /**
     * Extracts a double property value of a PROPVARIANT structure. If no value exists, then the specified default value is returned.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Float} dblDefault Type: <b>DOUBLE</b>
     * 
     * Specifies default property value, for use where no value currently exists.
     * @returns {Float} Type: <b>DOUBLE</b>
     * 
     * Returns extracted <b>double</b> value, or default.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttodoublewithdefault
     * @since windows5.1.2600
     */
    static PropVariantToDoubleWithDefault(propvarIn, dblDefault) {
        result := DllCall("PROPSYS.dll\PropVariantToDoubleWithDefault", "ptr", propvarIn, "double", dblDefault, "double")
        return result
    }

    /**
     * Extracts the string property value of a PROPVARIANT structure. If no value exists, then the specified default value is returned.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {PWSTR} pszDefault Type: <b>LPCWSTR</b>
     * 
     * Pointer to a default Unicode string value, for use where no value currently exists. May be <b>NULL</b>.
     * @returns {PWSTR} Type: <b>PCWSTR</b>
     * 
     * Returns string value or default, or the default.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttostringwithdefault
     * @since windows5.1.2600
     */
    static PropVariantToStringWithDefault(propvarIn, pszDefault) {
        pszDefault := pszDefault is String ? StrPtr(pszDefault) : pszDefault

        result := DllCall("PROPSYS.dll\PropVariantToStringWithDefault", "ptr", propvarIn, "ptr", pszDefault, "ptr")
        return result
    }

    /**
     * Extracts a Boolean property value of a PROPVARIANT structure. If no value can be extracted, then a default value is assigned.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * When this function returns, contains the extracted property value if one exists; otherwise, contains <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttoboolean
     * @since windows5.1.2600
     */
    static PropVariantToBoolean(propvarIn) {
        result := DllCall("PROPSYS.dll\PropVariantToBoolean", "ptr", propvarIn, "int*", &pfRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfRet
    }

    /**
     * Extracts an Int16 property value of a PROPVARIANT structure.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {Integer} Type: <b>SHORT*</b>
     * 
     * When this function returns, contains the extracted property value if one exists; otherwise, 0.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttoint16
     * @since windows5.1.2600
     */
    static PropVariantToInt16(propvarIn) {
        result := DllCall("PROPSYS.dll\PropVariantToInt16", "ptr", propvarIn, "short*", &piRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return piRet
    }

    /**
     * Extracts a unsigned short value from a PROPVARIANT structure. If no value can be extracted, then a default value is assigned.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {Integer} Type: <b>USHORT*</b>
     * 
     * When this function returns, contains the extracted property value if one exists; otherwise, 0.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttouint16
     * @since windows5.1.2600
     */
    static PropVariantToUInt16(propvarIn) {
        result := DllCall("PROPSYS.dll\PropVariantToUInt16", "ptr", propvarIn, "ushort*", &puiRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puiRet
    }

    /**
     * Extracts the Int32 property value of a PROPVARIANT structure. If no value can be extracted, then a default value is assigned.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {Integer} Type: <b>LONG*</b>
     * 
     * When this function returns, contains the extracted value if one exists; otherwise, 0.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttoint32
     * @since windows5.1.2600
     */
    static PropVariantToInt32(propvarIn) {
        result := DllCall("PROPSYS.dll\PropVariantToInt32", "ptr", propvarIn, "int*", &plRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plRet
    }

    /**
     * Extracts an ULONG value from a PROPVARIANT structure. If no value can be extracted, then a default value is assigned.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * A reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the extracted property value if one exists; otherwise, 0.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttouint32
     * @since windows5.1.2600
     */
    static PropVariantToUInt32(propvarIn) {
        result := DllCall("PROPSYS.dll\PropVariantToUInt32", "ptr", propvarIn, "uint*", &pulRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulRet
    }

    /**
     * Extracts a LONGLONG value from a PROPVARIANT structure. If no value can be extracted, then a default value is assigned.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {Integer} Type: <b>LONGLONG*</b>
     * 
     * When this function returns, contains the extracted property value if one exists; otherwise, 0.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttoint64
     * @since windows5.1.2600
     */
    static PropVariantToInt64(propvarIn) {
        result := DllCall("PROPSYS.dll\PropVariantToInt64", "ptr", propvarIn, "int64*", &pllRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pllRet
    }

    /**
     * Extracts a UInt64 value from a PROPVARIANT structure. If no value can be extracted, then a default value is assigned.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {Integer} Type: <b>ULONGLONG*</b>
     * 
     * When this function returns, contains the extracted property value if one exists; otherwise, 0.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttouint64
     * @since windows5.1.2600
     */
    static PropVariantToUInt64(propvarIn) {
        result := DllCall("PROPSYS.dll\PropVariantToUInt64", "ptr", propvarIn, "uint*", &pullRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pullRet
    }

    /**
     * Extracts double value from a PROPVARIANT structure.
     * @param {Pointer<PROPVARIANT>} propvarIn Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {Float} Type: <b>DOUBLE*</b>
     * 
     * When this function returns, contains the extracted property value if one exists; otherwise, contains 0.0.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttodouble
     * @since windows5.1.2600
     */
    static PropVariantToDouble(propvarIn) {
        result := DllCall("PROPSYS.dll\PropVariantToDouble", "ptr", propvarIn, "double*", &pdblRet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdblRet
    }

    /**
     * Extracts the buffer value from a PROPVARIANT structure of type VT_VECTOR | VT_UI1 or VT_ARRRAY | VT_UI1.
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
     * The<a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>was of the wrong type.
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
     * The<a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>value had fewer than <i>cb</i> bytes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttobuffer
     * @since windows5.1.2600
     */
    static PropVariantToBuffer(propvar, pv, cb) {
        result := DllCall("PROPSYS.dll\PropVariantToBuffer", "ptr", propvar, "ptr", pv, "uint", cb, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts a string value from a PROPVARIANT structure.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {PWSTR} psz Type: <b>PWSTR</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttostring
     * @since windows5.1.2600
     */
    static PropVariantToString(propvar, psz, cch) {
        psz := psz is String ? StrPtr(psz) : psz

        result := DllCall("PROPSYS.dll\PropVariantToString", "ptr", propvar, "ptr", psz, "uint", cch, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts a GUID value from a PROPVARIANT structure.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Guid>} pguid Type: <b>GUID*</b>
     * 
     * When this function returns, contains the extracted property value if one exists.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttoguid
     * @since windows5.1.2600
     */
    static PropVariantToGUID(propvar, pguid) {
        result := DllCall("PROPSYS.dll\PropVariantToGUID", "ptr", propvar, "ptr", pguid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts a string property value from a PROPVARIANT structure.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {PWSTR} Type: <b>PWSTR*</b>
     * 
     * When this function returns, contains a pointer to the extracted property value if one exists.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttostringalloc
     * @since windows5.1.2600
     */
    static PropVariantToStringAlloc(propvar) {
        result := DllCall("PROPSYS.dll\PropVariantToStringAlloc", "ptr", propvar, "ptr*", &ppszOut := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszOut
    }

    /**
     * Extracts the BSTR property value of a PROPVARIANT structure.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<BSTR>} pbstrOut Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a>*</b>
     * 
     * Pointer to the extracted property value if one exists; otherwise, contains an empty string.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttobstr
     * @since windows5.1.2600
     */
    static PropVariantToBSTR(propvar, pbstrOut) {
        result := DllCall("PROPSYS.dll\PropVariantToBSTR", "ptr", propvar, "ptr", pbstrOut, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts the FILETIME structure from a PROPVARIANT structure.
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
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttofiletime
     * @since windows5.1.2600
     */
    static PropVariantToFileTime(propvar, pstfOut, pftOut) {
        result := DllCall("PROPSYS.dll\PropVariantToFileTime", "ptr", propvar, "int", pstfOut, "ptr", pftOut, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the element count of a PROPVARIANT structure.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {Integer} Type: <b>ULONG</b>
     * 
     * Returns the element count of a VT_VECTOR or VT_ARRAY value: for single values, returns 1; for empty structures, returns 0.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvariantgetelementcount
     * @since windows5.1.2600
     */
    static PropVariantGetElementCount(propvar) {
        result := DllCall("PROPSYS.dll\PropVariantGetElementCount", "ptr", propvar, "uint")
        return result
    }

    /**
     * Extracts a Boolean vector from a PROPVARIANT structure.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<BOOL>} prgf Type: <b>BOOL*</b>
     * 
     * Points to a buffer that contains <i>crgf</i> <b>BOOL</b> values. When this function returns, the buffer has been initialized with <i>pcElem</i> Boolean elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} crgf Type: <b>ULONG</b>
     * 
     * Number of elements in the buffer pointed to by <i>prgf</i>.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
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
     * The source <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> contained more than <i>crgf</i> values. The buffer pointed to by <i>prgf</i>.
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
     * The <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttobooleanvector
     * @since windows5.1.2600
     */
    static PropVariantToBooleanVector(propvar, prgf, crgf, pcElem) {
        prgfMarshal := prgf is VarRef ? "int*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToBooleanVector", "ptr", propvar, prgfMarshal, prgf, "uint", crgf, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts a vector of Int16 values from a PROPVARIANT structure.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Integer>} prgn Type: <b>SHORT*</b>
     * 
     *  Points to a buffer containing <i>crgn</i> SHORT values. When this function returns, the buffer has been initialized with <i>pcElem</i> SHORT elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Size of the buffer pointed to by <i>prgn</i> in elements.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
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
     * The source <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> contained more than <i>crgn</i> values. The buffer pointed to by <i>prgn</i>.
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
     * The<a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttoint16vector
     * @since windows5.1.2600
     */
    static PropVariantToInt16Vector(propvar, prgn, crgn, pcElem) {
        prgnMarshal := prgn is VarRef ? "short*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToInt16Vector", "ptr", propvar, prgnMarshal, prgn, "uint", crgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into an unsigned short vector.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Integer>} prgn Type: <b>USHORT*</b>
     * 
     * Points to a buffer containing <i>crgn</i> <b>unsigned short</b> values. When this function returns, the buffer has been initialized with <i>pcElem</i> <b>unsigned short</b> elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Size of the buffer pointed to by <i>prgn</i> in elements.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
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
     * The source <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> contained more than <i>crgn</i> values. The buffer pointed to by <i>prgn</i>.
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
     * The <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttouint16vector
     * @since windows5.1.2600
     */
    static PropVariantToUInt16Vector(propvar, prgn, crgn, pcElem) {
        prgnMarshal := prgn is VarRef ? "ushort*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToUInt16Vector", "ptr", propvar, prgnMarshal, prgn, "uint", crgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts a vector of long values from a PROPVARIANT structure.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Integer>} prgn Type: <b>LONG*</b>
     * 
     * Points to a buffer containing <i>crgn</i>   <b>LONG</b> values. When this function returns, the buffer has been initialized with <i>pcElem</i>   <b>LONG</b> elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Size of the buffer pointed to by <i>prgn</i> in elements.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
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
     * The source <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> contained more than crgn values. The buffer pointed to by <i>prgn</i>.
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
     * The <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttoint32vector
     * @since windows5.1.2600
     */
    static PropVariantToInt32Vector(propvar, prgn, crgn, pcElem) {
        prgnMarshal := prgn is VarRef ? "int*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToInt32Vector", "ptr", propvar, prgnMarshal, prgn, "uint", crgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into an ULONG vector.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Integer>} prgn Type: <b>ULONG*</b>
     * 
     * Points to a buffer containing <i>crgn</i>   <b>ULONG</b> values. When this function returns, the buffer has been initialized with <i>pcElem</i>   <b>ULONG</b> elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Size of the buffer pointed to by <i>prgn</i>, in elements.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
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
     * The source <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> contained more than <i>crgn</i> values. The buffer pointed to by <i>prgn</i> is too small.
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
     * The <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttouint32vector
     * @since windows5.1.2600
     */
    static PropVariantToUInt32Vector(propvar, prgn, crgn, pcElem) {
        prgnMarshal := prgn is VarRef ? "uint*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToUInt32Vector", "ptr", propvar, prgnMarshal, prgn, "uint", crgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into an Int64 vector.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Integer>} prgn Type: <b>LONGLONG*</b>
     * 
     * Points to a buffer containing <i>crgn</i>   <b>LONGLONG</b> values. When this function returns, the buffer has been initialized with <i>pcElem</i>  <b>LONGLONG</b> elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Size of the buffer pointed to by <i>prgn</i> in elements.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
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
     * The source <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> contained more than <i>crgn</i> values. The buffer pointed to by <i>prgn</i>.
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
     * The <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttoint64vector
     * @since windows5.1.2600
     */
    static PropVariantToInt64Vector(propvar, prgn, crgn, pcElem) {
        prgnMarshal := prgn is VarRef ? "int64*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToInt64Vector", "ptr", propvar, prgnMarshal, prgn, "uint", crgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a ULONGLONG vector.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Integer>} prgn Type: <b>ULONGLONG*</b>
     * 
     * Points to a buffer containing <i>crgn</i>   <b>ULONGLONG</b> values. When this function returns, the buffer has been initialized with <i>pcElem</i>   <b>ULONGLONG</b> elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Size of the buffer pointed to by <i>prgn</i>, in elements.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
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
     * The source <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> contained more than <i>crgn</i> values. The buffer pointed to by <i>prgn</i>.
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
     * The <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttouint64vector
     * @since windows5.1.2600
     */
    static PropVariantToUInt64Vector(propvar, prgn, crgn, pcElem) {
        prgnMarshal := prgn is VarRef ? "uint*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToUInt64Vector", "ptr", propvar, prgnMarshal, prgn, "uint", crgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts a vector of doubles from a PROPVARIANT structure.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Float>} prgn Type: <b>DOUBLE*</b>
     * 
     * Points to a buffer containing <i>crgn</i> DOUBLE values. When this function returns, the buffer has been initialized with <i>pcElem</i> double elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} crgn Type: <b>ULONG</b>
     * 
     * Size in elements of the buffer pointed to by <i>prgn</i>.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of double elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttodoublevector
     * @since windows5.1.2600
     */
    static PropVariantToDoubleVector(propvar, prgn, crgn, pcElem) {
        prgnMarshal := prgn is VarRef ? "double*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToDoubleVector", "ptr", propvar, prgnMarshal, prgn, "uint", crgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a FILETIME vector.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<FILETIME>} prgft Type: <b>FILETIME*</b>
     * 
     *  Points to a buffer containing <i>crgft</i> FILETIME values. When this function returns, the buffer has been initialized with <i>pcElem</i> FILETIME elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} crgft Type: <b>ULONG</b>
     * 
     *  Size in elements of the buffer pointed to by <i>prgft</i>.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of FILETIME elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttofiletimevector
     * @since windows5.1.2600
     */
    static PropVariantToFileTimeVector(propvar, prgft, crgft) {
        result := DllCall("PROPSYS.dll\PropVariantToFileTimeVector", "ptr", propvar, "ptr", prgft, "uint", crgft, "uint*", &pcElem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcElem
    }

    /**
     * Extracts a vector of strings from a PROPVARIANT structure.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<PWSTR>} prgsz Type: <b>PWSTR*</b>
     * 
     * Pointer to a vector of string pointers. When this function returns, the buffer has been initialized with <i>pcElem</i> elements pointing to newly allocated strings containing the data extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>.
     * @param {Integer} crgsz Type: <b>ULONG</b>
     * 
     * Size of the buffer pointed to by <i>prgsz</i>, in elements.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
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
     * The source<a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>contained more than <i>crgsz</i> values. The buffer pointed to by <i>prgsz</i>.
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
     * The<a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttostringvector
     * @since windows5.1.2600
     */
    static PropVariantToStringVector(propvar, prgsz, crgsz, pcElem) {
        prgszMarshal := prgsz is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToStringVector", "ptr", propvar, prgszMarshal, prgsz, "uint", crgsz, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly allocated Boolean vector.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Pointer<BOOL>>} pprgf Type: <b>BOOL**</b>
     * 
     * When this function returns, contains a pointer to a vector of Boolean values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
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
     * The<a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttobooleanvectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToBooleanVectorAlloc(propvar, pprgf, pcElem) {
        pprgfMarshal := pprgf is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToBooleanVectorAlloc", "ptr", propvar, pprgfMarshal, pprgf, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly allocated Int16 vector.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Pointer<Integer>>} pprgn Type: <b>SHORT**</b>
     * 
     * When this function returns, contains a pointer to a vector of <b>Int16</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
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
     * The<a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttoint16vectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToInt16VectorAlloc(propvar, pprgn, pcElem) {
        pprgnMarshal := pprgn is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToInt16VectorAlloc", "ptr", propvar, pprgnMarshal, pprgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly-allocated unsigned short vector.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Pointer<Integer>>} pprgn Type: <b>USHORT**</b>
     * 
     * When this function returns, contains a pointer to a vector of <b>unsigned short</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
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
     * The <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttouint16vectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToUInt16VectorAlloc(propvar, pprgn, pcElem) {
        pprgnMarshal := pprgn is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToUInt16VectorAlloc", "ptr", propvar, pprgnMarshal, pprgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly-allocated Int32 vector.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Pointer<Integer>>} pprgn Type: <b>LONG**</b>
     * 
     * When this function returns, contains a pointer to a vector of <b>LONG</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
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
     * The<a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttoint32vectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToInt32VectorAlloc(propvar, pprgn, pcElem) {
        pprgnMarshal := pprgn is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToInt32VectorAlloc", "ptr", propvar, pprgnMarshal, pprgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly-allocated ULONG vector.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Pointer<Integer>>} pprgn Type: <b>ULONG**</b>
     * 
     * When this function returns, contains a pointer to a vector of <b>ULONG</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
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
     * The <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttouint32vectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToUInt32VectorAlloc(propvar, pprgn, pcElem) {
        pprgnMarshal := pprgn is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToUInt32VectorAlloc", "ptr", propvar, pprgnMarshal, pprgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly-allocated LONGLONG vector.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Pointer<Integer>>} pprgn Type: <b>LONGLONG**</b>
     * 
     * When this function returns, contains a pointer to a vector of <b>LONGLONG</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
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
     * The<a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttoint64vectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToInt64VectorAlloc(propvar, pprgn, pcElem) {
        pprgnMarshal := pprgn is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToInt64VectorAlloc", "ptr", propvar, pprgnMarshal, pprgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly-allocated ULONGLONG vector.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Pointer<Integer>>} pprgn Type: <b>ULONGLONG**</b>
     * 
     * When this function returns, contains a pointer to a vector of <b>ULONGLONG</b> values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
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
     * The <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttouint64vectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToUInt64VectorAlloc(propvar, pprgn, pcElem) {
        pprgnMarshal := pprgn is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToUInt64VectorAlloc", "ptr", propvar, pprgnMarshal, pprgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly-allocated double vector.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Pointer<Float>>} pprgn Type: <b>DOUBLE**</b>
     * 
     * When this function returns, contains a pointer to a vector of double values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the count of double elements extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttodoublevectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToDoubleVectorAlloc(propvar, pprgn, pcElem) {
        pprgnMarshal := pprgn is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToDoubleVectorAlloc", "ptr", propvar, pprgnMarshal, pprgn, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly-allocated FILETIME vector.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Pointer<FILETIME>>} pprgft Type: <b>FILETIME**</b>
     * 
     *  When this function returns, contains a pointer to a vector of FILETIME values extracted from the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
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
     * The<a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttofiletimevectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToFileTimeVectorAlloc(propvar, pprgft, pcElem) {
        pprgftMarshal := pprgft is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToFileTimeVectorAlloc", "ptr", propvar, pprgftMarshal, pprgft, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts data from a PROPVARIANT structure into a newly allocated strings in a newly allocated vector.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Pointer<PWSTR>>} pprgsz Type: <b>PWSTR**</b>
     * 
     * When this function returns, contains a pointer to a vector of strings extracted from source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<Integer>} pcElem Type: <b>ULONG*</b>
     * 
     * When this function returns, containsthe count of string elements extracted from source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
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
     * The <a href="/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> was not of the appropriate type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttostringvectoralloc
     * @since windows5.1.2600
     */
    static PropVariantToStringVectorAlloc(propvar, pprgsz, pcElem) {
        pprgszMarshal := pprgsz is VarRef ? "ptr*" : "ptr"
        pcElemMarshal := pcElem is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\PropVariantToStringVectorAlloc", "ptr", propvar, pprgszMarshal, pprgsz, pcElemMarshal, pcElem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts a single Boolean element from a PROPVARIANT structure of type VT_BOOL, VT_VECTOR | VT_BOOL, or VT_ARRAY | VT_BOOL.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * A reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * Specifies the vector or array index; otherwise, <i>iElem</i> must be 0.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * When this function returns, contains the extracted Boolean value.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvariantgetbooleanelem
     * @since windows5.1.2600
     */
    static PropVariantGetBooleanElem(propvar, iElem) {
        result := DllCall("PROPSYS.dll\PropVariantGetBooleanElem", "ptr", propvar, "uint", iElem, "int*", &pfVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfVal
    }

    /**
     * Extracts a single Int16 element from a PROPVARIANT structure of type VT_I2, VT_VECTOR | VT_I2, or VT_ARRAY | VT_I2.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * The vector or array index; otherwise, this value must be 0.
     * @returns {Integer} Type: <b>SHORT*</b>
     * 
     * When this function returns, contains the extracted Int32 element value.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvariantgetint16elem
     * @since windows5.1.2600
     */
    static PropVariantGetInt16Elem(propvar, iElem) {
        result := DllCall("PROPSYS.dll\PropVariantGetInt16Elem", "ptr", propvar, "uint", iElem, "short*", &pnVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnVal
    }

    /**
     * Extracts a single unsigned Int16 element from a PROPVARIANT structure of type VT_U12, VT_VECTOR | VT_U12, or VT_ARRAY | VT_U12.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * The vector or array index; otherwise, <i>iElem</i> must be 0.
     * @returns {Integer} Type: <b>USHORT*</b>
     * 
     * When this function returns, contains the extracted element value.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvariantgetuint16elem
     * @since windows5.1.2600
     */
    static PropVariantGetUInt16Elem(propvar, iElem) {
        result := DllCall("PROPSYS.dll\PropVariantGetUInt16Elem", "ptr", propvar, "uint", iElem, "ushort*", &pnVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnVal
    }

    /**
     * Extracts a single Int32 element from a PROPVARIANT of type VT_I4, VT_VECTOR | VT_I4, or VT_ARRAY | VT_I4.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * The vector or array index; otherwise, <i>iElem</i> must be 0.
     * @returns {Integer} Type: <b>LONG*</b>
     * 
     * When this function, contains the extracted Int32 value.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvariantgetint32elem
     * @since windows5.1.2600
     */
    static PropVariantGetInt32Elem(propvar, iElem) {
        result := DllCall("PROPSYS.dll\PropVariantGetInt32Elem", "ptr", propvar, "uint", iElem, "int*", &pnVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnVal
    }

    /**
     * Extracts a single unsigned Int32 element from a PROPVARIANT structure of type VT_UI4, VT_VECTOR | VT_UI4, or VT_ARRAY | VT_UI4.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * The source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * A vector or array index; otherwise, <i>iElem</i> must be 0.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * When this function returns, contains the extracted unsigned Int32 value.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvariantgetuint32elem
     * @since windows5.1.2600
     */
    static PropVariantGetUInt32Elem(propvar, iElem) {
        result := DllCall("PROPSYS.dll\PropVariantGetUInt32Elem", "ptr", propvar, "uint", iElem, "uint*", &pnVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnVal
    }

    /**
     * Extracts a single Int64 element from a PROPVARIANT structure of type VT_I8, VT_VECTOR | VT_I8, or VT_ARRAY | VT_I8.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * The vector or array index; otherwise, <i>iElem</i> must be 0.
     * @returns {Integer} Type: <b>LONGLONG*</b>
     * 
     * When this function returns, contains the extracted Int64 value.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvariantgetint64elem
     * @since windows5.1.2600
     */
    static PropVariantGetInt64Elem(propvar, iElem) {
        result := DllCall("PROPSYS.dll\PropVariantGetInt64Elem", "ptr", propvar, "uint", iElem, "int64*", &pnVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnVal
    }

    /**
     * Extracts a single unsigned Int64 element from a PROPVARIANT structure of type VT_UI8, VT_VECTOR | VT_UI8, or VT_ARRAY | VT_UI8.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * The source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * The vector or array index; otherwise, <i>iElem</i> must be 0.
     * @returns {Integer} Type: <b>ULONGLONG*</b>
     * 
     * When this function returns, contains the extracted Int64 value.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvariantgetuint64elem
     * @since windows5.1.2600
     */
    static PropVariantGetUInt64Elem(propvar, iElem) {
        result := DllCall("PROPSYS.dll\PropVariantGetUInt64Elem", "ptr", propvar, "uint", iElem, "uint*", &pnVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnVal
    }

    /**
     * Extracts a single double element from a PROPVARIANT structure of type VT_R8, VT_VECTOR | VT_R8, or VT_ARRAY | VT_R8.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to the source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * Specifies vector or array index; otherwise, <i>iElem</i> must be 0.
     * @returns {Float} Type: <b>DOUBLE*</b>
     * 
     * When this function returns, contains the extracted double value.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvariantgetdoubleelem
     * @since windows5.1.2600
     */
    static PropVariantGetDoubleElem(propvar, iElem) {
        result := DllCall("PROPSYS.dll\PropVariantGetDoubleElem", "ptr", propvar, "uint", iElem, "double*", &pnVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnVal
    }

    /**
     * Extracts a single FILETIME element from a PROPVARIANT structure of type VT_FILETIME, VT_VECTOR | VT_FILETIME, or VT_ARRAY | VT_FILETIME.
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
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvariantgetfiletimeelem
     * @since windows5.1.2600
     */
    static PropVariantGetFileTimeElem(propvar, iElem, pftVal) {
        result := DllCall("PROPSYS.dll\PropVariantGetFileTimeElem", "ptr", propvar, "uint", iElem, "ptr", pftVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Extracts a single Unicode string element from a PROPVARIANT structure of type VT_LPWSTR, VT_BSTR, VT_VECTOR | VT_LPWSTR, VT_VECTOR | VT_BSTR, or VT_ARRAY | VT_BSTR.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * Reference to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Integer} iElem Type: <b>ULONG</b>
     * 
     * The vector or array index; otherwise, <i>iElem</i> must be 0.
     * @returns {PWSTR} Type: <b>PWSTR*</b>
     * 
     * When this function returns, contains the extracted string value. The calling application is responsible for freeing this string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> when it is no longer needed.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvariantgetstringelem
     * @since windows5.1.2600
     */
    static PropVariantGetStringElem(propvar, iElem) {
        result := DllCall("PROPSYS.dll\PropVariantGetStringElem", "ptr", propvar, "uint", iElem, "ptr*", &ppszVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszVal
    }

    /**
     * Frees the memory and references used by an array of PROPVARIANT structures stored in an array.
     * @param {Pointer<PROPVARIANT>} rgPropVar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structures to free.
     * @param {Integer} cVars Type: <b>UINT</b>
     * 
     * The number of elements in the array specified by <i>rgPropVar</i>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-clearpropvariantarray
     * @since windows5.1.2600
     */
    static ClearPropVariantArray(rgPropVar, cVars) {
        DllCall("PROPSYS.dll\ClearPropVariantArray", "ptr", rgPropVar, "uint", cVars)
    }

    /**
     * Extends PropVariantCompare by allowing the caller to compare two PROPVARIANT structures based on specified comparison units and flags.
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
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvariantcompareex
     * @since windows5.1.2600
     */
    static PropVariantCompareEx(propvar1, propvar2, unit, flags) {
        result := DllCall("PROPSYS.dll\PropVariantCompareEx", "ptr", propvar1, "ptr", propvar2, "int", unit, "int", flags, "int")
        return result
    }

    /**
     * Coerces a value stored as a PROPVARIANT structure to an equivalent value of a different variant type.
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
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvariantchangetype
     * @since windows5.1.2600
     */
    static PropVariantChangeType(ppropvarDest, propvarSrc, flags, vt) {
        result := DllCall("PROPSYS.dll\PropVariantChangeType", "ptr", ppropvarDest, "ptr", propvarSrc, "int", flags, "ushort", vt, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Converts the contents of a PROPVARIANT structure to a VARIANT structure.
     * @param {Pointer<PROPVARIANT>} pPropVar Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to a source <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @param {Pointer<VARIANT>} pVar Type: <b>VARIANT*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure. When this function returns, the <b>VARIANT</b> contains the converted information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-propvarianttovariant
     * @since windows6.0.6000
     */
    static PropVariantToVariant(pPropVar, pVar) {
        result := DllCall("PROPSYS.dll\PropVariantToVariant", "ptr", pPropVar, "ptr", pVar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Copies the contents of a VARIANT structure to a PROPVARIANT structure.
     * @param {Pointer<VARIANT>} pVar Type: <b>const VARIANT*</b>
     * 
     * Pointer to a source <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> structure.
     * @param {Pointer<PROPVARIANT>} pPropVar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure. When this function returns, the <b>PROPVARIANT</b> contains the converted information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-varianttopropvariant
     * @since windows6.0.6000
     */
    static VariantToPropVariant(pVar, pPropVar) {
        result := DllCall("PROPSYS.dll\VariantToPropVariant", "ptr", pVar, "ptr", pPropVar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The StgSerializePropVariant function converts a PROPVARIANT data type to a SERIALIZEDPROPERTYVALUE data type.
     * @param {Pointer<PROPVARIANT>} ppropvar A pointer to <b>PROPVARIANT</b>.
     * @param {Pointer<Pointer<SERIALIZEDPROPERTYVALUE>>} ppProp A pointer to the newly allocated  <b>SERIALIZEDPROPERTYVALUE</b>.
     * @param {Pointer<Integer>} pcb A pointer to the size of the newly allocated  <b>SERIALIZEDPROPERTYVALUE</b>.
     * @returns {HRESULT} This function can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-stgserializepropvariant
     * @since windows5.0
     */
    static StgSerializePropVariant(ppropvar, ppProp, pcb) {
        ppPropMarshal := ppProp is VarRef ? "ptr*" : "ptr"
        pcbMarshal := pcb is VarRef ? "uint*" : "ptr"

        result := DllCall("PROPSYS.dll\StgSerializePropVariant", "ptr", ppropvar, ppPropMarshal, ppProp, pcbMarshal, pcb, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The StgDeserializePropVariant function converts a SERIALIZEDPROPERTYVALUE data type to a PROPVARIANT data type.
     * @param {Pointer<SERIALIZEDPROPERTYVALUE>} pprop A pointer to the  <b>SERIALIZEDPROPERTYVALUE</b> buffer.
     * @param {Integer} cbMax The size of the <i>pprop</i> buffer in bytes.
     * @param {Pointer<PROPVARIANT>} ppropvar A pointer to a <b>PROPVARIANT</b>.
     * @returns {HRESULT} This function can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//propvarutil/nf-propvarutil-stgdeserializepropvariant
     * @since windows5.0
     */
    static StgDeserializePropVariant(pprop, cbMax, ppropvar) {
        result := DllCall("PROPSYS.dll\StgDeserializePropVariant", "ptr", pprop, "uint", cbMax, "ptr", ppropvar, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}
