#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsiNamedStreams.ahk
#Include .\IFsiFileItem.ahk

/**
 * Use this interface to add, remove and enumerate named streams associated with a file. This interface also provides access to the 'Real-Time' attribute of a file.
 * @remarks
 * 
 * While UDF 2.0 is the lowest required revision for named stream support, the user must enable UDF  2.01 or higher to enable the use of both named streams and   real-time file attributes.
 * 
 * 
 * The recipients of a storage medium containing such files are required to read them using special MMC commands reducing read latency and increasing the worst-case read speed.
 * 
 * This interface is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-ifsifileitem2
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IFsiFileItem2 extends IFsiFileItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsiFileItem2
     * @type {Guid}
     */
    static IID => Guid("{199d0c19-11e1-40eb-8ec2-c8c822a07792}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FsiNamedStreams", "get_IsNamedStream", "AddStream", "RemoveStream", "get_IsRealTime", "put_IsRealTime"]

    /**
     * 
     * @returns {IFsiNamedStreams} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsifileitem2-get_fsinamedstreams
     */
    get_FsiNamedStreams() {
        result := ComCall(24, this, "ptr*", &streams := 0, "HRESULT")
        return IFsiNamedStreams(streams)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsifileitem2-get_isnamedstream
     */
    get_IsNamedStream() {
        result := ComCall(25, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {IStream} streamData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsifileitem2-addstream
     */
    AddStream(name, streamData) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(26, this, "ptr", name, "ptr", streamData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsifileitem2-removestream
     */
    RemoveStream(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(27, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsifileitem2-get_isrealtime
     */
    get_IsRealTime() {
        result := ComCall(28, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsifileitem2-put_isrealtime
     */
    put_IsRealTime(newVal) {
        result := ComCall(29, this, "short", newVal, "HRESULT")
        return result
    }
}
