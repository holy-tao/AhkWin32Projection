#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} cRequest 
     * @param {Pointer<SBE2_STREAM_DESC>} pStreamDesc 
     * @param {Pointer<UInt32>} pcReceived 
     * @returns {HRESULT} 
     */
    Next(cRequest, pStreamDesc, pcReceived) {
        result := ComCall(3, this, "uint", cRequest, "ptr", pStreamDesc, "uint*", pcReceived, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cRecords 
     * @returns {HRESULT} 
     */
    Skip(cRecords) {
        result := ComCall(4, this, "uint", cRecords, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISBE2EnumStream>} ppIEnumStream 
     * @returns {HRESULT} 
     */
    Clone(ppIEnumStream) {
        result := ComCall(6, this, "ptr", ppIEnumStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
