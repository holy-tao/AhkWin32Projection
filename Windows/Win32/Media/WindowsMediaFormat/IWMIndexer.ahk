#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMIndexer interface is used to create an index for ASF files to enable seeking.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmindexer
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMIndexer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMIndexer
     * @type {Guid}
     */
    static IID => Guid("{6d7cdc71-9888-11d3-8edc-00c04f6109cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartIndexing", "Cancel"]

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {IWMStatusCallback} pCallback 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmindexer-startindexing
     */
    StartIndexing(pwszURL, pCallback, pvContext) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(3, this, "ptr", pwszURL, "ptr", pCallback, "ptr", pvContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmindexer-cancel
     */
    Cancel() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
