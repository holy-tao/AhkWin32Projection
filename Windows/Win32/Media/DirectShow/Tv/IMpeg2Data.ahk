#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * IMpeg2Data is no longer available for use as of Windows 7.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMpeg2Data)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2data/nn-mpeg2data-impeg2data
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMpeg2Data extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMpeg2Data
     * @type {Guid}
     */
    static IID => Guid("{9b396d40-f380-4e3c-a514-1a82bf6ebfe6}")

    /**
     * The class identifier for Mpeg2Data
     * @type {Guid}
     */
    static CLSID => Guid("{c666e115-bb62-4027-a113-82d643fe2d99}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSection", "GetTable", "GetStreamOfSections"]

    /**
     * 
     * @param {Integer} pid 
     * @param {Integer} tid 
     * @param {Pointer<MPEG2_FILTER>} pFilter 
     * @param {Integer} dwTimeout 
     * @param {Pointer<ISectionList>} ppSectionList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2data-getsection
     */
    GetSection(pid, tid, pFilter, dwTimeout, ppSectionList) {
        result := ComCall(3, this, "ushort", pid, "char", tid, "ptr", pFilter, "uint", dwTimeout, "ptr*", ppSectionList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pid 
     * @param {Integer} tid 
     * @param {Pointer<MPEG2_FILTER>} pFilter 
     * @param {Integer} dwTimeout 
     * @param {Pointer<ISectionList>} ppSectionList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2data-gettable
     */
    GetTable(pid, tid, pFilter, dwTimeout, ppSectionList) {
        result := ComCall(4, this, "ushort", pid, "char", tid, "ptr", pFilter, "uint", dwTimeout, "ptr*", ppSectionList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pid 
     * @param {Integer} tid 
     * @param {Pointer<MPEG2_FILTER>} pFilter 
     * @param {HANDLE} hDataReadyEvent 
     * @param {Pointer<IMpeg2Stream>} ppMpegStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2data-getstreamofsections
     */
    GetStreamOfSections(pid, tid, pFilter, hDataReadyEvent, ppMpegStream) {
        hDataReadyEvent := hDataReadyEvent is Win32Handle ? NumGet(hDataReadyEvent, "ptr") : hDataReadyEvent

        result := ComCall(5, this, "ushort", pid, "char", tid, "ptr", pFilter, "ptr", hDataReadyEvent, "ptr*", ppMpegStream, "HRESULT")
        return result
    }
}
