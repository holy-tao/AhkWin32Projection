#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device5.ahk

/**
 * Represents a virtual adapter. This interface extends [ID3D12Device5](../d3d12/nn-d3d12-id3d12device5.md).
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12device6
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device6 extends ID3D12Device5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Device6
     * @type {Guid}
     */
    static IID => Guid("{c70b221b-40e4-4a17-89af-025a0727a6dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 65

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBackgroundProcessingMode"]

    /**
     * 
     * @param {Integer} Mode 
     * @param {Integer} MeasurementsAction 
     * @param {HANDLE} hEventToSignalUponCompletion 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device6-setbackgroundprocessingmode
     */
    SetBackgroundProcessingMode(Mode, MeasurementsAction, hEventToSignalUponCompletion) {
        hEventToSignalUponCompletion := hEventToSignalUponCompletion is Win32Handle ? NumGet(hEventToSignalUponCompletion, "ptr") : hEventToSignalUponCompletion

        result := ComCall(65, this, "int", Mode, "int", MeasurementsAction, "ptr", hEventToSignalUponCompletion, "int*", &pbFurtherMeasurementsDesired := 0, "HRESULT")
        return pbFurtherMeasurementsDesired
    }
}
