#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) private data descriptor. The private data descriptor describes broadcaster-specific data that is not part of the official MPEG-2 standard for broadcast streams.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbprivatedataspecifierdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbPrivateDataSpecifierDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbPrivateDataSpecifierDescriptor
     * @type {Guid}
     */
    static IID => Guid("{5660a019-e75a-4b82-9b4c-ed2256d165a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetPrivateDataSpecifier"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbprivatedataspecifierdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbprivatedataspecifierdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbprivatedataspecifierdescriptor-getprivatedataspecifier
     */
    GetPrivateDataSpecifier() {
        result := ComCall(5, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }
}
