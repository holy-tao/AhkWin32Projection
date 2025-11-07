#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Gets an MPEG-2 program specific information (PSI) table from an MPEG-2 transport stream.
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nn-mpeg2psiparser-ipsitables
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IPSITables extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPSITables
     * @type {Guid}
     */
    static IID => Guid("{919f24c5-7b14-42ac-a4b0-2ae08daf00ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTable"]

    /**
     * 
     * @param {Integer} dwTSID 
     * @param {Integer} dwTID_PID 
     * @param {Integer} dwHashedVer 
     * @param {Integer} dwPara4 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipsitables-gettable
     */
    GetTable(dwTSID, dwTID_PID, dwHashedVer, dwPara4) {
        result := ComCall(3, this, "uint", dwTSID, "uint", dwTID_PID, "uint", dwHashedVer, "uint", dwPara4, "ptr*", &ppIUnknown := 0, "HRESULT")
        return IUnknown(ppIUnknown)
    }
}
