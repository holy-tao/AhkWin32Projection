#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<IFsiNamedStreams>} streams 
     * @returns {HRESULT} 
     */
    get_FsiNamedStreams(streams) {
        result := ComCall(24, this, "ptr", streams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_IsNamedStream(pVal) {
        result := ComCall(25, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<IStream>} streamData 
     * @returns {HRESULT} 
     */
    AddStream(name, streamData) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(26, this, "ptr", name, "ptr", streamData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     */
    RemoveStream(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(27, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_IsRealTime(pVal) {
        result := ComCall(28, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_IsRealTime(newVal) {
        result := ComCall(29, this, "short", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
