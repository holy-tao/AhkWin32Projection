#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDVB_SDT.ahk

/**
 * Implements methods that get information from an Integrated Services Digital Broadcasting (ISDB) service description table (SDT). An SDT lists the names and other parameters of the services in an MPEG-2 transport stream.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdb_sdt
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IISDB_SDT extends IDVB_SDT{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IISDB_SDT
     * @type {Guid}
     */
    static IID => Guid("{3f3dc9a2-bb32-4fb9-ae9e-d856848927a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRecordEITUserDefinedFlags"]

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdt-getrecordeituserdefinedflags
     */
    GetRecordEITUserDefinedFlags(dwRecordIndex, pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(21, this, "uint", dwRecordIndex, pbValMarshal, pbVal, "HRESULT")
        return result
    }
}
