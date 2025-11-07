#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISBE2EnumStream.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enumerates a collection of streams. This is a utility interface, which you can use to enumerate the streams discovered in a WTV file. The Stream Buffer Source filter implements this interface.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ISBE2EnumStream)</c>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-isbe2enumstream
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ISBE2EnumStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISBE2EnumStream
     * @type {Guid}
     */
    static IID => Guid("{f7611092-9fbc-46ec-a7c7-548ea78b71a4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} cRequest 
     * @param {Pointer<SBE2_STREAM_DESC>} pStreamDesc 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2enumstream-next
     */
    Next(cRequest, pStreamDesc) {
        result := ComCall(3, this, "uint", cRequest, "ptr", pStreamDesc, "uint*", &pcReceived := 0, "HRESULT")
        return pcReceived
    }

    /**
     * 
     * @param {Integer} cRecords 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2enumstream-skip
     */
    Skip(cRecords) {
        result := ComCall(4, this, "uint", cRecords, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2enumstream-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISBE2EnumStream} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2enumstream-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnumStream := 0, "HRESULT")
        return ISBE2EnumStream(ppIEnumStream)
    }
}
