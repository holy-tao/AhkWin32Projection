#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMAddressAccess.ahk

/**
 * The IWMAddressAccess2 interface controls IP access lists on the writer network sink object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmaddressaccess2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMAddressAccess2 extends IWMAddressAccess{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMAddressAccess2
     * @type {Guid}
     */
    static IID => Guid("{65a83fc2-3e98-4d4d-81b5-2a742886b33d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAccessEntryEx", "AddAccessEntryEx"]

    /**
     * 
     * @param {Integer} aeType 
     * @param {Integer} dwEntryNum 
     * @param {Pointer<BSTR>} pbstrAddress 
     * @param {Pointer<BSTR>} pbstrMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmaddressaccess2-getaccessentryex
     */
    GetAccessEntryEx(aeType, dwEntryNum, pbstrAddress, pbstrMask) {
        result := ComCall(7, this, "int", aeType, "uint", dwEntryNum, "ptr", pbstrAddress, "ptr", pbstrMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} aeType 
     * @param {BSTR} bstrAddress 
     * @param {BSTR} bstrMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmaddressaccess2-addaccessentryex
     */
    AddAccessEntryEx(aeType, bstrAddress, bstrMask) {
        bstrAddress := bstrAddress is String ? BSTR.Alloc(bstrAddress).Value : bstrAddress
        bstrMask := bstrMask is String ? BSTR.Alloc(bstrMask).Value : bstrMask

        result := ComCall(8, this, "int", aeType, "ptr", bstrAddress, "ptr", bstrMask, "HRESULT")
        return result
    }
}
