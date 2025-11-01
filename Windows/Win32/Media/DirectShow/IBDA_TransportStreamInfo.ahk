#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later. The IBDA_TransportStreamInfo interface returns the time when the most recent Program Association Table (PAT) section was received.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_TransportStreamInfo)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_transportstreaminfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_TransportStreamInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_TransportStreamInfo
     * @type {Guid}
     */
    static IID => Guid("{8e882535-5f86-47ab-86cf-c281a72a0549}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PatTableTickCount"]

    /**
     * 
     * @param {Pointer<Integer>} pPatTickCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_transportstreaminfo-get_pattabletickcount
     */
    get_PatTableTickCount(pPatTickCount) {
        pPatTickCountMarshal := pPatTickCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pPatTickCountMarshal, pPatTickCount, "HRESULT")
        return result
    }
}
