#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IAudioProcessingObjectConfiguration interface is used to configure the APO. This interface uses its methods to lock and unlock the APO for processing.
 * @see https://docs.microsoft.com/windows/win32/api//audioenginebaseapo/nn-audioenginebaseapo-iaudioprocessingobjectconfiguration
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioProcessingObjectConfiguration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioProcessingObjectConfiguration
     * @type {Guid}
     */
    static IID => Guid("{0e5ed805-aba6-49c3-8f9a-2b8c889c4fa8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LockForProcess", "UnlockForProcess"]

    /**
     * 
     * @param {Integer} u32NumInputConnections 
     * @param {Pointer<Pointer<APO_CONNECTION_DESCRIPTOR>>} ppInputConnections 
     * @param {Integer} u32NumOutputConnections 
     * @param {Pointer<Pointer<APO_CONNECTION_DESCRIPTOR>>} ppOutputConnections 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobjectconfiguration-lockforprocess
     */
    LockForProcess(u32NumInputConnections, ppInputConnections, u32NumOutputConnections, ppOutputConnections) {
        result := ComCall(3, this, "uint", u32NumInputConnections, "ptr*", ppInputConnections, "uint", u32NumOutputConnections, "ptr*", ppOutputConnections, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobjectconfiguration-unlockforprocess
     */
    UnlockForProcess() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
