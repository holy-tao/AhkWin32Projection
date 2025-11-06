#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) data broadcast descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbdatabroadcastdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbDataBroadcastDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbDataBroadcastDescriptor
     * @type {Guid}
     */
    static IID => Guid("{d1ebc1d6-8b60-4c20-9caf-e59382e7c400}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetDataBroadcastID", "GetComponentTag", "GetSelectorLength", "GetSelectorBytes", "GetLangID", "GetTextLength", "GetText"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-getdatabroadcastid
     */
    GetDataBroadcastID() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-getcomponenttag
     */
    GetComponentTag() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-getselectorlength
     */
    GetSelectorLength() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Pointer<Integer>} pbLen 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-getselectorbytes
     */
    GetSelectorBytes(pbLen) {
        pbLenMarshal := pbLen is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pbLenMarshal, pbLen, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-getlangid
     */
    GetLangID() {
        result := ComCall(9, this, "uint*", &pulVal := 0, "HRESULT")
        return pulVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-gettextlength
     */
    GetTextLength() {
        result := ComCall(10, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Pointer<Integer>} pbLen 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastdescriptor-gettext
     */
    GetText(pbLen) {
        pbLenMarshal := pbLen is VarRef ? "char*" : "ptr"

        result := ComCall(11, this, pbLenMarshal, pbLen, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }
}
