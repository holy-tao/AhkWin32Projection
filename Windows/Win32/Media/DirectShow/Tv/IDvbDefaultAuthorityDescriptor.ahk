#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from the default authority descriptor for a content reference identifier (CRID). The default authority descriptor is the first part of the CRID and identifies the body that created the CRID.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbdefaultauthoritydescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbDefaultAuthorityDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbDefaultAuthorityDescriptor
     * @type {Guid}
     */
    static IID => Guid("{05ec24d1-3a31-44e7-b408-67c60a352276}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetDefaultAuthority"]

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdefaultauthoritydescriptor-gettag
     */
    GetTag(pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdefaultauthoritydescriptor-getlength
     */
    GetLength(pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbLength 
     * @param {Pointer<Pointer<Integer>>} ppbBytes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdefaultauthoritydescriptor-getdefaultauthority
     */
    GetDefaultAuthority(pbLength, ppbBytes) {
        pbLengthMarshal := pbLength is VarRef ? "char*" : "ptr"
        ppbBytesMarshal := ppbBytes is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pbLengthMarshal, pbLength, ppbBytesMarshal, ppbBytes, "HRESULT")
        return result
    }
}
