#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFTopology.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Converts a partial topology into a full topology.
 * @remarks
 * 
 * To create the topology loader, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatetopoloader">MFCreateTopoLoader</a> function.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imftopoloader
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTopoLoader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTopoLoader
     * @type {Guid}
     */
    static IID => Guid("{de9a6157-f660-4643-b56a-df9f7998c7cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Load"]

    /**
     * 
     * @param {IMFTopology} pInputTopo 
     * @param {IMFTopology} pCurrentTopo 
     * @returns {IMFTopology} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopoloader-load
     */
    Load(pInputTopo, pCurrentTopo) {
        result := ComCall(3, this, "ptr", pInputTopo, "ptr*", &ppOutputTopo := 0, "ptr", pCurrentTopo, "HRESULT")
        return IMFTopology(ppOutputTopo)
    }
}
