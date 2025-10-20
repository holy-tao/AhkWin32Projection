#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDvbSiParser.ahk

/**
 * The IDvbSiParser2 interface retrieves program specific information (PSI) and service information (SI) tables from a DVB transport stream.
 * @remarks
 * 
  * To get a pointer to this interface, call <b>CoCreateInstance</b>. Use the following CLSID:
  * 
  * 
  * ```cpp
  * F6B96EDA-1A94-4476-A85F-4D3DC7B39C3F
  * ```
  * 
  * 
  * This CLSID is not is not published in an SDK header; define a new GUID constant in your application.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbsiparser2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbSiParser2 extends IDvbSiParser{
    /**
     * The interface identifier for IDvbSiParser2
     * @type {Guid}
     */
    static IID => Guid("{0ac5525f-f816-42f4-93ba-4c0f32f46e54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * 
     * @param {Integer} tableId 
     * @param {Pointer<UInt16>} pwServiceId 
     * @param {Pointer<Byte>} pbSegment 
     * @param {Pointer<IDVB_EIT2>} ppEIT 
     * @returns {HRESULT} 
     */
    GetEIT2(tableId, pwServiceId, pbSegment, ppEIT) {
        result := ComCall(18, this, "char", tableId, "ushort*", pwServiceId, "char*", pbSegment, "ptr", ppEIT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
