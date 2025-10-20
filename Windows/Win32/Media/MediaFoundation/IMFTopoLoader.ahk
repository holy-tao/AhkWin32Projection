#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IMFTopology>} pInputTopo 
     * @param {Pointer<IMFTopology>} ppOutputTopo 
     * @param {Pointer<IMFTopology>} pCurrentTopo 
     * @returns {HRESULT} 
     */
    Load(pInputTopo, ppOutputTopo, pCurrentTopo) {
        result := ComCall(3, this, "ptr", pInputTopo, "ptr", ppOutputTopo, "ptr", pCurrentTopo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
